<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지사항 게시판</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user/header.css" />
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user/footer.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user/common/noticeBoard.css" />
  </head>
  <body>
    <div class="container">
      <div class="write-btn-wrap">
        <!-- 글쓰기 페이지 이동 처리 -->
        <a href="${pageContext.request.contextPath}/app/user/common/noticeBoardWrite.bo" class="write-btn">글쓰기</a>
      </div>

      <!-- 게시글 목록 -->
      <div class="board-list">
        <div class="board-header">
          <span class="no">번호</span>
          <span class="title">제목</span>
          <span class="author">작성자</span>
          <span class="date">날짜</span>
          <span class="hit">조회수</span>
        </div>

<!--         <div class="board-row">
          <span class="no">1</span>
          <span class="title">첫 번째 게시글입니다.</span>
          <span class="author">홍길동</span>
          <span class="date">2025-08-16</span>
          <span class="hit">10</span>
        </div> -->
        <!-- 게시글 목록 -->
         <div class="board-body">
            <c:choose>
               <c:when test="${not empty noticeBoardList}">
                  <c:forEach var="noticeBoard" items="${noticeBoardList}">
                      <div class="noticeBoard-row">
                         <div class="noticeBoard-item no">
                            <c:out value="${noticeBoard.getnoticeBoardNumber()}" />
                         </div>
                         <div class="noticeBoard-item title">
                            <a href="${pageContext.request.contextPath}/app/user/common/noticeBoardReadOk.bo?boardNumber=${noticeBoard.noticeBoardNumber}">
                               <c:out value="${noticeBoard.getnoticeBoardTitle()}" />
                            </a>
                         </div>
                         <div class="noticeBoard-item author">
                            <c:out value="${noticeBoard.getMemberId() }" />
                         </div>
                         <div class="noticeBoard-item date">
                            <c:out value="${noticeBoard.getnoticeBoardDate() }" />
                         </div>
                         <div class="noticeBoard-item hit">
                            <c:out value="${noticeBoard.getnoticeBoardReadCount() }" />
                         </div>
                      </div>
                   </c:forEach>
               </c:when>
               <c:otherwise>
                  <div>
                     <div colspan="5" align="center">등록된 게시물이 없습니다.</div>
                  </div>
               </c:otherwise>
            </c:choose>
         </div>
      </div>
      <div class="pagination">
        <ul>

          <c:if test="${prev}">
          	<li><a href="${pageContext.request.contextPath}/app/user/common/noticeBoardListOk.bo?page=${startPage - 1}" class="prev">&lt;</a></li>
          </c:if>
          <c:set var="realStartPage" value="${startPage < 0 ? 0:startPage}" />
          <c:forEach var="i" begin="${realStartPage}" end="${endPage}">
          	<c:choose>
          		<c:when test="${!(i == page)}">
          			<li><a href="${pageContext.request.contextPath}/app/user/common/noticeBoardListOk.bo?page=${i}">
          				<c:out value="${i}" />
          			</a></li>
          		</c:when>
          		<c:otherwise>
          			<li><a href="#" class="active">
          				<c:out value="${i}" />
          			</a></li>
          		</c:otherwise>
          	</c:choose>
          </c:forEach>
          <c:if test="${next}">
          	<li><a href="${pageContext.request.contextPath}/app/user/common/noticeBoardListOk.bo?page=${endPage + 1}" class="next">&gt;</a></li>
          </c:if>
        </ul>
       </div>
	</div>
	<script>
		let memberNumber = "${sessionScope.memberNumber}";
	</script>
	<script src="${pageContext.request.contextPath}/assets/js/user/header.js"></script>
  	<script src="${pageContext.request.contextPath}/assets/js/user/footer.js"></script>
  </body>
</html>