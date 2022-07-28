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
        <div id="container2">
            <div id="lorem-ipsum2"></div>
        </div>
            <main>
            <div id="modal2" class="modal-overlay2">
                <div class="modal-window2">
                    <div class="title2">
                        <h2>상세</h2>
                    </div>
                    <div class="close-area2">X</div>
                    <div class="content2">
                        <jsp:include page="/WEB-INF/views/moveline/movelineImages2.jsp"></jsp:include>
                    </div>
                </div>
            </div>
        </div>
    </main>

</body>
<script src="${contextPath}/resources/js/moveline/modal-test.js"></script>
</html>
