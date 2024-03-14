package com.itbank.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.action.CommandAction;

public class DispatcherServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	// forward에 사용할 prefix, suffix
	private final String prefix = "/WEB-INF/views/";
	private final String suffix = ".jsp";
	
	// 주소:객체 형태로 저장하는 map
	private Map<String, CommandAction> map = new HashMap<>();
	
	@Override	// 서블릿 생성 시 초기 작동 함수
	public void init() throws ServletException {
		// 서블릿 설정에 initParameter가 있으면 그 항목의 값을 문자열로 가져온다
		String configFile = getInitParameter("configFile");
		System.out.println(configFile);	// 확인
		
		
		// 1) 요청주소 : 클래스이름 (패키지포함)의 맵을 구성하여 pro에 저장한다
		Properties pro = new Properties();	// 비어있는 Properties (=map)을 생성
		FileInputStream fis = null;			// 파일에서 데이터를 읽어오는 객체의 변수
		
		try {
			String configFilePath = getServletContext().getRealPath(configFile);
			fis = new FileInputStream(configFilePath);
			pro.load(fis);	// 파일을 지정하면 내용을 properties에 불러온다
			
		} catch(IOException e) {
			throw new ServletException(e);
		} finally {
			if(fis != null) try { fis.close(); } catch(Exception e) {}
		}
		System.out.println(pro);
		
		// 2) 클래스 이름을 이용하여 실제 객체를 생성하고, 요청주소 : 객체 형태로 map에 저장한다
		for(Object key : pro.keySet()) {
			String command = (String) key;
			String handlerClassName = pro.getProperty(command);
			try {
				Class<?> handlerClass = Class.forName(handlerClassName);
				Constructor<?> constructor = handlerClass.getConstructor(null); 
				CommandAction handlerInstance = (CommandAction) constructor.newInstance(null);
				
				map.put(command, handlerInstance);	// 요청주소, 객체
				
			} catch(Exception e) {
				throw new ServletException(e);
			}
		}
	}
	
	@Override	// 요청이 들어왔을때 처리하는 함수
	protected void service(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String command = request.getRequestURI();				
		if(command.indexOf(request.getContextPath()) == 0) {
			command = command.substring(request.getContextPath().length());
		}
		System.out.println("URI : " + request.getRequestURI());
		System.out.println("command : " + command);
		
		String viewName = null;
		CommandAction action = map.get(command);
		
		if(action == null) {
			response.sendError(404, "요청하신 페이지를 찾을 수 없습니다");
			return;
		}
		
		switch(request.getMethod()) {
		case "GET":
			viewName = action.doGet(request, response);
			break;
		case "POST":
			viewName = action.doPost(request, response);
			break;
		}
		
		if(viewName.startsWith("redirect:")) {
			String location = request.getContextPath() + viewName.split(":")[1];
			response.sendRedirect(location);
		}
		else {
			viewName = prefix + viewName + suffix;
			RequestDispatcher rd = request.getRequestDispatcher(viewName);
			rd.forward(request, response);
		}
		
	}
	

}





