package com.dto;

public class BookingVO {
	private int no;
	private int course_no;
	private String member_id;
	private boolean deposit;
	private MemberVO member;
	private CourseVO course;
	
	public MemberVO getMember() {
		return member;
	}
	public void setMember(MemberVO member) {
		this.member = member;
	}
	public CourseVO getCourse() {
		return course;
	}
	public void setCourse(CourseVO course) {
		this.course = course;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCourse_no() {
		return course_no;
	}
	public void setCourse_no(int course_no) {
		this.course_no = course_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public boolean isDeposit() {
		return deposit;
	}
	public void setDeposit(boolean deposit) {
		this.deposit = deposit;
	}
}
