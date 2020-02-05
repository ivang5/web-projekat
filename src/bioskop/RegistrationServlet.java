package bioskop;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.KorisniciDAO;
import model.Korisnik;
import model.Uloga;

public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String korisnickoIme = request.getParameter("userName");
			if (KorisniciDAO.get(korisnickoIme) != null)
				throw new Exception("Korisnicko ime vec postoji!");
			if ("".equals(korisnickoIme))
				throw new Exception("Korisnicko ime nije uneto!");
			if (!korisnickoIme.matches("[A-Za-z0-9]+"))
				throw new Exception("Korisnicko ime nije validno!");

			String loznika = request.getParameter("password");
			if ("".equals(loznika))
				throw new Exception("Lozinka nije uneta!");
			if (!loznika.matches("[A-Za-z0-9]+"))
				throw new Exception("Lozinka nije validna!");
			Date datumRegistracije = new Date();
			Uloga uloga = Uloga.KORISNIK;
			
			Korisnik korisnik = new Korisnik();
			korisnik.setKorisnickoIme(korisnickoIme);
			korisnik.setLozinka(loznika);
			korisnik.setDatumRegistracije(datumRegistracije);
			korisnik.setUloga(uloga);
			korisnik.setObrisan(false);
			
			KorisniciDAO.add(korisnik);
			request.getRequestDispatcher("./SuccessServlet").forward(request, response);
		} catch (Exception ex) {
			String message = ex.getMessage();
			if (message == null) {
				message = "Nepredvidjena greska!";
				ex.printStackTrace();
			}
			Map<String, Object> data = new LinkedHashMap<>();
			data.put("message", message);

			request.setAttribute("data", data);
			request.getRequestDispatcher("./FailureServlet").forward(request, response);
		}
	}

}
