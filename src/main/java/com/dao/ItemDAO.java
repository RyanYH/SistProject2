package com.dao;

import java.net.URLEncoder;
import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import com.dto.*;

public class ItemDAO {
	 public static List<ItemVO> ItemAllData(String text) throws Exception{
		 String aa = new String(text.getBytes("UTF-8"),"UTF-8");
		 
	    	List<ItemVO> list=new ArrayList<ItemVO>();
	    	try{
	    		Document doc=Jsoup.connect("http://shopping.naver.com/search/all.nhn?query="+URLEncoder.encode(aa, "UTF-8")).get();
	    		Elements titleElem=doc.select("div#_search_list.sort_content div.info a.tit");
	    		Elements imgElem=doc.select("div.img_area a.img img._productLazyImg");
	    		Elements linkElem = doc.select("div#_search_list.sort_content div.search_list.basis ul.goods_list li._model_list div.info a.tit");
	    		
				if (linkElem.size() == 0){
	    			linkElem = doc.select("div#_search_list.sort_content div.search_list.basis ul.goods_list li._product_list div.info a.tit");
	    		} 
				
				if (linkElem.size() == 0){
	    			linkElem = doc.select("div#_search_list.sort_content div.search_list ul.goods_list li div.info a.tit");
	    		} 
	    		
	    		Elements priceElem = doc.select("div#_search_list.sort_content div.search_list.basis ul.goods_list li._product_list div.info span.price em span.num._price_reload");
	    		
	    		if(priceElem.size() == 0){
	    			priceElem = doc.select("div#_search_list.sort_content div.search_list.thumb ul.goods_list li div.info span.price em span.num._price_reload");
	    		}
	    		
	    		for(int i=0;i<titleElem.size();i++){
	    			Element telem=titleElem.get(i);
	    			Element ielem=imgElem.get(i);
	    			Element lilem=linkElem.get(i);
	    			Element prlem=priceElem.get(i);
	    			
	    			String img=ielem.attr("data-original");
	    			
	    			int index = img.indexOf("?");
	    			img = img.substring(0, index);
	    			img = img + "?type=f160";
	    			
	    			String link=lilem.attr("href");
	    			String originLink = "http://shopping.naver.com" + link;
	    			String price= prlem.text();
	    			
	    			String name = telem.text();
	    			
	    			System.out.println(name);
	    			
	    			ItemVO d=new ItemVO();
	    			d.setPath(img);
	    			d.setName(name);
	    			d.setLink(originLink);
	    			d.setPrice(price);
	    			
	    		    list.add(d); 
	    		}
	    	}catch(Exception ex){
	    		System.out.println(ex.getMessage());
	    	}
	    	return list;
	    }
}
