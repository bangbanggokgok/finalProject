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
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>
    <div class="board">

        <h1>1:1 문의관리</h1>
        

        <section class="board">
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
                                <div class="situation">답변대기</div>       
                                </c:otherwise>
                            </c:choose>
                            <div class="date">${question.createDate}</div>

                        </div>
                    </li>
                    </c:forEach>
                    
                
                </ul>
                
            </section>

            <div class="pagination-area">

                <!-- 페이지네이션 a태그에 사용될 공통 주소를 저장한 변수 선언 -->
                <c:set var="url" value="${list}?cp="/>


                <ul class="pagination">
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="${url}1">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="${url}${pagination.prevPage}">&lt;</a></li>

                    <!-- 범위가 정해진 일반 for문 사용 -->
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
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="${url}${pagination.nextPage}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="${url}${pagination.maxPage}">&gt;&gt;</a></li>

                </ul>
            </div>
        </section>
    </div>




        
</body>

</html>