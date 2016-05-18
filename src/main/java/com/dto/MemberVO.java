package com.dto;
/*
 * 	id varchar(20) primary key,
	pwd varchar(20) not null,
	email varchar(50) not null,
	profile varchar(200)
 */
public class MemberVO {
	private String id;
	private String pwd;
	private String email;
	private String profile;
	private String snslike;
	private int admin;
	
	public String getSnslike() {
		return snslike;
	}
	public void setSnslike(String snslike) {
		this.snslike = snslike;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
}
