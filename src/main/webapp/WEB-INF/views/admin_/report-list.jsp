<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<c:set var="reportList" value="${map.reportList}" />
<c:set var="pagination" value="${map.pagination}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고관리</title>

    <link rel="stylesheet" href="../../resources/css/admin_/report-list.css">
    <link rel="stylesheet" href="../../resources/css/admin_/adminNav.css">
</head>

<body>

    <section class="navWrapper">
        <div class="adminNav">
            <ul class="listWrapper">
                <div class="adminList">Admin</div>
                <li id="adminList">
                    <i class="fal fa-clipboard-list-check"></i> 공지사항
                    <div>
                        <a href="">공지/이벤트 조회</a><br>
                        <a href="">공지/이벤트 작성</a>
                    </div>
                </li>
                <li id="adminList">
                    <a href=""><i class="fal fa-user-friends"></i> 회원관리</a>
                </li>
                <li id="adminList">
                    <a href=""><i class="fal fa-map-marker-question"></i> 1:1 문의조회</a>
                </li>
                <li id="adminList">
                    <a href=""><i class="fal fa-siren-on"></i> 신고관리</a>
                </li>
            </ul>

        </div>

    </section>
    <div class="board">
        <h1>신고관리</h1>
        
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
                                <div class="situation">처리대기</div>
                            </c:when>

                            <c:otherwise>
                               <div class="situation">처리완료</div>       
                            </c:otherwise>
                        </c:choose>
                    </div>
                </li>

                        <%-- <c:if test="${empty user.secessionDate}">
                        <div class="noticeTitle">-</div>
                        </c:if>
                        <c:if test="${!empty user.secessionDate}">
                        <div class="noticeTitle">${user.secessionDate}</div>
                        </c:if> --%>
            </c:forEach>
            
        </ul>
    </div>
    </div>
</body>

</html>