package user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SanPhamDAO;
import dbconnect.DBConnect;
import phone_store.entity.SanPham;

@WebServlet("/detail")
public class DetailServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String id_detail = req.getParameter("id_detail");
			int id = Integer.parseInt(id_detail);
			SanPhamDAO dao4 = new SanPhamDAO(DBConnect.getConn());
			SanPham sp4 = dao4.getSanPhamByID(id);
			//System.out.println(sp4.getCauHinh());
			
			//de gui response ve ajax tieng viet
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<p>" + sp4.getCauHinh() + "</p>");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
