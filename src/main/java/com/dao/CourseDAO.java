package com.dao;

import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.dto.BookingVO;
import com.dto.CourseVO;
import com.dto.MemberVO;
import com.dto.PhotoVO;
import com.dto.ReplyVO;
import com.dto.SNSVO;
import com.dto.TagVO;
import com.dto.TextVO;

import java.io.*;

public class CourseDAO {
	private static SqlSessionFactory ssf;
   
	static {
	   try { 
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   ssf=new SqlSessionFactoryBuilder().build(reader);
	   } catch(Exception ex){
		   System.out.println(ex.getMessage());
	   }
   }
   
	public static int insertCourse(Map map){ 
		SqlSession session=ssf.openSession(true);
		int itcourse = session.insert("insertCourse",map);
		session.close();
		return itcourse;
	} 
	
	public static int deleteCourse(int no){ 
		SqlSession session=ssf.openSession(true);
		int result = session.insert("deleteCourse",no);
		session.close();
		return result;
	}
	
	public static int getMaxCourseNo(){ 
		SqlSession session=ssf.openSession();
		int courseNo = session.selectOne("getMaxCourseNo");
		session.close();
		return courseNo;
	}
	
	public static int xinsertCourse(Map map){ 
		SqlSession session=ssf.openSession(true);
		int xres = session.insert("xinsertCourse", map);
		session.close();
		return xres;
	}
	
	public static int tinsertCourse(Map map){ 
		SqlSession session=ssf.openSession(true);
		int tres = session.insert("tinsertCourse", map);
		session.close();
		return tres;
	}
	
	public static int pinsertCourse(Map map){ 
		SqlSession session=ssf.openSession(true);
		int pres = session.insert("pinsertCourse", map);
		session.close();
		return pres;
	}
	
