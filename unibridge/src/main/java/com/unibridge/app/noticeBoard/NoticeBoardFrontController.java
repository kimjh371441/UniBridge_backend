package com.unibridge.app.noticeBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.unibridge.app.Result;
import com.unibridge.app.noticeBoard.controller.NoticeBoardListOkController;

/**
 * Servlet implementation class BoardFrontController
 */
public class NoticeBoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeBoardFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("BoardFrontController 현재 경로 : " + target);
		Result result = new Result();
		
		switch(target) {
		case  "/noticeBoard/controller/noticeboardListOk.bo":
			System.out.println("게시물 목록 처리 요청");
			result = new NoticeBoardListOkController().execute(request, response);
			System.out.println("게시물 목록 처리 완료");
			break;
		case "/noticeBoard/controller/noticeboardReadOk.bo":
			System.out.println("게시물 상세 페이지 처리 요청");
//			result = new NoticeBoardReadOkController().execute(request, response);
			System.out.println("게시물 상세 페이지 처리 완료");
			break;
		
			
		}
		
		if(result != null && result.getPath() != null) {
			if(result.isRedirect()) {
				response.sendRedirect(result.getPath());
			} else {
				request.getRequestDispatcher(result.getPath()).forward(request, response);
			}
		}
		
		
	}

}
