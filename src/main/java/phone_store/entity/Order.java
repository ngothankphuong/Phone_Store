package phone_store.entity;

public class Order {
	private int id;
	private String orID;
	private int userID;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userAddress;
	private String payment;
	
	private String spName;
	private String spCauhinh;
	private String spHang;
	private int so_luong;
	private String spGia;
	private String status;


	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSpName() {
		return spName;
	}

	public void setSpName(String spName) {
		this.spName = spName;
	}

	public String getSpCauhinh() {
		return spCauhinh;
	}

	public void setSpCauhinh(String spCauhinh) {
		this.spCauhinh = spCauhinh;
	}

	public String getSpHang() {
		return spHang;
	}

	public void setSpHang(String spHang) {
		this.spHang = spHang;
	}

	public String getOrID() {
		return orID;
	}

	public void setOrID(String orID) {
		this.orID = orID;
	}

	public String getSpGia() {
		return spGia;
	}

	public void setSpGia(String spGia) {
		this.spGia = spGia;
	}

	public int getSo_luong() {
		return so_luong;
	}

	public void setSo_luong(int so_luong) {
		this.so_luong = so_luong;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
