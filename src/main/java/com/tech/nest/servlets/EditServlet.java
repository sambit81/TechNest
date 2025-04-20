package com.tech.nest.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.attribute.UserDefinedFileAttributeView;
import java.security.MessageDigest;

import com.tech.nest.dao.UserDao;
import com.tech.nest.entities.Message;
import com.tech.nest.entities.User;
import com.tech.nest.helper.ConnectionProvider;
import com.tech.nest.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
			
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet EditServlet</title>");
			out.println("</head>");
			out.println("<body>");
			
			// fetch all data
			String userEmail = request.getParameter("user_email");
			String userName = request.getParameter("user_name");
			String userPassword = request.getParameter("user_password");
			String userAbout = request.getParameter("user_about");
			Part part = request.getPart("image");
			
			String imageName = part.getSubmittedFileName();
			
			
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("currentUser");
			user.setEmail(userEmail);
			user.setName(userName);
			user.setPassword(userPassword);
			user.setAbout(userAbout);
			
			String oldFile = user.getProfile();
			
			user.setProfile(imageName);
			
			// update database.......
			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			
			boolean ans = userDao.updateUser(user);
			System.out.println("Edit Servlet Java");
			if (ans) {
				out.println("User updated");
				
				String path = getServletContext().getRealPath("/")+"img"+File.separator+user.getProfile();
				System.out.println("New path" + path);
				
				// start of photo work
				// delete code
				
				String pathOldFile = getServletContext().getRealPath("/") + "img" + File.separator + oldFile;
				
				String picsDir = request.getServletContext().getRealPath("/pics");
				System.out.println(picsDir);
				
				System.out.println("Old path" + pathOldFile);
				System.out.println("User updated");
				if(!oldFile.equals("default.jpg")) {
					Helper.deleteFile(pathOldFile);
				}
				//https://stackoverflow.com/questions/18664579/recommended-way-to-save-uploaded-files-in-a-servlet-application
				
				if(Helper.saveFile(part.getInputStream(), path)) {
					System.out.println("Image File Saved");
					out.println("Profile updated...");
					Message msg = new Message("Profile details updated...", "success", "alert-success");
					session.setAttribute("msg", msg);
				} else {
					/////////
					Message msg = new Message("Something went wrong..", "error", "alert-danger");
					session.setAttribute("msg", msg);
				}
			} else {
				out.println("User not updated");
				Message msg = new Message("Something went wrong..", "error", "alert-danger");
				session.setAttribute("msg", msg);
			}
			
			
			response.sendRedirect("profile.jsp");
			
			out.println("</body>");
			out.println("</html>");
		}
	}

}
