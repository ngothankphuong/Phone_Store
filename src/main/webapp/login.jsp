<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="all_component/taglib.jsp"%>
<%@include file="all_component/allCss.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
</head>
<body style="background-color: #f0f1f2">

	<!-- Kiem tra nguoi dung da dang nhap hay chua , neu da dang nhap chuyen den trang index -->
	<c:if test="${not empty userObj}">
		<c:redirect url="index.jsp" />
	</c:if>


	<!-- thong bao dang xuat thanh cong -->
	<c:if test="${not empty logoutsucessMsg}">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<strong>Thông Báo: </strong> Đăng xuất thành công!
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<c:remove var="logoutsucessMsg" scope="session" />
	</c:if>
	
	
	<!-- thong bao dang nhap khong thanh cong -->
	<c:if test="${not empty loginfaileMsg}">
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">
			<strong>Thông Báo: </strong> ${loginfaileMsg }
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<c:remove var="loginfaileMsg" scope="session" />
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center font-weight-bold">Đăng Nhập</h3>

						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Địa chỉ email</label> <input
									name="email" required="required" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword2">Mật khẩu</label> <input
									name="password" required="required" type="password"
									class="form-control" id="exampleInputPassword2" placeholder="">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Đăng nhập</button>
								<br> <a href="register.jsp" target="target">Tạo tài
									khoản? </a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/back_top.jsp"%>
</body>
</html>