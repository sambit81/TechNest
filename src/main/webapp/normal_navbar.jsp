<!-- 
<nav class="navbar navbar-expand-lg bg-body-tertiary primary-background navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>Tech Blog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-bell-o"></span> LearnCode with Durgesh</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <span class="fa fa-check-square-o"></span> Categories
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Programming Language</a></li>
            <li><a class="dropdown-item" href="#">Project Implementation</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Data Structure</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#contactModal"><span class="fa fa-address-card-o"></span> Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle"></span> Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span> Sign up</a>
        </li>
      </ul>
      <!-- 
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
       -->
<!--
    </div>
  </div>
</nav
-->
<%@page import="com.tech.nest.entities.User"%>
<%
User u = (User) session.getAttribute("currentUser");
String uri = request.getRequestURI();
%>
<nav
	class="navbar navbar-expand-lg bg-body-tertiary primary-background navbar-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-asterisk"></span> TechNest</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
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
					if (uri.endsWith("login_page.jsp")) {
				%>
				<li class="nav-item"><a class="nav-link"
					href="register_page.jsp"><span class="fa fa-user-plus"></span>
						Sign up</a></li>
				<%
				} else if (uri.endsWith("register_page.jsp")) {
				%>
				<li class="nav-item"><a class="nav-link" href="login_page.jsp"><span
						class="fa fa-user-circle"></span> Login</a></li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="login_page.jsp"><span
						class="fa fa-user-circle"></span> Login</a></li>
				<li class="nav-item"><a class="nav-link"
					href="register_page.jsp"><span class="fa fa-user-plus"></span>
						Sign up</a></li>
				<%
				}
				%>
				<%
				}
				%>
				<li class="nav-item"><a class="nav-link" href="#"
					data-bs-toggle="modal" data-bs-target="#contactModal"><span
						class="fa-regular fa-address-card"></span> Contact</a></li>
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
			</ul>
			<%
			}
			%>
		</div>
	</div>
</nav>
<%@include file="contact.jsp"%>