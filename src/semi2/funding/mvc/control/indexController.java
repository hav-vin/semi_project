package semi2.funding.mvc.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.funding.mvc.domain.Board;
import semi2.funding.mvc.model.FundingService;

@WebServlet("/index.do")
public class indexController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FundingService service = FundingService.getInstance();
		ArrayList<Board> list = service.getListS();
		request.setAttribute("list", list);
		
		String view = "index.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

}

