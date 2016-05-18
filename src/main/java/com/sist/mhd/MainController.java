package com.sist.mhd;

import java.io.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.dto.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.xml.bind.v2.runtime.Location;
import com.controller.Controller;
import com.controller.RequestMapping;
import com.dao.CourseDAO;
import com.dao.ItemDAO;
import com.dao.SNSDAO;
import com.dao.*;

import java.util.*;

@Controller("mainController")
public class MainController {

	@RequestMapping("main.do")
	public String main_page(HttpServletRequest request) {

	    List<SNSVO> slist = MemberDAO.getSocialStar();
	    List<CourseVO> clist = MemberDAO.getCourseStar();
	    
		String[] nav = new String[2];
		nav[0] = "<li><a href='social.do'>포스팅 시작하기</a></li>";
		nav[1] = "<li><a href='course.do'>꿀팁 보기</a></li>";
		
		request.setAttribute("clist", clist);
		request.setAttribute("slist", slist);
		request.setAttribute("nav", nav);
		request.setAttribute("home", "active");
		request.setAttribute("jsp", "../main/home/newhome.jsp");

		return "main/main";
	}

	@RequestMapping("admin.do")
	public String admin_page(HttpServletRequest request) {

		String[] nav = new String[1];
		nav[0] = "<li><a href='javascript:adminMember()'>회원 목록</a></li>";

		List<BookingVO> clist = CourseDAO.getReserveAdminCourse();
		
		String[] theme = {"침실", "거실", "주방", "욕실"};
		int[] count = SNSDAO.themeCount();
		List<ThemeCountVO> tlist = new ArrayList<ThemeCountVO>();
		for (int i=0; i<count.length; i++) {
			ThemeCountVO t = new ThemeCountVO();
			t.setTheme(theme[i]);
			t.setCount(count[i]);
			tlist.add(t);
		}
		
		List<SNSVO> slist = SNSDAO.snslikeCount();
		
		request.setAttribute("clist", clist);
		request.setAttribute("tlist", tlist);
		request.setAttribute("slist", slist);
		request.setAttribute("nav", nav);
		request.setAttribute("admin", "active");
		request.setAttribute("jsp", "../main/admin/adminpage.jsp");

		return "main/main";
	}

	@RequestMapping("adminmember.do")
	public String adminmember_page(HttpServletRequest request) { 

		String[] nav = new String[1];
		nav[0] = "<li><a href='javascript:adminMember()'>회원 목록</a></li>";

		List<MemberVO> mlist = MemberDAO.getMemberAllData();

		request.setAttribute("nav", nav);
		request.setAttribute("admin", "active");
		request.setAttribute("mlist", mlist);
		request.setAttribute("jsp", "../main/admin/adminmember.jsp");

		return "main/main";
	}
	
	@RequestMapping("adminfindmember.do")
	public String adminfindmember_page (HttpServletRequest request) throws Exception {
		
		String[] nav = new String[1];
		nav[0] = "<li><a href='javascript:adminMember()'>회원 목록</a></li>";
		
		String fs = request.getParameter("fs");
		String ss = request.getParameter("ss");
		
		if (ss.trim().length() == 0) {
			
			List<MemberVO> mlist = MemberDAO.getMemberAllData();
			
			request.setAttribute("nav", nav);
			request.setAttribute("admin", "active");
			request.setAttribute("mlist", mlist);
			request.setAttribute("jsp", "../main/admin/adminmember.jsp");
			
			return "main/main";
		}
		
		Map map = new HashMap();
		map.put("fs", fs);
		map.put("ss", ss);
		
		List<MemberVO> flist = MemberDAO.adminFindMember(map);
		
		request.setAttribute("nav", nav);
		request.setAttribute("admin", "active");
		request.setAttribute("flist", flist);
		request.setAttribute("jsp", "../main/admin/adminfindmember.jsp");

		return "main/main";
	}

	@RequestMapping("home.do")
	public String home_page(HttpServletRequest request) throws Exception {
	    List<SNSVO> slist = MemberDAO.getSocialStar();
	    List<CourseVO> clist = MemberDAO.getCourseStar();
	    
		String[] nav = new String[2];
		nav[0] = "<li><a href='social.do'>포스팅 시작하기</a></li>";
		nav[1] = "<li><a href='course.do'>꿀팁 보기</a></li>";
		
		request.setAttribute("clist", clist);
		request.setAttribute("slist", slist);
		request.setAttribute("nav", nav);
		request.setAttribute("home", "active");
		request.setAttribute("jsp", "../main/home/newhome.jsp");

		return "main/main";
	}

