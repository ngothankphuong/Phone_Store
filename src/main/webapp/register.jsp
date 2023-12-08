<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="all_component/taglib.jsp"%>
<%@include file="all_component/allCss.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng ký tài khoản</title>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container mt-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center font-weight-bold">Đăng Ký Tài Khoản</h4>

						<!-- Thong bao dang ky thanh cong -->
						<c:if test="${not empty registerSuccMsg}">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>Thông Báo: </strong> ${registerSuccMsg }
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<c:remove var="registerSuccMsg" />
						</c:if>

						<!-- thong bao dang ky khong thanh cong -->
						<c:if test="${not empty registerFaileMsg}">
							<p class="text-center text-danger">${registerFaileMsg}</p>
							<c:remove var="registerFaileMsg" />
						</c:if>

						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Tên</label> <input
									required="required" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="" name="username">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Địa chỉ email</label> <input
									required="required" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Mật khẩu</label> <input
									required="required" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="" name="password">
							</div>
							<button type="submit" class="btn btn-primary">Đăng ký</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
