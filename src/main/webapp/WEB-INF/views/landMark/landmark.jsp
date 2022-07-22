<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:if test="${!empty map.landmarkList}">
  <c:set var="landmarkList" value="${map.landmarkList}">
  </c:set>
</c:if>
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
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/landmark/landmark.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/landmark/style.css" />

    <script
      src="https://kit.fontawesome.com/243327ab3a.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
  	<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>
    <section id="slide1">
      <div class="container">
        <ul class="slider-container simple-list" id="slider">
        <%-- 인기 이미지 넣기 --%>
          <li class="slide">
            <img
              class="slide-img"
              src="${contextPath}/resources/images/landmark/landmark1.jpg"
              alt="first_img"
            />
          </li>
          <li class="slide">
            <img
              class="slide-img"
              src="${contextPath}/resources/images/landmark/landmark2.jpg"
              alt="first_img"
            />
          </li>
          <li class="slide">
            <img
              class="slide-img"
              src="${contextPath}/resources/images/landmark/landmark3.jpg"
              alt="first_img"
            />
          </li>
          <li class="slide">
            <img
              class="slide-img"
              src="${contextPath}/resources/images/landmark/landmark4.jpg"
              alt="first_img"
            />
          </li>
          <li class="slide">
            <img
              class="slide-img"
              src="${contextPath}/resources/images/landmark/landmark5.jpg"
              alt="first_img"
            />
          </li>
          <li class="slide">
            <img
              class="slide-img"
              src="${contextPath}/resources/images/landmark/landmark6.jpg"
              alt="first_img"
            />
          </li>
        </ul>
        <p class="pager">
          <!-- <span data-idx="0">1</span>
                      <span data-idx="1">2</span>
                      <span data-idx="2">3</span>
                      <span data-idx="3">4</span>
                      <span data-idx="4">5</span>
                      <span data-idx="5">6</span> -->
        </p>

        <a href="#" id="prev">
          <i class="fa-solid fa-angle-left"></i>
        </a>
        <a href="#" id="next">
          <i class="fa-solid fa-angle-right"></i>
        </a>
      </div>
    </section>

    <section class="gallery">
      <div class="container">
        <div class="tit">
          <h2 id="zoneTitle">서울</h2>
          <a class="landWrite" href="write/insert">랜드마크 작성하기</a>
        </div>
        <div class="region-1" id=region>
		<c:if test="${!empty LocationList}">
			<c:forEach var="locations" items="${LocationList}">
				 <span class="region-detail" onclick="searchingLocation(${locations.locationNum})">${locations.locationName}</span>
			</c:forEach>
		</c:if>
		<c:if test="${empty LocationList}">
			비어있음
		</c:if>
        </div>
        <div class="toolbar">
          <div class="search-wrapper">
            <div class="search">
              <i class="fa-solid fa-magnifying-glass"></i>
              <input type="search" placeholder="랜드마크 검색" />
            </div>
            <!-- <div class="counter">게시글 수: <span>12</span></div> -->
          </div>
          <ul class="view-options">
            <li class="zoom">
              <input type="range" min="180" max="380" value="280" />
            </li>
            <li class="show-grid active">
              <button>
                <i class="fa-solid fa-border-all"></i>
              </button>
            </li>
            <li class="show-list">
              <button>
                <i class="fa-solid fa-list-ul"></i>
              </button>
            </li>
          </ul>
        </div>

        <ol class="image-list grid-view" id="landMakrList">
         <c:forEach var="landmark" items="${landmarkList}">
          <li class='land-row'>
            <figure> 
            <a href="../landmark-main/detail/${landmark.locationType}/${landmark.landMarkNo}">  <img src="${contextPath}${landmark.thumbnail}"></img></a>
                <%-- 이부분은 좀 테스트 해봅시다 --%>
              <figcaption class="landMark" id="landMark">
                <p class="land-Title">${landmark.landMarkName}</p>
                <p class="land-content">${landmark.landMarkContent}</p>
              </figcaption>
            </figure>
          </li>
          </c:forEach>
        </ol>
      </div>
    </section>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script>
        const locationType = "${locations.locationNum}"
        const contextPath = "${contextPath}"
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/landmark/landmark.js"></script>
    <script src="${contextPath}/resources/js/common/nav.js"></script>
    <script src="${contextPath}/resources/js/common/scroll-top.js"></script>
    <script src="${contextPath}/resources/js/landmark/main.js"></script>
    <script src="${contextPath}/resources/js/landmark/locationType.js"></script>
  </body>
</html>
