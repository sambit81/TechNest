package com.tech.nest.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.nest.dao.PostDao;
import com.tech.nest.entities.Post;
import com.tech.nest.entities.User;
import com.tech.nest.helper.ConnectionProvider;
import com.tech.nest.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		executeServlet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void executeServlet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			
			String imgPath = request.getServletContext().getRealPath("/img");
			String blogPicsPath = request.getServletContext().getRealPath("/blog_pics");

			File imgDir = new File(imgPath);
			if (!imgDir.exists()) {
			    imgDir.mkdirs();
			}

			File blogPicsDir = new File(blogPicsPath);
			if (!blogPicsDir.exists()) {
			    blogPicsDir.mkdirs();
			}
			
			int cid = Integer.parseInt(request.getParameter("cid"));
			String pTitle = request.getParameter("pTitle");
			String pContent = request.getParameter("pContent");
			String pCode = request.getParameter("pCode");
			Part part = request.getPart("pic");
			
			// getting currentuser id
			
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("currentUser");
			//out.println("Pic" + part.getSubmittedFileName());
			Post post;
			if(part.getSubmittedFileName().equals("")) {
				post = new Post(pTitle, pContent, pCode, "default_post_pic.jpg", null, cid, user.getId());
			} else {
				post = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());
			}
			//out.println("Output" + cid +" " + pTitle + " " + pContent + " " + pCode + " " + part.getSubmittedFileName());
			
			//Post post = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());
			PostDao dao = new PostDao(ConnectionProvider.getConnection());
			
			if (dao.savePost(post)) {
				String path = getServletContext().getRealPath("/") + "blog_pics" + File.separator + part.getSubmittedFileName();
				//out.println(path);
				if (!part.getSubmittedFileName().equals("")) {
					Helper.saveFile(part.getInputStream(), path);
				}
				out.println("done");
			} else {
				out.println("error");
			}
		}
	}

}
