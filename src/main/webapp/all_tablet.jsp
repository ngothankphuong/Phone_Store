<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="all_component/allCss.jsp"%>
<%@include file="all_component/taglib.jsp"%>
<meta charset="ISO-8859-1">
<title>Tất cả Máy Tính Bảng</title>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userObj");
	%>

	<%@include file="all_component/navbar.jsp"%>
	<h3 class="text-center p-3">Máy Tính Bảng</h3>
	<div class="container-fuild">
		<div class="row p-3">
			<%
			SanPhamDAO dao = new SanPhamDAO(DBConnect.getConn());
			List<SanPham> listSP = dao.getAllTablet();
			for (SanPham sp : listSP) {
			%>

			<div class="col-md-3 mt-3">
				<div class="card card-hov">
					<div class="card-body">
						<img src="sanpham/<%=sp.getHinhAnh()%>" alt=""
							class="img-thumblin size-img-book"
							style="width: 130px; height: 140px" />

						<p>
							Tên:<%=sp.getTenSanPham()%></p>
						<p>
							Hãng:<%=sp.getHang()%></p>
						<div>
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i> Thêm vào giỏ hàng</a>
							<%
							} else {
							%>
							<a onclick="addToCart(<%=sp.getId()%>,<%=u.getId()%>, this)"
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i> Thêm vào giỏ hàng</a>
							<%
							}
							%>
							<div>
								<form>
									<input type="hidden" id="id_detail" name="id_detail"
										value="<%=sp.getId()%>">
									<button onclick="getDetail(this)" value="<%=sp.getId()%>"
										type="button" class="btn btn-primary btn-sm mt-1 mb-1"
										data-toggle="modal" data-target="#detail">Xem chi
										tiết</button>
								</form>
							</div>
							<div>
								<a class="btn btn-success btn-sm text-white"><%=sp.getGia()%>
									VND</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>

	<div id="content_detail"></div>
	<!-- Modal detail -->
	<div class="modal fade" id="detail" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<p class="modal-title" id="exampleModalLongTitle">Chi tiết sản
						phẩm</p>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h5 id="detail_content"></h5>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>

	<script>
		//function show detail
		function getDetail(argument) {
			var id_detail = argument.parentNode.firstElementChild.value;

			$.ajax({
				type : "POST",
				url : "detail",
				data : {
					id_detail : id_detail
				},
				success : function(response) {
					var content = document.getElementById("detail_content");
					content.innerHTML += response;
				},
				error : function(error) {
					console.error(error);
				}
			});
		}
		// clear detail modal when hidden
		$('#detail').on('hidden.bs.modal', function() {
			var content = document.getElementById("detail_content");
			content.innerHTML = '';
		});

		//function add to cart
		function addToCart(spID, userID, argument) {
			//console.log(spID, userID, argument);
			$.ajax({
				type : "GET",
				url : "addCart",
				data : {
					IdSanPham : spID,
					UserID : userID
				},
				success : function(data) {
					if (data == "true") {
						var preValue = document.getElementById("thongbao");
						alert("Đã thêm vào giỏ hàng !");
					}
				},
				error : function(error) {
					console.error(error);
				}
			})
		}
	</script>
	<%@include file="all_component/back_top.jsp"%>
</body>
</html>