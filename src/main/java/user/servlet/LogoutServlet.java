package user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			if (session.getAttribute("userObjAdmin") != null) {
				session.removeAttribute("userObjAdmin");
			}
			if (session.getAttribute("userObj") != null) {
				session.removeAttribute("userObj");
			}
			HttpSession session2 = req.getSession();
			session2.setAttribute("logoutsucessMsg", "Logout Successfully hehe");

			resp.sendRedirect("login.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
