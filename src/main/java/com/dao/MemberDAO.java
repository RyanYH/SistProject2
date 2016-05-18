package com.dao;

import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.dto.*;
import java.io.*;

public class MemberDAO {
	private static SqlSessionFactory ssf;
	   static {
		   try { 
			   Reader reader=Resources.getResourceAsReader("Config.xml");
			   ssf=new SqlSessionFactoryBuilder().build(reader);
		   } catch(Exception ex){
			   System.out.println(ex.getMessage());
		   }
	   }
	   
	   public static int login(Map map){
		  SqlSession session=ssf.openSession();
		  int isLogin = session.selectOne("login", map);
		  session.close();
		  return isLogin;
	   }
	   
	   public static boolean join(Map<String,String> map){
		  SqlSession session=ssf.openSession(true);
		  int isJoin = session.insert("join", map);
		  session.close();
		  return (isJoin>0)?true:false;
	   }
	   
	   public static boolean update(Map map){
		  SqlSession session=ssf.openSession(true);
		  int isUpdate = session.update("update", map);
		  session.close();
		  return (isUpdate>0)?true:false;
	   }
	   
	   public static boolean delete(Map map){
		  SqlSession session=ssf.openSession(true);
		  int isDelete = session.delete("delete", map);
		  session.close();
		  return (isDelete>0)?true:false;
	   }
	   
	   public static boolean addFollow(Map map){
			  SqlSession session=ssf.openSession(true);
			  int isAddFollow = session.insert("addfollow", map);
			  session.close();
			  return (isAddFollow>0)?true:false;
		   }
	   
	   public static boolean deleteFollow(Map map){
		  SqlSession session=ssf.openSession(true);
		  int isDeleteFollow = session.delete("deleteFollow", map);
		  session.close();
		  return (isDeleteFollow>0)?true:false;
	   }
	   
	   public static List<MemberVO> getFollowList(Map map){
		  SqlSession session=ssf.openSession();
		  List<FollowVO> list = session.selectList("getfollowlist", map);
		  List<MemberVO> flist = new ArrayList<MemberVO>();
		  
		  for(int i = 0; i < list.size(); i++){
			  String FollowID = list.get(i).getFollow_id();
			  MemberVO d = session.selectOne("getfollowAllList",FollowID);
			  
			  if(d.getProfile().length() > 25){
					String aa = d.getProfile();
					aa = aa.replace("C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\", "");
					aa = aa.replace("\\", "/");
					d.setProfile(aa);
			  }
			  flist.add(d);
		  }
		  session.close();
		  return flist;
	   }
	   
	   public static MemberVO mypageInfo(Map map) {
		   SqlSession session=ssf.openSession();
		   MemberVO list=session.selectOne("mypageInfo", map);
		   session.close();
		   return list;
	   }
	   
	   public static int checkLogin(Map map){
			SqlSession session=ssf.openSession();
			int result = session.selectOne("checkLogin", map);
			session.close();
			return result;
	   }
	   
	   public static int insertFB(Map map){
		   SqlSession session=ssf.openSession(true);
		   int result = session.insert("insertFB", map);
		   session.close();
		   return result;
	   }
	   
	   public static int insertKAKAO(Map map){
		   SqlSession session=ssf.openSession(true);
		   int result = session.insert("insertKAKAO", map);
		   session.close();
		   return result;
	   }
	   
	   public static List<FollowVO> getMyFollowlist(String id){
			SqlSession session=ssf.openSession();
			List<FollowVO> flist = session.selectList("getMyFollowlist", id);
			session.close();
			return flist;
	   }
	   
	   public static List<MemberVO> getMemberAllData () {
		   SqlSession session = ssf.openSession();
		   List<MemberVO> mlist = session.selectList("getMemberAllData");
		   
		   for(int i = 0; i < mlist.size(); i++){
			   String aa = mlist.get(i).getProfile();
			   
			   if (aa.length() > 25){
				   aa = aa.replace("C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\", "");
				   aa = aa.replace("\\", "/");
				   mlist.get(i).setProfile(aa);
			   }
		   }
		   session.close();
		   return mlist;
	   }
	   
	   public static int deleteByAdmin(String id){
		   SqlSession session = ssf.openSession(true);
		   int result = session.delete("deleteByAdmin", id);
		   session.close();
		   return result;
	   }
	   
	   public static int setMemlike(Map map){
		   SqlSession session = ssf.openSession(true);
		   int result = session.update("setMemlike", map);
		   session.close();
		   return result;
	   }
	   
	   public static MemberVO getMember(String id){
		   SqlSession session = ssf.openSession();
		   MemberVO a = session.selectOne("getMember", id);
		   session.close();
		   return a;
	   }
	   
	   public static List<MemberVO> adminFindMember (Map map) {
			SqlSession session=ssf.openSession();
			System.out.println(map.get("fs")+" "+map.get("ss"));
			List<MemberVO> mlist = session.selectList("adminFindMember", map);
			System.out.println(mlist.size());
			session.close();
			return mlist;
	   }
	   public static List<SNSVO> getSocialStar(){
		   SqlSession session = ssf.openSession();
		   List<SNSVO> slist = session.selectList("getSoicalStar");
		   session.close();
		   
		   for(int i = 0; i < slist.size(); i++){
			   String id = slist.get(i).getId();
			   
			   session = ssf.openSession();
			   MemberVO a = session.selectOne("getMember", id);
			   session.close();
			   
			   slist.get(i).setMember(a);
			   
			   String aa =  slist.get(i).getMember().getProfile();
				aa = aa.replace("C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\","");
				aa = aa.replace("\\", "/");
				slist.get(i).getMember().setProfile(aa);
		   }
		   return slist;
	   }
	   public static List<CourseVO> getCourseStar(){
		   SqlSession session = ssf.openSession();
		   List<CourseVO> clist = session.selectList("getCourseStar");
		   session.close();
		   
		   for(int i = 0; i < clist.size(); i++){
			   String id = clist.get(i).getId();
			   
			   session = ssf.openSession();
			   MemberVO a = session.selectOne("getMember", id);
			   session.close();
			   
			   clist.get(i).setMember(a);
			   
			   String aa =  clist.get(i).getMember().getProfile();
				aa = aa.replace("C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\","");
				aa = aa.replace("\\", "/");
				clist.get(i).getMember().setProfile(aa);
		   }
		   return clist;
	   }
}
