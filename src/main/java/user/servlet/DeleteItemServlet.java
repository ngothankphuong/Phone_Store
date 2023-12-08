package user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dbconnect.DBConnect;

@WebServlet("/deleteCartItem")
public class DeleteItemServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int cID = Integer.parseInt(req.getParameter("cID"));
			//System.out.println(cID);

			CartDAO dao = new CartDAO(DBConnect.getConn());
			boolean f = dao.deleteItem(cID);
			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("delItemSucc", "Đã xóa sản phẩm");
				resp.sendRedirect("checkout.jsp");
			} else {
				session.setAttribute("delItemFaile", "Xóa sản phẩm không thành công");
				resp.sendRedirect("checkout.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
