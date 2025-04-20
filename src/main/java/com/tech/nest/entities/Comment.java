package com.tech.nest.entities;

import java.sql.Timestamp;

public class Comment {
	private String comment;
	private String userName;
	private Timestamp timestamp;
	private int userId;
	private int postId;
	
	public Comment(String comment, String userName, Timestamp timestamp, int userId, int postId) {
		super();
		this.comment = comment;
		this.userName = userName;
		this.timestamp = timestamp;
		this.userId = userId;
		this.postId = postId;
	}

	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public Timestamp getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	
	
}
