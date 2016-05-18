package com.dao;

import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class IndexDAO {
	private static SqlSessionFactory ssf;
	static {
		try { 
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	public static String[] indexPage(){
		SqlSession session=ssf.openSession();
		String[] a = new String[2];
		
		String mcount = session.selectOne("indexmember");
		String lcount = session.selectOne("indexlike");
		
		a[0] = mcount;
		a[1] = lcount;
		
		return a;
	}
}
