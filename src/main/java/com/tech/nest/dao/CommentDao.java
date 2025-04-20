package com.tech.nest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.nest.entities.Comment;

public class CommentDao {
	private Connection connection;

	public CommentDao(Connection connection) {
		this.connection = connection;
	}

	public boolean insertComment(String comment, String userName, int pid, int uid) {
		boolean f = false;
		String q = "insert into comments(comment, userName, commentPid, commentUid) values (?,?,?,?)";
		try (PreparedStatement pstmt = connection.prepareStatement(q)) {
			pstmt.setString(1, comment);
			pstmt.setString(2, userName);
			pstmt.setInt(3, pid);
			pstmt.setInt(4, uid);

			pstmt.executeUpdate();

			f = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}

	public List<Comment> getAllCommentsForPost(int postId) {
		List<Comment> list = new ArrayList<Comment>();
		String q = "select * from comments where commentPid=? order by time DESC";
		try (PreparedStatement pstmt = connection.prepareStatement(q)) {
			pstmt.setInt(1, postId);

			try (ResultSet set = pstmt.executeQuery()) {

				while (set.next()) {
					String comment = set.getString("comment");
					String userName = set.getString("userName");
					Timestamp time = set.getTimestamp("time");
					int commentUid = set.getInt("commentUid");
					int commentPid = set.getInt("commentPid");

					Comment c = new Comment(comment, userName, time, commentUid, commentPid);

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

	public int countCommentsOnPost(int postId) {
		int count = 0;
		String q = "select count(*) from comments where commentPid=?";
		try (PreparedStatement pstmt = connection.prepareStatement(q)) {

			pstmt.setInt(1, postId);

			try (ResultSet set = pstmt.executeQuery()) {

				while (set.next()) {
					count = set.getInt("count(*)");
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return count;
	}
}
