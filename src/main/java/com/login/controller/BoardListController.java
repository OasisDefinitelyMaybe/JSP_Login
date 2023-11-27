package com.login.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.BoardDao;
import com.login.dto.Criteria;
import com.login.dto.PageDto;

/**
 * 게시글 목록을 조회후 반납합니다.
 */
@WebServlet("/boardList")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 게시글 목록을 조회
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	   // 리스트를 조회하기 위한 파라미터 수집
	   Criteria cri = new Criteria(request.getParameter("pageNo"), request.getParameter("amount"));
	
	   // 리스트 조회후 리퀘스트 영역에 저장
	   BoardDao dao = new BoardDao();

/*
	   // 페이징을 위한 시작번호, 끝번호 전에 세팅
       int pageNo=1;
       int amount=10;      
       // 전달된 값이 있으면 변경 없으면 기본값
       if(request.getParameter("pageNo") != null 
    		   && !"".equals(request.getParameter("pageNo"))) {	   
    	   pageNo = Integer.parseInt(request.getParameter("pageNo"));
       }
       if(request.getParameter("amount") != null 
    		   && !"".equals(request.getParameter("amount"))) {	   
    	   amount = Integer.parseInt(request.getParameter("amount"));
       }
       System.out.println("pageNo = " + pageNo);
       System.out.println("amount = " + amount);
*/
	   // request영역에 저장 -> 화면까지 데이터를 유지하기 위해서
	   request.setAttribute("list", dao.getList(cri));
	   
       // 페이징을 위한 시작번호와 끝번호를 계산
//       int endNum = pageNo * amount;
//       int startNum = endNum - (amount-1);
	   
       // 페이지 블럭을 생성하기 위해 필요한 정보를 저장
	   int total = dao.getTotalCnt();
	   PageDto pageDto = new PageDto(total, cri);
	   
	   // request영역에 저장 -> 화면까지 데이터를 유지하기 위해서
//      request.setAttribute("list", dao.getList(startNum, endNum));
        request.setAttribute("pageDto", pageDto);
        
        // 자원반납
        dao.close();
        
        //페이지 전환
        request.getRequestDispatcher("/board/board.jsp").forward(request, response);      
	}

}
