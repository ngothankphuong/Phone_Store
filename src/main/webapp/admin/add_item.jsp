<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Thêm Sản Phẩm</title>
<%@include file="allCss.jsp"%>
<%@include file="taglib.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userObjAdmin}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 mt-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Thêm Sản Phẩm</h4>

						<c:if test="${not empty addsuccMsg}">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>Thông Báo: </strong> ${addsuccMsg }
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<c:remove var="addsuccMsg" />
						</c:if>


						<c:if test="${not empty addfaileMsg}">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<strong>Thông Báo: </strong> ${addfaileMsg }
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<c:remove var="addfaileMsg" />
						</c:if>

						<form action="../add_item" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleFormControlInput1">Tên Sản Phẩm*</label> <input
									name="ten_san_pham" type="text" class="form-control"
									id="exampleFormControlInput1" required="required">
							</div>

							<div class="form-group">
								<label for="exampleFormControlInput10">Cấu Hình*</label> <input
									name="cau_hinh" type="text" class="form-control"
									id="exampleFormControlInput10" required="required">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput3">Hãng*</label> <input
									name="hang" type="text" class="form-control" placeholder=""
									id="exampleFormControlInput3" required="required">
							</div>
							<div class="form-group">
								<label for="inputState">Loại Sản Phẩm*</label> <select
									class="form-control" id="inputState" name="loai_san_pham">
									<option value="selected">--Chọn--</option>
									<option value="dien_thoai">Điện Thoại</option>
									<option value="laptop">Máy Tính Xách Tay</option>
									<option value="may_tinh_bang">Máy Tính Bảng</option>
								</select>
							</div>
							<div class="form-group">
								<label for="trangthai">Trạng Thái*</label> <select
									class="form-control" id="trangthai" name="trang_thai">
									<option value="selected">--Chọn--</option>
									<option value="active">Hiển thị</option>
									<option value="inactive">Không hiển thị</option>
								</select>
							</div>

							<div class="form-group">
								<label for="inputState2">Giá*</label> <input name="gia"
									step="0.01" type="number" class="form-control"
									placeholder="VND" id="inputState2" required="required">
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile4">Chọn Ảnh*</label> <input
									name="san_pham_img" type="file" class="form-control-file"
									id="exampleFormControlFile4" required="required" />
							</div>
							<button type="submit" class="btn btn-primary">Thêm</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="back_top.jsp"%>
	<div style="margin-top: 20px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>