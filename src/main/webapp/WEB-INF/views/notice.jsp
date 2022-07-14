<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}" />
<c:set var="noticeList" value="${map.noticeList}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/notice.css">
</head>

<body>
    <div class="board">
        <h1>공지사항</h1>
        <div class="list">
            <span class="category all">전체</span>
            <span class="category notice">공지</span>
            <span class="category event">이벤트</span>
        </div>
        <ul class="noticePage">


            <c:choose>
                            <c:when test="${empty noticeList}">
                                <!-- 게시글 목록 조회 결과가 비어있다면 -->
                                <li>
                                    <span colspan="5">게시글이 존재하지 않습니다.</span>
                                </li>
                            </c:when>

                            <c:otherwise>
                                <!-- 게시글 목록 조회 결과가 비어있지 않다면 -->

                                <!-- 향상된 for문처럼 사용 -->
                                <c:forEach var="notice" items="${noticeList}">

                                <li>
                                    <div class="titleWrapper">
                                        <div class="noticeBadge">${notice.noticeType}</div>
                                        <div class="noticeTitle">${notice.noticeTitle}</div>
                                        <div class="noticeDate">${notice.noticeCreate}</div>
                                    </div>
                                </li>
                                </c:forEach>

                            </c:otherwise>
                        </c:choose>
            <%-- <li>
                <div class="titleWrapper">
                    <div class="noticeBadge">공지</div>
                    <div class="noticeTitle">개인정보 처리방침 변경 안내</div>
                    <div class="noticeDate">2022-07-06 14:46</div>
                </div>
            </li> --%>
            
        </ul>


        <div class="pagination-area">

                <!-- 페이지네이션 a태그에 사용될 공통 주소를 저장한 변수 선언 -->
                <c:set var="url" value="&cp="/>


                <ul class="pagination">
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="${url}1${sURL}">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="${url}${pagination.prevPage}${sURL}">&lt;</a></li>

                    <!-- 범위가 정해진 일반 for문 사용 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                        <c:choose>
                            <c:when test="${i == pagination.currentPage}">
                                <li><a class="current">${i}</a></li>
                            </c:when>

                            <c:otherwise>
                                <li><a href="${url}${i}${sURL}">${i}</a></li>        
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="${url}${pagination.nextPage}${sURL}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="${url}${pagination.maxPage}${sURL}">&gt;&gt;</a></li>

                </ul>
            </div>
    </div>
</body>

</html>