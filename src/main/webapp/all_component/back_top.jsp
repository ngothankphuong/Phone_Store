<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
html {
	scroll-behavior: smooth;
}

#myBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	font-size: 18px;
	border: none;
	outline: none;
	background-color: red;
	color: white;
	cursor: pointer;
	padding: 13px 20px;
	border-radius: 4px;
}

#myBtn:hover {
	background-color: #555;
}
</style>
</head>
<body>

	<button onclick="topFunction()" id="myBtn" title="Go to top">
		<i class="fa-solid fa-caret-up"></i>
	</button>


	<script>
		let mybutton = document.getElementById("myBtn");

		window.onscroll = function() {
			scrollFunction()
		};

		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				mybutton.style.display = "block";
			} else {
				mybutton.style.display = "none";
			}
		}
		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
			$('html', 'body').animate({
				scrollTop : 0
			}, 1000);
		}
	</script>

</body>
</html>
