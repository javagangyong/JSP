package com.itbank.action;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.board.BoardDAO;
import com.itbank.board.BoardDTO;
import com.itbank.board.Paging;

public class BoardAction implements CommandAction {
	
	private BoardDAO boardDAO = BoardDAO.getInstance();

	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		String paramPage = request.getParameter("page");
		String search = request.getParameter("search");
		if(search == null) {
			search = "";
		}
		int page = paramPage == null ? 1 : Integer.parseInt(paramPage);
		int boardCount = boardDAO.selectCount(search); 
		Paging paging = Paging.newInstance(page, boardCount);
		List<BoardDTO> list = boardDAO.selectList(search, paging);
		
		request.setAttribute("list", list);	// DAO 에서 불러온 list를 JSP에게 넘겨주기 위해서 setAttribute
		request.setAttribute("paging", paging);
		
		return "board";	// "/WEB-INF/views/board.jsp" 로 이동
	}

	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		// TODO Auto-generated method stub
		return null;
	}

}
