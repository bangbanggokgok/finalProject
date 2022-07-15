<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1문의</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage-inquiryDetail.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <section class="header">
        <section class="pageWrapper">
            <h1 font-size="24px" class="boardTitle">1:1 문의</h1>
        </section>
    </section>

    <section class="board">

        <section class="pageWrapper" id="contentWrapper">

                <div class="title">${detail.questionTitle}<br>
                    <span class="createDate">작성일 : ${detail.createDate}</span>
                </div>

                <div class="contentArea">
                    <div class="content">${detail.questionContent}</div>
                </div>
                
                <div class="replyArea">
                    <div>
                        <c:if test="${!empty detail.questionAnswer}">
                            <p>${detail.managerName}</p>
                            <p>${detail.questionAnswer}</p>
                        </c:if>

                        <c:if test="${empty detail.questionAnswer}">
                            <p>등록된 답변이 없습니다.</p>
                        </c:if>
                    </div>
                </div>
                <button type="button" id="goToList">목록으로</button>
            
        </section>
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="${contextPath}/resources/js/myPage/inquiry.js"></script>

</body>
</html>