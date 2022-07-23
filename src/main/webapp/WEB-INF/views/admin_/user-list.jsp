<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<c:set var="userList" value="${map.userList}" />
<c:set var="pagination" value="${map.pagination}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원관리</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/admin_/member_mgt.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/admin_/adminNav.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>

    <div class="board">
        <h1>회원관리</h1>
        <div class="list">
            <span class="category all">전체</span>
            <span class="category notice">활동회원</span>
            <span class="category event">탈퇴회원</span>
        </div>
        <ul class="noticePage">

            <li>
                <div class="wrapper">
                    <div class="memberNo">No.</div>
                    <div class="noticeTitle">닉네임</div>
                    <div class="noticeTitle">아이디</div>
                    <div class="noticeTitle">가입날짜</div>
                    <div class="noticeTitle">탈퇴날짜</div>
                </div>
            </li>
            <c:forEach var="user" items="${userList}">
                <li>
                    <div class="wrapper">
                        <div class="memberNo">${user.userNo}</div>
                        <div class="noticeTitle">${user.userName}</div>
                        <div class="noticeTitle">${user.userEmail}</div>
                        <div class="noticeTitle">${user.registDate}</div>

                        <c:if test="${empty user.secessionDate}">
                        <div class="noticeTitle">-</div>
                        </c:if>
                        <c:if test="${!empty user.secessionDate}">
                        <div class="noticeTitle">${user.secessionDate}</div>
                        </c:if>
                    </div>
                </li>
            </c:forEach>
        </ul>

        <div class="pagination-area">

                <c:set var="url" value="${list}?cp="/>
                <ul class="pagination">
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

</body>

</html>