package com.unibridge.app.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.unibridge.app.Execute;
import com.unibridge.app.Result;

public class AdminLogoutOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Result result = new Result();
		request.getSession().invalidate(); //세션 무효화
		result.setPath(request.getContextPath() +"/login.admin");
		result.setRedirect(true);

		return result;
	}
	

}
