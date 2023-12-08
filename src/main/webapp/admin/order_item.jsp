<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="allCss.jsp"%>
<%@include file="taglib.jsp"%>
<meta charset="ISO-8859-1">
<title>Trang đơn hàng</title>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container">
		<h3 class="text-center text-primary p-3">Tất cả đơn hàng</h3>
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">ID Đơn</th>
					<th scope="col">Tên Sản Phẩm</th>
					<th scope="col">Cấu Hình</th>
					<th scope="col">Hãng</th>
					<th scope="col">Giá</th>
					<th scope="col">Tên người dùng</th>
					<th scope="col">Email</th>
					<th scope="col">Số điện thoại</th>
					<th scope="col">Địa chỉ</th>
					<th scope="col">PT Thanh Toán</th>
				</tr>
			</thead>
			<tbody>

				
				<tr>
					<th scope="row"></th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
	<%@include file="back_top.jsp"%>
	<%@include file="footer.jsp"%>
</body>
</html>