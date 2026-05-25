<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>멘토 매칭 취소 요청</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user/mentor/myPage/userMatching/nonMatching.css">
</head>
<body>
    
    <jsp:include page="/app/user/header.jsp" />

    <div class="mainContainer">
        <aside>
            <div class="myPageTitle">마이페이지</div>
            <ul>
                <li><a href="${pageContext.request.contextPath}/mvc/auth/mentor/myPage.my">계정관리</a></li>
				<li><a href="${pageContext.request.contextPath}/mvc/auth/mentor/survey.my">설문조사</a></li>
				<li><a href="${pageContext.request.contextPath}/mvc/auth/mentor/matching.my" class="active">매칭 정보</a></li>
				<li><a href="${pageContext.request.contextPath}/mvc/auth/mentor/mentoring.my">멘토링</a></li>
				<li><a href="${pageContext.request.contextPath}/mvc/auth/mentor/delete.my">회원탈퇴</a></li>
            </ul>
        </aside>

        <main>

            <div class="userManageTitle">
                <img src="${pageContext.request.contextPath}/assets/img/user/userProfile/pay.png" alt="프로필 아이콘">
                <div class="title">결제 정보</div>
            </div>

            <div class="nonPayLog">
                취소 신청 처리 중 입니다. 
            </div>

        </main>

    </div>
</body>
</html>