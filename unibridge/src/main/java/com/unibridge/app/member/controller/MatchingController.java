package com.unibridge.app.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.unibridge.app.Execute;
import com.unibridge.app.Result;
import com.unibridge.app.member.dto.MemberDTO;

public class MatchingController implements Execute{
	
	private Result outResult = new Result();

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("===MenteeMatchingController===");
		
		String method = request.getMethod().toUpperCase();

        switch (method) {
            case "GET":
                doGet(request, response);
                break;
            case "POST":
                doPost(request, response);
                break;
        }

        return outResult;
	}

	private void doGet(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("[MatchingController] GET - 매칭 정보 페이지");
		
		HttpSession session = request.getSession();
		MemberDTO memberNumber = (MemberDTO) session.getAttribute("loginUser");
	    System.out.println("MenteeMange컨트롤러 : " + memberNumber.getMemberNumber());
	    
	    
		
		// outResult로 forward 설정
	    outResult.setPath("/app/user/mentee/myPage/userMatching/userMatching.jsp");
	    outResult.setRedirect(false); // forward 처리
	    
	    System.out.println("request.getContextPath() :" + request.getContextPath());
		
	}

	private void doPost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

}
