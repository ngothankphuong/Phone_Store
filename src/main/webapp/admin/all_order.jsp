<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="taglib.jsp"%>
<%@include file="allCss.jsp"%>
<meta charset="ISO-8859-1">
<title>Tất cả Đơn Hàng</title>
</head>
<body>

	<c:if test="${empty userObjAdmin}">
		<c:redirect url="../login.jsp" />
	</c:if>


	<%@include file="navbar.jsp"%>
	<h3>Tất cả đơn hàng</h3>
	<div class="container">

		<div class="row p-1">


			<div class="card-deck">
				<div class="">
					<%
					OrderDAO odao = new OrderDAO(DBConnect.getConn());

					List<Order> listO = odao.getAllOrder();
					//System.out.println("list O " + listO);

					if (listO.isEmpty()) {
					%>
					<h3>Không có đơn hàng</h3>
					<%
					} else {
					%>
					
					<!-- check box -->
					<label class="btn btn-success" for="confirmed"> <input
						id="confirmed" type="checkbox"
						aria-label="Checkbox for following text input"> Đã xác
						nhận
					</label> <label class="btn btn-danger ml-2" for="not_confirmed"> <input
						id="not_confirmed" type="checkbox"
						aria-label="Checkbox for following text input"> Chưa xác
						nhận
					</label>
					
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
								<th scope="col">Hành động</th>

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
								<%
								if (o.getStatus().equals("confirm")) {
								%>
								<td class="text-center "><span class="badge badge-success"><%=o.getStatus()%></span></td>
								<td>
									<p onclick="deleteOrder(this)"
										class="text-white btn btn-sm btn-danger">Delete</p>
								</td>
								<%
								} else {
								%>
								<td class="text-center "><span class="badge badge-danger"><%=o.getStatus()%></span></td>
								<td>
									<p onclick="confirmOrder(this)"
										class="text-white btn btn-sm btn-success">Confirm</p>
								</td>
								<%
								}
								%>

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
	<script>
		//confirm Order
		function confirmOrder(argument) {
			var orderID = argument.parentNode.parentNode.childNodes[1].textContent;
			//td tag
			var messConfirm = argument.parentNode.parentNode
					.getElementsByTagName('td')[11]
			//console.log(messConfirm)

			//span tag
			var spanTag = messConfirm.firstChild

			//parent btn delete
			var pDelete = argument.parentNode
			
			//delete button
			var btnDelete = argument.parentNode.getElementsByTagName('p')[1]
			//console.log(btnDelete)
			$.ajax({
				type : "GET",
				url : "../confirmOrder",
				data : {
					maOrder : orderID
				},
				success : function(data) {
					//console.log(argument)
					//console.log(data)
					if (data == "true") {
						argument.classList.add("disabled")
						if (spanTag) {
							spanTag = ""
						}
						messConfirm.innerHTML = "<span class='badge badge-success'>confirm</span>";
						if (btnDelete) {
							btnDelete = ""
						}
						pDelete.innerHTML = "<a class='text-white btn btn-sm btn-danger'>Delete</a>";
					}
				},
				error : function(error) {
					console.error(error);
				}
			})
		}
		//delete Order
		function deleteOrder(argument) {
			var maOrder = argument.parentNode.parentNode.childNodes[1].textContent;
			//console.log(argument.parentNode.parentNode.childNodes[1].textContent);
			var orderLine = argument.parentNode.parentNode
			//console.log(orderLine)
			$.ajax({
				type: "POST",
				url : "../deleteOrder",
				data: {
					orderID: maOrder
				},
				success: function(response){
					if(response == "true"){
						orderLine.innerHTML = ""
					}
				},
				error: function(error){
					console.log(error)
				}
			})
		}
	</script>



	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</body>
</html>