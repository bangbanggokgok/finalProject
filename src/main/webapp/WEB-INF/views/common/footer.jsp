<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css" />
    <script
      src="https://kit.fontawesome.com/243327ab3a.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <footer class="foot">
      <div class="foot_in">
        <div class="foot-content">
          <div class="foot-title">
            <i class="fa-solid fa-face-laugh-wink"></i>
            방방곡곡 사진들을 SNS에 업로드하세요!
          </div>
          <ul class="sns-list">
            <li>
              <i class="fa-solid fa-blog"></i>
              <a
                href="https://section.blog.naver.com/BlogHome.naver?directoryNo=0&currentPage=1&groupId=0"
                >블로그</a
              >
            </li>
            <li>
              <i class="fa-brands fa-facebook"></i>
              <a href="https://www.facebook.com/" target="_blank">페이스북</a>
            </li>
            <li>
              <i class="fa-brands fa-twitter"></i>
              <a href="https://twitter.com/" target="_blank">트위터</a>
            </li>
            <li>
              <i class="fa-brands fa-instagram"></i>
              <a href="https://instagram.com/" target="_blank">인스타그램</a>
            </li>
            <li>
              <i class="fa-brands fa-youtube"></i>
              <a href="https://youtube.com/" target="_blank">유튜브</a>
            </li>
          </ul>
        </div>
        <ul class="btn_menu">
          <li>개인정보처리방침</li>
          <li>이용약관</li>
          <li>저작권정책</li>
          <li>고객서비스현장</li>
          <li>Q&A</li>
          <li></li>
        </ul>
        <ul class="ft_address"></ul>
      </div>
      <div class="footer_pcLogo">
        <div class="btn_footLogo">
          <span>
            <i class="fa-solid fa-building"></i>
            방방곡곡
          </span>
          <span>tel : 02-1100-1100</span>
          <span>address : 서울 특별시 종로구 홍지동 125번지 </span>
        </div>
        <ul class="logo_list">
          <li>
            <a href="http://api.visitkorea.or.kr/" target="_blank" title="새창"
              ><img
                src="https://cdn.visitkorea.or.kr/resources/images/common/logo_foot_api.png"
                alt="TourAPI 3.0"
              />
            </a>
          </li>
          <li>
            <a
              href="http://www.wa.or.kr/board/list.asp?BoardID=0006"
              target="_blank"
              title="새창"
              ><img
                src="https://cdn.visitkorea.or.kr/resources/images/common/logo_foot_wa.png"
                alt="과학기술정보통신부 웹 접근성 품질인증 마크"
            /></a>
          </li>
          <li>
            <a
              href="http://kto.visitkorea.or.kr/kor.kto"
              target="_blank"
              title="새창"
              ><img
                src="https://cdn.visitkorea.or.kr/resources/images/common/logo_foot_gg.png"
                alt="한국관광공사"
            /></a>
          </li>
          <li>
            <a href="http://www.mcst.go.kr/" target="_blank" title="새창"
              ><img
                src="https://cdn.visitkorea.or.kr/resources/images/common/logo_foot_mg.png"
                alt="문화체육관광부"
            /></a>
          </li>
        </ul>
      </div>
    </footer>

    <%-- session에 message 속성이 존재하는 경우 alert창으로 해당 내용을 출력
    --%>
    <c:if test="${ !empty sessionScope.message }">
      <script>
        alert("${message}");
        // EL 작성 시 scope를 지정하지 않으면
        // page -> request -> session -> application 순서로 검색하여
        // 일치하는 속성이 있으면 출력
      </script>

      <%-- message 1회 출력 후 session에서 제거 --%>
      <c:remove var="message" scope="session" />
    </c:if>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  </body>
</html>
