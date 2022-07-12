<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>방방곡곡</title>
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700"
      rel="stylesheet"
    />
    <!-- <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
      integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
      crossorigin="anonymous"
    /> -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/nav.css" />
    <script
      src="https://kit.fontawesome.com/243327ab3a.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <nav id="mainNavbar1" class="nav">
      <a href="${contextPath}" class="nav-title"
        ><img class="logo" src="${contextPath}/resources/images/logo.png" alt=""
      /></a>

      <div class="navbarWrap">
        <ul class="nav-nav">
          <li>
            <a href="#" class="nav-menu">코스</a>
          </li>
          <li>
            <a href="${contextPath}/landmark-main" class="nav-menu">랜드마크</a>
          </li>
        </ul>
      </div>
      <div>
        <ul class="nav-in">
        <c:if test="${empty loginUser}">
          <li>
            <a href="${contextPath}/user/login-page" class="login-btn nav-hover">로그인</a>
          </li>
          <li>
            <a href="${contextPath}/addAccount/sign-up" class="signUp-btn nav-hover">회원가입</a>
          </li>
        </c:if>
        <c:if test="${!empty loginUser}">
          <li>
            <a href="#" class="login-btn nav-hover">내 정보 조회</a>
          </li>
          <li>
            <a href="#" class="signUp-btn nav-hover">로그아웃</a>
          </li>
        </c:if>
        </ul>
      </div>
      <span class="cursor ham"><i class="fa-solid fa-bars"></i></span>
    </nav>

    <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"
    ></script>
    <script src="${contextPath}/resources/js/common/nav.js"></script>
  </body>
</html>
