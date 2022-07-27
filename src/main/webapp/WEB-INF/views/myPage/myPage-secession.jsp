<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 탈퇴</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/changeInfo.css">

    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

    <script src="https://kit.fontawesome.com/4f7f0292da.js" crossorigin="anonymous"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <main>

        <section class="myPage-container">
            
            <jsp:include page="/WEB-INF/views/myPage/sideMenu.jsp"/>

            <section class="myInfo-content">
                <h1 class="page-title">회원 탈퇴</h1>

                <form action="secession" method="POST" name="myPage-form" onsubmit="return secessionValidate()">
                    <div class="myInfo-explanation">
                        <i class="fa-solid fa-bullhorn fa-xl" style="color: tomato;"></i>
                        <span> 탈퇴를 원하는 경우 현재 비밀번호를 입력 후 탈퇴하기 버튼을 클릭 해주세요.</span>
                    </div>

                    <div class="myInfo-row">
                        <label for="userPw">현재 비밀번호</label>
                        <input type="password" id="userPw" name="userPw" maxlength="20">
                    </div>
                    <span class="myInfo-message">현재 비밀번호를 입력해주세요.</span>

                    <div class="myInfo-row">
                        <button id="myInfo-btn">탈 퇴 하 기</button>
                    </div>
                    
                </form>
            </section>
        </section>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="${contextPath}/resources/js/myPage/myPage.js"></script>

</body>
</html>