package phone_store.entity;

public class SanPham {
	private int id;
	private String tenSanPham;
	private String cauHinh;
	private String hang;
	private String loaiSanPham;
	private String trangThai;
	private String gia;
	private String hinhAnh;

	public SanPham() {
		super();
	}

	public SanPham( String tenSanPham, String cauHinh, String hang, String loaiSanPham, String trangThai,
		String gia, String hinhAnh) {
		super();
		this.tenSanPham = tenSanPham;
		this.cauHinh = cauHinh;
		this.hang = hang;
		this.loaiSanPham = loaiSanPham;
		this.trangThai = trangThai;
		this.gia = gia;
		this.hinhAnh = hinhAnh;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTenSanPham() {
		return tenSanPham;
	}

	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}

	public String getCauHinh() {
		return cauHinh;
	}

	public void setCauHinh(String cauHinh) {
		this.cauHinh = cauHinh;
	}

	public String getHang() {
		return hang;
	}

	public void setHang(String hang) {
		this.hang = hang;
	}

	public String getLoaiSanPham() {
		return loaiSanPham;
	}

	public void setLoaiSanPham(String loaiSanPham) {
		this.loaiSanPham = loaiSanPham;
	}

	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}

	public String getGia() {
		return gia;
	}

	public void setGia(String gia) {
		this.gia = gia;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	@Override
	public String toString() {
		return "SanPham [id=" + id + ", tenSanPham=" + tenSanPham + ", cauHinh=" + cauHinh + ", hang=" + hang
				+ ", loaiSanPham=" + loaiSanPham + ", trangThai=" + trangThai + ", gia=" + gia + ", hinhAnh=" + hinhAnh
				+ "]";
	}

}
