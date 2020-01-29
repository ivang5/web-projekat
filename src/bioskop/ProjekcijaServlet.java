package bioskop;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FIlmoviDAO;
import dao.KarteDAO;
import dao.KorisniciDAO;
import dao.ProjekcijeDAO;
import dao.SaleDAO;
import model.Film;
import model.Karta;
import model.Korisnik;
import model.Projekcija;
import model.Sala;
import model.TipProjekcije;
import model.Uloga;

public class ProjekcijaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String projekcijaID = request.getParameter("projekcijaID");
		String proveraZauzetihSedista = request.getParameter("proveraZauzetihSedista");
		String kartaID = request.getParameter("kartaID");
		if(proveraZauzetihSedista != null && proveraZauzetihSedista != "") {
			Map<String, Object> data = new LinkedHashMap<>();
			List<Integer> zauzetaSedista = new ArrayList<>();
			List<Karta> Karte = KarteDAO.getAll();
			for(Karta k : Karte) {
				if(k.getProjekcija() != null && k.getId() != Integer.parseInt(kartaID) && k.getProjekcija().getId() == Integer.parseInt(projekcijaID)) {
					zauzetaSedista.add(k.getSediste().getRedniBroj());
				}
			}
			data.put("zauzetaSedista", zauzetaSedista);
			request.setAttribute("data", data);
			request.getRequestDispatcher("./SuccessServlet").forward(request, response);
			return;
		}
			
		if(projekcijaID != null && projekcijaID != "") {
			Map<String, Object> data = new LinkedHashMap<>();
			data.put("trazenaProjekcija", ProjekcijeDAO.getById(projekcijaID));
			
			request.setAttribute("data", data);
			request.getRequestDispatcher("./SuccessServlet").forward(request, response);
		}else {
			String film = request.getParameter("filmFilter");
			int filmIndex;
			if(film != null && film != "") {				
				filmIndex = FIlmoviDAO.get(film).getId();
				System.out.println("Naziv filma: " + film + "     ID filma: " + filmIndex);
			}else {
				filmIndex = -1;
			}
			String datumOd = request.getParameter("datumOdFilter");
			String datumDo = request.getParameter("datumDoFilter");
			String sala = request.getParameter("salaFilter");
			int salaIndex;
			if(sala != null && sala != "") {
				salaIndex = SaleDAO.get(sala).getId();
				System.out.println("Naziv sale: " + sala + "     ID sale: " + salaIndex);
			}else {
				salaIndex = -1;
			}
			double minCena = 0.0;
			try {
				String minCenaFilter = request.getParameter("minCenaFilter");
				minCena = Double.parseDouble(minCenaFilter);
				minCena = (minCena >= 0.0? minCena: 0.0);
			} catch (Exception ex) {}
			double maxCena = 1500.0;
			try {
				String maxCenaFilter = request.getParameter("maxCenaFilter");
				maxCena = Double.parseDouble(maxCenaFilter);
				maxCena = (maxCena >= 0.0? maxCena: 1500.0);
			} catch (Exception ex) {}
			String tipProjekcije = request.getParameter("tipProjekcijeFilter");
			
			List<Projekcija> filtriraneProjekcije = ProjekcijeDAO.getAll(filmIndex, tipProjekcije, salaIndex, datumOd, datumDo, minCena, maxCena);
			
			Map<String, Object> data = new LinkedHashMap<>();
			data.put("filtriraneProjekcije", filtriraneProjekcije);
			
			request.setAttribute("data", data);
			request.getRequestDispatcher("./SuccessServlet").forward(request, response);
		}
		
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
		
		if (loggedInUser.getUloga() != Uloga.ADMINISTRATOR || loggedInUser.isObrisan() == true) {
			request.getRequestDispatcher("./LogoutServlet").forward(request, response);
			return;
		}
		
		try {
			String action = request.getParameter("action");
			switch (action) {
			case "add": {
				String filmString = request.getParameter("film");
				Film film = FIlmoviDAO.get(filmString);
				TipProjekcije tipProjekcije = TipProjekcije.valueOf(request.getParameter("tipProjekcije"));
				String salaString = request.getParameter("sala");
				Sala sala = SaleDAO.get(salaString);
				String datumVremeString = request.getParameter("datumVreme");
				Date datumVreme = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datumVremeString);
				double cenaKarte = Double.parseDouble(request.getParameter("cenaKarte"));
				Korisnik korisnik = KorisniciDAO.get(loggedInUserName);
				
				Projekcija projekcija = new Projekcija();
				projekcija.setFilm(film);
				projekcija.setTipProjekcije(tipProjekcije);
				projekcija.setSala(sala);
				projekcija.setDatumVreme(datumVreme);
				projekcija.setCenaKarte(cenaKarte);
				projekcija.setKorisnik(korisnik);
				projekcija.setObrisana(false);
				
				ProjekcijeDAO.add(projekcija);
				request.getRequestDispatcher("./SuccessServlet").forward(request, response);
				break;	
			} case "delete": {
				String id = request.getParameter("id");
				Projekcija projekcija = ProjekcijeDAO.getById(id);
				
				if(KarteDAO.postojanjeProjekcije(id)) {
					projekcija.setObrisana(true);
					ProjekcijeDAO.update(projekcija);
				}else {
					ProjekcijeDAO.delete(id);
				}
				
				request.getRequestDispatcher("./SuccessServlet").forward(request, response);
				break;
			}
			}
		} catch (Exception ex) {
			request.getRequestDispatcher("./FailureServlet").forward(request, response);
			ex.printStackTrace();
		}
	}

}
