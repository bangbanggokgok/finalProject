<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modal</title>
        <link rel="stylesheet" href="${contextPath}/resources/css/moveline/modal.css" />
            
        
    </head>
    <body>
        <main>
            <div id="container">
                <button type="button" id="btn-modal">사진</button>
                <button type="button" class="showContent" value="${landmarkNo}" id="btn-modal2">상세설명</button>
                <div id="lorem-ipsum"></div>
            </div>
            <div id="modal" class="modal-overlay">
                <div class="modal-window">
                    <div class="title">
                        <h2>모달</h2>
                    </div>
                    <div class="close-area">X</div>
                    <div class="content">
                        <jsp:include page="/WEB-INF/views/moveline/movelineImages2.jsp"></jsp:include>
                    </div>
                </div>
        </div>
    </main>

</body>
<script src="${contextPath}/resources/js/moveline/modal-test.js"></script>
</html>