	@RequestMapping("social.do")
	public String social(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		MemberVO mvo = (MemberVO) session.getAttribute("vo");

		List<SNSVO> snslist = SNSDAO.getAllDataSNS();
		List<FollowVO> flist = MemberDAO.getMyFollowlist(mvo.getId());
		
		List<String> klist = new ArrayList<String>();
		String likelist = mvo.getSnslike();
		
		if (likelist != null){
			StringTokenizer st = new StringTokenizer(likelist,",");
			
			while(st.hasMoreTokens()){
				klist.add(st.nextToken());
			}
		}
		
		session.setAttribute("vo", mvo);
		
		String[] nav = new String[2];
		nav[0] = "<li><a href='javascript:sortnew()'>　최신순　</a></li>";
		nav[1] = "<li><a href='javascript:sortlike()'>　인기순　</a></li>";

		request.setAttribute("nav", nav);
		request.setAttribute("flist", flist);
		request.setAttribute("klist", klist);
		request.setAttribute("snslist", snslist);
		request.setAttribute("social", "active");
		request.setAttribute("jsp", "../main/social/social.jsp");

		return "main/main";
	}

	@RequestMapping("writeCourse.do")
	public String writeCourse(HttpServletRequest request) {
		
		String theme = request.getParameter("theme");
		
		String[] nav = new String[1];
		nav[0] = "<li><a href='javascript:newWrite()'>　새로쓰기　</a></li>";
		
		request.setAttribute("theme", theme);
		request.setAttribute("nav", nav);
		request.setAttribute("jsp", "../main/write/writeCourse.jsp");

		return "main/main";
	}

	@RequestMapping("detailSNS.do")
	public String detail_page(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession(true);
		MemberVO mvo = (MemberVO) session.getAttribute("vo");
		List<FollowVO> flist = MemberDAO.getMyFollowlist(mvo.getId());

		String no = request.getParameter("no");
		SNSVO vo = SNSDAO.getSNSDetail(Integer.parseInt(no));
		String res = request.getParameter("res");
		String searchText = request.getParameter("searchText");
		
		if (searchText == null){
			searchText = "";
		}
		
		List<ReplyVO> rlist = SNSDAO.getAllSNSReply(Integer.parseInt(no));
		List<String> path = new ArrayList<String>();

		StringTokenizer st = new StringTokenizer(vo.getPhoto().getPath(), ",");

		while (st.hasMoreTokens()) {
			String aa = st.nextToken();
			aa = aa.replace(
					"C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\",
					"");
			aa = aa.replace("\\", "/");
			path.add(aa);
		}

		String fimg = path.get(0);

		List<SNSVO> snslist = SNSDAO.getAllDataSNS();
		String[] nav = new String[2];
		nav[0] = "<li><a href='javascript:sortnew()'>　최신순　</a></li>";
		nav[1] = "<li><a href='javascript:sortlike()'>　인기순　</a></li>";

		request.setAttribute("searchText", searchText);
		request.setAttribute("res", res);
		request.setAttribute("no", no);
		request.setAttribute("rlist", rlist);
		request.setAttribute("fimg", fimg);
		request.setAttribute("nav", nav);
		request.setAttribute("snslist", snslist);
		request.setAttribute("social", "active");
		request.setAttribute("jsp", "../main/social/dsocial.jsp");
		request.setAttribute("imgArr", path);
		request.setAttribute("detailSNS", vo);
		request.setAttribute("flist", flist);
		return "main/main";
	}
	
