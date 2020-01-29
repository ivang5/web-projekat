package bioskop;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SaleDAO;
import model.Sala;

public class SalaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipProjekcijeFilter = request.getParameter("tipProjekcijeFilter");
		
		List<Sala> filtriraneSale = SaleDAO.getAll(tipProjekcijeFilter);
		
		Map<String, Object> data = new LinkedHashMap<>();
		data.put("filtriraneSale", filtriraneSale);
		
		request.setAttribute("data", data);
		request.getRequestDispatcher("./SuccessServlet").forward(request, response);
	}

}
