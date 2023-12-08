<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_component/taglib.jsp"%>
<%@include file="all_component/allCss.jsp"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.NumberFormat"%>
<title>Trang Thanh Toán</title>
</head>
<body style="background-color: #f0f1f2">

	<!-- Kiem tra nguoi dung chua dang nhap chuyen den trang login -->
	<c:if test="${empty userObj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<!-- Thong bao xoa item trong gio hang success -->
	<c:if test="${not empty delItemSucc }">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<strong>${delItemSucc } </strong>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<c:remove var="delItemSucc" scope="session" />
	</c:if>


	<!-- Thong bao xoa item trong gio hang faile -->
	<c:if test="${not empty delIemFaile }">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<strong>${delIemFaile } </strong>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<c:remove var="delIemFaile" scope="session" />
	</c:if>

	<!-- thong bao dat hang thanh cong -->
	<c:if test="${not empty orderSucc }">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<strong>${orderSucc } </strong>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<c:remove var="orderSucc" scope="session" />
	</c:if>

	<!-- thong bao gio hang rong -->
	<c:if test="${not empty null_cart}">
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">
			<strong>${null_cart } </strong>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<c:remove var="null_cart" scope="session" />
	</c:if>

	<!-- thong bao chua select payment method-->
	<c:if test="${not empty no_select }">
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">
			<strong>${no_select } </strong>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<c:remove var="no_select" scope="session" />
	</c:if>

	<!-- thong bao san pham da co -->
	<c:if test="${not empty cartExisted }">
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">
			<strong>${cartExisted } </strong>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<c:remove var="cartExisted" scope="session" />
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="">
		<div class="row p-4">
			<div class="col-md text-center">
				<div class=" bg-white p-3">
					<div class="">

						<h3 class="text-center text-success">Giỏ Hàng</h3>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col">Tên Sản Phẩm</th>
									<th scope="col">Cầu Hình</th>
									<th scope="col">Hãng</th>
									<th scope="col">Số Lượng</th>
									<th scope="col">Giá</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>

								<!-- Hien thi ra danh sach Cart -->
								<%
								User u = (User) session.getAttribute("userObj");
								long tong_gia = 0;
								CartDAO dao = new CartDAO(DBConnect.getConn());
								List<Cart> carts = dao.getSanPhamByUserID(u.getId());
								for (Cart c : carts) {
									double giasp = Double.parseDouble(c.getGia());
									tong_gia += giasp * c.getSo_luong();
								%>
								<tr>
									<td scope="row"><%=c.getTen_san_pham()%></td>
									<td><%=c.getCau_hinh()%></td>
									<td><%=c.getHang()%></td>
									<td><a
										onclick="minusCart(<%=c.getUserID()%>, <%=c.getCartID()%>, this)"
										class="btn">-</a> <span style="display: inline-block;"><%=c.getSo_luong()%></span>
										<a
										onclick="plusCart(<%=c.getUserID()%>, <%=c.getCartID()%>, this)"
										class="btn">+</a></td>

									<td><%=c.getGia()%> VND</td>
									<td><a href="deleteCartItem?cID=<%=c.getCartID()%>"
										class="btn btn-danger">Xóa</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td>Tổng Hóa Đơn</td>
									<td></td>
									<td></td>
									<td></td>
									<td><p id="tongGia"><%=tong_gia%></p> VND</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-5 text-center ">
				<div class="cart bg-white p-3">
					<div class="cart-body"></div>
					<h3 class="text-success">Thông tin đặt hàng</h3>
					<form action="order" method="POST">
						<input type="hidden" value="${userObj.id}" name="userID" />
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputName">Họ và Tên</label> <input
									required="required" name="userName" type="text"
									class="form-control" id="inputName" placeholder=""
									value="${userObj.name }">
							</div>
							<div class="form-group col-md-6">
								<label for="inputEmail">Email</label> <input required="required"
									name="userEmail" type="email" class="form-control"
									id="inputEmail" placeholder="" value="${userObj.email }">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputPhone">Số Điện Thoại</label> <input
									required="required" name="userPhone" type="number"
									class="form-control" id="inputPhone">
							</div>
							<div class="form-group col-md-6">
								<label for="inputAddress">Địa Chỉ</label> <input
									required="required" name="userAddress" type="text"
									class="form-control" id="inputAddress" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label>Phương Thức Thanh Toán</label> <select
								name="paymentMethod" class="form-control">
								<option value="no_select">--Chọn--</option>
								<option value="ship_cod">Thanh Toán Khi Nhận Hàng</option>
							</select>
							<div class="mt-3 text-center">
								<button type="submit" class="mr-3 btn btn-warning">Tiến
									Hành Đặt Hàng</button>
								<a href="index.jsp" class="ml-3 btn btn-success">Tiếp Tục
									Mua Sắm</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>

	<!-- Javascript -->
	<script>
	
	//function  tang san pham
	function plusCart(uID, cID, argument){
		
		//the span chua so luong cua san phan khi tang
		var quantity_tag = argument.parentNode.querySelector('span');
		var quantityValue = quantity_tag.textContent;
		
		//console.log(quantityValue)
		
		//tag totalPrice
		var totalPrice_tag = argument.parentNode.parentNode.parentNode.querySelector('#tongGia');
		
		var tongGia = totalPrice_tag.textContent;
		console.log(tongGia);
		
		
		 $.ajax ({
			type:"GET",
			url: "plus",
			data:{
				userID: uID,
				cartID: cID,
				value: quantityValue,
				tongGia: tongGia
			},
			success: function(response){

				var data = JSON.parse(response);
				quantity_tag.textContent = data.quantity;
				totalPrice_tag.textContent = data.price;
			},
			error: function(error){
				console.log(error)
			}
		})
	}
	
	//function giam san pham
	function minusCart(uID, cID, argument){
		//the span chua so luong cua san phan khi tang
		var quantity_tag = argument.parentNode.querySelector('span');
		var quantityValue = quantity_tag.textContent;
		
		//console.log(quantityValue)
		
		//tag totalPrice
		var totalPrice_tag = argument.parentNode.parentNode.parentNode.querySelector('#tongGia');
		
		var tongGia = totalPrice_tag.textContent;
		//console.log(tongGia);
		
		
		  $.ajax ({
			type:"GET",
			url: "minus",
			data:{
				userID: uID,
				cartID: cID,
				value: quantityValue,
				tongGia: tongGia
			},
			success: function(response){
				var data = JSON.parse(response);
				quantity_tag.textContent = data.quantity;
				totalPrice_tag.textContent = data.price;
				
			},
			error: function(error){
				console.log(error)
			}
		}) 
	}

	</script>
	<%@include file="all_component/back_top.jsp"%>
</body>
</html>