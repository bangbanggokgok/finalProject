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

    <link rel="stylesheet" href="${contextPath}/resources/css/admin_/user-list.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>

    <div class="board">
        <h1>회원관리</h1>
        <div class="list">
            <span class="category"><a id="all" href="${contextPath}/admin/user/list">전체</a></span>
            <div class="category register type" value="register">활동회원</div>
            <div class="category secession type" value="secession">탈퇴회원</div>
        </div>

        <div>
            <div class="titleWrapper">
                <div class="userNo">No.</div>
                <div class="title">닉네임</div>
                <div class="title">아이디</div>
                <div class="title">가입날짜</div>
                <div class="title">탈퇴날짜</div>
            </div>
        </div>
        <ul id="userPage">

            <c:forEach var="user" items="${userList}">
                <li>
                    <div class="contentWrapper">
                        <span class="userNo">${user.userNo}</span>
                        <span class="title">${user.userName}</span>
                        <span class="title">${user.userEmail}</span>
                        <span class="title">${user.registDate}</span>

                        <c:if test="${empty user.secessionDate}">
                        <span class="title">-</span>
                        </c:if>
                        <c:if test="${!empty user.secessionDate}">
                        <span class="title">${user.secessionDate}</span>
                        </c:if>
                    </div>
                </li>
            </c:forEach>
        </ul>

        <div class="pagination-area">

                <c:set var="url" value="${list}?cp="/>
                <ul class="pagination">
                    <li><a href="${url}1"><i class="fal fa-angle-double-left"></i></a></li>
                    <li><a href="${url}${pagination.prevPage}"><i class="fal fa-angle-left"></i></a></li>

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
                    
                    <li><a href="${url}${pagination.nextPage}"><i class="fal fa-angle-right"></i></a></li>
                    <li><a href="${url}${pagination.maxPage}"><i class="fal fa-angle-double-right"></i></a></li>

                </ul>
        </div>
        
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script>
        const contextPath = "${contextPath}";
    </script>
</body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/admin_/user-list.js"></script>
    <script src="${contextPath}/resources/js/common/nav.js"></script>
</html>