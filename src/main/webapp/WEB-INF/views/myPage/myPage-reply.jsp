<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage-main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage-board.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">

    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <main>
        <div class="myPage-container">

            <jsp:include page="/WEB-INF/views/myPage/myPage-myInfo.jsp"/>

            <section class="board-list">
                <h1 class="board-name">내 댓글</h1>

                <div class="list-wrapper">
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>코스명</th>
                                <th>내 댓글</th>
                                <th>글 작성자</th>
                            </tr>
                        </thead>
        
                        <tbody>
							<c:if test="${empty myReplyList}">
	                            <tr>
	                                <th colspan="4">작성한 댓글이 없습니다.</th>
	                            </tr>
							</c:if>
							<c:if test="${!empty myReplyList}">
								<c:forEach var="myReply" items="${myReplyList}" >
	                            <tr>
	                                <td>1</td>
	                                <td>
	                                    <a href="#">서울 여행</a>
	                                </td>
	                                <td>좋아요~~
	                                </td>
	                                <td>유저일</td>
	                            </tr>
								</c:forEach>
							</c:if>
                        </tbody>
                    </table>
                </div>
        

                <div class="pagination-area">
                    <ul class="pagination">
                        <li><a href="#">&lt;&lt;</a></li>
                        <li><a href="#">&lt;</a></li>
                        <li><a class="current">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">6</a></li>
                        <li><a href="#">7</a></li>
                        <li><a href="#">8</a></li>
                        <li><a href="#">9</a></li>
                        <li><a href="#">10</a></li>
                        <li><a href="#">&gt;</a></li>
                        <li><a href="#">&gt;&gt;</a></li>
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