	@RequestMapping("detailSNS2.do")
	public String detail_page2(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession(true);
		MemberVO mvo = (MemberVO) session.getAttribute("vo");
		List<FollowVO> flist = MemberDAO.getMyFollowlist(mvo.getId());
		
		String searchText = request.getParameter("searchText");
		String no = request.getParameter("no");
		SNSVO vo = SNSDAO.getSNSDetail(Integer.parseInt(no));
		String res = request.getParameter("res");

		List<ReplyVO> rlist = SNSDAO.getAllSNSReply(Integer.parseInt(no));
		List<String> path = new ArrayList<String>();

		StringTokenizer st = new StringTokenizer(vo.getPhoto().getPath(), ",");

		while (st.hasMoreTokens()) {
			String aa = st.nextToken();
			aa = aa.replace(
					"C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\",
					"");
			aa = aa.replace("\\", "/");
			path.add(aa);
		}
		String fimg = path.get(0);

		List<SNSVO> snslist = SNSDAO.getAllDataSNS();
		String[] nav = new String[1];
		nav[0] = "<li class='dropdown'><a href='#' data-toggle='dropdown'>테마별　조회</a>"
				+ "<ul class='dropdown-menu' style='width:100%'>"
				+ "<li style='width:100%'><a href='stip.do?searchText=거실'>거실</a></li>"
				+ "<li style='width:100%'><a href='stip.do?searchText=주방'>주방</a></li>"
				+ "<li style='width:100%'><a href='stip.do?searchText=욕실'>욕실</a></li>"
				+ "<li style='width:100%'><a href='stip.do?searchText=침실'>침실</a></li>" + "</ul>" + "</li>";
		
		request.setAttribute("searchText", searchText);
		request.setAttribute("res", res);
		request.setAttribute("no", no);
		request.setAttribute("rlist", rlist);
		request.setAttribute("fimg", fimg);
		request.setAttribute("nav", nav);
		request.setAttribute("snslist", snslist);
		request.setAttribute("social", "active");
		request.setAttribute("jsp", "../main/tip/dtip_s.jsp");
		request.setAttribute("imgArr", path);
		request.setAttribute("detailSNS", vo);
		request.setAttribute("flist", flist);
		return "main/main";
	}
	
	@RequestMapping("dsocial.do")
	public String dsocial(HttpServletRequest request) {
		HttpSession session = request.getSession();

		List<SNSVO> snslist = SNSDAO.getAllDataSNS();
		String[] nav = new String[2];
		nav[0] = "<li><a href='javascript:sortnew()'>　최신순　</a></li>";
		nav[1] = "<li><a href='javascript:sortlike()'>　인기순　</a></li>";

		request.setAttribute("nav", nav);
		request.setAttribute("snslist", snslist);
		request.setAttribute("social", "active");
		request.setAttribute("jsp", "../main/social/dsocial.jsp");

		return "main/main";
	}
	
	@RequestMapping("deleteSNS.do")
	public String deleteSNS(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("vo");
		
		String no = request.getParameter("no");
		int result = SNSDAO.deleteSNS(Integer.parseInt(no));
		
		return "main/social/delete_ok";
	}
	
	@RequestMapping("deleteCourse.do")
	public String deleteCourse(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("vo");
		
		String no = request.getParameter("no");
		int result = CourseDAO.deleteCourse(Integer.parseInt(no));
		
		return "main/tip/delete_ok";
	}
	
	@RequestMapping("snsReplyinsert.do")
	public String reply_page(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");

		String no = request.getParameter("no");
		String text = request.getParameter("text");
		String id = request.getParameter("id");
		String res = request.getParameter("res");
		String searchText = request.getParameter("searchText");
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("text", text);
		map.put("no", no);
		
		request.setAttribute("searchText", searchText);
		request.setAttribute("res", res);
		request.setAttribute("no", no);
		int result = SNSDAO.snsReplyInsert(map);

		return "main/social/reply_ok";
	}

	@RequestMapping("tip.do")
	public String tip_page(HttpServletRequest request) {
		String[] nav = new String[1];
		nav[0] = "<li class='dropdown'><a href='#' data-toggle='dropdown'>테마별　조회</a>"
				+ "<ul class='dropdown-menu' style='width:100%'>"
				+ "<li style='width:100%'><a href='stip.do?searchText=거실'>거실</a></li>"
				+ "<li style='width:100%'><a href='stip.do?searchText=주방'>주방</a></li>"
				+ "<li style='width:100%'><a href='stip.do?searchText=욕실'>욕실</a></li>"
				+ "<li style='width:100%'><a href='stip.do?searchText=침실'>침실</a></li>" + "</ul>" + "</li>";

		request.setAttribute("nav", nav);
		request.setAttribute("jsp", "../main/tip/tip.jsp");
		request.setAttribute("tip", "active");
		return "main/main";
	}

