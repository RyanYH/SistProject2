package com.dto;

import java.util.*;

public class CourseVO {
	private int no;
	private String id;
	private int quoat;
	private String addr;
	private Date date;
	private Date courseDate;
	private String theme;
	private TagVO tag;
	private PhotoVO photo;
	private TextVO text;
	private ReplyVO reply;
	private RoomstarVO roomstar;
	private MemberVO member;
	private BookingVO booking;
	private String cname;
	private int fixquoat;
	
	public int getFixquoat() {
		return fixquoat;
	}
	public void setFixquoat(int fixquoat) {
		this.fixquoat = fixquoat;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getQuoat() {
		return quoat;
	}
	public void setQuoat(int quoat) {
		this.quoat = quoat;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getCourseDate() {
		return courseDate;
	}
	public void setCourseDate(Date courseDate) {
		this.courseDate = courseDate;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
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
	public ReplyVO getReply() {
		return reply;
	}
	public void setReply(ReplyVO reply) {
		this.reply = reply;
	}
	public RoomstarVO getRoomstar() {
		return roomstar;
	}
	public void setRoomstar(RoomstarVO roomstar) {
		this.roomstar = roomstar;
	}
	public MemberVO getMember() {
		return member;
	}
	public void setMember(MemberVO member) {
		this.member = member;
	}
	public BookingVO getBooking() {
		return booking;
	}
	public void setBooking(BookingVO booking) {
		this.booking = booking;
	}
}
