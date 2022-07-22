<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/noticeDetail.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/admin_/adminNav.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>

    <section class="header">
        <section class="pageWrapper">
            <c:if test="${fn:contains(detail.noticeType, 'event')}">
                    <h1 font-size="24px" class="boardTitle">이벤트</h1>
            </c:if>
            <c:if test="${fn:contains(detail.noticeType, 'notice')}">
                    <h1 font-size="24px" class="boardTitle">공지</h1>
            </c:if>

        </section>
    </section>

    <section class="board">
        <section class="pageWrapper" id="contentWrapper">
            <form>
                <div class="title">${detail.noticeTitle}</div>
                <c:set var="start" value="0"/>
                <c:if test="${fn:length(detail.imageList) > start}">
                    <div class="img-box">
                        <c:forEach var="i" begin="${start}" end="${fn:length(detail.imageList) -1 }">
                            <div class="boardImg">
                                <img src="${contextPath}${detail.imageList[i].imageReName}">
                            </div>
                        </c:forEach>
                    </div>
                </c:if> 

                <div class="contentArea">
                    <div class="content">
                        ${detail.noticeContent}
                    </div>
                </div>
                
                <c:if test="${fn:contains(loginUser.adminFlag, 'Y')}">
                <section class="submitBar">
                    <div class="buttonContainer">
                        <button type="button" disabled="" class="submitButton">수정하기</button>
                    </div>
                </section>
                </c:if>
            </form>
            <div class="sc-fznxKY bjxHni">
                <section class="sc-fzpmMD fpVDsP"></section>
            </div>
                
            </form>
            
        </section>
    </section>
</body>

</html>