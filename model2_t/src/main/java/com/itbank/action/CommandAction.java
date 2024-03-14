package com.itbank.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandAction {

	String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException;
	
	String doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException;
}
