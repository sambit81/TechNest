package com.tech.nest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.nest.entities.Category;
import com.tech.nest.entities.Post;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();

		try {
			String q = "select * from categories";
			try (Statement st = this.con.createStatement(); ResultSet set = st.executeQuery(q);) {

				while (set.next()) {
					int cid = set.getInt("cid");
					String name = set.getString("name");
					String description = set.getString("description");
					Category c = new Category(cid, name, description);
					list.add(c);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	public boolean savePost(Post p) {
		boolean f = false;

		try {
			String q = "insert into posts(pTitle, pContent, pCode, pPic, catId, userId) values (?,?,?,?,?,?)";
			try (PreparedStatement pstmt = con.prepareStatement(q);) {
				pstmt.setString(1, p.getpTitle());
				pstmt.setString(2, p.getpContent());
				pstmt.setString(3, p.getpCode());
				pstmt.setString(4, p.getpPic());
				pstmt.setInt(5, p.getCatId());
				pstmt.setInt(6, p.getUserId());
				pstmt.executeUpdate();
				f = true;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return f;
	}

	public List<Post> getAllPosts() {
		List<Post> list = new ArrayList<Post>();

		// fetch all the post
		try {
			try (PreparedStatement preparedStatement = con.prepareStatement("select * from posts order by pid desc");
					ResultSet set = preparedStatement.executeQuery();) {
				while (set.next()) {
					int pid = set.getInt("pid");
					String pTitle = set.getString("pTitle");
					String pContent = set.getString("pContent");
					String pCode = set.getString("pCode");
					String pPic = set.getString("pPic");
					Timestamp date = set.getTimestamp("pDate");
					int catId = set.getInt("catId");
					int userId = set.getInt("userId");
					Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

					list.add(post);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public List<Post> getPostByCatId(int catId) {
		List<Post> list = new ArrayList<Post>();
		// fetch all post by id
		// fetch all the post
		try {
			try (PreparedStatement p = con.prepareStatement("select * from posts where catId=?");) {
				p.setInt(1, catId);
				try (ResultSet set = p.executeQuery();) {
					while (set.next()) {
						int pid = set.getInt("pid");
						String pTitle = set.getString("pTitle");
						String pContent = set.getString("pContent");
						String pCode = set.getString("pCode");
						String pPic = set.getString("pPic");
						Timestamp date = set.getTimestamp("pDate");

						int userId = set.getInt("userId");
						Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

						list.add(post);
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public Post getPostByPostId(int postId) {
		Post post = null;
		String q = "select * from posts where pid=?";
		try {
			try (PreparedStatement preparedStatement = this.con.prepareStatement(q);) {
				preparedStatement.setInt(1, postId);
				try (ResultSet set = preparedStatement.executeQuery();) {
					if (set.next()) {

						int pid = set.getInt("pid");
						String pTitle = set.getString("pTitle");
						String pContent = set.getString("pContent");
						String pCode = set.getString("pCode");
						String pPic = set.getString("pPic");
						Timestamp date = set.getTimestamp("pDate");
						int cid = set.getInt("catId");
						int userId = set.getInt("userId");
						post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return post;
	}

}
