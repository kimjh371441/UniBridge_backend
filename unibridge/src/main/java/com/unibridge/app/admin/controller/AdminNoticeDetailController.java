package com.unibridge.app.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.unibridge.app.Execute;
import com.unibridge.app.Result;
import com.unibridge.app.admin.dao.AdNoticeBoardDAO;
import com.unibridge.app.admin.dto.AdNoticeBoardDTO;
import com.unibridge.app.file.dao.FileDAO;
import com.unibridge.app.file.dto.FileDTO;

public class AdminNoticeDetailController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("게시글 상세 페이지 이동 완료");
		
		Result result = new Result();
		
		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		
		AdNoticeBoardDAO boardDAO = new AdNoticeBoardDAO();
		FileDAO fileDAO = new FileDAO();
		
		//DB에서 게시글 가져오기
		AdNoticeBoardDTO boardDTO = boardDAO.selectBoard(boardNumber);
		
		//게시글이 존재하지 않을 경우
		if(boardDTO == null) {
			System.out.println("존재하지 않는 게시물입니다." + boardNumber);
			result.setPath("/app/admin/adminNotice/noticeList.jsp");
			result.setRedirect(true);
			return result;
		}
		
		//첨부파일 가져오기
		FileDTO file = fileDAO.selectFile(boardNumber);
		System.out.println("==파일 확인==");
		System.out.println(file);
		System.out.println("===========");
		
		//첨부파일 붙이기
		boardDTO.setFile(file);
		
		//로그인 한 사용자 번호 가져오기
		Integer loginMemberNumber = (Integer) request.getSession().getAttribute("adminNumber");
		System.out.println("로그인 한 멤버 번호 : " + loginMemberNumber);
		
		//현재 게시글 작성자 번호 가져오기
		int boardWriterNumber = boardDTO.getAdminNumber();
		System.out.println("현재 게시글 작성자 번호 : " + boardWriterNumber);
		
		
		request.setAttribute("board", boardDTO);
		result.setPath("/app/admin/adminNotice/noticeDetail.jsp");
		result.setRedirect(false);
		
		return result;
	}
	

}