	@RequestMapping("stip.do")
	public String stip_page(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");

		String st = request.getParameter("searchText");

		if (st == null) {
			st = "";
		}
		System.out.println(st);

		List<SNSVO> snslist = SNSDAO.getDataSNSbyTheme(st);
		List<CourseVO> courselist = CourseDAO.getDataCoursebyTheme(st);

		String[] nav = new String[1];
		nav[0] = "<li class='dropdown'><a href='#' data-toggle='dropdown'>테마별　조회</a>"
				+ "<ul class='dropdown-menu' style='width:100%'>"
				+ "<li style='width:100%'><a href='stip.do?searchText=거실'>거실</a></li>"
				+ "<li style='width:100%'><a href='stip.do?searchText=주방'>주방</a></li>"
				+ "<li style='width:100%'><a href='stip.do?searchText=욕실'>욕실</a></li>"
				+ "<li style='width:100%'><a href='stip.do?searchText=침실'>침실</a></li>" + "</ul>" + "</li>";

		request.setAttribute("nav", nav);
		request.setAttribute("tip", "active");
		request.setAttribute("searchText", st);
		request.setAttribute("snslist", snslist);
		request.setAttribute("courselist", courselist);
		request.setAttribute("jsp", "../main/tip/htip.jsp");

		return "main/main";
	}

	@RequestMapping("bestitem.do")
	public String bestitem_page(HttpServletRequest request) throws Exception {
		String[] nav = new String[1];
		nav[0] = "<li><a href='http://www.ikea.com/kr/ko/'>　구매정보　</a></li>";
		request.setAttribute("nav", nav);
		request.setAttribute("bestitem", "active");
		request.setAttribute("jsp", "../main/bestitem/bestitem.jsp");

		return "main/main";
	}

	@RequestMapping("snswirteform.do")
	public String write_page(HttpServletRequest request) throws Exception {
		String[] nav = new String[1];
		nav[0] = "<li><a href='javascript:newWrite()'>　새로쓰기　</a></li>";
		request.setAttribute("nav", nav);
		request.setAttribute("jsp", "../main/write/writeSNS.jsp");

		return "main/main";
	}

	@RequestMapping("searchitem.do")
	public String item_page(HttpServletRequest request) throws Exception {

		request.setCharacterEncoding("UTF-8");
		/* response.setContentType("text/html; charset=utf-8") */;

		String aa = request.getParameter("searchText");

		if (aa == null) {
			aa = "";
		}
		String[] nav = new String[1];
		nav[0] = "<li><a href='javascript:link()'>　구매정보　</a></li>";

		List<ItemVO> itemlist = ItemDAO.ItemAllData(aa);
		request.setAttribute("nav", nav);
		request.setAttribute("bestitem", "active");
		request.setAttribute("itemlist", itemlist);
		request.setAttribute("searchText", aa);
		request.setAttribute("jsp", "../main/bestitem/searchBestItem.jsp");

		return "main/main";
	}

	@RequestMapping("mypage.do")
	public String my_page(HttpServletRequest request) {

		String[] nav = new String[3];
		nav[0] = "<li><a href='javascript:deleteMember()'>　탈퇴하기　</a></li>";
		nav[1] = "<li><a href='javascript:openOutlook()'>　문의하기　</a></li>";
		nav[2] = "<li><a href='javascript:myCourse()'>　내 강좌　</a></li>";

		request.setAttribute("nav", nav);

		request.setAttribute("mypage", "active");
		request.setAttribute("jsp", "../main/mypage/mypage.jsp");

		return "main/main";
	}

