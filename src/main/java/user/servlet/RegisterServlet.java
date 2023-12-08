package user.servlet;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dbconnect.DBConnect;
import phone_store.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String name = new String(request.getParameter("username").getBytes("ISO-8859-1"), "UTF-8");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			System.out.println(name + email + password);
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPassword(password);
			HttpSession session = request.getSession();
			UserDAO dao = new UserDAO(DBConnect.getConn());
			boolean f = dao.userRegister(us);
			System.out.println(f);
			if (f) {
				session.setAttribute("registerSuccMsg", "Đăng ký tài khoản thành công");
				response.sendRedirect("register.jsp");
			} else {
				session.setAttribute("registerFaileMsg", "Đăng ký tài khoản không thành công !!!");
				response.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
