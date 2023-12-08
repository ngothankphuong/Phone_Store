package admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SanPhamDAO;
import dbconnect.DBConnect;

@WebServlet("/deleteItem")
public class DeleteItemServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int spID = Integer.parseInt(req.getParameter("spID"));
		try {
		SanPhamDAO dao = new SanPhamDAO(DBConnect.getConn());
		boolean f = dao.deleteSP(spID);
		HttpSession session = req.getSession();
		if(f) {
			session.setAttribute("delSucc", "Đã xóa sản phẩm");
			resp.sendRedirect("admin/all_item.jsp");
		} else {
			session.setAttribute("delFaile", "Đã không thành công");
			resp.sendRedirect("admin/all_item.jsp");
		}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
}
