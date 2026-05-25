<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>멘토링 등록 - UniBridge</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/fonts.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/user/mentor/myPage/userMentoring/mentoringForm.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css">
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
				<div class="title">멘토링 관리</div>
			</div>

			<div id="contentsMain">
				<div id="mentoringBackground">
					<form
						action="${pageContext.request.contextPath}/mvc/auth/mentor/mentoring.my?type=writeOk"
						method="post" enctype="multipart/form-data">
						<div id="mentoringMain">
							<div id="mentoring">
								<div id="mentoringTopics">
									<div class="subject">
										<label>학습 과목</label> <select name="mentoringSubject"
											id="mentoringSubject">
											<option value="none">선택하세요</option>
											<option value="1">국어</option>
											<option value="2">수학</option>
											<option value="3">영어</option>
											<option value="4">자바</option>
											<option value="5">파이썬</option>
											<option value="6">C++</option>
											<option value="7">C언어</option>
											<option value="8">게임</option>
										</select>
									</div>
									<div class="title">
										<label>멘토링 주제</label> <input type="text" name="mentoringTitle"
											id="mentoringTitle" placeholder="제목을 입력하세요">
									</div>
									<div id="purpose">
										<label>멘토링 목적</label>
										<textarea name="mentoringPurpose" id="mentoringPurpose"
											placeholder="목적을 입력하세요"></textarea>
									</div>
								</div>

								<div id="curriculum">
									<div id="text">
										<div>
											<label for="mentoringCurriculum">멘토링 커리큘럼 상세</label>
										</div>
										<textarea id="mentoringCurriculum" name="mentoringCurriculum"></textarea>
									</div>
									<div id="file">
									    <div id="curriculumFileTitle">멘토 프로필 사진 등록</div>
									    <div class="profile-upload-container">
									        <!-- 클릭 시 파일 업로드가 트리거되는 이미지 박스 -->
									        <div id="profilePreviewBox" onclick="document.getElementById('curriculumFile').click();" style="cursor: pointer; width: 150px; height: 150px; border: 2px dashed #ccc; display: flex; align-items: center; justify-content: center; overflow: hidden; background-color: #f9f9f9; border-radius: 8px;">
									            <img id="profilePreview" src="${pageContext.request.contextPath}/assets/img/user/userProfile/userIcon.png" alt="프로필 미리보기" style="width: 100%; height: 100%; object-fit: cover;">
									        </div>
									        <!-- accept를 이미지 파일만 허용하도록 변경 -->
									        <input type="file" id="curriculumFile" name="mentoringFile" accept="image/*" style="display: none;" onchange="previewImage(this);">
									        <p class="file-notice" style="margin-top: 8px; font-size: 12px; color: #888;">* 이미지를 클릭하면 사진을 변경할 수 있습니다.</p>
									    </div>
									</div>
								</div>
							</div>
						</div>
						<div id="buttons">
							<button type="submit">등록</button>
							<button type="reset">취소</button>
						</div>
					</form>
				</div>
			</div>
		</main>
	</div>

	<jsp:include page="/app/user/footer.jsp" />

	<script
		src="${pageContext.request.contextPath}/assets/js/user/mentor/myPage/userMentoring/mentoringCreate.js"></script>
</body>
</html>