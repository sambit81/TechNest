<%@page import="com.tech.nest.entities.Category"%>
<%@page import="com.tech.nest.helper.ConnectionProvider"%>
<%@page import="com.tech.nest.dao.PostDao"%>
<%@page import="com.tech.nest.entities.User"%>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp" %>


<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= user.getName() %> | TechNest</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="icon" type="image/png" href="img/favicon.png">
<style>
body{
                background:url(img/bg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
}
</style>
</head>
<body>

	<!-- navbar -->
	<nav
		class="navbar navbar-expand-lg bg-body-tertiary primary-background navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><span
				class="fa fa-asterisk"></span> Tech Nest</a>
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
					<li class="nav-item">
						<a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal">
						<span class="fa fa-user-circle"></span> <%= user.getName() %>
						</a>
					</li>
					
					<li class="nav-item">
				    	<a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="fa fa-asterisk"></span> Do Post</a>
				    </li>
					
					<li class="nav-item">
						<a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus"></span> Logout</a>
					</li>
					
					<li class="nav-item"><a class="nav-link" href="#"
					data-bs-toggle="modal" data-bs-target="#contactModal"><span
						class="fa-regular fa-address-card"></span> Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- end of navbar -->
	<%@include file="contact.jsp"%>
	<main>
		<div class="container">
			<div class="row mt-4">
				<!-- first col -->
				<div class="col-md-4">
					<!-- categories -->
					<div class="list-group">
						<a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active">
							All posts
						</a>
						<!-- categories -->
						<%
							PostDao d = new PostDao(ConnectionProvider.getConnection());
							ArrayList<Category> list1 = d.getAllCategories();
							for (Category cc : list1) {
						%>
						
						<a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName()%></a>
						<%
							}
						%>
					</div>
				</div>
				
				<!-- second col -->
				<div class="col-md-8">
					<!-- posts --> 
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading...</h3>
					</div>
					
					<div class="container-fluid" id="post-container">
					
					</div>
				</div>
			</div>
		</div>
	</main>
	
	
	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel"> TechNest </h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="img/<%= user.getProfile() %>" class="img-fluid" style="border-radius:50%;max-width: 150px;;">
						<br>
						<h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName() %> </h5>
						<!-- //details -->
						
						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row"> ID :</th>
										<td> <%= user.getId() %> </td>
									</tr>
									<tr>
										<th scope="row"> Email : </th>
										<td><%= user.getEmail() %></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%= user.getGender() %></td>
									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%= user.getAbout() %></td>
									</tr>
									<tr>
										<th scope="row"> Registered on :</th>
										<td><%= user.getDateTime().toString() %> </td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<!-- profile edit -->
						
						<div id="profile-edit" style="display: none;">
							<h3 class="mt-2">Please Edit Carefully</h3>
							<form action="EditServlet" method="post" enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%= user.getId() %> </td>
									</tr>
									<tr>
										<td>Email :</td>
										<td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>
									</tr>
									<tr>
										<td>Name :</td>
										<td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"></td>
									</tr>
									<tr>
										<td>Password :</td>
										<td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"></td>
									</tr>
									<tr>
										<td>Gender :</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>About :</td>
										<td>
											<textarea rows="3" class="form-control" name="user_about"><%= user.getAbout() %></textarea>
										</td>
									</tr>
									<tr>
										<td>New Profile:</td>
										<td>
											<input type="file" name="image" class="form-control">
										</td>
									</tr>
								</table>
								
								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							<button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="post">
						<div class="form-group mb-2">
							<select class="form-control" name="cid" required>
								<option value="" selected disabled>---Select Category---</option>
								
								<%
									PostDao postd = new PostDao(ConnectionProvider.getConnection());
									ArrayList<Category> list = postd.getAllCategories();
									for(Category c : list) {
								%>
								<option value="<%= c.getCid() %>"><%= c.getName() %> </option>
								
								<%
									}
								%> 
							</select>
						</div>
						
						<div class="form-group mb-2">
							<input name="pTitle" type="text" placeholder="Enter post title" class="form-control" required>
						</div>
						
						<div class="form-group mb-2">
							<textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content" required></textarea>
						</div>
						
						<div class="form-group mb-2">
							<textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
						</div>
						
						<div class="form-group mb-2">
							<label>Select your pic..</label>
							<br>
							<input type="file" name="pic">
						</div>
						
						<div class="container text-center mb-2">
							<button type="submit" class="btn btn-outline-primary">Post </button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.17.2/dist/sweetalert2.all.min.js"></script>
	<script>
		$(document).ready(function () {
			let editStatus = false;
			
			$('#edit-profile-button').click(function() {
				if (editStatus == false) {
					$("#profile-details").hide();
					
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back");
				} else {
					$("#profile-details").show()
					
					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("Edit")
				}
			})
		})
	</script>
	
	<!-- now add post js -->
	<script>
		$(document).ready(function (e) {
			$("#add-post-form").on("submit", function(event) {
				// this code gets called when form is submitted....
				event.preventDefault(); // prevent the normal behaviour of making synchronous call
				console.log("You have clicked on submit..");
				let form = new FormData(this);
				
				
				// now requesting to server
				$.ajax({
					url: "AddPostServlet",
					type: 'POST',
					data: form,
					success: function (data, textStatus, jqXHR) {
						// success ..
						console.log("data"+data);
						if (data.trim() == 'empty') {
							Swal.fire({
								icon: "error",
								title: "Error",
								text: "Please fill all the required fields",
							})
						}
						else if (data.trim() == 'done') {
							Swal.fire({
								  title: "Successfully posted",
								  icon: "success",
								});
						} else {
							Swal.fire({
								  icon: "error",
								  title: "Oops...",
								  text: "Something went wrong!",
								});
						}
					},
					error: function (jqXHR, textStatus, errorThrown) {
						//error..
						Swal.fire({
							  icon: "error",
							  title: "Oops...",
							  text: "Something went wrong!",
							});
					},
					processData: false,
					contentType: false
				})
			})
		})
	</script>
	
	<!-- loading post using ajax -->
	<script>
		
		function getPosts(catId, temp) {
			$("#loader").show();
			$("#post-container").hide()
			
			$(".c-link").removeClass('active');
			
			$.ajax({
				url: "load_posts.jsp",
				data: {cid: catId},
				success: function (data, textStatus, jqXHR) {
					console.log(data);
					$("#loader").hide();
					$("#post-container").show();
					$("#post-container").html(data)
					$(temp).addClass('active')
				}
			})
		}
		
		$(document).ready(function (e) {
			let allPostRef = $('.c-link')[0]
			getPosts(0, allPostRef)
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