	@RequestMapping("sns.do")
	public String uploadSNS(HttpServletRequest request) {
		String enctype = "UTF-8";
		int size = 1024 * 1024 * 1000;
		String path = "C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\imgUpload";
		String fileName = "";
		String fileLength = "";
		File file = null;
		String count = "";

		try {
			MultipartRequest multi = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());

			String content = multi.getParameter("content");
			String tag = multi.getParameter("tag");
			String id = multi.getParameter("id");
			String theme = multi.getParameter("theme");
			count = multi.getParameter("count");
			Enumeration efiles = multi.getFileNames();

			List<String> taglist = new ArrayList<String>();
			String rec = content.trim();

			while (true) {
				int a = rec.indexOf("#");
				if (a == -1) {
					break;
				} else {
					rec = rec.substring(a, rec.length());
					int b = rec.indexOf(" ");
					String r = rec.substring(0, b);
					rec = rec.substring(b + 1, rec.length());
					taglist.add(r);
				}
			}
			
			if (taglist.size() != 0){
				tag = taglist.get(0);
			} else {
				tag = " ";
			}
			
			for (int i = 1; i < taglist.size(); i++) {
				tag = tag + ", " + taglist.get(i);
			}

			Map map = new HashMap();
			map.put("id", id);
			map.put("theme", theme);

			int insertSNS = SNSDAO.insertSNS(map);
			int snsNo = SNSDAO.getMaxSnsNo();

			Map map1 = new HashMap();
			map1.put("sns_no", snsNo);
			map1.put("text", content);

			Map map2 = new HashMap();
			map2.put("sns_no", snsNo);
			map2.put("tag", tag);

			int xinsert = SNSDAO.xinsertSNS(map1);
			int tinsert = SNSDAO.tinsertSNS(map2);

			int i = 0;

			while (efiles.hasMoreElements()) {
				String name = (String) efiles.nextElement();
				file = (File) multi.getFile(name);
				String str = file.getName();
				i++;
				fileName = fileName + "," + path + "\\" + str;

				fileLength += "&fileLength" + i + "=" + file.length();
			}

			Map map3 = new HashMap();
			map3.put("sns_no", snsNo);
			map3.put("path", fileName);

			int pinsert = SNSDAO.pinsertSNS(map3);
			
			HttpSession session = request.getSession(true);
			MemberVO mvo = (MemberVO) session.getAttribute("vo");
			session.setAttribute("vo", mvo);
			
		} catch (Exception e) {
			System.out.print("예외 발생 : " + e);
		}

		List<SNSVO> snslist = SNSDAO.getAllDataSNS();
		String[] nav = new String[2];
		nav[0] = "<li><a href='javascript:sortnew()'>　최신순　</a></li>";
		nav[1] = "<li><a href='javascript:sortlike()'>　인기순　</a></li>";

		request.setAttribute("nav", nav);
		request.setAttribute("snslist", snslist);
		request.setAttribute("social", "active");
		//request.setAttribute("jsp", "../main/social/social.jsp");

