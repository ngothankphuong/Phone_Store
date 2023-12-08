package phone_store.entity;

public class Cart {
	private int cartID;
	private int spID;
	private int userID;
	private String ten_san_pham;
	private String cau_hinh;
	private String hang;
	private String gia;
	private int so_luong;

	
	
	public int getSo_luong() {
		return so_luong;
	}

	public void setSo_luong(int so_luong) {
		this.so_luong = so_luong;
	}

	public int getCartID() {
		return cartID;
	}

	public void setCartID(int cartID) {
		this.cartID = cartID;
	}

	public int getSpID() {
		return spID;
	}

	public void setSpID(int spID) {
		this.spID = spID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getTen_san_pham() {
		return ten_san_pham;
	}

	public void setTen_san_pham(String ten_san_pham) {
		this.ten_san_pham = ten_san_pham;
	}

	public String getCau_hinh() {
		return cau_hinh;
	}

	public void setCau_hinh(String cau_hinh) {
		this.cau_hinh = cau_hinh;
	}

	public String getHang() {
		return hang;
	}

	public void setHang(String hang) {
		this.hang = hang;
	}

	public String getGia() {
		return gia;
	}

	public void setGia(String gia) {
		this.gia = gia;
	}


	@Override
	public String toString() {
		return "Cart [cartID=" + cartID + ", spID=" + spID + ", userID=" + userID + ", ten_san_pham=" + ten_san_pham
				+ ", cau_hinh=" + cau_hinh + ", hang=" + hang + ", gia=" + gia + "]";
	}

}
