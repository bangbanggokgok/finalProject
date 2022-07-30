<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:if test="${!empty map.landmarkList}">
  <c:set var="landmarkList" value="${map.landmarkList}">
  </c:set>
</c:if>
<c:if test="${!empty map.pagination}">
  <c:set var="pagination" value="${map.pagination}"/>
</c:if>
<c:if test="${!empty map.rankLandMarkList}">
  <c:set var="rankLandMarkList" value="${map.rankLandMarkList}">
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
      <%-- <script>
      window.onload=function(){

        const num = 1;
        let locationNum = 100;
        let ismainchecked = localStorage.getItem("ismaincheck") || 'false'
        if(ismainchecked == 'true'){
          locationNum = localStorage.getItem("locationNum");
        }
        loadLocation(locationNum, num);
      };
      window.onbeforeunload = function () {
        let link =  document.location.href;
        let cureenthref = link.slice(-3);
        if(cureenthref == '100'){
          localStorage.clear();
        }
      };
      </script> --%>
    <script src="${contextPath}/resources/js/landmark/locationType.js"></script>
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
          <%-- <li class="slide slideHtml">
        </li> --%>
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
          <h2 id="zoneTitle">
            <c:forEach var="locations" items="${locationList}">
              <c:if test="${map.hihi == locations.locationNum}">
                ${locations.locationName}
              </c:if>
            </c:forEach>
          </h2>
          <a class="landWrite" href="${contextPath}/landmark-main/write/insert">랜드마크 작성하기</a>
        </div>
        <div class="region-1" id="region">
		<c:if test="${!empty locationList}">
			<c:forEach var="locations" items="${locationList}">
				  <c:if test="${map.hihi != locations.locationNum}">
            <span class="region-detail" onclick="loadLocation(${locations.locationNum},1)">${locations.locationName}</span>
          </c:if>
				  <c:if test="${map.hihi == locations.locationNum}">
            <span class="region-detail clicked" onclick="loadLocation(${locations.locationNum},1)">${locations.locationName}</span>
          </c:if>
			</c:forEach>
		</c:if>
        </div>
        <div class="toolbar">
          <div class="search-wrapper">
            <div class="search">
              <i class="fa-solid fa-magnifying-glass"></i>
              <input class='abc' type="search" placeholder="랜드마크 검색" />
            </div>
             <%-- <div class="counter">게시글 수: <span>12</span></div>  --%>
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

        <ol class="image-list grid-view landMarkHtml" id="landMakrList">
        <c:if test="${!empty landmarkList}">
         <c:forEach var="landmark" items="${landmarkList}">
          <li class='land-row'>
            <figure> 
            <a href="../detail/${landmark.locationType}/${landmark.landMarkNo}">
              <img class=land-img src="${contextPath}${landmark.thumbnail}"/>
            </a>
              <figcaption class="landMark" id="landMark">
                <p class="land-Title">${landmark.landMarkName}</p>
                <p class="land-content">${landmark.landMarkContent}</p>
              </figcaption>
            </figure>
          </li>
          </c:forEach>
          
        </c:if>
        <c:if test="${empty landmarkList}">
          <h1 style="display:flex;justify-content: center;">아직 등록된 랜드마크가 없어요.</h1>
        </c:if>
        </ol>
        <div class="pagination-list">
          <c:if test="${!empty landmarkList}">
            <ul class="pagination">
              <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                    <li><a onclick="loadLocation(${map.hihi},${i})" style="cursor: pointer;">${i}</a></li>  
              </c:forEach>
            </ul>
          </div>
        </c:if>
      </div>
    </section>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script>
        const locationType = "${locations.locationNum}"
        const contextPath = "${contextPath}"
    </script>
    <script src="${contextPath}/resources/js/landmark/landmark.js"></script>
    <%-- <script src="${contextPath}/resources/js/common/scroll-top.js"></script> --%>
    <script src="${contextPath}/resources/js/landmark/main.js"></script>
    <script src="${contextPath}/resources/js/landmark/locationType.js"></script>
  </body>
</html>
