package com.itbank.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeAction implements CommandAction {

	@Override	// "/" 주소로 GET 요청을 받으면 home을 반환한다 (home.jsp)
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		request.setAttribute("message", "JSP Model2 재미있다");
		return "home";
	}

	@Override	// "/" 주소로 POST 요청을 받으면 GET과 동일한 규칙으로 처리하여 반환한다
	public String doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		return doGet(request, response);
	}

}
