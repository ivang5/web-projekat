package bioskop;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FIlmoviDAO;
import dao.KorisniciDAO;
import model.Film;
import model.Korisnik;
import model.Uloga;

public class FilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String filmID = request.getParameter("filmID");
		if(filmID != null && filmID != "") {
			Map<String, Object> data = new LinkedHashMap<>();
			data.put("trazeniFilm", FIlmoviDAO.getById(filmID));
			
			request.setAttribute("data", data);
			request.getRequestDispatcher("./SuccessServlet").forward(request, response);
		}else {
			String naziv = request.getParameter("nazivFilter");
			String zanrovi = request.getParameter("zanrFilter");
			int trajanjeOd = 1;
			try {
				String trajanjeOdFilter = request.getParameter("trajanjeOdFilter");
				trajanjeOd = Integer.parseInt(trajanjeOdFilter);
				trajanjeOd = (trajanjeOd >= 1? trajanjeOd: 1);
			} catch (Exception ex) {}
			int trajanjeDo = 5;
			try {
				String trajanjeDoFilter = request.getParameter("trajanjeDoFilter");
				trajanjeDo = Integer.parseInt(trajanjeDoFilter);
				trajanjeDo = (trajanjeDo >= 1? trajanjeDo: 5);
			} catch (Exception ex) {}
			String distributer = request.getParameter("distributerFilter");
			String zemljaPorekla = request.getParameter("zemljaPoreklaFilter");
			int godinaOd = 1950;
			try {
				String godinaOdFilter = request.getParameter("godinaOdFilter");
				godinaOd = Integer.parseInt(godinaOdFilter);
				godinaOd = (godinaOd >= 1950? godinaOd: 1950);
			} catch (Exception ex) {}
			int godinaDo = 2020;
			try {
				String godinaDoFilter = request.getParameter("godinaDoFilter");
				godinaDo = Integer.parseInt(godinaDoFilter);
				godinaDo = (godinaDo >= 1950? godinaDo: 2020);
			} catch (Exception ex) {}
			
			List<Film> filtriraniFilmovi = FIlmoviDAO.getAll(naziv, zanrovi, trajanjeOd, trajanjeDo, distributer, zemljaPorekla, godinaOd, godinaDo);
			
			Map<String, Object> data = new LinkedHashMap<>();
			data.put("filtriraniFilmovi", filtriraniFilmovi);
			
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
				String naziv = request.getParameter("naziv");
				String reziser = request.getParameter("reziser");
				String glumci = request.getParameter("glumci");
				String zanrovi = request.getParameter("zanrovi");
				int trajanje = Integer.parseInt(request.getParameter("trajanje"));
				String distributer = request.getParameter("distributer");
				String zemljaPorekla = request.getParameter("zemljaPorekla");
				int godinaProizvodnje = Integer.parseInt(request.getParameter("godinaProizvodnje"));
				String opis = request.getParameter("opis");
				
				Film film = new Film();
				film.setNaziv(naziv);
				film.setReziser(reziser);
				film.setGlumci(glumci);
				film.setZanrovi(zanrovi);
				film.setTrajanje(trajanje);
				film.setDistributer(distributer);
				film.setZemljaPorekla(zemljaPorekla);
				film.setGodinaProizvodnje(godinaProizvodnje);
				film.setOpis(opis);
				film.setObrisan(false);
				
				FIlmoviDAO.add(film);
				request.getRequestDispatcher("./SuccessServlet").forward(request, response);
				break;
			} case "update": {
				String id = request.getParameter("id");
				Film film = FIlmoviDAO.getById(id);
				
				String naziv = request.getParameter("naziv");
				String reziser = request.getParameter("reziser");
				String glumci = request.getParameter("glumci");
				String zanrovi = request.getParameter("zanrovi");
				int trajanje = Integer.parseInt(request.getParameter("trajanje"));
				String distributer = request.getParameter("distributer");
				String zemljaPorekla = request.getParameter("zemljaPorekla");
				int godinaProizvodnje = Integer.parseInt(request.getParameter("godinaProizvodnje"));
				String opis = request.getParameter("opis");
				
				film.setNaziv(naziv);
				film.setReziser(reziser);
				film.setGlumci(glumci);
				film.setZanrovi(zanrovi);
				film.setTrajanje(trajanje);
				film.setDistributer(distributer);
				film.setZemljaPorekla(zemljaPorekla);
				film.setGodinaProizvodnje(godinaProizvodnje);
				film.setOpis(opis);
				
				FIlmoviDAO.update(film);
				request.getRequestDispatcher("./SuccessServlet").forward(request, response);
				break;
			} case "delete": {
				String id = request.getParameter("id");
				Film film = FIlmoviDAO.getById(id);
				film.setObrisan(true);
				FIlmoviDAO.update(film);
				
				
				
				
				
				
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
