package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import phone_store.entity.User;

public class UserDAO {
	private Connection conn;
	
	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	//ham dang ky nguoi dung
	public boolean userRegister(User us) {
		boolean f = false;
		try {
			//Connection conn = DBConnect.getConn();
			String sql = "insert into `user` values(null,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPassword());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// ham dang nhap nguoi dung theo email va password
	public User userLogin(String email, String password) {
		User us = null;
		try {
			String sql = "select * from user where email=? and mat_khau =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPassword(rs.getString(4));                                             
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return us;
	}
	
	
}
