package com.itbank.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutAction implements CommandAction{

	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		request.getSession().invalidate();
		return "redirect:/";
	}
	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		return doGet(request, response);
	} 
	
}
