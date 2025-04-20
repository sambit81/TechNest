<%@page import="com.tech.nest.helper.ConnectionProvider"%>
<%@page import="com.tech.nest.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.tech.nest.entities.Comment" %>
<%@page import="com.tech.nest.dao.UserDao" %>
<%@page import="com.tech.nest.entities.User" %>
<div class="row">
<%
	int postId = (int) session.getAttribute("postId");
	Thread.sleep(1000);
	
	CommentDao cDao = new CommentDao(ConnectionProvider.getConnection());
	
	List<Comment> comments = cDao.getAllCommentsForPost(postId);
	UserDao uDao = new UserDao(ConnectionProvider.getConnection());
	
	if (comments.size() == 0) {
		out.println("<h3 class='display-5' text-center'>No comments to display</h3>");
		return;
	}
	
	for (Comment comment : comments) {
%>
	<div class="col-md-12 mt-2">
		<div class="card p-3 mb-3">
		<% User u = uDao.getUserByUserId(comment.getUserId()); %>
									<div class="d-flex">
										<img src="img/<%= u.getProfile() %>" alt="User"
											class="profile-pic me-3">
										<div>
											<p class="mb-1"><%= comment.getComment() %></p>
											<small class="text-muted"><%= comment.getUserName() %>
												&nbsp;–&nbsp; <%= comment.getTimestamp() %></small>
										</div>
									</div>
								</div>
	</div>
	
	<%
	}
	%>
</div>