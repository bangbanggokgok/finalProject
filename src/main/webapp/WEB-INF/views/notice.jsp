<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<c:set var="pagination" value="${map.pagination}" />
<c:set var="noticeList" value="${map.noticeList}" />
<c:set var="anoticeList" value="${result.allNoticeList}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/notice.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>

    <div class="board">
        <h1>공지사항</h1>
        <div class="list">
            <span class="category" id="all">전체</span>
            <span class="category" id="notide"onclick="show_noticePage()">공지</span>
            <span class="category" id="event">이벤트</span>
        </div>


        <div  id="allPage">
            <ul class="noticePage">
                <c:forEach var="notice" items="${noticeList}">
                ${result.map.allNoticeList}
                    <li>
                        <div class="titleWrapper">
                                <c:if test="${notice.noticeType == '공지'}">
                                    <div class="noticeBadge">
                                    	공지
                                    </div>
                                </c:if>
                                <c:if test="${notice.noticeType =='이벤트'}">
                                    <div class="eventBadge">
                                    	이벤트
                                    </div>
                                </c:if>
                            <div class="noticeTitle">
                            	<a href="../notice/detail/${notice.noticeNo}?cp=${pagination.currentPage}${sURL}">${notice.noticeTitle}</a>
                           	</div>
                            <div class="noticeDate">${notice.noticeCreate}
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        


        
        <div class="pagination-area">

                <!-- 페이지네이션 a태그에 사용될 공통 주소를 저장한 변수 선언 -->
                <c:set var="url" value="${list}&cp="/>


                <ul class="pagination">
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="${url}1">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="${url}${pagination.prevPage}">&lt;</a></li>

                    <!-- 범위가 정해진 일반 for문 사용 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                        <c:choose>
                            <c:when test="${i == pagination.currentPage}">
                                <li><a class="current">${i}</a></li>
                            </c:when>

                            <c:otherwise>
                                <li><a href="${url}${i}">${i}</a></li>        
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="${url}${pagination.nextPage}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="${url}${pagination.maxPage}">&gt;&gt;</a></li>

                </ul>
        </div>
    </div>

    <script>

        const contextPath = "${contextPath}";
    </script>
</body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/notice.js"></script>
</html>