package com.itbank.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

public class LoginAction implements CommandAction {
	
	private MemberDAO memberDAO = MemberDAO.getInstance();

	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		return "login";
	}

	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		MemberDTO dto = new MemberDTO();
		dto.setUserid(userid);
		dto.setUserpw(userpw);
				
		MemberDTO login = memberDAO.login(dto);
		
		HttpSession session = request.getSession();
		session.setAttribute("login", login);
		return "redirect:/";
	}

}
