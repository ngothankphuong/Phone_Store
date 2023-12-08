<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="taglib.jsp"%>
<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 ">
			<h3>
				<i class="fa-brands fa-apple"></i> Apple Store
			</h3>
		</div>
		<div class="col-md-6">
			<!-- <form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form> -->
		</div>


		<!-- Khi nguoi dung rong => chua dang nhap -->
		<c:if test="${empty userObjAdmin }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-right-to-bracket mr-1"></i> Đăng Nhập</a> <a
					href="register.jsp" class="btn btn-primary ml-1"><i
					class="fa-solid fa-user-plus mr-2"></i>Đăng Ký</a>
			</div>
		</c:if>

		<!-- Neu admin da dang nhap hien thi ten nguoi dung -->
		<c:if test="${not empty userObjAdmin }">
			<div class="col-md-3">

				<a href="" class="btn btn-success"><i
					class="fa-solid fa-user mr-1"></i>${userObjAdmin.name}</a> <a
					data-toggle="modal" data-target="#exampleModalCenter" href=""
					class="btn btn-primary ml-1"><i
					class="fa-solid fa-right-from-bracket mr-2"></i>Đăng Xuất</a>
			</div>
		</c:if>

	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark"
	style="background-color: #000">
	<!-- <a class="navbar-brand" href="home.jsp"><i class="fa fa-home"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button> -->
	<div class="btn-group" role="group"
		aria-label="Button group with nested dropdown">

		<div class="btn-group" role="group">
			<button type="button" class="btn btn-secondary dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false"></button>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="add_item.jsp">Thêm sản phẩm</a> <a
					class="dropdown-item" href="all_item.jsp">Tất cả sản phẩm</a>
					 <a
					class="dropdown-item" href="all_order.jsp">Đơn hàng</a>
			</div>
		</div>
	</div>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp">Trang
					Chủ</a></li>
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
					<a href="../logout" type="button"
						class="btn btn-primary text-white">Đăng Xuất</a>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- End logout modal -->
