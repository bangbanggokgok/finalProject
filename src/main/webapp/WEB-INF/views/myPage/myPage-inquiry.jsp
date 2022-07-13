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
                <h1 class="board-name">1:1 문의</h1>
                
                <div class="btn-area">
                    <button id="insert-btn">문의하기</button>
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

                            <tr>
                                <th colspan="4">작성한 글이 없습니다.</th>
                            </tr>

                            <tr>
                                <td>1</td>
                                <td>
                                    <a href="#">문의합니다.</a>
                                </td>
                                <td>2022.07.06</td>
                                <td>미답변</td>
                            </tr>
                            
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