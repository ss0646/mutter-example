package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Mutter;
import model.PostMutterLogic;
import model.User;

/**
 * Servlet implementation class Main
 */
@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext application = getServletContext();
		List<Mutter> mutterList = (List<Mutter>) application.getAttribute("mutterList");
		if (mutterList == null) {
			mutterList = new ArrayList();
			application.setAttribute("mutterList", mutterList);
		}
		
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		if (loginUser == null) {
			response.sendRedirect("/mutter-example/");
		} else {
			request.getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String text = request.getParameter("text");
		
		if (text != null && text.length() != 0) {
			ServletContext application = getServletContext();
			List<Mutter> mutterList = (List<Mutter>) application.getAttribute("mutterList");
			User loginUser = (User) request.getSession().getAttribute("loginUser");
			Mutter mutter = new Mutter(loginUser.getName(), text);
			PostMutterLogic logic = new PostMutterLogic();
			logic.execute(mutter, mutterList);
			application.setAttribute("mutterList", mutterList);
		} else {
			request.setAttribute("errorMsg", "つぶやきが入力されていません");
		}
		
		request.getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(request, response);
	}

}
