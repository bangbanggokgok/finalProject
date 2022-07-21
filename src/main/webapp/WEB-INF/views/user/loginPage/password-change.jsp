<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>제목</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/nav.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css" />
    <link
      rel="stylesheet"
      href="${contextPath}/resources/css/loginPage/password-change.css"
    />
    <script
      src="https://kit.fontawesome.com/243327ab3a.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>

    <section class="id-pw-wrap">
      <div class="id-pw">
        <h3>아이디/비밀번호 찾기</h3>
      </div>
      <div class="id-pw-content">
        <h4>요청하신 메일로 비밀번호를 전송했습니다.</h4>
        <a href="${contextPath}">메인페이지로 돌아가기</a>
      </div>
    </section>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
    <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"
    ></script>
    <script src="${contextPath}/resources/js/common/nav.js"></script>
  </body>
</html>