	public static List<CourseVO> getDataCoursebyTheme(String st){
		SqlSession session=ssf.openSession();
		List<CourseVO> list = session.selectList("getDataCoursebyTheme", st);
		session.close();
		
		for(int i = 0; i < list.size(); i++){
			int no = list.get(i).getNo();
			
			session=ssf.openSession();
			TagVO tagvo = session.selectOne("getAllDataCourseTag", no);
			session.close();
			
			session=ssf.openSession();
			TextVO textvo = session.selectOne("getAllDataCourseText", no);
			session.close();
			
			session=ssf.openSession();
			PhotoVO photovo = session.selectOne("getAllDataCoursePhoto", no);
			session.close();
			
			session = ssf.openSession();
			MemberVO memvo = session.selectOne("getMemberCourse", list.get(i).getId().toString());
			session.close();
			
			if (memvo.getProfile().length() > 25){
				String aa = memvo.getProfile();
				aa = aa.replace("C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\", "");
				aa = aa.replace("\\", "/");
				
				memvo.setProfile(aa);
			}
			
			list.get(i).setMember(memvo);
			list.get(i).setText(textvo);	
			list.get(i).setTag(tagvo);
			list.get(i).setPhoto(photovo);
			
			if (photovo.getPath() != null){
				StringTokenizer st1 = new StringTokenizer(list.get(i).getPhoto().getPath(), ",");
				String imgpath1 = st1.nextToken();
				imgpath1 = imgpath1.replace("C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\", "");
				imgpath1 = imgpath1.replace("\\", "/");
				
				list.get(i).getPhoto().setPath(imgpath1);
			}
			
		}
		return list;
	}
	
	public static List<CourseVO> getMyCourse(String id){
		SqlSession session=ssf.openSession();
		List<CourseVO> list = session.selectList("getMyCourse", id);
		
		for(int i = 0; i < list.size(); i++){
			int no = list.get(i).getNo();
			
			session=ssf.openSession();
			TagVO tagvo = session.selectOne("getAllDataCourseTag", no);
			session.close();
			
			session=ssf.openSession();
			TextVO textvo = session.selectOne("getAllDataCourseText", no);
			session.close();
			
			session=ssf.openSession();
			PhotoVO photovo = session.selectOne("getAllDataCoursePhoto", no);
			session.close();
			
			session = ssf.openSession();
			MemberVO memvo = session.selectOne("getMemberCourse", list.get(i).getId().toString());
			session.close();
			
			if (memvo.getProfile().length() > 25){
				String aa = memvo.getProfile();
				aa = aa.replace("C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\", "");
				aa = aa.replace("\\", "/");
				
				memvo.setProfile(aa);
			}
			
			list.get(i).setMember(memvo);
			list.get(i).setText(textvo);	
			list.get(i).setTag(tagvo);
			list.get(i).setPhoto(photovo);
			
			if (photovo.getPath() != null){
				StringTokenizer st1 = new StringTokenizer(list.get(i).getPhoto().getPath(), ",");
				String imgpath1 = st1.nextToken();
				imgpath1 = imgpath1.replace("C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\", "");
				imgpath1 = imgpath1.replace("\\", "/");
				
				list.get(i).getPhoto().setPath(imgpath1);
			}
			
		}
		return list;
	}
	
	public static CourseVO detailCourse(int no){
		SqlSession session=ssf.openSession();
		CourseVO cvo = session.selectOne("detailCourse", no);
	
		TextVO xvo = session.selectOne("detailCourseText", no);
		TagVO tvo = session.selectOne("detailCourseTag", no);
		PhotoVO pvo = session.selectOne("detailCoursePhoto", no);
		MemberVO mvo = session.selectOne("detailCourseMember", cvo.getId());
		
		if (mvo.getProfile().length() > 25){
			String aa = mvo.getProfile();
			aa = aa.replace("C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\", "");
			aa = aa.replace("\\", "/");
			
			mvo.setProfile(aa);
		}
		
		cvo.setTag(tvo);
		cvo.setText(xvo);
		cvo.setPhoto(pvo);
		cvo.setMember(mvo);
		
		session.close();
		return cvo;
	}
	
	
	public static List<CourseVO> getReserveMyCourse(String id){
		SqlSession session=ssf.openSession();
		
		List<BookingVO> blist = session.selectList("getReserveMyCourse", id);
		List<CourseVO> clist = new ArrayList<CourseVO>();
		
		for(int i = 0; i < blist.size(); i++){
			String bid = blist.get(i).getMember_id();
			
			if (id.equals(bid)){
				int bno = blist.get(i).getCourse_no();
				
				CourseVO cvo = session.selectOne("getReserveCourseList", bno);
				clist.add(cvo);
			}
		}
		
		return clist;
	}
	
	public static List<BookingVO> getReserveAdminCourse(){
		SqlSession session=ssf.openSession();
		
		List<BookingVO> blist = session.selectList("getReserveAdminCourse");
		
		for(int i = 0; i < blist.size(); i++){
			int cno = blist.get(i).getCourse_no();
			
			CourseVO cvo = session.selectOne("getReserveMyC", cno);
			blist.get(i).setCourse(cvo);
		}
		
		return blist;
	}
	
	public static int courseReserve(Map map) {
		SqlSession session=ssf.openSession(true);
		int count=session.insert("courseReserve", map);
		return count;
	}
	
	public static CourseVO getCourseDetail(int no){
		SqlSession session=ssf.openSession();
		CourseVO vo = session.selectOne("getCourseDetail",no);
		session.close();
		
		session = ssf.openSession();
		MemberVO mvo = session.selectOne("getCourseDetailMember", vo.getId());
		session.close();
		
		session = ssf.openSession();
		TextVO xvo = session.selectOne("getCourseDetailText",no);
		session.close();
		
		session = ssf.openSession();
		TagVO tvo = session.selectOne("getCourseDetailTag",no);
		session.close();
		
		session = ssf.openSession();
		PhotoVO pvo = session.selectOne("getCourseDetailPhoto",no);
		session.close();
		
		if (mvo.getProfile().length() > 25){
			String aa = mvo.getProfile();
			aa = aa.replace("C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\", "");
			aa = aa.replace("\\", "/");
			
			mvo.setProfile(aa);
		}
		
		vo.setText(xvo);
		vo.setPhoto(pvo);
		vo.setTag(tvo);
		vo.setMember(mvo);
		return vo;
	}
	
	public static List<ReplyVO> getAllCourseReply(int no){
		SqlSession session=ssf.openSession();
		List<ReplyVO> rvolist = session.selectList("getAllCourseReply", no);
		session.close();
		return rvolist;
	}
	
	public static int courseReplyInsert(Map map){
		SqlSession session=ssf.openSession(true);
		int crs = session.insert("courseReplyInsert", map);
		session.close();
		return crs;
	}
	
	public static int checkDeposit(Map map) {
		   SqlSession session = ssf.openSession(true);
		   int result = session.update("checkDeposit", map);
		   session.close();
		   session = ssf.openSession(true);
		   int result1 = session.update("updateFixquoat", map);
		   session.close();
		   return result;
	   }
}
