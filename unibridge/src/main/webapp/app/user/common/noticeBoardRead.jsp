<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지사항 확인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user/header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user/common/noticeBoardDetail.css" />
  </head>
  <body>
    <div class="container">
      <div class="view-wrap">
        <div class="view-title">
          <h1>
          	<c:out value="${noticeBoard.noticeBoardTitle}" />
          </h1>
        </div>
        <div class="view-info">
          <div class="info-title">
            <div class="title-wrap">
              <span class="writer">작성자</span>
              <!-- 임시 작성자 -->
              <div class="content-writer">
              	<c:out value="${noticeBoard.memberId}" />
              </div>
            </div>
            <div class="title-wrap">
              <span class="date">작성일</span>
              <!-- 임시 작성일 -->
              <div class="content-date">
              	<c:out value="${noticeBoard.noticeBoardDate}" />
              </div>
            </div>
            <div class="title-wrap">
              <span class="hit">조회수</span>
              <!-- 임시 조회수 -->
              <div class="content-hit">
              	<c:out value="${noticeBoard.noticeBoardReadCount}" />
              </div>
            </div>
          </div>
          <!-- <div class="info-content">
            <span class="content-writer">작성자</span>
            <span class="content-date">작성일</span>
            <span class="content-hit">조회수</span>
          </div> -->
        </div>
        <!-- 임시 내용 -->
        <div class="view-content">
        	<c:out value="${noticeBoard.noticeBoardContent}" />
        </div>
        <!-- 임시 첨부 파일 -->
        <div class="view-attach">
        	<c:forEach var="file" items="${noticeBoard.files}" >
        		<div class="img-box">
        			<img src="${pageContext.request.contextPath}/upload/${file.fileSystemName}" />
        			
        	<%-- 		<!-- 다운로드 버튼 -->
        			<!--  다운로드 받기 위해서는 시스템 이름이 필요하고 사용자에게 파일을 줄 때는 오리지널 네임으로 줘야한다 -->
        			<a href="${pageContext.request.contextPath}/file/download.file?fileSystemName="${file.fileOriginalName}">
        				<div class="download-btn">
        					<svg viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" clip-rule="evenodd"
									d="M6.44325 7.02619L3.36676 4.05286C3.13236 3.93626 2.83937 3.96541 2.63427 4.05286C2.42917 4.28606 2.42917 4.60672 2.63427 4.81077L6.61905 8.6586C6.82415 8.86265 7.14644 8.86265 7.35154 8.6586L11.3656 4.78162C11.5707 4.57757 11.5707 4.25691 11.3656 4.05286C11.1605 3.84881 10.8089 3.84881 10.6038 4.05286L7.49804 7.02619L7.49804 1.1084C7.49804 0.816895 7.26364 0.583984 6.97064 0.583984C6.67765 0.583984 6.44325 0.816895 6.44325 1.1084L6.44325 7.02619ZM1.63829 9.91137C1.63829 9.61987 1.40389 9.38638 1.11089 9.38638C0.817895 9.38638 0.583496 9.64873 0.583496 9.94023V12.8923C0.583496 13.1838 0.817895 13.4167 1.11089 13.4167H12.8894C13.1824 13.4167 13.4168 13.1838 13.4168 12.8923V9.94023C13.4168 9.64873 13.1824 9.41582 12.8894 9.41582C12.5964 9.41582 12.362 9.64873 12.362 9.94023V12.3381H1.63829V9.91137Z"></path>
							</svg>
        				</div>
        			
        			</a> --%>
        			
        		</div>
        	</c:forEach>
        </div>
        <div class="btn-group">
            <!-- 각 버튼 처리 경로 js로 수정하기 -->
            <button type="button" class="list-btn" data-noticeBoard-number="${noticeBoard.noticeBoardNumber}" data-member-number="${sessionScope.memberNumber}">목록</button>
            <!-- 수정/삭제 버튼(로그인한 사용자가 작성자인 경우에만 표시) -->
            <c:if test="${sessionScope.memberNumber == noticeBoard.memberNumber}">
                <button type="button" class="modify-btn">수정</button>
          		<button type="button" class="delete-btn">삭제</button>
            </c:if>
        </div>
        
        <!--  댓글 -->
      </div>
    </div>
    <script>
    	let memberNumber = "${sessionScope.memberNumber}";
    </script>
    <script src="${pageContext.request.contextPath}/assets/js/user/header.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/user/common/noticeBoardRead.js"></script>
  </body>
</html>