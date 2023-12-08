<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="allCss.jsp"%>
<%@include file="taglib.jsp"%>
<meta charset="ISO-8859-1">
<title>Chỉnh Sửa Sản Phẩm</title>
</head>
<body>

	<c:if test="${ empty userObjAdmin }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<%
	int spID = Integer.parseInt(request.getParameter("spID"));
	//lay ra san pham theo ID edit
	SanPhamDAO dao = new SanPhamDAO(DBConnect.getConn());
	SanPham sp = dao.getSanPhamByID(spID);
	%>

	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 mt-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Chỉnh sửa sản phẩm</h4>

						<form action="../editItem" method="post">
							<input type="hidden" name="spID" value="<%=sp.getId()%>" />
							<div class="form-group">
								<label for="exampleFormControlInput1">Tên Sản Phẩm*</label> <input
									name="ten_san_pham" type="text" class="form-control"
									id="exampleFormControlInput1" required="required"
									value="<%=sp.getTenSanPham()%>">
							</div>

							<div class="form-group">
								<label for="exampleFormControlInput10">Cấu Hình*</label> <input
									name="cau_hinh" type="text" class="form-control"
									id="exampleFormControlInput10" required="required"
									value="<%=sp.getCauHinh()%>">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput3">Hãng*</label> <input
									name="hang" type="text" class="form-control" placeholder=""
									id="exampleFormControlInput3" required="required"
									value="<%=sp.getHang()%>">
							</div>
							<div class="form-group">
								<label for="trangthai">Trạng Thái*</label> <select
									class="form-control" id="trangthai" name="trang_thai">
									<%
									if ("active".equals(sp.getTrangThai())) {
									%>

									<option value="active">Hiển thị</option>
									<option value="inactive">Không hiển thị</option>
									<%
									} else {
									%>

									<option value="inactive">Không hiển thị</option>
									<option value="active">Hiển thị</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="form-group">
								<label for="inputState2">Giá*</label> <input name="gia"
									step="0.01" type="number" class="form-control"
									placeholder="VND" id="inputState2" required="required"
									value="<%=sp.getGia()%>">
							</div>
							<button type="submit" class="btn btn-primary">Cập nhật</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>