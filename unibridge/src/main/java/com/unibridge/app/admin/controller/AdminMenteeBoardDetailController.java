package com.unibridge.app.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.unibridge.app.Execute;
import com.unibridge.app.Result;
import com.unibridge.app.admin.dao.AdMenteeBoardDAO;
import com.unibridge.app.admin.dto.AdMenteeBoardListDTO;
import com.unibridge.app.file.dao.FileDAO;
import com.unibridge.app.file.dto.FileDTO;

public class AdminMenteeBoardDetailController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("게시글 상세 페이지 이동 완료");
		Result result = new Result();
		
		//boardNumber가 빈 문자열이거나 null인 경우
		String boardNumberStr = request.getParameter("boardNumber");
		if(boardNumberStr == null || boardNumberStr.trim().isEmpty()) {
			System.out.println("boardNumber 값이 없습니다");
			result.setPath("/app/board/boardList.jsp"); //게시글 목록 페이지로 리다이렉트
			result.setRedirect(true);
			return result;
		}
		
		int boardNumber = Integer.parseInt(boardNumberStr);
		
		AdMenteeBoardDAO boardDAO = new AdMenteeBoardDAO();
		FileDAO fileDAO = new FileDAO();
		
		//DB에서 게시글 가져오기
		AdMenteeBoardListDTO boardListDTO = boardDAO.menteeSelectBoard(boardNumber);
		
		//게시글이 존재하지 않을 경우
		if(boardListDTO == null) {
			System.out.println("존재하지 않는 게시물입니다." + boardNumber);
			result.setPath("/app/board/boardList.jsp");
			result.setRedirect(true);
			return result;
		}
		
		//첨부파일 가져오기
		List<FileDTO> files = fileDAO.selectFile(boardNumber);
		System.out.println("==파일 확인==");
		System.out.println(files);
		System.out.println("===========");
		
		//첨부파일 붙이기
		boardListDTO.setFiles(files);
		
		//로그인 한 사용자 번호 가져오기
		Integer loginMemberNumber = (Integer) request.getSession().getAttribute("memberNumber");
		System.out.println("로그인 한 멤버 번호 : " + loginMemberNumber);
		
		//현재 게시글 작성자 번호 가져오기
		int boardWriterNumber = boardListDTO.getMemberNumber();
		System.out.println("현재 게시글 작성자 번호 : " + boardWriterNumber);
		
		//로그인한 사용자가 작성자가 아닐 때만 조회 수 증가
		if(!Objects.equals(loginMemberNumber, boardWriterNumber)) {
			boardDAO.updateReadCount(boardNumber);
		}
		
		request.setAttribute("board", boardListDTO);
		result.setPath("/app/board/boardRead.jsp");
		result.setRedirect(false);
		
		return result;
	}

}
