package bioskop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.KorisniciDAO;
import model.Korisnik;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		
		System.out.println("Korisnicko ime: " + userName);
		System.out.println("Lozinka: " + password);
		
		Korisnik korisnik = KorisniciDAO.get(userName, password);
		if (korisnik == null || korisnik.isObrisan() == true) {
			request.getRequestDispatcher("./FailureServlet").forward(request, response);
			return;
		}

		request.getSession().setAttribute("loggedInUserName", korisnik.getKorisnickoIme());
		
		request.getRequestDispatcher("./SuccessServlet").forward(request, response);
		System.out.println(korisnik.getKorisnickoIme());
		return;
	}
}
