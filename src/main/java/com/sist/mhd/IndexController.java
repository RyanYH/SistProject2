package com.sist.mhd;

import java.io.UnsupportedEncodingException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import com.controller.Controller;
import com.controller.RequestMapping;
import com.dao.IndexDAO;

@Controller("indexController")
public class IndexController {
	@RequestMapping("index.do")
	public String index_page(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String[] a = IndexDAO.indexPage();
		
		request.setAttribute("abc", a);
		return "main/index";
	}
}