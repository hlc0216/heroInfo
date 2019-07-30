package com.hlc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//设置编码格式
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		//获取请求数据请求
		String name = req.getParameter("name");
		String pwd =req.getParameter("pwd");
		System.out.println(name+":"+pwd);
		//处理请求
		//处理响应
//		int a=9/0;
		resp.getWriter().write("这是来自ajax的测试");
		
	}
}
