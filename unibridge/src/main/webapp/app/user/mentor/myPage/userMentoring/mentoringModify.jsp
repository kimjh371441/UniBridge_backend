<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>멘토링 수정 - UniBridge</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/fonts.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/user/mentor/myPage/userMentoring/mentoringForm.css">
</head>
<body>
	<jsp:include page="/app/user/header.jsp" />

	<div class="mainContainer">
		<aside>
			<div class="myPageTitle">마이페이지</div>
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/mvc/auth/mentor/myPage.my">계정
						관리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mvc/auth/mentor/survey.my">설문
						조사</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mvc/auth/mentor/matching.my">매칭
						정보</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mvc/auth/mentor/mentoring.my"
					class="active">멘토링</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mvc/auth/mentor/app/delete.my">회원
						탈퇴</a></li>
			</ul>
		</aside>

		<main>
			<div class="userManageTitle">
				<img
					src="${pageContext.request.contextPath}/assets/img/user/userProfile/userIcon.png"
					alt="아이콘">
				<div class="title">멘토링 정보 수정</div>
			</div>

			<div id="contentsMain">
				<div id="mentoringBackground">
					<%-- [수정] action 경로 확인: .mo인지 .my인지 확인 필요 (일단 기존 흐름대로 유지) --%>
					<form
						action="${pageContext.request.contextPath}/mvc/auth/mentor/mentoring.my?type=modifyOk"
						method="post" enctype="multipart/form-data">
						<input type="hidden" name="mentoringNumber"
							value="${mentoring.mentoringNumber}">

						<%-- [수정] DTO 필드명에 맞춰 internalId 사용 --%>
						<input type="hidden" name="mentoringNumber"
							value="${mentoring.mentoringNumber}">

						<div id="mentoringMain">
							<div id="mentoring">
								<div id="mentoringTopics">
									<div class="subject">
										<label>학습 과목</label> <select name="mentoringSubject"
											id="mentoringSubject" required>
											<option value="">과목을 선택하세요</option>
											<option value="1"
												${mentoring.subjectNumber == 1 ? 'selected' : ''}>자바</option>
											<option value="2"
												${mentoring.subjectNumber == 2 ? 'selected' : ''}>파이썬</option>
											<option value="3"
												${mentoring.subjectNumber == 3 ? 'selected' : ''}>국어</option>
											<option value="4"
												${mentoring.subjectNumber == 4 ? 'selected' : ''}>수학</option>
											<option value="5"
												${mentoring.subjectNumber == 5 ? 'selected' : ''}>C++</option>
											<option value="6"
												${mentoring.subjectNumber == 6 ? 'selected' : ''}>C언어</option>
											<option value="7"
												${mentoring.subjectNumber == 7 ? 'selected' : ''}>영어</option>
											<option value="8"
												${mentoring.subjectNumber == 8 ? 'selected' : ''}>게임</option>
										</select>
									</div>
									<div class="title">
										<label>멘토링 제목</label> <input type="text" name="mentoringTitle"
											value="${mentoring.mentoringTitle}" required>
									</div>
									<div id="purpose">
										<label>수정할 목적</label>
										<%-- [수정] mentoringPurpose -> mentoringGoal --%>
										<textarea name="mentoringPurpose" required>${mentoring.mentoringGoal}</textarea>
									</div>
								</div>

								<div id="curriculum">
									<div id="text">
										<div>
											<label for="mentoringCurriculum">멘토링 커리큘럼 상세</label>
										</div>
										<%-- [수정] curriculum -> mentoringDetail --%>
										<textarea id="mentoringCurriculum" name="mentoringCurriculum"
											required>${mentoring.mentoringDetail}</textarea>
									</div>
									<div id="file">
									    <div id="curriculumFileTitle">프로필 사진 수정</div>
									    <div class="profile-upload-container">
									        <div id="profilePreviewBox" onclick="document.getElementById('curriculumFile').click();" style="cursor: pointer; width: 150px; height: 150px; border: 2px dashed #ccc; display: flex; align-items: center; justify-content: center; overflow: hidden; background-color: #f9f9f9; border-radius: 8px;">
									            <c:choose>
									                <%-- 기존에 업로드된 이미지가 존재하면 서버에서 가져와 띄움 --%>
									                <c:when test="${not empty mentoring.fileOriginalName}">
									                    <img id="profilePreview" src="${pageContext.request.contextPath}/upload/mentoring/${mentoring.fileOriginalName}" alt="프로필 미리보기" style="width: 100%; height: 100%; object-fit: cover;">
									                </c:when>
									                <%-- 등록된 이미지가 없으면 기본 아이콘 표시 --%>
									                <c:otherwise>
									                    <img id="profilePreview" src="${pageContext.request.contextPath}/assets/img/user/userProfile/userIcon.png" alt="프로필 미리보기" style="width: 100%; height: 100%; object-fit: cover;">
									                </c:otherwise>
									            </c:choose>
									        </div>
									        <input type="file" id="curriculumFile" name="mentoringFile" accept="image/*" style="display: none;" onchange="previewImage(this);">
									        <p class="file-notice" style="margin-top: 8px; font-size: 12px; color: #888;">* 이미지를 클릭하면 새로운 사진으로 교체됩니다.</p>
									    </div>
									</div>
								</div>
							</div>

						</div>

						<div id="buttons">
							<button type="submit">수정 완료</button>
							<button type="button" onclick="history.back()">취소</button>
						</div>
					</form>
				</div>
			</div>
		</main>
	</div>
</body>
</html>