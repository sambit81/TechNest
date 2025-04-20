<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TechNest | Register</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="icon" type="image/png" href="img/favicon.png">
<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.17.2/dist/sweetalert2.min.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="normal_navbar.jsp"%>

	<main class="primary-background banner-background"
		style="padding-bottom: 80px;">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center primary-background text-white">
						<span class="fa fa-3x fa-user-circle"></span> <br> Register
						here
					</div>
					<div class="card-body">
						<form id="reg-form" action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="user_name">User Name</label> <input name="user_name"
									type="text" class="form-control" id="user_name"
									aria-describedby="emailHelp" placeholder="Enter name" required>
							</div>
							<br>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="user_email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email" required> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else. </small>
							</div>
							<br>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="user_password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password" required>
							</div>
							<br>
							<div class="form-group">
								<label for="gender">Select Gender</label> <br> <input
									type="radio" id="gender" name="gender" value="male">Male
								<input type="radio" id="gender" name="gender" value="female">Female
							</div>
							<br>
							<div class="form-group">
								<textarea name="about" class="form-control" id="" rows="5"
									placeholder="Enter something about yourself"></textarea>
							</div>
							<br>
							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms and conditions</label>
							</div>

							<br>

							<div class="container text-center" id="loader"
								style="display: none;">
								<span class="fa fa-refresh fa-spin fa-4x"></span>
								<h4>Please wait..</h4>
							</div>

							<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.17.2/dist/sweetalert2.all.min.js"></script>
	<script>
		$(document).ready(function() {
			console.log("loaded............");
			$('#reg-form').on('submit', function(event) {
				event.preventDefault();
				
				let form = new FormData(this);
				
				
				$("#submit-btn").hide();
				$("#loader").show();
				
				//send register servlet:
				$.ajax({
					url: "RegisterServlet",
					type: 'POST',
					data: form,
					success: function (data, textStatus, jqXHR) {
						console.log(data);
						
						$("#submit-btn").show();
						$("#loader").hide();
						
						if(data.trim() === 'done') {
							console.log('Success')
							
							Swal.fire({
								title: "Registered successfully..We are going to redirect to login page",
							}).then((value) => {
								window.location = "login_page.jsp";
							});
							
							/*
							Swal.fire({
								  title: 'Error!',
								  text: 'Do you want to continue',
								  icon: 'error',
								  confirmButtonText: 'Cool'
								})*/
						} else {
							console.log(data);
							Swal.fire(data);
						}
					},
					error: function(jqXHR, textStatus, errorThrown) {
						$("#submit-btn").show();
						$("#loader").hide();
						Swal.fire("Something went wrong..try again");
					},
					processData: false,
					contentType: false
				})
			})
		})
	</script>
	<script type="text/javascript">
		var submitted = false;
		
		document.getElementById("query-form").addEventListener('submit', function () {
			submitted = true;
			$("#success-alert").hide();
			$('#submit-query-loader').show();
			$('#submit-query').prop('disabled', true);
			$("#submit-text").text("Submitting...");
		});
		
		// Detect when form is done submitting
		document.getElementById("hidden_iframe").onload = function() {
			if (submitted) {
				$('#submit-query-loader').hide();
				$('#submit-query').prop('disabled', false);
				$("#submit-text").text("Submit");
				
				$('#success-alert').fadeIn();
				setTimeout(() => {
					$("#success-alert").fadeOut();
				}, 4000);
				
				document.getElementById("query-form").reset();
				submitted = false;
			}
		}
	</script>

</body>
</html>