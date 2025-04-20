package com.tech.nest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	Connection con;
	
	public LikeDao(Connection con) {
		this.con = con;
	}
	
	public boolean insertLike(int pid, int uid) {
		boolean f = false;
		try {
			String q = "insert into liked(pid, uid) values(?, ?)";
			try (PreparedStatement p = this.con.prepareStatement(q)) {
				// values set...
				p.setInt(1, pid);
				p.setInt(2, uid);
				p.executeUpdate();
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
	
	public int countLikeOnPost(int pid) {
		int count = 0;
		
		String q = "select count(*) from liked where pid=?";
		try {
			try (PreparedStatement p = this.con.prepareStatement(q)) {
				p.setInt(1, pid);
				try (ResultSet set = p.executeQuery()) {
					if (set.next()) {
						count = set.getInt("count(*)");
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return count;
	}
	
	public boolean isLikedByUser(int pid, int uid) {
		boolean f = false;
		try {
			try (PreparedStatement p = this.con.prepareStatement("select * from liked where pid=? and uid=?")) {
				p.setInt(1, pid);
				p.setInt(2, uid);
				try (ResultSet set = p.executeQuery()) {
					if (set.next()) {
						f = true;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean deleteLike(int pid, int uid) {
		boolean f = false;
		try (PreparedStatement p = this.con.prepareStatement("delete from liked where pid=? and uid=?")) {
			p.setInt(1, pid);
			p.setInt(2, uid);
			p.executeUpdate();
			f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	
	public String getClassNameForUser(int pid, int uid) {
		if (isLikedByUser(pid, uid)) {
			return "fa-solid fa-thumbs-up";
		} else {
			return "fa-regular fa-thumbs-up";
		}
	}
}
