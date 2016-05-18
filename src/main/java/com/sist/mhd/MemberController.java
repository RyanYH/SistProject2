package com.sist.mhd;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.controller.Controller;
import com.controller.RequestMapping;
import com.dao.MemberDAO;
import com.dto.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller("memberController")
public class MemberController {

	@RequestMapping("login.do")
	public String login_page(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("Username");
		String pwd = request.getParameter("Password");
		
		Map map = new HashMap();
		map.put("Username", id);
		map.put("Password", pwd);

		int lcheck = MemberDAO.login(map);

		HttpSession session = request.getSession();

		if (lcheck == 1) {
			MemberVO d = MemberDAO.mypageInfo(map);
			List<MemberVO> dd = MemberDAO.getFollowList(map);

			if (!d.getProfile().equals("user/images/avatar.jpg")){
				String aa = d.getProfile();
				aa = aa.replace("C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\", "");
				aa = aa.replace("\\", "/");
				d.setProfile(aa);
			}
			request.setAttribute("jsp", "main/home/home.jsp");
			session.setAttribute("vo", d);
			session.setAttribute("flist", dd);
		}
		request.setAttribute("lcheck", lcheck);

		return "member/login_ok";
	}

	@RequestMapping("join.do")
	public String join_page(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("Username");
		String pwd = request.getParameter("Password");
		String email = request.getParameter("Email");
		String profile = "user/images/avatar.jpg";

		Map<String, String> map = new HashMap<String, String>();
		map.put("Username", name);
		map.put("Password", pwd);
		map.put("Email", email);
		map.put("profile", profile);

		boolean check = MemberDAO.join(map);
		request.setAttribute("check", check);

		return "member/join";
	}

	@RequestMapping("deletefollow.do")
	public String delete_follow(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("id");
		String fname = request.getParameter("followid");

		Map map = new HashMap();
		map.put("Username", name);
		map.put("FollowID", fname);

		boolean dcheck = MemberDAO.deleteFollow(map);

		HttpSession session = request.getSession();
		if (dcheck == true) {
			List<MemberVO> dd = MemberDAO.getFollowList(map);
			session.setAttribute("flist", dd);
		}
		request.setAttribute("dcheck", dcheck);

		return "main/mypage/deletefollow_ok";
	}
	@RequestMapping("updateprofile.do")
	public String update_profile(HttpServletRequest request) throws Exception {	
		request.setCharacterEncoding("UTF-8");

		String enctype = "UTF-8";
		int size = 1024 * 1024 * 100;
		String path = "C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\imgUpload";
		String fileName = "";
		String fileLength = "";
		File file = null;
		String count = "";
		
       try{
    	   MultipartRequest multi = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());

    	   String id = multi.getParameter("name");
    	   String email = multi.getParameter("email");
    	   String password = multi.getParameter("pwd");
    	   
    	   Enumeration efiles =  multi.getFileNames();
    	   String name = (String)efiles.nextElement(); 
    	   file = (File) multi.getFile(name);
    	   
    	   if (file == null){
    		   String bpro = multi.getParameter("bpro");
    		   bpro = bpro.replace("/", "\\");
    		   fileName = "C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\"+bpro;
    	   } else {
    		   String str = file.getName();
        	   fileName = path + "\\" + str;
    	   }
		 
    	   Map<String, String> map = new HashMap<String, String>();
    	   map.put("Username", id);
    	   map.put("Email", email);
    	   map.put("Password", password);
			map.put("profile", fileName);

			boolean ucheck = MemberDAO.update(map);
			request.setAttribute("ucheck", ucheck);
			request.setAttribute("id", id);
			request.setAttribute("pwd", password);
       }catch(Exception ex){
    	   System.out.println(ex.getMessage()); 
       }

		return "main/mypage/update_ok";
	}
	
	@RequestMapping("deleteByAdmin.do")
	public static String deleteByAdmin(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		int result = MemberDAO.deleteByAdmin(id);
		
		return "main/admin/deletemember_ok";
	}
	
	@RequestMapping("addfollow.do")
	public String addfollow(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String name=request.getParameter("id");
		String fname=request.getParameter("followid");
		String no=request.getParameter("no");
		String res = request.getParameter("res");
		
		Map map=new HashMap();
		map.put("Username", name);
		map.put("FollowID", fname);
		map.put("no", no);
		
		boolean acheck = MemberDAO.addFollow(map);
		
		HttpSession session = request.getSession();
		if (acheck  == true){
			List<MemberVO> dd= MemberDAO.getFollowList(map);
			session.setAttribute("flist", dd);
		}
		
		request.setAttribute("res", res);
		request.setAttribute("no", no);
		request.setAttribute("acheck", acheck);
		request.setAttribute("a", 0);
		
		return "main/mypage/follow_ok";
	}
	
	@RequestMapping("addcourse.do")
	public String addcourse(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String name=request.getParameter("id");
		String fname=request.getParameter("followid");
		String no=request.getParameter("no");
		String res = request.getParameter("res");
		String searchText = request.getParameter("searchText");
		
		Map map=new HashMap();
		map.put("Username", name);
		map.put("FollowID", fname);
		map.put("no", no);
		
		boolean acheck = MemberDAO.addFollow(map);
		
		HttpSession session = request.getSession();
		if (acheck  == true){
			List<MemberVO> dd= MemberDAO.getFollowList(map);
			session.setAttribute("flist", dd);
		}
		
		request.setAttribute("searchText", searchText);
		request.setAttribute("res", res);
		request.setAttribute("no", no);
		request.setAttribute("acheck", acheck);
		request.setAttribute("a", 1);
		
		return "main/mypage/follow_ok";
	}
	
	@RequestMapping("kakao.do")
	public String kakao_login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String profile = request.getParameter("profile");
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("profile", profile);
		
		int lcheck = MemberDAO.checkLogin(map);
		
		if (lcheck == 0){
			MemberDAO.insertKAKAO(map);
			lcheck = 1;
		}
		
		
		if (lcheck == 1) {
			Map map1 = new HashMap();
			map1.put("Username", id);
			
			MemberVO d = MemberDAO.mypageInfo(map1);
			List<MemberVO> dd = MemberDAO.getFollowList(map1);

			if (!d.getProfile().equals("user/images/avatar.jpg") && !d.getProfile().startsWith("http://")){
				String aa = d.getProfile();
				aa = aa.replace("C:\\Users\\AAA\\git1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SistprojectSE2\\", "");
				aa = aa.replace("\\", "/");
				d.setProfile(aa);
			}
			request.setAttribute("jsp", "main/home/home.jsp");
			session.setAttribute("vo", d);
			session.setAttribute("flist", dd);
		}
		request.setAttribute("lcheck", lcheck);

		return "member/login_ok";

	}
}
