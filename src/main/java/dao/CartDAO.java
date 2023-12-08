package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import phone_store.entity.Cart;
import phone_store.entity.SanPham;

public class CartDAO {

	private Connection conn;

	public CartDAO(Connection conn) {
		this.conn = conn;
	}

	// Them san pham vao database carts
	public boolean addCart(Cart c) {
		boolean f = false;
		try {
			String sql = "INSERT INTO carts VALUES(null,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getSpID());
			ps.setInt(2, c.getUserID());
			ps.setString(3, c.getTen_san_pham());
			ps.setString(4, c.getCau_hinh());
			ps.setString(5, c.getHang());
			ps.setString(6, c.getGia());
			ps.setInt(7, c.getSo_luong());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// lay san pham theo id user de hien thi 
	public List<Cart> getSanPhamByUserID(int id) {
		List<Cart> listC = new ArrayList<Cart>();
		Cart c = null;
		try {
			String sql = "SELECT * FROM carts WHERE userID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Cart();
				c.setCartID(rs.getInt(1));
				c.setSpID(rs.getInt(2));
				c.setUserID(rs.getInt(3));
				c.setTen_san_pham(rs.getString(4));
				c.setCau_hinh(rs.getString(5));
				c.setHang(rs.getString(6));
				c.setGia(rs.getString(7));
				c.setSo_luong(rs.getInt(8));
				listC.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listC;
	}

	// xoa item trong gio hang
	public boolean deleteItem(int cID) {
		boolean f = false;
		try {
			String sql = "DELETE FROM carts WHERE cartID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cID);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	//xoa san pham khi sumbit order
	public boolean deleteCartByUserID(int id) {
		boolean f = false;
		try {
			String sql = "DELETE FROM carts WHERE userID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	//giam so luong san pham
	public boolean minusCart(int cartID, int userID, int value) {
		boolean f = false;
		int value1=1;
		if(value > 1 ) {
			value1 = value - 1;			
		}
		
		try {
			String sql = "UPDATE carts SET so_luong=? WHERE userID=? AND cartID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, value1);
			ps.setInt(2, userID);
			ps.setInt(3, cartID);
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	//tang so luong san pham
	public boolean plusCart(int cartID, int userID, int value) {
		boolean f = false;		
		int value1 = value +1;
		try {
			String sql = "UPDATE carts SET so_luong=? WHERE userID=? AND cartID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, value1);
			ps.setInt(2, userID);
			ps.setInt(3, cartID);
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
	//lay ra san trong cart theo id sn pham , kiem tra co hay chua
	public List<Cart> check(int spID, int userID) {
		List<Cart> listC = new ArrayList<Cart>();
		Cart c= null;
		try {
			String sql = "SELECT * FROM carts WHERE spID=? AND userID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, spID);
			ps.setInt(2, userID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				c = new Cart();
				c.setCartID(rs.getInt(1));
				c.setSpID(rs.getInt(2));
				c.setUserID(rs.getInt(3));
				c.setTen_san_pham(rs.getString(4));
				c.setCau_hinh(rs.getString(5));
				c.setHang(rs.getString(6));
				c.setGia(rs.getString(7));
				c.setSo_luong(rs.getInt(8));
				listC.add(c);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return  listC;
	}
	
	
	//getvalue
	public int getValue(int spID, int userID) {
		int value=0;
		try {
			String sql = "SELECT so_luong from carts WHERE spID=? AND userID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, spID);
			ps.setInt(2, userID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				value = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return value;
	}
	
	public int getCartID(int spID, int userID) {
		int cartID = 0;
		try {
			 String sql = "SELECT cartID from carts WHERE spID=? AND userID=?";
			 PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, spID);
				ps.setInt(2, userID);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					cartID = rs.getInt(1);
				}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return cartID;
	}
	
	//lay ra so luong cua san pham theo cartID
	public int getQuantity(int cID) {
		int quantity=0;
		try {
			String sql = "SELECT so_luong from carts WHERE cartID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cID);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				quantity = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return quantity;
	}
	
	//lay ra gia cua san theo cartID
	public String getPrice(int cID) {
		String giaSP = "";
		try {
			String sql = "SELECT gia FROM carts WHERE cartID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				giaSP = rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return giaSP;
	}
	
	
}
