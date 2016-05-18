package com.dto;

import java.util.*;

public class SNSVO {
	private int no;
	private String title;
	private Date date;
	private String id;
	private int sns_like;
	private TagVO tag;
	private PhotoVO photo;
	private TextVO text;
	private ReplyVO reply;
	private RoomstarVO roomstar;
	private MemberVO member;
	private String theme;
	
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public MemberVO getMember() {
		return member;
	}
	public void setMember(MemberVO member) {
		this.member = member;
	}
	public RoomstarVO getRoomstar() {
		return roomstar;
	}
	public void setRoomstar(RoomstarVO roomstar) {
		this.roomstar = roomstar;
	}
	public ReplyVO getReply() {
		return reply;
	}
	public void setReply(ReplyVO reply) {
		this.reply = reply;
	}
	public TagVO getTag() {
		return tag;
	}
	public void setTag(TagVO tag) {
		this.tag = tag;
	}
	public PhotoVO getPhoto() {
		return photo;
	}
	public void setPhoto(PhotoVO photo) {
		this.photo = photo;
	}
	public TextVO getText() {
		return text;
	}
	public void setText(TextVO text) {
		this.text = text;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSns_like() {
		return sns_like;
	}
	public void setSns_like(int sns_like) {
		this.sns_like = sns_like;
	}
	
}
