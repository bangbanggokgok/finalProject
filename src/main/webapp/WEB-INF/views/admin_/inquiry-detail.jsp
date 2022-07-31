<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1문의 답변</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/admin_/inquiry-detail.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/admin_/adminNav.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
</head>

<body>

     <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <section class="header">
        <section class="pageWrapper">
            <h1 style="font-size:24px" class="boardTitle">1:1 문의 답변</h1>
        </section>
    </section>

    <section class="board">

        <section class="pageWrapper" id="contentWrapper">
            <%-- <form> --%>
                
                <div class="title">
                    <span id="title">${detail.questionTitle}</span>
                    <span id="createDate">${detail.createDate}</span>
                </div>

                <div class="contentArea">
                    <div class="content">
                        ${detail.questionContent}
                    </div>
                </div>
                
                <div id="answer">
                <c:choose>
            	    <c:when test="${empty detail.questionAnswer}">
            	        <div class="replyArea">
                        	<textarea class="reply" id="replyContent" placeholder="답변을 입력해주세요."></textarea>
                        </div>

                        <section class="submitBar">
                            <div class="buttonContainer">
                                <button type="button" id="addReply" class="submitButton">등록하기</button>
                            </div>
                        </section>
                    </c:when>

                    <c:otherwise>
                        <div class="answerName">${detail.managerName}</div>    
                        <div class="answer">${detail.questionAnswer}</div>    
                    </c:otherwise>
                </c:choose>
                </div>
                
            <%-- </form> --%>
            <%-- <div class="sc-fznxKY bjxHni">
                <section class="sc-fzpmMD fpVDsP"></section>
            </div>
                
            </form> --%>
            
        </section>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
    <script>
        const contextPath = "${contextPath}";
        const questionNo = "${detail.questionNo}";
        const questionAnswer = "${detail.questionAnswer}";
        const userNo = "${loginUser.userNo}"
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/admin_/inquiry-detail.js"></script>
</html>