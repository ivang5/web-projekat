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

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loggedInUserName = (String) request.getSession().getAttribute("loggedInUserName");
		if (loggedInUserName == null) {
			request.getRequestDispatcher("./LogoutServlet").forward(request, response);
			return;
		}
		Korisnik loggedInUser = KorisniciDAO.get(loggedInUserName);
		if (loggedInUser == null || loggedInUser.isObrisan() == true) {
			request.getRequestDispatcher("./LogoutServlet").forward(request, response);
			return;
		}
		
		String action = request.getParameter("action");
		String korisnikID = request.getParameter("korisnikID");
		String korisnickoImeInput = request.getParameter("korisnickoImeInput");
		String ulogaInput = request.getParameter("ulogaInput");
			
		if(action != null && action != "") {
			
			Map<String, Object> data = new LinkedHashMap<>();
			
			switch (action) {
				case "loggedInUserRole": {
					data.put("loggedInUserRole", loggedInUser.getUloga());
					break;
				}case  "loggedInUserId" : {
					data.put("loggedInUserId", loggedInUser.getId());
					break;
				}case "allUsers" : {
					if (loggedInUser.getUloga() == Uloga.ADMINISTRATOR) {
						data.put("allUsers", KorisniciDAO.getAll(korisnickoImeInput, ulogaInput));
						break;
					}else {
						request.getRequestDispatcher("./LogoutServlet").forward(request, response);
						break;
					}

				}
			}

			request.setAttribute("data", data);
			request.getRequestDispatcher("./SuccessServlet").forward(request, response);
		}
		else if(korisnikID != null && korisnikID != "") {
			Map<String, Object> data = new LinkedHashMap<>();
			data.put("trazeniKorisnik", KorisniciDAO.getById(korisnikID));

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
		if (loggedInUser == null || loggedInUser.isObrisan() == true) {
			request.getRequestDispatcher("./LogoutServlet").forward(request, response);
			return;
		}
		
		
		try {
			String action = request.getParameter("action");
			switch (action) {
			case "add": {
				if (loggedInUser.getUloga() != Uloga.ADMINISTRATOR) {
					request.getRequestDispatcher("./LogoutServlet").forward(request, response);
					return;
				}
				String korisnickoIme = request.getParameter("korisnickoIme");
				String lozinka = request.getParameter("lozinka");
				Date datumRegistracije = new Date();
				Uloga uloga = Uloga.KORISNIK;
				
				Korisnik korisnik = new Korisnik();
				korisnik.setKorisnickoIme(korisnickoIme);
				korisnik.setLozinka(lozinka);
				korisnik.setDatumRegistracije(datumRegistracije);
				korisnik.setUloga(uloga);
				korisnik.setObrisan(false);
				
				KorisniciDAO.add(korisnik);
				request.getRequestDispatcher("./SuccessServlet").forward(request, response);
				break;
			}case "update": {
				String id = request.getParameter("id");
				Korisnik korisnik = KorisniciDAO.getById(id);
				String korisnickoIme = request.getParameter("korisnickoIme");
				if(korisnickoIme != null && korisnickoIme != "")
					korisnik.setKorisnickoIme(korisnickoIme);
				String lozinka = request.getParameter("lozinka");
				if(lozinka != null && lozinka != "")
					korisnik.setLozinka(lozinka);
				Uloga uloga = Uloga.valueOf(request.getParameter("uloga"));
				korisnik.setUloga(uloga);
				KorisniciDAO.update(korisnik);
				request.getRequestDispatcher("./SuccessServlet").forward(request, response);
				break;
			}case "delete":{
				if (loggedInUser.getUloga() != Uloga.ADMINISTRATOR) {
					request.getRequestDispatcher("./LogoutServlet").forward(request, response);
					return;
				}
				String id = request.getParameter("id");
				Korisnik korisnik = KorisniciDAO.getById(id);
				korisnik.setObrisan(true);
				KorisniciDAO.update(korisnik);

				
				
				
				
				
				request.getRequestDispatcher("./SuccessServlet").forward(request, response);
				break;
			}
		}
			
		} catch (Exception e) {
			request.getRequestDispatcher("./FailureServlet").forward(request, response);
			e.printStackTrace();
		}
	}

}
