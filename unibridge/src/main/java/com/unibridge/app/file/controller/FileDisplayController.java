package com.unibridge.app.file.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.unibridge.app.Execute;
import com.unibridge.app.Result;

public class FileDisplayController implements Execute {
	
	private static final String UPLOAD_PATH = "C:/upload/profile/";

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fileName = request.getParameter("fileName");

		if (fileName == null || fileName.trim().isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "fileName 파라미터가 필요합니다.");
			return null;
		}

		File file = new File(UPLOAD_PATH + fileName);
		
		if (file == null || !file.exists()) {
			// getRealPath를 이용해 서버 컨텍스트 내의 실제 경로를 가져옴
			String realDefaultPath = request.getServletContext().getRealPath("/assets/img/user/userProfile/default.png");
			file = new File(realDefaultPath);
			
			// 만약 기본 이미지 파일조차 서버에 없다면 404 에러 반환
			if (!file.exists()) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "이미지를 찾을 수 없습니다.");
				return null;
			}
		}


		// MIME 타입 설정 (이미지로 인식하게 함)
		String mimeType = request.getServletContext().getMimeType(file.toString());
		response.setContentType(mimeType != null ? mimeType : "image/jpeg");
		response.setContentLengthLong(file.length());

		// 파일 전송 (FileDownloadController의 5번 로직과 동일하지만 헤더만 없음)
		try (FileInputStream fis = new FileInputStream(file); OutputStream os = response.getOutputStream()) {
			byte[] buffer = new byte[4096];
			int read;
			while ((read = fis.read(buffer)) != -1) {
				os.write(buffer, 0, read);
			}
			os.flush();
		}
		return null;
	}

}
