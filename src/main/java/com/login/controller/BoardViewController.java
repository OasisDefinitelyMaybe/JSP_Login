package com.login.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.BoardDao;

/**
 * 게시글 상세보기
 */
@WebServlet("/view")
public class BoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파라미터 수집
		String num = request.getParameter("num");
		
		BoardDao dao = new BoardDao();
		// 게시글을 조회시 조회수를 증가시켜줍니다.
		dao.visitCountUp(num);
		
		// DB로부터 1건의 게시글을 조회 후 BoardDto로 반환
		request.setAttribute("boardDto", dao.getOne(num));
		
		dao.close();
	    request.getRequestDispatcher("/board/view.jsp").forward(request, response);
	}

}
