<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="taglib.jsp"%>
<%@include file="allCss.jsp"%>
<meta charset="ISO-8859-1">
<title>Đơn hàng chưa xác nhận</title>
</head>
<body>

	<c:if test="${empty userObjAdmin}">
		<c:redirect url="../login.jsp" />
	</c:if>


	<%@include file="navbar.jsp"%>

	<h3>Đơn hàng chưa xác nhận</h3>


	<div class="container">
		<div class="input-group mb-3">

			<!-- check box -->
			<div class="input-group-prepend">
				<div class="input-group-text">
					<input type="checkbox"
						aria-label="Checkbox for following text input"> Đã xác
					nhận
				</div>
			</div>

			<div class="input-group-prepend">
				<div class="input-group-text">
					<input type="checkbox"
						aria-label="Checkbox for following text input"> Chưa xác
					nhận
				</div>
			</div>

		</div>
		<div class="row p-1">
			<div class="card-deck">
				<div class="">
					<%
					OrderDAO odao = new OrderDAO(DBConnect.getConn());

					List<Order> listO = odao.getOrderNew();
					//System.out.println("list O " + listO);

					if (listO.isEmpty()) {
					%>
					<h3>Không có đơn hàng</h3>
					<%
					} else {
					%>
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">Mã đơn hàng</th>
								<th scope="col">Tên sản phẩm</th>
								<th scope="col">Cấu hình</th>
								<th scope="col">Hãng</th>
								<th scope="col">Số lượng</th>
								<th scope="col">Giá</th>
								<th scope="col">Tên người nhận</th>
								<th scope="col">Email</th>
								<th scope="col">Số điện thoại</th>
								<th scope="col">Địa chỉ nhận hàng</th>
								<th scope="col">PTTT</th>
								<th scope="col">Trạng thái</th>

							</tr>
						</thead>
						<%
						for (Order o : listO) {
						%>
						<tbody>

							<tr>
								<td><%=o.getOrID()%></td>
								<td><%=o.getSpName()%></td>
								<td><%=o.getSpCauhinh()%></td>
								<td><%=o.getSpHang()%></td>
								<td><%=o.getSo_luong()%></td>
								<td><%=o.getSpGia()%></td>
								<td><%=o.getUserName()%></td>
								<td><%=o.getUserEmail()%></td>
								<td><%=o.getUserPhone()%></td>
								<td><%=o.getUserAddress()%></td>
								<td><%=o.getPayment()%></td>
								<td>
									<p class="badge badge-danger btn-sm disabled">Chưa xác nhận</p>
									<p class="btn btn-success btn-sm">Xác nhận</p>
								</td>
							</tr>
						</tbody>

						<%
						}
						%>
					</table>
					<%
					}
					%>
				</div>

			</div>
		</div>
	</div>
	<%@include file="back_top.jsp"%>
</body>
</html>