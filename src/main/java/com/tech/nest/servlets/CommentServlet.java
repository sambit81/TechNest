package com.tech.nest.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import org.apache.tomcat.util.buf.UDecoder;

import com.tech.nest.dao.CommentDao;
import com.tech.nest.entities.Comment;
import com.tech.nest.helper.ConnectionProvider;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		executeServlet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public void executeServlet(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter outPrintWriter = response.getWriter()) {
			String comment = request.getParameter("comment");
			String username = request.getParameter("username");
			int pid = Integer.parseInt(request.getParameter("pid"));
			int uid = Integer.parseInt(request.getParameter("uid"));

			CommentDao cdao = new CommentDao(ConnectionProvider.getConnection());

			boolean result = cdao.insertComment(comment, username, pid, uid);

			int commentCount = cdao.getAllCommentsForPost(pid).size();

			if (result) {
				if (commentCount == 1) {
					outPrintWriter.println(commentCount + " comment");
				} else {
					outPrintWriter.println(commentCount + " comments");
				}
			} else {
				outPrintWriter.println("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
