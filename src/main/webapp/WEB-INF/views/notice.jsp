<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<c:set var="pagination" value="${map.pagination}" />
<c:set var="noticeList" value="${map.noticeList}" />
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
            <div class="category" value="all"><a id="all" href="${contextPath}/notice/list">전체</a></div>
            <div class="category" id="notice" value="notice">공지</div>
            <div class="category" id="event" value="event">이벤트</div>
        </div>

        <div  id="allPage">
            <ul class="noticePage" id="noticePage">
                <c:forEach var="notice" items="${noticeList}">
                    <li class="noticeRow">
                        <li class="titleWrapper">
                                <c:if test="${notice.noticeType == '공지'}">
                                    <span class="noticeBadge">공지</span>
                                </c:if>
                                <c:if test="${notice.noticeType =='이벤트'}">
                                    <span class="eventBadge">이벤트</span>
                                </c:if>
                            <p class="noticeTitle"><a href="../notice/detail/${notice.noticeNo}?cp=${pagination.currentPage}${sURL}">${notice.noticeTitle}</a></p>
                            <p class="noticeDate">${notice.noticeCreate}</p>
                        </li>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <div class="pagination-area">

                <c:set var="url" value="${list}?cp="/>
                <ul class="pagination" id="pagination">
                    <li><a href="${url}1">&lt;&lt;</a></li>
                    <li><a href="${url}${pagination.prevPage}">&lt;</a></li>

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
                    
                    <li><a href="${url}${pagination.nextPage}">&gt;</a></li>
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