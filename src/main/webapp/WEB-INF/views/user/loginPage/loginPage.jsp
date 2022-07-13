<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>로그인페이지</title>
   <link rel="stylesheet" href="${contextPath}/resources/css/loginPage/login-page-css.css">
</head>
<body>
    <div class="header">
        <a href="${contextPath}"><img src="${contextPath}/resources/images/loginPage/KakaoTalk_20220706_164429231.png" alt="logo"></a>
    </div>
    <div class="wrapper">
        <div class="main-container">
            <div class="controller">
                <div class="selected-div" onclick="handler(0)"><span>로그인</span></div>
                <div onclick="handler(1)"><span>이메일 찾기</span></div>
                <div onclick="handler(2)"><span>비밀번호 재설정</span></div>
            </div>
            <!-- 클릭 시 js로 토글 이벤트 추가 할 예정 -->
            <div class="content">
                <form action="login" method="POST" onsubmit="return login()">
                    <div class="input-row">
                        <div class="img-container">
                            <img src="${contextPath}/resources/images/loginPage/letter-removebg-preview.png" alt="">
                        </div>
                        <input type="email" name="email" placeholder="이메일" autocomplete="off">
                    </div>
                    <div class="input-row">
                        <div class="img-container">
                            <img src="${contextPath}/resources/images/loginPage/pwIcon.png" alt="">
                        </div>
                        <input type="password" name="password" placeholder="비밀번호" autocomplete="off">
                    </div>
                    <button class="submit-button">로그인</button>
                    <div class="account-sign-up"><span><a href="${contextPath}/addAccount/sign-up">회원가입</a></span></div>
                </form>

                <form class="hidden-object">
                    <div class="input-row">
                        <div class="img-container">
                            <img src="${contextPath}/resources/images/loginPage/telIcon.png" alt="폰이미지">
                        </div>
                        <input type="tel" name="userTel" placeholder="전화번호(-제외)" autocomplete="off">
                    </div>
                    <div class="input-row">
                        <div class="img-container">
                            <img src="${contextPath}/resources/images/loginPage/idIcon.png" alt="">
                        </div>
                        <input type="text" name="userName" placeholder="성함" autocomplete="off">
                    </div>
                    <button type="button" class="submit-button" onclick="return findEmail()">계정 찾기</button>
                    <div class="account-sign-up"><span><a href="#"></a></span></div>
                </form>

                <form action="reset-password" method="post" class="hidden-object" onsubmit="return resetPassword()">
                    <div class="input-row">
                        <div class="img-container">
                            <img src="${contextPath}/resources/images/loginPage/letter-removebg-preview.png" alt="">
                        </div>
                        <input type="email" name="RPEmail" placeholder="이메일" autocomplete="off">
                    </div>
                    <div class="input-row">
                        <div class="img-container">
                            <img src="${contextPath}/resources/images/loginPage/idIcon.png" alt="">
                        </div>
                        <input type="text" name="RPUserName" placeholder="성함" autocomplete="off">
                    </div>
                    <button class="submit-button">비밀번호 재설정</button>
                    <div class="account-sign-up"><span><a href="#"></a></span></div>
                </form>
            </div>
        </div>
    </div>
    <div class="all">
        <div class="modal all-modal-opacity unstaged">
            <div class="mod-top all-modal-opacity unstaged">
                <div class="name-data all-modal-opacity unstaged"> </div>
            </div>
            <button class="close all-modal-opacity unstaged"><img src="${contextPath}/resources/images/loginPage/800px-Letter_x_negative.png" class="all-modal-opacity" alt=""></button>
            <div class="mod-bot all-modal-opacity unstaged">
                <div class="email-data all-modal-opacity unstaged"> </div>
            </div>
        </div>
    </div>
    <c:if test="${!empty sessionScope.message }">
      <script>
        alert("${message}");
      </script>
      <c:remove var="message" scope="session" />
    </c:if>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/loginPage/login-page.js"></script>
</body>
</html>