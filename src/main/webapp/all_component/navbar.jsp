<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="taglib.jsp"%>

<c:if test="${not empty userObjAdmin}">
	<c:redirect url="admin/home.jsp" />
</c:if>


<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 ">
			<h3>
				<i class="fa-brands fa-apple"></i> Apple Store
			</h3>
		</div>
		<div class="col-md-6">
			<form action="search.jsp" method="post"
				class="form-inline my-2 my-lg-0">
				<input required="required" name="searchSP"
					class="form-control mr-sm-2" type="search"
					placeholder="Thông tin sản phẩm" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm
					kiếm</button>
			</form>
		</div>



		<!-- Neu nguoi dung da dang nhap hien thi ten nguoi dung va gio hang-->
		<c:if test="${not empty userObj }">
			<div class="col-md-3">

				<!-- kiem tra nguoi dung co order san pham hay khong -->
				<%
				User user = (User) session.getAttribute("userObj");

				if (user != null) {
					OrderDAO odao = new OrderDAO(DBConnect.getConn());
					String email = user.getEmail();
					//System.out.println(email);
					boolean f = odao.isNotOrder(email);
					if (!f) {
				%>
				<a type="button" href="donHang.jsp"
					class="btn btn-success text-white" data-toggle="tooltip"
					data-placement="left" title="Đơn hàng đã đặt"><i
					style="font-size: 23px" class="fa-sharp fa-solid fa-box-open-full"></i></a>

				<%
				}
				}
				%>

				<a type="button" data-toggle="tooltip" data-placement="left"
					title="Giỏ hàng" href="checkout.jsp" class="btn btn-danger mr-2">
					<i style="font-size: 23px; margin-top: 2px"
					class="fa-solid fa-cart-plus"></i>
				</a> <a href="" class="btn btn-success"><i
					class="fa-solid fa-user mr-1"></i>${userObj.name}</a> <a
					data-toggle="modal" data-target="#exampleModalCenter" href=""
					class="btn btn-primary ml-1"><i
					class="fa-solid fa-right-from-bracket mr-2"></i>Đăng Xuất</a>
			</div>
		</c:if>

		<!-- Khi nguoi dung rong => chua dang nhap -->
		<c:if test="${empty userObj }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-right-to-bracket mr-1"></i> Đăng Nhập</a> <a
					href="register.jsp" class="btn btn-primary ml-1"><i
					class="fa-solid fa-user-plus mr-2"></i>Đăng Ký</a>
			</div>
		</c:if>

	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark"
	style="background-color: #000">
	<a class="navbar-brand" href="index.jsp"><i class="fa fa-home"></i></a>
	<button onclick="toggleNav()" class="navbar-toggler" type="button"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Trang
					Chủ</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_phone.jsp"><i class="fa-solid fa-mobile-screen-button"></i>
					Điện Thoại</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_laptop.jsp"><i class="fa-solid fa-laptop"></i> Máy
					Tính Xách Tay</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_tablet.jsp"><i class="fa-solid fa-tablet"></i> Máy
					Tính Bảng</a></li>
		</ul>
	</div>
</nav>

<!-- Logout modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4>Đăng xuất tài khoản?</h4>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
					<a href="logout" type="button" class="btn btn-primary text-white">Đăng
						Xuất</a>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- End logout modal -->


<script>
	$(function() {
		$('[data-toggle="tooltip"]').tooltip()
	})

	function toggleNav() {
		// Lấy thẻ div cần kiểm tra
		var navbarCollapse = document.getElementById("navbarSupportedContent");

		// Kiểm tra xem thẻ div đã có class "show" chưa
		var hasClass = navbarCollapse.classList.contains("show");

		// Nếu có class "show", xóa nó; nếu không, thêm vào
		if (hasClass) {
			navbarCollapse.classList.remove("show");
		} else {
			navbarCollapse.classList.add("show");
		}
	}
</script>
