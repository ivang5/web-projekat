package bioskop;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SedistaDAO;

public class SedisteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String redniBroj = request.getParameter("redniBroj");
		String salaId = request.getParameter("salaId");
		if(redniBroj != null && redniBroj != "" && salaId != null && salaId != "") {
			Map<String, Object> data = new LinkedHashMap<>();
			data.put("trazenoSediste", SedistaDAO.getByRbAndSala(redniBroj, salaId));
			
			request.setAttribute("data", data);
			request.getRequestDispatcher("./SuccessServlet").forward(request, response);
		}

	}

}
