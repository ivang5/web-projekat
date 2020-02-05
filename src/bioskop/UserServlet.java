package bioskop;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.KarteDAO;
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
		String korisnickoImeFilter = request.getParameter("korisnickoImeFilter");
		String ulogaFilter = request.getParameter("ulogaFilter");
			
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
						data.put("allUsers", KorisniciDAO.getAll(korisnickoImeFilter, ulogaFilter));
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
			case "update": {
				String id = request.getParameter("id");
				Korisnik korisnik = KorisniciDAO.getById(id);
				if (korisnik == null)
					throw new Exception("Korisnik je nepostojec!");
				
				String korisnickoIme = request.getParameter("korisnickoIme");
				if (KorisniciDAO.get(korisnickoIme) != null)
					throw new Exception("Korisnicko ime vec postoji!");
				if("".equals(korisnickoIme))
					throw new Exception("Korisnicko ime nije uneto!");
				if (!korisnickoIme.matches("[A-Za-z0-9]+"))
					throw new Exception("Korisnicko ime nije validno!");
				korisnik.setKorisnickoIme(korisnickoIme);
				String lozinka = request.getParameter("lozinka");
				if("".equals(lozinka))
					throw new Exception("Lozinka nije uneta!");
				if (!lozinka.matches("[A-Za-z0-9]+"))
					throw new Exception("Lozinka nije validna!");
				String staraLozinka = request.getParameter("staraLozinka");
				if(staraLozinka.equals(korisnik.getLozinka())) {
					korisnik.setLozinka(lozinka);
				}else {
					throw new Exception("Stara lozinka nije ispravna!");
				}
				Uloga uloga = Uloga.valueOf(request.getParameter("uloga"));
				if (uloga == null)
					throw new Exception("Uloga je nepostojeca!");
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
				
				if(KarteDAO.postojanjeKorisnika(id)) {
					korisnik.setObrisan(true);
					KorisniciDAO.update(korisnik);
				}else {
					KorisniciDAO.delete(id);
				}
				
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
