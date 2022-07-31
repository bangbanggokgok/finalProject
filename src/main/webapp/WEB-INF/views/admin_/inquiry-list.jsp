<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<c:set var="pagination" value="${map.pagination}" />
<c:set var="questionList" value="${map.questionList}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의관리</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/admin_/inquiry-list.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/admin_/adminNav.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>
    <div class="board">

        <h1>1:1 문의관리</h1>
        

        <section class="board">
    
            <section class="pageWrapper" id="contentWrapper">
                <ul class="noticePage">
                    <li>
                        <div class="wrapper">
                            <div class="memberNo">No.</div>
                            <div class="title">제목</div>
                            <div class="writer">작성자</div>
                            <div class="situation">상태</div>
                            <div class="date">등록일</div>
                        </div>
                    </li>
                    
                    <c:forEach var="question" items="${questionList}">
	                    <li>
	                        <div class="wrapper">
	                            <div class="memberNo">${question.questionNo}</div>
	                            <div class="title"><a href="../qna/detail/${question.questionNo}">${question.questionTitle}</a></div>
	                            <div class="writer">${question.userName}</div>
	
	                            <c:choose>
	                                <c:when test="${!empty question.questionAnswer}">
	                                    <div class="situation">답변완료</div>
	                                </c:when>
	
	                                <c:otherwise>
	                                	<div class="situation" id="wait">답변대기</div>       
	                                </c:otherwise>
	                            </c:choose>
	                            
	                            <div class="date">${question.createDate}</div>
	                        </div>
	                    </li>
                    </c:forEach>
                </ul>
            </section>

            <div class="pagination-area">

               <c:set var="url" value="${list}?cp="/>
                <ul class="pagination" id="pagination">
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
        </section>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/common/nav.js"></script>
</body>

</html>