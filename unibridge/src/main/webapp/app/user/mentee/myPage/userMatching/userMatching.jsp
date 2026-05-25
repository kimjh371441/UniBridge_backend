<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>멘티 매칭 정보</title>
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/user/mentee/myPage/userMatching/userMatching.css?v=1.1">

<script defer
	src="${pageContext.request.contextPath}/assets/js/user/mentee/myPage/userMatching/userMatching.js?v=1.1"></script>
</head>
<body>

	<jsp:include page="/app/user/header.jsp" />

	<div class="mainContainer">
		<aside>
			<div class="myPageTitle">마이페이지</div>
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/mvc/auth/mentee/myPage.my">계정
						관리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mvc/auth/mentee/survey.my">설문
						조사</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mvc/auth/mentee/log.my">결제
						정보</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mvc/auth/mentee/matching.my"
					class="active">매칭 정보</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mvc/auth/mentee/delete.my">회원
						탈퇴</a></li>
			</ul>
		</aside>

		<section class="content">
			<div class="headerRow">
				<h2>매칭 정보</h2>
			</div>

			<div class="card">
				<c:choose>
					<c:when test="${not empty matchingList}">
						<c:forEach var="matching" items="${matchingList}">
							<div class="matchingInfoBox">
								<div class="statusBadge">${matching.matchingState}</div>
								<div class="infoGrid">
									<div class="infoRow">
										<span class="label">멘토 이름</span> <span class="value">${matching.mentorName}</span>
									</div>
									<div class="infoRow">
										<span class="label">멘티 이름</span> <span class="value">${matching.menteeName}</span>
									</div>
									<div class="infoRow">
										<span class="label">멘토링 과목</span> <span class="value">${matching.subjectName}</span>
									</div>
									<div class="infoRow">
										<span class="label">결제 금액</span> <span class="value"><fmt:formatNumber
												value="${matching.payAmount}" type="number" />원</span>
									</div>
									<div class="infoRow">
										<span class="label">결제 수단</span> <span class="value">${matching.payMethod}</span>
									</div>
									<div class="infoRow">
										<span class="label">결제 일시</span> <span class="value">${matching.payDate}</span>
									</div>
									<div class="infoRow">
										<span class="label">결제 상태</span> <span class="value">${matching.payStatus}</span>
									</div>
								</div>
								<div class="btnBox">
									<button class="openModalBtn"
										onclick="openCancelModal('${matching.matchingNumber}')">매칭
										취소</button>
								</div>
							</div>

							<div id="matchingModal_${matching.matchingNumber}" class="modal"
								style="display: none;">
								<div class="modalContent">
									<div class="modalHeader">
										<h3>매칭 취소 신청</h3>
									</div>

									<div class="mentoringInfoPrint">
										<div class="contextTitle">신청 정보 확인</div>
										<div class="printRow">
											<label>멘토 이름</label>
											<div class="mentoringText">${matching.mentorName}</div>
										</div>
										<div class="printRow">
											<label>멘티 이름</label>
											<div class="mentoringText">${matching.menteeName}</div>
										</div>
										<div class="printRow">
											<label>멘토링 과목</label>
											<div class="mentoringText">${matching.subjectName}</div>
										</div>
										<div class="printRow">
											<label>시작일</label>
											<div class="mentoringText">
												<fmt:parseDate value="${matching.payDate}"
													var="parsedPayDate" pattern="yyyy-MM-dd HH:mm:ss" />
												<fmt:formatDate value="${parsedPayDate}"
													pattern="yyyy/MM/dd" />
											</div>
										</div>
									</div>

									<div class="cencelInputBox">
										<div class="contextTitle">매칭취소 사유</div>
										<textarea name="matchingCanReason" class="cencelIput"
											maxlength="1024" placeholder="취소 사유를 입력해주세요"></textarea>
									</div>

									<div class="cancelFooter">
										<button type="button" class="submitBtn"
											onclick="submitCancel('${matching.matchingNumber}')">취소
											신청</button>
										<button type="button" class="cancelBtn"
											onclick="closeCancelModal('${matching.matchingNumber}')">닫기</button>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p class="noData">현재 진행 중인 매칭 정보가 없습니다.</p>
					</c:otherwise>
				</c:choose>
			</div>
		</section>
	</div>

</body>
</html>