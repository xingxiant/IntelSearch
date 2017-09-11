package com.xxt.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static List<String> datas=new ArrayList<String>();
    static{
    	//添加静态数据
    	datas.add("ajax");
    	datas.add("ajax post");
    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//获得客户端发来的数据
		String keyword=request.getParameter("content");
		//System.out.println(keyword);
		List<String> listData=getDataa(keyword);
		String s=null;
		if(listData==null){
			s="[]";
		}else{
			s=JSONArray.fromObject(listData).toString();
		}
		
		System.out.println(s);
		
		response.getWriter().write(s);
		
		
		response.setCharacterEncoding("utf-8");
	}

	private List<String> getDataa(String keyword) {
		List<String> result=new ArrayList<String>();
		if(keyword.equals("")){
			return null;
		}
		
		
		for(String str:datas){
			if(str.contains(keyword)){
				result.add(str);
			}
		}
		return result;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
