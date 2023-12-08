package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import phone_store.entity.SanPham;

public class SanPhamDAO {

	private Connection conn;

	public SanPhamDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	// ADMIN them san pham
	public boolean addSanPham(SanPham b) {
		boolean f = false;
		try {
			String sql = "insert into san_pham values(null,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getTenSanPham());
			ps.setString(2, b.getCauHinh());
			ps.setString(3, b.getHang());
			ps.setString(4, b.getLoaiSanPham());
			ps.setString(5, b.getGia());
			ps.setString(6, b.getHinhAnh());
			ps.setString(7, b.getTrangThai());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// lay ra san pham la dien thoai < 4
	public List<SanPham> getPhone() {
		List<SanPham> listSP = new ArrayList<SanPham>();
		SanPham sp = null;
		try {

			String sql = "SELECT * FROM san_pham WHERE trang_thai=? AND loai_san_pham=? ORDER BY id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "active");
			ps.setString(2, "dien_thoai");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				sp = new SanPham();
				sp.setId(rs.getInt(1));
				sp.setTenSanPham(rs.getString(2));
				sp.setCauHinh(rs.getString(3));
				sp.setHang(rs.getString(4));
				sp.setLoaiSanPham(rs.getString(5));
				sp.setGia(rs.getString(6));
				sp.setHinhAnh(rs.getString(7));
				sp.setTrangThai(rs.getString(8));
				listSP.add(sp);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listSP;
	}

	// lay ra san pham laptop < 4
	public List<SanPham> getLaptop() {
		List<SanPham> listSP = new ArrayList<SanPham>();
		SanPham sp = null;
		try {

			String sql = "SELECT * FROM san_pham WHERE trang_thai=? AND loai_san_pham=? ORDER BY id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "active");
			ps.setString(2, "laptop");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				sp = new SanPham();
				sp.setId(rs.getInt(1));
				sp.setTenSanPham(rs.getString(2));
				sp.setCauHinh(rs.getString(3));
				sp.setHang(rs.getString(4));
				sp.setLoaiSanPham(rs.getString(5));
				sp.setGia(rs.getString(6));
				sp.setHinhAnh(rs.getString(7));
				sp.setTrangThai(rs.getString(8));
				listSP.add(sp);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listSP;
	}

	// lay ra san pham la tablet <4
	public List<SanPham> getTablet() {
		List<SanPham> listSP = new ArrayList<SanPham>();
		SanPham sp = null;
		try {

			String sql = "SELECT * FROM san_pham WHERE trang_thai=? AND loai_san_pham=? ORDER BY id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "active");
			ps.setString(2, "may_tinh_bang");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				sp = new SanPham();
				sp.setId(rs.getInt(1));
				sp.setTenSanPham(rs.getString(2));
				sp.setCauHinh(rs.getString(3));
				sp.setHang(rs.getString(4));
				sp.setLoaiSanPham(rs.getString(5));
				sp.setGia(rs.getString(6));
				sp.setHinhAnh(rs.getString(7));
				sp.setTrangThai(rs.getString(8));
				listSP.add(sp);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listSP;
	}

	// Lay ra tat ca dien thoai
	public List<SanPham> getAllPhone() {
		List<SanPham> listSP = new ArrayList<SanPham>();
		SanPham sp = null;
		try {
			String sql = "SELECT * FROM san_pham WHERE trang_thai=? AND loai_san_pham=? ORDER BY id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "active");
			ps.setString(2, "dien_thoai");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sp = new SanPham();
				sp.setId(rs.getInt(1));
				sp.setTenSanPham(rs.getString(2));
				sp.setCauHinh(rs.getString(3));
				sp.setHang(rs.getString(4));
				sp.setLoaiSanPham(rs.getString(5));
				sp.setGia(rs.getString(6));
				sp.setHinhAnh(rs.getString(7));
				sp.setTrangThai(rs.getString(8));
				listSP.add(sp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listSP;
	}

	// lay ra tat ca san pham laptop
	public List<SanPham> getAllLaptop() {
		List<SanPham> listSP = new ArrayList<SanPham>();
		SanPham sp = null;
		try {
			String sql = "SELECT * FROM san_pham WHERE trang_thai=? AND loai_san_pham=? ORDER BY id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "active");
			ps.setString(2, "laptop");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sp = new SanPham();
				sp.setId(rs.getInt(1));
				sp.setTenSanPham(rs.getString(2));
				sp.setCauHinh(rs.getString(3));
				sp.setHang(rs.getString(4));
				sp.setLoaiSanPham(rs.getString(5));
				sp.setGia(rs.getString(6));
				sp.setHinhAnh(rs.getString(7));
				sp.setTrangThai(rs.getString(8));
				listSP.add(sp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listSP;
	}

	// lay ra tat ca may tinh bang
	public List<SanPham> getAllTablet() {
		List<SanPham> listSP = new ArrayList<SanPham>();
		SanPham sp = null;
		try {
			String sql = "SELECT * FROM san_pham WHERE trang_thai=? AND loai_san_pham=? ORDER BY id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "active");
			ps.setString(2, "may_tinh_bang");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sp = new SanPham();
				sp.setId(rs.getInt(1));
				sp.setTenSanPham(rs.getString(2));
				sp.setCauHinh(rs.getString(3));
				sp.setHang(rs.getString(4));
				sp.setLoaiSanPham(rs.getString(5));
				sp.setGia(rs.getString(6));
				sp.setHinhAnh(rs.getString(7));
				sp.setTrangThai(rs.getString(8));
				listSP.add(sp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listSP;
	}

	// lay ra san pham theo id
	public SanPham getSanPhamByID(int id) {
		SanPham sp = null;
		try {
			String sql = "SELECT * FROM san_pham WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sp = new SanPham();
				sp.setId(rs.getInt(1));
				sp.setTenSanPham(rs.getString(2));
				sp.setCauHinh(rs.getString(3));
				sp.setHang(rs.getString(4));
				sp.setLoaiSanPham(rs.getString(5));
				sp.setGia(rs.getString(6));
				sp.setHinhAnh(rs.getString(7));
				sp.setTrangThai(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sp;
	}

	// lay ra tat ca san pham
	public List<SanPham> getAllSP() {
		List<SanPham> listSP = new ArrayList<SanPham>();
		SanPham sp = null;
		try {
			String sql = "SELECT * FROM san_pham";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sp = new SanPham();
				sp.setId(rs.getInt(1));
				sp.setTenSanPham(rs.getString(2));
				sp.setCauHinh(rs.getString(3));
				sp.setHang(rs.getString(4));
				sp.setLoaiSanPham(rs.getString(5));
				sp.setGia(rs.getString(6));
				sp.setHinhAnh(rs.getString(7));
				sp.setTrangThai(rs.getString(8));
				listSP.add(sp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}         
		

		return listSP;
	}

	// ADMIN xoa sp theo ID
	public boolean deleteSP(int spID) {
		boolean f = false;
		try {
			String sql = "DELETE FROM san_pham WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, spID);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// ADMIN cap nhat san pham
	public boolean updateItem(SanPham sp) {
		boolean f = false;
		try {
			String sql = "UPDATE san_pham  SET ten=?,cau_hinh=?,hang=?,gia=?,trang_thai=? WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, sp.getTenSanPham());
			ps.setString(2, sp.getCauHinh());
			ps.setString(3, sp.getHang());
			ps.setString(4, sp.getGia());
			ps.setString(5, sp.getTrangThai());
			ps.setInt(6, sp.getId());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// tim kiem san pham
	public List<SanPham> getSearch(String info) {
		List<SanPham> listSearch = new ArrayList<SanPham>();
		SanPham sp = null;
		try {
			String sql = "SELECT * FROM san_pham WHERE ten like ? OR loai_san_pham like ? OR hang like ? OR cau_hinh like ? AND trang_thai=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + info + "%");
			ps.setString(2, "%" + info + "%");
			ps.setString(3, "%" + info + "%");
			ps.setString(4, "%" + info + "%");
			ps.setString(5, "active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sp = new SanPham();
				sp.setId(rs.getInt(1));
				sp.setTenSanPham(rs.getString(2));
				sp.setCauHinh(rs.getString(3));
				sp.setHang(rs.getString(4));
				sp.setLoaiSanPham(rs.getString(5));
				sp.setGia(rs.getString(6));
				sp.setHinhAnh(rs.getString(7));
				sp.setTrangThai(rs.getString(8));
				listSearch.add(sp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listSearch;
	}


}
