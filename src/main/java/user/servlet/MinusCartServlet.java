package user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.CartDAO;
import dbconnect.DBConnect;

@WebServlet("/minus")
public class MinusCartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String value = req.getParameter("value");
			String userID = req.getParameter("userID");
			String cartID = req.getParameter("cartID");
			String tongGia = req.getParameter("tongGia");
			//System.out.println(userID + "-------" + cartID + "---------" + value + "----" + tongGia);

			int value1 = Integer.parseInt(value);
			int userID1 = Integer.parseInt(userID);
			int cartID1 = Integer.parseInt(cartID);
			int tongGia1 = Integer.parseInt(tongGia);

			// gia = tong gia hien tai + (soluong san phan * gia tien)

			// tang so luong san pham
			CartDAO dao = new CartDAO(DBConnect.getConn());

			if (value1 > 1) {

				boolean f = dao.minusCart(cartID1, userID1, value1);
				if (f) {

					PrintWriter out = resp.getWriter();

					// sau khi tang thanh cong lay ra so luong tra ve
					int quantity = dao.getQuantity(cartID1);

					// lay ra gia cua san pham da tang
					String priceSP = dao.getPrice(cartID1);
					int price = Integer.parseInt(priceSP);

					// gia hien tai + gia sp
					tongGia1 = tongGia1 - price;
					System.out.println(tongGia1);

					Map<String, Integer> data = new HashMap<>();
					data.put("quantity", quantity);
					data.put("price", tongGia1);
					// chuyen Map thanh kieu json
					String jsonResponse = new Gson().toJson(data);

					out.print(jsonResponse);
				} else {
					System.out.println("Giam that bai");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
