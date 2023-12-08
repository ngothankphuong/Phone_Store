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
import phone_store.entity.SanPham;

@WebServlet("/editItem")
public class EditItemServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int spID = Integer.parseInt(req.getParameter("spID"));
			String ten_sp = new String(req.getParameter("ten_san_pham").getBytes("ISO-8859-1"), "UTF-8");
			String cau_hinh = new String(req.getParameter("cau_hinh").getBytes("ISO-8859-1"), "UTF-8");
			String hang = new String(req.getParameter("hang").getBytes("ISO-8859-1"), "UTF-8");
			String gia = new String(req.getParameter("gia").getBytes("ISO-8859-1"), "UTF-8");
			String trang_thai = req.getParameter("trang_thai");
			
			//System.out.println(ten_sp);
			
			SanPham sp = new SanPham();
			sp.setId(spID);
			sp.setTenSanPham(ten_sp);
			sp.setCauHinh(cau_hinh);
			sp.setHang(hang);
			sp.setGia(gia);
			sp.setTrangThai(trang_thai);
			
			SanPhamDAO dao = new SanPhamDAO(DBConnect.getConn());
			boolean f = dao.updateItem(sp);
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("updateSucc", "Cập nhật sản phẩm thành công");
				resp.sendRedirect("admin/all_item.jsp");
			} else {
				session.setAttribute("updateFaile", "Cập nhật sản phẩm thất bại");
				resp.sendRedirect("admin/all_item.jsp");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
