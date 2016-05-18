package com.dao;

import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.dto.*;
import java.io.*;

public class SNSDAO {
	private static SqlSessionFactory ssf;
	static {
		try { 
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	public static int insertSNS(Map map){ // insert to sns table
		SqlSession session=ssf.openSession(true);
		int itsns = session.insert("insertSNS",map);
		session.close();
		return itsns;
	}
	
	public static int pinsertSNS(Map map){ // insert to photo table
		SqlSession session=ssf.openSession(true);
		int itpsns = session.insert("pinsertSNS",map);
		session.close();
		return itpsns;
	}
	
	public static int tinsertSNS(Map map){ // insert to tag table
		SqlSession session=ssf.openSession(true);
		int ittsns = session.insert("tinsertSNS",map);
		session.close();
		return ittsns;
	}
	
	public static int xinsertSNS(Map map){ // insert to text table
		SqlSession session=ssf.openSession(true);
		int itxsns = session.insert("xinsertSNS",map);
		session.close();
		return itxsns;
	}
	
	public static int getMaxSnsNo(){
		SqlSession session=ssf.openSession();
		int maxNo = session.selectOne("getMaxSnsNo");
		session.close();
		return maxNo;
	}
	
	public static List<SNSVO> getAllDataSNS(){
		SqlSession session=ssf.openSession();
		List<SNSVO> list = session.selectList("getAllDataSNS");
		session.close();

		for(int i = 0; i < list.size(); i++){
			int no = list.get(i).getNo();
			
			session=ssf.openSession();
			TagVO tagvo = session.selectOne("getAllDataSNSTag", no);
			session.close();
			
			session=ssf.openSession();
			TextVO textvo = session.selectOne("getAllDataSNSText", no);
			session.close();
			
			session=ssf.openSession();
			PhotoVO photovo = session.selectOne("getAllDataSNSPhoto", no);
			session.close();
			
			session = ssf.openSession();
			MemberVO memvo = session.selectOne("getMemberSNS", list.get(i).getId().toString());
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
	
	public static List<SNSVO> getDataSNSbyTheme(String st){
		SqlSession session=ssf.openSession();
		List<SNSVO> list = session.selectList("getDataSNSbyTheme", st);
		session.close();
		
		for(int i = 0; i < list.size(); i++){
			int no = list.get(i).getNo();
			
			session=ssf.openSession();
			TagVO tagvo = session.selectOne("getAllDataSNSTag", no);
			session.close();
			
			session=ssf.openSession();
			TextVO textvo = session.selectOne("getAllDataSNSText", no);
			session.close();
			
			session=ssf.openSession();
			PhotoVO photovo = session.selectOne("getAllDataSNSPhoto", no);
			session.close();
			
			session = ssf.openSession();
			MemberVO memvo = session.selectOne("getMemberSNS", list.get(i).getId().toString());
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
	
	public static SNSVO getSNSDetail(int no){
		SqlSession session=ssf.openSession();
		SNSVO vo = session.selectOne("getSNSDetail",no);
		session.close();
		
		session = ssf.openSession();
		MemberVO mvo = session.selectOne("getSNSDetailMember", vo.getId());
		session.close();
		
		session = ssf.openSession();
		TextVO xvo = session.selectOne("getSNSDetailText",no);
		session.close();
		
		session = ssf.openSession();
		TagVO tvo = session.selectOne("getSNSDetailTag",no);
		session.close();
		
		session = ssf.openSession();
		PhotoVO pvo = session.selectOne("getSNSDetailPhoto",no);
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
	
	public static String getMemLike(String id){
		SqlSession session=ssf.openSession();
		String memlike = session.selectOne("getMemLike", id);
		session.close();
		return memlike;
	}
	
	public static int deleteSNS(int no){
		SqlSession session=ssf.openSession(true);
		int result = session.delete("deleteSNS", no);
		session.close();
		return result;
	}
	
	public static int updateMemLike(Map map){
		SqlSession session=ssf.openSession(true);
		int update = session.update("updateMemLike", map);
		session.close();
		return update;
	}
	public static boolean addSNSlike(int no){
		SqlSession session=ssf.openSession(true);
		int isAddSNSlike = session.update("addSNSlike", no);
		session.close();
		return (isAddSNSlike>0)?true:false;
	}
	
	public static List<ReplyVO> getAllSNSReply(int no){
		SqlSession session=ssf.openSession();
		List<ReplyVO> rvolist = session.selectList("getAllSNSReply", no);
		session.close();
		return rvolist;
	}
	
	public static int snsReplyInsert(Map map){
		SqlSession session=ssf.openSession(true);
		int rrs = session.insert("snsReplyInsert", map);
		session.close();
		return rrs;
	}
	
	public static int[] themeCount () {
		SqlSession session=ssf.openSession();
		int[] count = new int[4];
		count[0] = session.selectOne("CountTheme0");
		count[1] = session.selectOne("CountTheme1");
		count[2] = session.selectOne("CountTheme2");
		count[3] = session.selectOne("CountTheme3");
		session.close();
		return count;
	}
	
	public static List<SNSVO> snslikeCount () {
		SqlSession session=ssf.openSession();
		List<SNSVO> slist = session.selectList("CountSnsLike");
		session.close();
		return slist;
	}
	
	public static List<SNSVO> getSNSSortLike(){
		SqlSession session=ssf.openSession();
		List<SNSVO> list = session.selectList("getSNSSortLike");
		session.close();
		
		for(int i = 0; i < list.size(); i++){
			int no = list.get(i).getNo();
			
			session=ssf.openSession();
			TagVO tagvo = session.selectOne("getAllDataSNSTag", no);
			session.close();
			
			session=ssf.openSession();
			TextVO textvo = session.selectOne("getAllDataSNSText", no);
			session.close();
			
			session=ssf.openSession();
			PhotoVO photovo = session.selectOne("getAllDataSNSPhoto", no);
			session.close();
			
			session = ssf.openSession();
			MemberVO memvo = session.selectOne("getMemberSNS", list.get(i).getId().toString());
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
	
	
}
