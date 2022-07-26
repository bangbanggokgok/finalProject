<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="pagination" value="${map.pagination}" />
<c:set var="qList" value="${map.qList}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage-main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage-board.css">

    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <main>
        <div class="myPage-container">

            <jsp:include page="/WEB-INF/views/myPage/myPage-myInfo.jsp"/>

            <section class="board-list">
                <h1 class="board-name">1:1 문의</h1>
                
                <div class="btn-area">
                    <button id="insert-btn" onclick="location.href='inquiry/q_write?cp=1'">문의하기</button>
                </div>

                <div class="list-wrapper">
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성일</th>
                                <th>답변여부</th>
                            </tr>
                        </thead>
        
                        <tbody>
                            <c:choose>
                                <c:when test="${empty qList}">
                                    <tr>
                                        <th colspan="4">작성한 글이 없습니다.</th>
                                    </tr>
                                </c:when>

                                <c:otherwise>
                                    <c:forEach var="question" items="${qList}">
                                        <tr>
                                            <td>${question.rowNo}</td>
                                            <td>
                                                <a href="inquiry/detail/${question.questionNo}?cp=${pagination.currentPage}">${question.questionTitle}</a>
                                            </td>
                                            <td>${question.createDate}</td>
                                            <c:if test="${!empty question.questionAnswer}">
                                                <td style="color : #bbd0ff;">답변 완료</td>
                                            </c:if>
                                            <c:if test="${empty question.questionAnswer}">
                                                <td style="color : green;">미답변</td>
                                            </c:if>
                                        </tr>
                                        </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
        

                <div class="pagination-area">
                    <c:set var="url" value="inquiry?cp="/>

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
            </section>
        </div>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        
    <script src="${contextPath}/resources/js/myPage/myPage.js"></script>
    
</body>
</html>