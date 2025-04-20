<%@page import="com.tech.nest.dao.TutorialDao"%>
<%@page import="com.tech.nest.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.tech.nest.entities.Tutorials"%>
<%@page import="com.tech.nest.dao.TutorialDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.nest.entities.User"%>
<%
User u = (User) session.getAttribute("currentUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TechNest</title>
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
</head>
<body>
	<nav
		class="navbar navbar-expand-lg bg-body-tertiary primary-background navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><span
				class="fa fa-asterisk"></span> TechNest</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<!-- 
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#"><span class="fa fa-bell-o"></span>
							LearnCode with Durgesh</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <span
							class="fa fa-check-square-o"></span> Categories
					</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Programming
									Language</a></li>
							<li><a class="dropdown-item" href="#">Project
									Implementation</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Data Structure</a></li>
						</ul></li>
					-->
				</ul>
				<ul class="navbar-nav mr-right">
					<%
					if (u == null) {
					%>
					<li class="nav-item"><a class="nav-link" href="login_page.jsp"><span
							class="fa fa-user-circle"></span> Login</a></li>
					<li class="nav-item"><a class="nav-link"
						href="register_page.jsp"><span class="fa fa-user-plus"></span>
							Sign up</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-bs-toggle="modal" data-bs-target="#contactModal"><span
							class="fa-regular fa-address-card"></span> Contact</a></li>
					<%
					}
					%>
				</ul>
				<!-- <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> -->
				<%
				if (u != null) {
				%>
				<ul class="navbar-nav mr-right">
					<li class="nav-item"><a class="nav-link" href="profile.jsp">
							<span class="fa fa-user-circle"></span> Profile
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-bs-toggle="modal" data-bs-target="#contactModal"><span
							class="fa-regular fa-address-card"></span> Contact</a></li>
				</ul>
				<%
				}
				%>
			</div>
		</div>
	</nav>
	<%@include file="contact.jsp"%>
	<!-- //banner -->
	<div class="jumbotron primary-background text-white banner-background">
		<div class="container">
			<h3 class="display-3">Welcome to TechNest</h3>

			<p>Welcome to technical blog, world of technology. A programming
				language is a formal language, which comprises a set of instructions
				that produce various kinds of output. Programming languages are used
				in computer programming to implement algorithms.</p>
			<p>Most programming languages consist of instructions for
				computers. There are programmable machines that use a set of
				specific instructions, rather than general programming languages.</p>

			<%
			if (u == null) {
			%>
			<button class="btn btn-outline-light btn-lg mb-5">
				<span class="fa fa-user-plus"></span> Start ! its Free
			</button>
			<a href="login_page.jsp" class="btn btn-outline-light btn-lg mb-5"><span
				class="fa fa-user-circle"></span> Login</a>
			<%
			} else {
			%>
			<br> <br> <br> <br>
			<%
			}
			%>
		</div>
	</div>


	<!-- cards -->
	<br>
	<div class="container">
		<%
		TutorialDao tutDao = new TutorialDao(ConnectionProvider.getConnection());
		List<Tutorials> list = tutDao.getAllTutorials();

		int length = list.size();
		%>
		<div class="row mb-2 row-cols-3">
			<%
			for (int i = 0; i < length; i++) {
				Tutorials t = list.get(i);
			%>
			<div class="col mb-2">
				<div class="card">
					<img src="blog_pics/<%=t.gettImage()%>" class="card-img-top"
						alt="..." style="height: 165px;">
					<div class="card-body">
						<h5 class="card-title"><%=t.gettName()%></h5>
						<a href="<%=t.gettLink()%>"
							class="btn primary-background text-white" target="_blank">Read more</a>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.17.2/dist/sweetalert2.all.min.js"></script>
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