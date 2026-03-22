package com.unibridge.app.mypage.surveyMentor.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.unibridge.app.Execute;
import com.unibridge.app.Result;
import com.unibridge.app.file.dto.FileDTO;
import com.unibridge.app.member.dto.MemberDTO;
import com.unibridge.app.mypage.survey.dao.SurveyDAO;
import com.unibridge.app.mypage.surveyMentor.dto.SurveyMentorDTO;

public class UndecidedSurveyMentor implements Execute{

	private Result outResult = new Result();

	@Override
    public Result execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//파일 저장 경로 설정 및 디렉토리 생성
		String UPLOAD_PATH = request.getServletContext().getRealPath("/") + "upload/";
        File uploadDir = new File(UPLOAD_PATH);
        if (!uploadDir.exists()) uploadDir.mkdirs();
        
        HttpSession session = request.getSession();
        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        
        if (loginUser == null) {
            outResult.setRedirect(true);
            outResult.setPath(request.getContextPath() + "/index.main"); // 로그인 안되어있으면 메인으로
            return outResult;
        }

        // 1. MultipartRequest 생성 (여기서 데이터가 파싱됩니다)
        MultipartRequest multi = new MultipartRequest(request, UPLOAD_PATH, 100*1024*1024, "UTF-8", new DefaultFileRenamePolicy());

        // 2. 파싱된 multi 객체에서 role 값을 꺼냅니다. (드디어 null이 아님!)
        String role = multi.getParameter("role");
        System.out.println("[LOG] 전달된 role: " + role);

        SurveyDAO surveyDAO = new SurveyDAO();
        SurveyMentorDTO mentorDTO = new SurveyMentorDTO();

        try {
            // 4. 데이터 수집 및 DTO 세팅
            mentorDTO.setMemberNumber(loginUser.getMemberNumber());
            mentorDTO.setSurveyType("MENTOR");
            
            // 멘토 전용 입력 필드 (JSP의 name 속성과 일치해야 함)
            mentorDTO.setGradSchool(multi.getParameter("gradSchool"));
            mentorDTO.setGradDepart(multi.getParameter("gradDepart"));
            
            // 학점(double) 변환 처리 (비어있을 경우 0.0 처리)
            String scoreStr = multi.getParameter("gradScore");
            mentorDTO.setGradScore((scoreStr != null && !scoreStr.isEmpty()) ? Double.parseDouble(scoreStr) : 0.0);

            // 담당 과목 번호(int) 변환 처리
            String subjectStr = multi.getParameter("subjectNumber");
            mentorDTO.setSubjectNumber((subjectStr != null && !subjectStr.isEmpty()) ? Integer.parseInt(subjectStr) : 0);

            // 5. 파일 처리 로직
            FileDTO fileDTO = null;
            // JSP의 <input type="file" name="surveyFile">에서 전송된 파일이 있는지 확인
            if (multi.getFilesystemName("surveyFile") != null) {
                fileDTO = new FileDTO();
                String fileName = multi.getFilesystemName("surveyFile");
                
                fileDTO.setFileName(fileName);
                fileDTO.setFileOriginalName(multi.getOriginalFileName("surveyFile"));
                fileDTO.setFilePath("/upload/" + fileName);
                fileDTO.setFileExtension(fileName.substring(fileName.lastIndexOf(".") + 1));
                fileDTO.setFileSize(multi.getFile("surveyFile").length());
                
                System.out.println("[DEBUG] 멘토 파일 업로드 성공: " + fileName);
            } else {
                System.out.println("[DEBUG] 멘토 파일 업로드 없음");
            }

            // 6. DB 저장 (SurveyDAO 내부에서 파일 -> 설문마스터 -> 멘토상세 순으로 처리)
            surveyDAO.insertMentorSurvey(mentorDTO, fileDTO);
            System.out.println("[LOG] 멘토 설문 등록 성공 (회원번호: " + loginUser.getMemberNumber() + ")");

        } catch (NumberFormatException e) {
            System.out.println("[ERROR] 숫자 형식 데이터 변환 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("[ERROR] 설문 등록 중 예외 발생");
            e.printStackTrace();
        }

        // 6. 결과 설정
        outResult.setRedirect(true);
        outResult.setPath(request.getContextPath() + "/mvc/auth/undecided/survey.my"); 
        return outResult;
    }

}
