package com.unibridge.app.mypage.survey.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.unibridge.app.file.dto.FileDTO;
import com.unibridge.app.mypage.surveyMentee.dto.SurveyMenteeDTO;
import com.unibridge.app.mypage.surveyMentor.dto.SurveyMentorDTO;
import com.unibridge.config.MyBatisConfig;

public class SurveyDAO {
	
    private SqlSessionFactory factory = MyBatisConfig.getSqlSessionFactory();

    /**
     * 멘티 설문 등록 (파일 -> 공통 설문 -> 멘티 상세)
     */
    public void insertMenteeSurvey(SurveyMenteeDTO menteeDTO, FileDTO fileDTO) {
        try (SqlSession session = factory.openSession(false)) {
            try {
                // [1단계] 파일이 실제로 존재할 때만 insert 진행
                // fileDTO가 null이 아니더라도 파일명이 없거나 사이즈가 0이면 제외해야 함
                if (fileDTO != null && fileDTO.getFileName() != null && !fileDTO.getFileName().isEmpty()) {
                    
                    System.out.println("[DEBUG] 파일 DB 저장 시도: " + fileDTO.getFileName());
                    session.insert("file.insertFile", fileDTO); 
                    
                    // selectKey가 정상 작동했다면 fileDTO.getFileNumber()에 값이 담겨있음
                    int generatedFileNo = fileDTO.getFileNumber();
                    
                    if(generatedFileNo > 0) {
                        menteeDTO.setFileNumber(generatedFileNo);
                        System.out.println("[DEBUG] 생성된 파일 번호 매핑 완료: " + generatedFileNo);
                    }
                } else {
                    // 파일을 선택하지 않은 경우 명시적으로 null 세팅
                    menteeDTO.setFileNumber(null);
                }

                // [2단계] 설문 마스터 저장
                session.insert("survey.insertSurvey", menteeDTO);

                // [3단계] 멘티 상세 정보 저장
                session.insert("survey.insertMenteeSurvey", menteeDTO);

                session.commit();
            } catch (Exception e) {
                session.rollback();
                e.printStackTrace();
            }
        }
    }

    /**
     * 멘토 설문 등록 (파일 -> 공통 설문 -> 멘토 상세)
     */
    public void insertMentorSurvey(SurveyMentorDTO mentorDTO, FileDTO fileDTO) {
        try (SqlSession session = factory.openSession(false)) {
            try {
                // 1. 파일 저장 (필요 시)
                if (fileDTO != null) {
                    session.insert("file.insertFile", fileDTO);
                    mentorDTO.setFileNumber(fileDTO.getFileNumber());
                }

                // 2. 공통 설문 저장
                session.insert("survey.insertSurvey", mentorDTO);

                // 3. 멘토 상세 정보 저장
                session.insert("survey.insertMentorSurvey", mentorDTO);

                session.commit();
            } catch (Exception e) {
                session.rollback();
                e.printStackTrace();
                throw e;
            }
        }
    }
    
    public String getSurveyType(int memberNumber) {
        try (SqlSession session = factory.openSession(true)) {
            return session.selectOne("survey.getSurveyType", memberNumber);
        }
    }
    
    public int checkSurveyExists(int memberNumber) {
        try (SqlSession session = factory.openSession(true)) {
            return session.selectOne("survey.checkSurveyExists", memberNumber);
        }
    }
}