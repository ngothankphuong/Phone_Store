package user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dbconnect.DBConnect;
import phone_store.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			UserDAO dao = new UserDAO(DBConnect.getConn());
			HttpSession session = req.getSession();
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			//Kiem tra admin
			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User us = new User();
				us.setName("Admin");
				/*
				 * us.setEmail("admin@gmail.com"); us.setPassword("admin");
				 */
				session.setAttribute("userObjAdmin", us);
				resp.sendRedirect("admin/home.jsp");
			} else {
				
				//kiem tra user 
				User us = dao.userLogin(email, password);
				if(us!=null) {
					session.setAttribute("userObj", us);
					resp.sendRedirect("index.jsp");
				} else {
					session.setAttribute("loginfaileMsg", "Email hoặc mật khẩu không đúng, vui lòng nhập lại !!!");
					resp.sendRedirect("login.jsp");
				}
			}
			
			//System.out.println(email + password);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
