<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@include file="all_component/taglib.jsp"%>
<%@include file="all_component/allCss.jsp"%>

<title>Trang Chủ</title>
<style>
.back-img {
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

body {
	background-color: #f7f7f7;
}

.card-hov:hover {
	background-color: #e6e6e6;
	font-weight: 500;
}

a {
	text-decoration: none;
	color: black;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>

</head>
<body id="body-tag">


	<%
	//Lay ra user da dang nhap
	User u = (User) session.getAttribute("userObj");
	%>


	<%@include file="all_component/navbar.jsp"%>

	<!-- slider -->
	<div class="container-fluid back-img">
		<div id="carouselExampleControls" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img style="max-height: 790px" class="d-block w-100"
						src="img/bg5.jpg" alt="First slide">
				</div>
				<div class="carousel-item">
					<img style="max-height: 790px" class="d-block w-100"
						src="img/bg1.jpg" alt="Second slide">
				</div>
				<div class="carousel-item">
					<img style="max-height: 790px" class="d-block w-100"
						src="img/bg6.jpg" alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>




	<!-- Start Điện Thoại-->
	<div class="container mt-4">
		<h3 class="text-center">Điện Thooại</h3>
		<div class="row">

			<!-- Hiển thị ra dien thoai -->
			<%
			SanPhamDAO dao = new SanPhamDAO(DBConnect.getConn());
			List<SanPham> listSP = dao.getPhone();
			for (SanPham sp : listSP) {
			%>

			<div class="col-md-3">
				<div class="card card-hov">
					<div class="card-body ">
						<img src="sanpham/<%=sp.getHinhAnh()%>" alt=""
							class="img-thumblin
							size-img-book"
							style="width: 150px; height: 160px" />
						<p>
							Tên:
							<%=sp.getTenSanPham()%></p>
						Hãng:<%=sp.getHang()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a type="button" id="liveToastBtn" href="login.jsp"
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i>Thêm vào giỏ hàng</a>
							<%
							} else {
							%>
							<a onclick="addToCart(<%=sp.getId()%>,<%=u.getId()%>, this)"
								class="btn btn-danger btn-sm text-white"> <i
								class="fa-solid fa-cart-plus"></i>Thêm vào giỏ hàng
							</a>
							<%
							}
							%>


						</div>
						<div class="row">
							<!-- Button trigger modal -->
							<form>
								<input type="hidden" id="id_detail" name="id_detail"
									value="<%=sp.getId()%>">
								<button onclick="getDetail(this)" value="<%=sp.getId()%>"
									type="button" class="btn btn-primary btn-sm mt-1"
									data-toggle="modal" data-target="#detail">Xem chi tiết</button>
							</form>
						</div>

						<div class="row">
							<a class="btn btn-success btn-sm mt-1 text-white"><%=sp.getGia()%>
								VND</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_phone.jsp" class="btn btn-danger btn-sm text-white mt-2">Xem
				tất cả</a>
		</div>
	</div>
	<!-- End Điện Thoại -->

	<hr />

	<!-- Start Laptop-->
	<div class="container mt-4">
		<h3 class="text-center">Máy Tính Xách Tay</h3>
		<div class="row">

			<!-- Hiển thị laptop -->
			<%
			SanPhamDAO dao2 = new SanPhamDAO(DBConnect.getConn());
			List<SanPham> listSP2 = dao.getLaptop();

			for (SanPham sp : listSP2) {
			%>

			<div class="col-md-3">
				<div class="card card-hov">
					<div class="card-body ">
						<img src="sanpham/<%=sp.getHinhAnh()%>" alt=""
							class="img-thumblin
							size-img-book"
							style="width: 150px; height: 160px" />


						<p>
							Tên:
							<%=sp.getTenSanPham()%></p>
						<p>
							Cấu Hình:
							<%=sp.getCauHinh()%></p>
						<p>
							Hãng:
							<%=sp.getHang()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i>Thêm vào giỏ hàng</a>
							<%
							} else {
							%>
							<a onclick="addToCart(<%=sp.getId()%>,<%=u.getId()%>, this)"
								class="btn btn-danger btn-sm text-white"><i
								class="fa-solid fa-cart-plus"></i>Thêm vào giỏ hàng</a>
							<%
							}
							%>

						</div>
						<div class="row">
							<!-- Button trigger modal -->
							<form>
								<input type="hidden" id="id_detail" name="id_detail"
									value="<%=sp.getId()%>">
								<button onclick="getDetail(this)" value="<%=sp.getId()%>"
									type="button" class="btn btn-primary btn-sm mt-1"
									data-toggle="modal" data-target="#detail">Xem chi tiết</button>
							</form>
						</div>
						<div class="row">
							<a class="btn btn-success btn-sm mt-1 text-white"><%=sp.getGia()%>
								VND</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_laptop.jsp"
				class="btn btn-danger btn-sm text-white mt-2">Xem tất cả</a>
		</div>
	</div>
	<!-- End Laptop -->

	<hr />

	<!-- Start Tablet-->
	<div class="container mt-4">
		<h3 class="text-center">Máy Tính Bảng</h3>
		<div class="row">

			<!-- Hiển thị ra tablet -->
			<%
			SanPhamDAO dao3 = new SanPhamDAO(DBConnect.getConn());
			List<SanPham> listSP3 = dao.getTablet();

			for (SanPham sp : listSP3) {
			%>

			<div class="col-md-3">
				<div class="card card-hov">
					<div class="card-body ">
						<img src="sanpham/<%=sp.getHinhAnh()%>" alt=""
							class="img-thumblin
							size-img-book"
							style="width: 150px; height: 160px" />
						<p>
							Tên:
							<%=sp.getTenSanPham()%></p>
						<p>
							Cấu Hình:
							<%=sp.getCauHinh()%></p>
						<p>
							Hãng:
							<%=sp.getHang()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i>Thêm vào giỏ hàng</a>
							<%
							} else {
							%>
							<a onclick="addToCart(<%=sp.getId()%>,<%=u.getId()%>, this)"
								class="btn btn-danger btn-sm text-white"><i
								class="fa-solid fa-cart-plus"></i>Thêm vào giỏ hàng</a>
							<%
							}
							%>

						</div>
						<div class="row">
							<!-- Button trigger modal -->
							<form>
								<input type="hidden" id="id_detail" name="id_detail"
									value="<%=sp.getId()%>">
								<button onclick="getDetail(this)" value="<%=sp.getId()%>"
									type="button" class="btn btn-primary btn-sm mt-1"
									data-toggle="modal" data-target="#detail">Xem chi tiết</button>
							</form>

						</div>
						<div class="row">
							<a class="btn btn-success btn-sm mt-1 text-white"><%=sp.getGia()%>
								VND</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_tablet.jsp"
				class="btn btn-danger btn-sm text-white mt-2">Xem tất cả</a>
		</div>
	</div>
	<!-- End tablet -->

	<!-- Start Footer -->
	<%@include file="all_component/footer.jsp"%>

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
					//console.log(response);
				},
				error : function(error) {
					console.error(error);
				}
			});
		}
		// clear content when the modal hidden
		$('#detail').on('hidden.bs.modal', function() {
			var content = document.getElementById("detail_content");
			content.innerHTML = '';
		});
		
		
		//function Add To Cart
		function addToCart(spID, uID, element){
			//console.log(spID);
			//console.log(uID);
			 $.ajax({
				type: "GET",
				url: "addCart",
				data: {
					IdSanPham: spID,
					UserID : uID
				},
				success: function(data) {
					if(data=="true") {
						var preValue = document.getElementById("thongbao");
						alert("Đã thêm vào giỏ hàng !");
						if (preValue) {
		                    // Xóa giá trị innerHTML trước đó
		                    preValue.innerHTML = "";
		                }
						
						//var body_tag = document.getElementById("body-tag");
						//body_tag.innerHTML +="<div class='alert alert-success alert-dismissible fade show' role='alert'><strong> Add thanh cong </strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span></button></div>";
						
						//var cart = element.parentNode.parentNode;
						//cart.innerHTML = "<div id='thongbao'><div class='alert alert-success alert-dismissible fade show' role='alert'> <strong>Đã Thêm</strong> <button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div></div>" + cart.innerHTML;
					}
				},
				error: function(error) {
					console.error(error);
				}
			}) 
		}
		
	</script>
	<%@include file="all_component/back_top.jsp"%>
</body>
</html>



