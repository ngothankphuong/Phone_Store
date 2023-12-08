package user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dao.OrderDAO;
import dbconnect.DBConnect;
import phone_store.entity.Cart;
import phone_store.entity.Order;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=UTF-8");
			// du lieu tu form submit
			int userID = Integer.parseInt(req.getParameter("userID"));
			String userName = req.getParameter("userName");
			String email = req.getParameter("userEmail");
			String phone = req.getParameter("userPhone");
			String address = req.getParameter("userAddress");
			String paymentMethod = req.getParameter("paymentMethod");
			

			//System.out.println(userID + userName + email + phone + address + paymentMethod);

			HttpSession ss = req.getSession();

			CartDAO dao1 = new CartDAO(DBConnect.getConn());
			List<Cart> listC = new ArrayList<Cart>();
			listC = dao1.getSanPhamByUserID(userID);
			//System.out.println(listC);
			
			OrderDAO dao2 = new OrderDAO(DBConnect.getConn());

			
			Order o = null;
			ArrayList<Order> orderList = new ArrayList<Order>();
			Random r = new Random();
			//int MA = r.nextInt(1000);
			for(Cart c: listC) {
				o = new Order();
				//System.out.println(c.getTen_san_pham()+""+c.getCau_hinh()+" "+c.getHang()+" "+c.getGia());
				//System.out.println("So Luong " + c.getSo_luong());
				o.setOrID("ORDER-" + r.nextInt(1000));
				o.setUserName(userName);
				o.setUserID(userID);
				o.setUserEmail(email);
				o.setUserPhone(phone);
				o.setUserAddress(address);
				o.setPayment(paymentMethod);
				o.setSpName(c.getTen_san_pham());
				o.setSpCauhinh(c.getCau_hinh());
				o.setSpHang(c.getHang());
				o.setSo_luong(c.getSo_luong());
				o.setSpGia(c.getGia());
				orderList.add(o);
			}
			//System.out.println(orderList);
			if (listC.isEmpty()) {
				ss.setAttribute("null_cart", "Vui lòng thêm sản phẩm vào giỏ hàng !!");
				resp.sendRedirect("checkout.jsp");
			} else if (paymentMethod.equals("no_select")) {
				ss.setAttribute("no_select", "Vui lòng chọn phương thức thanh toán!");
				resp.sendRedirect("checkout.jsp");
			}

			else {	
				boolean f2 = dao2.saveOrder(orderList);
				if(f2) {
					ss.setAttribute("orderSucc", "Đặt hàng thành công !!");
					boolean f = dao1.deleteCartByUserID(userID);
					resp.sendRedirect("checkout.jsp");
				} else {
					resp.sendRedirect("checkout.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