		return "main/write/writeSNS_ok";
	}

	@RequestMapping("course.do")
	public String uploadCourse(HttpServletRequest request) {
		String enctype = "UTF-8";
		int size = 1024 * 1024 * 1000;
		String path = "C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\imgUpload";
		String fileName = "";
		String fileLength = "";
		File file = null;
		String count = "";

		try {
			MultipartRequest multi = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());

			String cname = multi.getParameter("title");
			String content = multi.getParameter("content");
			String tag = " ";
			String id = multi.getParameter("id");
			String theme = multi.getParameter("theme");
			String cDate = multi.getParameter("cDate");
			String addr = multi.getParameter("addr");
			String inwon = multi.getParameter("inwon");
			count = multi.getParameter("count");
			Enumeration efiles = multi.getFileNames();

			if (cname == null) {
				cname = theme + " 강좌";
			}

			List<String> taglist = new ArrayList<String>();
			String rec = content.trim();

			while (true) {
				int a = rec.indexOf("#");
				if (a == -1) {
					break;
				} else {
					rec = rec.substring(a, rec.length());
					int b = rec.indexOf(" ");
					String r = rec.substring(0, b);
					rec = rec.substring(b + 1, rec.length());
					taglist.add(r);
				}
			}
			
			if (taglist.size() != 0){
				tag = taglist.get(0);
			} else {
				tag = " ";
			}
			
			for (int i = 1; i < taglist.size(); i++) {
				tag = tag + ", " + taglist.get(i);
			}
			

			Map map = new HashMap();
			map.put("id", id);
			map.put("theme", theme);
			map.put("cDate", cDate);
			map.put("quoat", inwon);
			map.put("addr", addr);
			map.put("cname", cname);

			int insertCourse = CourseDAO.insertCourse(map);
			int courseNO = CourseDAO.getMaxCourseNo();

			Map map1 = new HashMap();
			map1.put("course_no", courseNO);
			map1.put("text", content);

			Map map2 = new HashMap();
			map2.put("course_no", courseNO);
			map2.put("tag", tag);

			int xinsert = CourseDAO.xinsertCourse(map1);
			int tinsert = CourseDAO.tinsertCourse(map2);

			int i = 0;

			while (efiles.hasMoreElements()) {
				String name = (String) efiles.nextElement();
				file = (File) multi.getFile(name);
				String str = file.getName();
				i++;
				fileName = fileName + "," + path + "\\" + str;

				fileLength += "&fileLength" + i + "=" + file.length();
			}

			Map map3 = new HashMap();
			map3.put("course_no", courseNO);
			map3.put("path", fileName);

			int pinsert = CourseDAO.pinsertCourse(map3);
			
			HttpSession session = request.getSession(true);
			MemberVO mvo = (MemberVO) session.getAttribute("vo");
			session.setAttribute("vo", mvo);
			
		} catch (Exception e) {
			System.out.print("예외 발생 : " + e);
		}

		String[] nav = new String[1];
		nav[0] = "<li class='dropdown'><a href='#' data-toggle='dropdown'>테마별　조회</a>"
				+ "<ul class='dropdown-menu' style='width:100%'>"
				+ "<li style='width:100%'><a href='stip.do?searchText=거실'>거실</a></li>"
				+ "<li style='width:100%'><a href='stip.do?searchText=주방'>주방</a></li>"
				+ "<li style='width:100%'><a href='stip.do?searchText=욕실'>욕실</a></li>"
				+ "<li style='width:100%'><a href='stip.do?searchText=침실'>침실</a></li>" + "</ul>" + "</li>";

		request.setAttribute("nav", nav);
		request.setAttribute("jsp", "../main/tip/tip.jsp");
		request.setAttribute("tip", "active");
		return "main/main";

	}

	@RequestMapping("delete.do")
	public String member_delete(HttpServletRequest request) {

		String name = request.getParameter("id");

		Map map = new HashMap();
		map.put("Username", name);

		boolean dcheck = MemberDAO.delete(map);
		request.setAttribute("dcheck", dcheck);

		return "main/index";
	}

	@RequestMapping("sociallike.do")
	public String social_like(HttpServletRequest request) {
		List<SNSVO> snslist = SNSDAO.getSNSSortLike();

		String[] nav = new String[2];
		nav[0] = "<li><a href='javascript:sortnew()'>　최신순　</a></li>";
		nav[1] = "<li><a href='javascript:sortlike()'>　인기순　</a></li>";

		request.setAttribute("nav", nav);
		request.setAttribute("snslist", snslist);
		request.setAttribute("social", "active");
		request.setAttribute("jsp", "../main/social/social.jsp");

		return "main/main";
	}

	@RequestMapping("myCourse.do")
	public String mycourse_page(HttpServletRequest request) {
	  String id = request.getParameter("id");
	      
      List<CourseVO> clist = CourseDAO.getMyCourse(id);
      List<CourseVO> rlist = CourseDAO.getReserveMyCourse(id);
    
      String[] nav = new String[3];
      nav[0] = "<li><a href='javascript:deleteMember()'>　탈퇴하기　</a></li>";
      nav[1] = "<li><a href='javascript:openOutlook()'>　문의하기　</a></li>";
      nav[2] = "<li><a href='javascript:myCourse()'>　내 강좌　</a></li>";
      
      request.setAttribute("nav", nav);
      request.setAttribute("clist", clist);
      request.setAttribute("rlist", rlist);
      request.setAttribute("mypage", "active");
      request.setAttribute("jsp", "../main/mypage/myCourse.jsp");
   
      return "main/main";
	}

	@RequestMapping("detailCourse.do")
	public String detailCourse(HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		MemberVO mvo = (MemberVO) session.getAttribute("vo");
		List<FollowVO> flist = MemberDAO.getMyFollowlist(mvo.getId());
		
		String no = request.getParameter("no");

		CourseVO cvo = CourseDAO.detailCourse(Integer.parseInt(no));
		List<String> path = new ArrayList<String>();
		
		StringTokenizer st = new StringTokenizer(cvo.getPhoto().getPath(), ",");

		while (st.hasMoreTokens()) {
			String aa = st.nextToken();
			aa = aa.replace(
					"C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\","");
			aa = aa.replace("\\", "/");
			path.add(aa);
		}

		String fimg = path.get(0);
		
		String[] nav = new String[1];
		nav[0] = "<li class='dropdown'><a href='#' data-toggle='dropdown'>테마별　조회</a>"
				+ "<ul class='dropdown-menu' style='width:100%'>"
				+ "<li style='width:100%'><a href='stip.do?searchText=거실'>거실</a></li>"
				+ "<li style='width:100%'><a href='stip.do?searchText=주방'>주방</a></li>"
				+ "<li style='width:100%'><a href='stip.do?searchText=욕실'>욕실</a></li>"
				+ "<li style='width:100%'><a href='stip.do?searchText=침실'>침실</a></li>" + "</ul>" + "</li>";
		
		request.setAttribute("fimg", fimg);
		request.setAttribute("path", path);
		request.setAttribute("flist", flist);
		request.setAttribute("cvo", cvo);
		request.setAttribute("nav", nav);
		request.setAttribute("tip", "active");
		request.setAttribute("jsp", "../main/tip/dtip.jsp");

		return "main/main";
	}
	
	@RequestMapping("courseReserve.do")
	public String courseReserve(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String no=request.getParameter("no");
		MemberVO mvo=(MemberVO) session.getAttribute("vo");
		
		Map map=new HashMap();
		map.put("no", no);
		map.put("id", mvo.getId());
		
		int count=CourseDAO.courseReserve(map);

		return "main/tip/reserve_ok";
	}

	@RequestMapping("writeCourse.do")
	public String writeCourse_page(HttpServletRequest request) {

		request.setAttribute("mypage", "active");
		request.setAttribute("jsp", "../main/write/writeCourse.jsp");
		return "main/main";
	}
	
	@RequestMapping("addSNSlike.do")
	public String addSNSlike (HttpServletRequest request) throws Exception {	
		String no = request.getParameter("no");
		
		HttpSession session = request.getSession(true);
		MemberVO mvo = (MemberVO) session.getAttribute ("vo");
		
		boolean lresult = SNSDAO.addSNSlike(Integer.parseInt(no));
		
		if (lresult == true){
			if (mvo.getSnslike() == null){
				mvo.setSnslike("");
			}
			String snslike = mvo.getSnslike() + "," + no; 
			
			Map map = new HashMap();
			map.put("id", mvo.getId());
			map.put("snslike", snslike);
			
			int mresult = MemberDAO.setMemlike(map);
		}
		
		mvo = MemberDAO.getMember(mvo.getId());
		
		String aa = mvo.getProfile();
		aa = aa.replace("C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\","");
		aa = aa.replace("\\", "/");
		mvo.setProfile(aa);
		
		session.setAttribute("vo", mvo);
		
		return "main/social/snsLike_ok";
	}
	
	@RequestMapping("courseReply.do")
	public String courseReply(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession(true);
		MemberVO mvo = (MemberVO) session.getAttribute("vo");

		String no = request.getParameter("no");
		CourseVO vo = CourseDAO.getCourseDetail(Integer.parseInt(no));
		String searchText = request.getParameter("searchText");
		
		List<ReplyVO> rlist = CourseDAO.getAllCourseReply(vo.getNo());
		List<String> path = new ArrayList<String>();

		StringTokenizer st = new StringTokenizer(vo.getPhoto().getPath(), ",");

		while (st.hasMoreTokens()) {
			String aa = st.nextToken();
			aa = aa.replace(
					"C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\",
					"");
			aa = aa.replace("\\", "/");
			path.add(aa);
		}

		String fimg = path.get(0);
		
		request.setAttribute("searchText", searchText);
		request.setAttribute("no", no);
		request.setAttribute("rlist", rlist);
		request.setAttribute("imgArr", path);
		request.setAttribute("detailCourse", vo);
		return "main/tip/courseReply";
	}
	
	@RequestMapping("courseReplyinsert.do")
	public String courseReplyinsert(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");

		String no = request.getParameter("no");
		String text = request.getParameter("text");
		
		HttpSession session = request.getSession(true);
		MemberVO mvo = (MemberVO) session.getAttribute ("vo");
		String id = mvo.getId();
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("text", text);
		map.put("no", no);

		int result = CourseDAO.courseReplyInsert(map);
		request.setAttribute("no", no);
		return "main/tip/reply_ok";
	}
	
	@RequestMapping("checkDeposit.do")
	public String checkDeposit(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");

		String cno = request.getParameter("no");
		String mid = request.getParameter("id");

		Map map = new HashMap();
		map.put("id", mid);
		map.put("no", cno);

		request.setAttribute("no", cno);
		int result = CourseDAO.checkDeposit(map);

		return "main/admin/checkDeposit";
	}
}
