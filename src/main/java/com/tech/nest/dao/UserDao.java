package com.tech.nest.dao;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tech.nest.entities.User;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	//method to insert user to data base:
	public boolean saveUser(User user) {
		boolean f = false;
		try {
			//user --> database
			
			String query = "insert into user(name, email, password, gender, about, rdate) values(?,?,?,?,?,?)";
			try(PreparedStatement pstmt = this.con.prepareStatement(query)) {
				pstmt.setString(1, user.getName());
				pstmt.setString(2, user.getEmail());
				pstmt.setString(3, user.getPassword());
				pstmt.setString(4, user.getGender());
				pstmt.setString(5, user.getAbout());
				pstmt.setTimestamp(6, user.getDateTime());
				
				pstmt.executeUpdate();
				f=true;
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	
	//get user by useremail and userpassword:
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		
		try {
			String query = "select * from user where email =? and password =?";
			try (PreparedStatement pstmt = con.prepareStatement(query)) {
				pstmt.setString(1, email);
				pstmt.setString(2, password);
				try (ResultSet set = pstmt.executeQuery()) {
					if (set.next()) {
						user = new User();
						// data from db
						String name = set.getString("name");
						// set to user object
						user.setName(name);
						
						user.setId(set.getInt("id"));
						user.setEmail(set.getString("email"));
						user.setPassword(set.getString("password"));
						user.setGender(set.getString("gender"));
						user.setAbout(set.getString("about"));
						user.setDateTime(set.getTimestamp("rdate"));
						user.setProfile(set.getString("profile"));
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
		
		
		return user;
	}
	
	public boolean updateUser(User user) {
		
		boolean f = false;
		try {
			String query = "update user set name=?, email=?, password=?, gender=?, about=?, profile=? where id=?";
			try (PreparedStatement preparedStatement = con.prepareStatement(query)) {
				preparedStatement.setString(1, user.getName());
				preparedStatement.setString(2, user.getEmail());
				preparedStatement.setString(3, user.getPassword());
				preparedStatement.setString(4, user.getGender());
				preparedStatement.setString(5, user.getAbout());
				preparedStatement.setString(6, user.getProfile());
				preparedStatement.setInt(7, user.getId());
				
				preparedStatement.executeUpdate();
				f=true;
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User getUserByUserId(int userId) {
		User user = null;
		try {
			String q = "select * from user where id=?";
			try (PreparedStatement ps = this.con.prepareStatement(q)) {
				ps.setInt(1, userId);
				try (ResultSet set = ps.executeQuery()) {
					if (set.next()) {
						user = new User();
						
//						data from db
						String name = set.getString("name");
						
//						set to user object 
						user.setName(name);
						
						user.setId(set.getInt("id"));
						user.setEmail(set.getString("email"));
						user.setPassword(set.getString("password"));
						user.setGender(set.getString("gender"));
						user.setAbout(set.getString("about"));
						user.setDateTime(set.getTimestamp("rdate"));
						user.setProfile(set.getString("profile"));
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
		
		return user;
	}
}
