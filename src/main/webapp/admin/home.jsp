<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="taglib.jsp"%>
<%@include file="allCss.jsp"%>
<meta charset="ISO-8859-1">
<title>Amin: Home</title>
<style>
.a-link {
	color: black;
}

.a-link:hover {
	text-decoration: none;
	opacity: 0.7;
	color: #000;
}
</style>

</head>
<body>
	<%@include file="navbar.jsp"%>

	<!-- Kiem tra khi admin chua dang nhap chuyen den trang login -->
	<c:if test="${empty userObjAdmin}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-4">
				<a class="a-link" href="add_item.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-medical fa-3x text-primary"></i><br />
							<h4>Thêm Sản Phẩm</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a class="a-link" href="all_item.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book fa-3x text-warning"></i><br />
							<h4>Tất Cả Sản Phẩm</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a class="a-link" href="all_order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-regular fa-3x fa-box-open text-danger"></i>
							<h4>Đơn Hàng</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>


			<!-- <div class="col-md-4">
				<a class="a-link" data-toggle="modal"
					data-target="#exampleModalCenter" href="../logout">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x text-danger"></i><br />
							<h4>Đăng Xuất</h4>
							-----------------
						</div>
					</div>
				</a>
			</div> -->
		</div>
	</div>

	<!-- Logout modal -->
	<!-- Modal -->
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
						<h4>Do you want logout?</h4>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="../logout" type="button"
							class="btn btn-primary text-white">Logout</a>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- End logout modal -->


	<div style="margin-top: 50px">
		<%@include file="footer.jsp"%>
	</div>
	<%@include file="back_top.jsp"%>
</body>
</html>