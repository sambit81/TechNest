package com.tech.nest.entities;

public class Tutorials {
	private int tid;
	private String tName;
	private String tImage;
	private String tLink;
	
	public Tutorials() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Tutorials(int tid, String tName, String tImage, String tLink) {
		super();
		this.tid = tid;
		this.tName = tName;
		this.tImage = tImage;
		this.tLink = tLink;
	}
	
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String gettImage() {
		return tImage;
	}
	public void settImage(String tImage) {
		this.tImage = tImage;
	}
	public String gettLink() {
		return tLink;
	}
	public void settLink(String tLink) {
		this.tLink = tLink;
	}
	
	
}
