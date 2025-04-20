<%@page import="com.tech.nest.dao.CommentDao"%>
<%@page import="com.tech.nest.dao.LikeDao"%>
<%@page import="com.tech.nest.helper.ConnectionProvider"%>
<%@page import="com.tech.nest.dao.PostDao"%>
<%@page import="java.util.List" %>
<%@page import="com.tech.nest.entities.Post" %>
<%@page import="com.tech.nest.entities.User" %>
<div class="row">
<%
	
	User uuu = (User) session.getAttribute("currentUser");
	Thread.sleep(1000);
	PostDao d = new PostDao(ConnectionProvider.getConnection());

	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> posts = null;
	if(cid == 0) {
		posts = d.getAllPosts();
	} else {
		posts = d.getPostByCatId(cid);
	}
	
	if(posts.size() == 0) {
		out.println("<h3 class='display-3 text-center'>No posts in this category..</h3>");
		return;
	}
	
	CommentDao cDao = new CommentDao(ConnectionProvider.getConnection());
	for (Post p : posts) {
%>
	<div class="col-md-6 mt-2">
		<div class="card">
			<img src="blog_pics/<%= p.getpPic() %>" class="card-img-top" alt="Card image cap">
			<div class="card-body">
				<b><%= p.getpTitle() %></b>
				<p><%= p.getpContent() %></p>
			</div>
			<div class="card-footer primary-background text-center">
				<%
					LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
				%>
				<a href="#!" onclick="doLike(<%= p.getPid() %>, <%= uuu.getId() %>)" class="btn btn-outline-light btn-sm"> <i id="like-counter<%= p.getPid() %>" class="<%= ld.getClassNameForUser(p.getPid(), uuu.getId()) %>"></i><span class="like-counter<%= p.getPid() %>"> <%= ld.countLikeOnPost(p.getPid()) %></span></a>
				
				<a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read More...</a>
				<a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm"><i class="fa-regular fa-comment"></i><span> <%= cDao.countCommentsOnPost(p.getPid()) %></span></a>
			</div>	
		</div>
		
	</div>
<%
	}
%>
</div>