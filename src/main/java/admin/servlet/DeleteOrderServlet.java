package admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDAO;
import dbconnect.DBConnect;

@WebServlet("/deleteOrder")
public class DeleteOrderServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String orderID = req.getParameter("orderID");
			//System.out.println(orderID);
			OrderDAO dao = new OrderDAO(DBConnect.getConn());
			boolean f = dao.deleteOrder(orderID);
			//System.out.println(f);
			PrintWriter out = resp.getWriter();
			out.print(f);

		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
