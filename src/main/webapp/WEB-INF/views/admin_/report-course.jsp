<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<c:set var="reportList" value="${map.reportList}" />
<c:set var="pagination" value="${map.pagination}" />

<%-- <fmt:parseNumber var="reportNo" type="number" value="${reportList.reportNo}"/>
<fmt:parseNumber var="reportFlag" type="string" value="${reportList.reportFlag}"/> --%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>코스 신고관리</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/admin_/report-list.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/admin_/adminNav.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>
    <div class="board">
        <h1>코스 신고관리</h1>
        <div class="list">
            <span class="category course"><a id="course" href="${contextPath}/admin/report/course/list">코스</a></span>
            <span class="category reply"><a href="${contextPath}/admin/report/reply/list"> 댓글</a></span>
        </div>
        <ul class="noticePage">
            <li>
                <div class="wrapper">
                    <div class="number">No.</div>
                    <div class="course">코스</div>
                    <div class="reason">사유</div>
                    <div class="reporter">신고한 회원</div>
                    <div class="date">신고일</div>
                    <div class="situation">상태</div>
                </div>
            </li>
            
            <c:forEach var="report" items="${reportList}">
                <li>
                    <div class="wrapper">
                        <div class="number">${report.reportNo}</div>
                        <div class="course">${report.moveLineTitle}</div>
                        <div class="reason">${report.reportReason}</div>
                        <div class="reporter">${report.userName}</div>
                        <div class="date">${report.reportDate}</div>
                        <c:choose>
                            <c:when test="${report.reportFlag == 'N'}">
                                <div  id="wait" class="situation">처리대기</div>
                            </c:when>

                            <c:otherwise>
                               <div id="complete" class="situation">처리완료</div>       
                            </c:otherwise>
                        </c:choose>
                    </div>
                   
                </li>
            </c:forEach>
            
        </ul>
    </div>
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
    
    <script>
        const contextPath = "${contextPath}";
        // const reportNo = "${reportList.reportNo}"
    </script> 
        <%--const reportNo = "${reportList.reportNo}";
        const reportNo = "${reportList.reportNo}";
        const reportFlag = "${reportList.reportFlag}";--%>
</body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/admin_/report-list.js"></script>
</html>