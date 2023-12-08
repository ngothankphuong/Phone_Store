<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="all_component/taglib.jsp"%>
<%@include file="all_component/allCss.jsp"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.NumberFormat"%>
<title>Đơn Hàng</title>
</head>
<body>

	<c:if test="${empty userObj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row p-4">
			<div class="card-deck">

				<div class="col-md">

					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">Mã đơn hàng</th>
								<th scope="col">Tên sản phẩm</th>
								<th scope="col">Số lượng</th>
								<th scope="col">Giá</th>
								<th scope="col">Tên người nhận</th>
								<th scope="col">Địa chỉ nhận hàng</th>
								<th scope="col">Trạn thái</th>
							</tr>
						</thead>
						<%
						User user = (User) session.getAttribute("userObj");
						OrderDAO odao = new OrderDAO(DBConnect.getConn());
						//System.out.println(user.getId());
						List<Order> listO = odao.getOrderUser(user.getId());
						//System.out.println("list O " + listO);
						int totalPrice = 0;
						for (Order o : listO) {
							totalPrice += Integer.parseInt(o.getSpGia());
						%>
						<tbody>
							<tr>
								<td><%=o.getOrID()%></td>
								<td><%=o.getSpName()%></td>
								<td><%=o.getSo_luong()%></td>
								<td><%=o.getSpGia()%></td>
								<td><%=o.getUserName()%></td>
								<td><%=o.getUserAddress()%></td>
								<%
								if (o.getStatus().equals("confirm")) {
								%>
								<td><p class="badge badge-success">Đã xác nhận</p></td>
								<%
								} else {
								%>
								<td>
								<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
										<div class="btn-group" role="group">
											<button type="button"
												class="btn btn-sm btn-danger dropdown-toggle"
												data-toggle="dropdown" aria-expanded="false">Chờ xác nhận</button>
											<div class="dropdown-menu">
												<a onclick="huyOrder(this)" class="dropdown-item" >Hủy</a>
											</div>
										</div>
									</div>
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
				</div>
				<div>
					<p class="btn btn-primary">
						Tổng giá tiền :
						<%=totalPrice%>
						VND
					</p>
				</div>
				<br>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
	<%@include file="all_component/back_top.jsp"%>
	
	<script>
	//huy dat hang
	function huyOrder(argument){
		var maHuy = argument.parentNode.parentNode.parentNode.parentNode.parentNode.childNodes[1].textContent;
		//console.log(maHuy)
		var orderLine =  argument.parentNode.parentNode.parentNode.parentNode.parentNode;
		//console.log(orderLine)
		$.ajax({
			type :"POST",
			url :"huyOrder",
			data :{
				orderID : maHuy
			},
			success : function(response){
				console.log(response);
				if(response == "true"){
					orderLine.innerHTML = "";
				}
			},
			error : function(error){
				console.log(error)
			}
		}) 
		
	}
	</script>
</body>
</html>