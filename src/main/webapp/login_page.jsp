<%@page import="com.tech.nest.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TechNest | Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="icon" type="image/png" href="img/favicon.png">
<style>
	.banner-background {
		clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
	}
</style>
</head>
<body>
	<!-- navbar -->
	<%@include file="normal_navbar.jsp" %>
	
	<main class="d-flex align-items-center primary-background banner-background" style="height: 70vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-plus fa-3x"></span>
							<br>
							<p>Login here</p>
						</div>
						<%
							Message m = (Message) session.getAttribute("msg");
							if (m != null) {
						%>
						<div class="alert <%= m.getCssClass() %>" role="alert">
  							<%= m.getContent() %>
						</div>
						<%
								session.removeAttribute("msg");
							}
						%>
						<div class="card-body">
							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail">Email address</label>
									<input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
								</div>
								
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label>
									<input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
									
								</div>
								
								<div class="container text-center">
									<button type="submit" class="btn btn-primary mt-2">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<!-- JavaScript -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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