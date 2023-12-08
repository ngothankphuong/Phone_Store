<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tìm kiếm sản phẩm</title>

<%@include file="all_component/allCss.jsp"%>
<%@include file="all_component/taglib.jsp"%>
</head>
<body>

	<%
	//Lay ra user da dang nhap
	User u = (User) session.getAttribute("userObj");
	%>


	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fuild">
		<div class="row p-3">
			<%
			String search = request.getParameter("searchSP");
			SanPhamDAO dao = new SanPhamDAO(DBConnect.getConn());
			List<SanPham> listSearch = dao.getSearch(search);
			for (SanPham sp : listSearch) {
			%>

			<div class="col-md-3 mt-3">
				<div class="card card-hov">
					<div class="card-body text-center">
						<img src="sanpham/<%=sp.getHinhAnh()%>" alt=""
							class="img-thumblin size-img-book"
							style="width: 130px; height: 140px" />
						<p>
							Tên:<%=sp.getTenSanPham()%></p>
						<p>
							Cấu Hình:<%=sp.getCauHinh()%></p>
						<p>
							Hãng:<%=sp.getHang()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i> Thêm vào giỏ hàng</a>
							<%
							} else {
							%>
							<a href="addCart?spID=<%=sp.getId()%>&&userID=<%=u.getId()%>"
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i> Thêm vào giỏ hàng</a>
							<%
							}
							%>
							<a class="btn btn-success btn-sm ml-1 text-white"><%=sp.getGia()%><i
								class="fa-solid fa-dollar-sign ml-1"></i></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>
	<%@include file="all_component/back_top.jsp"%>
</body>
</html>