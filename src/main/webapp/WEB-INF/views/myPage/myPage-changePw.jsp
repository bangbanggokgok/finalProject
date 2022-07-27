<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/changeInfo.css">

    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <main>

        <section class="myPage-container">
            
            <jsp:include page="/WEB-INF/views/myPage/sideMenu.jsp"/>

            <section class="myInfo-content">
                <h1 class="page-title">비밀번호 변경</h1>

                <form action="changePw" method="POST" name="myPage-form" onsubmit="return changePwValidate()">

                    <div class="myInfo-row">
                        <label for="userPw">현재 비밀번호</label>
                        <input type="password" id="userPw" name="userPw" maxlength="20" required>
                    </div>
                    <span class="myInfo-message">현재 비밀번호를 입력해주세요.</span>
    
                    <div class="myInfo-row">
                        <label for="changePw">변경 비밀번호</label>
                        <input type="password" id="changePw" name="changePw" maxlength="20" required>
                    </div>
                    <span class="myInfo-message" id="pwMessage">영어, 숫자, 특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.</span>
    
                    <div class="myInfo-row">
                        <label for="changePwConfirm">비밀번호 확인</label>
                        <input type="password" id="changePwConfirm" name="changePwConfirm" maxlength="20" required>
                    </div>
                    <span class="myInfo-message" id="pwConfirmMessage"></span>

                    <div class="myInfo-row">
                        <button id="myInfo-btn">변 경 하 기</button>
                    </div>
                </form>
            </section>
        </section>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="${contextPath}/resources/js/myPage/myPage.js"></script>

</body>
</html>