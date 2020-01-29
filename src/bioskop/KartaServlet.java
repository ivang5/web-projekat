package bioskop;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.KarteDAO;
import dao.KorisniciDAO;
import dao.ProjekcijeDAO;
import dao.SedistaDAO;
import model.Karta;
import model.Korisnik;
import model.Projekcija;
import model.Sediste;
import model.Uloga;

public class KartaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String korisnikID = request.getParameter("korisnikID");
		List<Karta> filtriraneKarte = KarteDAO.getKorisnikKarte(korisnikID);
		
		Map<String, Object> data = new LinkedHashMap<>();
		data.put("filtriraneKarte", filtriraneKarte);
		
		request.setAttribute("data", data);
		request.getRequestDispatcher("./SuccessServlet").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loggedInUserName = (String) request.getSession().getAttribute("loggedInUserName");
		if (loggedInUserName == null) {
			request.getRequestDispatcher("./LogoutServlet").forward(request, response);
			return;
		}
		
		Korisnik loggedInUser = KorisniciDAO.get(loggedInUserName);
		if (loggedInUser == null) {
			request.getRequestDispatcher("./LogoutServlet").forward(request, response);
			return;
		}
		
		if (loggedInUser.getUloga() != Uloga.KORISNIK || loggedInUser.isObrisan() == true) {
			request.getRequestDispatcher("./LogoutServlet").forward(request, response);
			return;
		}
		
		try {
			String action = request.getParameter("action");
			switch (action) {
			case "add": {
				String projekcijaString = request.getParameter("projekcijaID");
				Projekcija projekcija = ProjekcijeDAO.getById(projekcijaString);
				String sedisteString = request.getParameter("sediste");
				Sediste sediste = SedistaDAO.getById(sedisteString);
				Date datumVremeProdaje = new Date();
				Korisnik korisnik = KorisniciDAO.get(loggedInUserName);
				
				Karta karta = new Karta();
				karta.setProjekcija(projekcija);
				karta.setSediste(sediste);
				karta.setDatumVremeProdaje(datumVremeProdaje);
				karta.setKorisnik(korisnik);
				
				KarteDAO.add(karta);
				request.getRequestDispatcher("./SuccessServlet").forward(request, response);
				break;
			} case "delete": {
				String id = request.getParameter("id");
				Karta karta = KarteDAO.get(id);
				Date datumVremeProjekcije = karta.getProjekcija().getDatumVreme();
				if (datumVremeProjekcije.getTime() > System.currentTimeMillis()) {
					KarteDAO.delete(id);
					request.getRequestDispatcher("./SuccessServlet").forward(request, response);
					break;
				}else {
					request.getRequestDispatcher("./FailureServlet").forward(request, response);
				}
			}
			}
		} catch (Exception ex) {
			request.getRequestDispatcher("./FailureServlet").forward(request, response);
			ex.printStackTrace();
		}
	}

}
