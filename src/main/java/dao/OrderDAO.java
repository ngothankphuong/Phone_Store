package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import phone_store.entity.Order;

public class OrderDAO {
	
	private Connection conn;
	public OrderDAO(Connection conn) {
		this.conn = conn;
	}
	
	public boolean saveOrder(List<Order> plist) {
		boolean f = false;
		try {
			String sql = "INSERT INTO orders VALUES(null,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			for(Order od: plist) {
				ps.setString(1, od.getOrID());
				ps.setInt(2, od.getUserID());
				ps.setString(3, od.getUserName());
				ps.setString(4, od.getUserEmail());
				ps.setString(5, od.getUserPhone());
				ps.setString(6, od.getUserAddress());
				ps.setString(7, od.getPayment());
				ps.setString(8, od.getSpName());
				ps.setString(9, od.getSpCauhinh());
				ps.setString(10, od.getSpHang());
				ps.setInt(11, od.getSo_luong());
				ps.setString(12, od.getSpGia());
				ps.setString(13, "not_confirm");
				ps.addBatch();				
			}			
			int[] count = ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return f;	
	}
	
	public boolean isNotOrder(String email) {
		boolean f=false;
		try {
			String sql = "SELECT * FROM orders WHERE email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if(!rs.isBeforeFirst()) {
				//System.out.println("Nguoi dung khong co order san pham nao");
				f=true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Order> getOrderUser(int id) {
		List<Order> listO = new ArrayList<Order>();
		Order o = null;
		try {
			String sql = "SELECT * FROM orders WHERE userID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				o = new Order();
				o.setId(rs.getInt(1));
				o.setOrID(rs.getString(2));
				o.setUserID(rs.getInt(3));
				o.setUserName(rs.getString(4));
				o.setUserEmail(rs.getString(5));
				o.setUserPhone(rs.getString(6));
				o.setUserAddress(rs.getString(7));
				o.setPayment(rs.getString(8));
				o.setSpName(rs.getString(9));
				o.setSpCauhinh(rs.getString(10));
				o.setSpHang(rs.getString(11));
				o.setSo_luong(rs.getInt(12));
				o.setSpGia(rs.getString(13));
				o.setStatus(rs.getString(14));
				listO.add(o);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return listO;
	}
	
	
	//admin get tat ca don hang
	public List<Order> getAllOrder(){
		List<Order> listO = new ArrayList<Order>();
		Order o=null;
		try {
			String sql = "SELECT * FROM orders";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				o = new Order();
				o.setId(rs.getInt(1));
				o.setOrID(rs.getString(2));
				o.setUserID(rs.getInt(3));
				o.setUserName(rs.getString(4));
				o.setUserEmail(rs.getString(5));
				o.setUserPhone(rs.getString(6));
				o.setUserAddress(rs.getString(7));
				o.setPayment(rs.getString(8));
				o.setSpName(rs.getString(9));
				o.setSpCauhinh(rs.getString(10));
				o.setSpHang(rs.getString(11));
				o.setSo_luong(rs.getInt(12));
				o.setSpGia(rs.getString(13));
				o.setStatus(rs.getString(14));
				listO.add(o);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return listO;
	}
	
	//admin get order new
		public List<Order> getOrderNew(){
			List<Order> listO = new ArrayList<Order>();
			Order o=null;
			try {
				String sql = "SELECT * FROM orders WHERE trang_thai=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, "not_confirm");
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					o = new Order();
					o.setId(rs.getInt(1));
					o.setOrID(rs.getString(2));
					o.setUserID(rs.getInt(3));
					o.setUserName(rs.getString(4));
					o.setUserEmail(rs.getString(5));
					o.setUserPhone(rs.getString(6));
					o.setUserAddress(rs.getString(7));
					o.setPayment(rs.getString(8));
					o.setSpName(rs.getString(9));
					o.setSpCauhinh(rs.getString(10));
					o.setSpHang(rs.getString(11));
					o.setSo_luong(rs.getInt(12));
					o.setSpGia(rs.getString(13));
					o.setStatus(rs.getString(14));
					listO.add(o);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			return listO;
		}
		
		//get order confirmed
		public List<Order> getOrderConfirm(){
			List<Order> listO = new ArrayList<Order>();
			Order o=null;
			try {
				String sql = "SELECT * FROM orders WHERE trang_thai=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, "confirmed");
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					o = new Order();
					o.setId(rs.getInt(1));
					o.setOrID(rs.getString(2));
					o.setUserID(rs.getInt(3));
					o.setUserName(rs.getString(4));
					o.setUserEmail(rs.getString(5));
					o.setUserPhone(rs.getString(6));
					o.setUserAddress(rs.getString(7));
					o.setPayment(rs.getString(8));
					o.setSpName(rs.getString(9));
					o.setSpCauhinh(rs.getString(10));
					o.setSpHang(rs.getString(11));
					o.setSo_luong(rs.getInt(12));
					o.setSpGia(rs.getString(13));
					o.setStatus(rs.getString(14));
					listO.add(o);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			return listO;
		}
		
		//ADMIN xac nhan don hang
		public boolean confirmOrder(String id_order) {
			boolean f=false;
			try {
				String sql = "UPDATE orders SET trang_thai=? WHERE orderID=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, "confirm");
				ps.setString(2, id_order);
				int i  = ps.executeUpdate();
				if(i==1) {
					f=true;
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			return f;
		}
	
	//ADMIN delete order by orderID
		public boolean deleteOrder(String orderID) {
			boolean f=false;
			try {
				String sql = "DELETE FROM orders WHERE orderID=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, orderID);
				int i = ps.executeUpdate();
				if(i==1) {
					f=true;
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			return f;
		}
		
}
