<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>scroll_menu</title>
    <script
      src="https://kit.fontawesome.com/243327ab3a.js"
      crossorigin="anonymous"
    ></script>
    <link
      rel="stylesheet"
      type="text/css"
      href="${contextPath}/resources/css/landmark/land-detail.css"
    />
    <!-- <link rel="stylesheet" type="text/css" href="../css/style1.css" /> -->
  </head>
  <body>
  	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
    <section id="contents">
      <div class="titleType1">
        <div class="area_tag">
          <div class="name1">
            <a href="#">
              <i class="fa-solid fa-ranking-star"></i>
              <span>인기</span>
            </a>
          </div>
          <div class="name1 name1-wrap">
            <div class="heart1">
              <img class="heart-img hide" src="${contextPath}/resources/images/landmark/heart.png" alt=""/>
              <img class="redHeart-img hide" src="${contextPath}/resources/images/landmark/redHeart.png" alt=""/>
              <span style="width:75px; letter-spacing:-3px">즐겨찾기</span>
              <input class="bookmarkValue" type="hidden" value = ${checkBookmark}>
            </div>
            <%-- <a class="police" href=""> --%>
            <div class="report" style="width:170px;">
              <img src="${contextPath}/resources/images/landmark/신고.png" alt="" style="width: 25px;"/>
              <span style="letter-spacing:-3px">신고하기</span>
            </div>
            <%-- </a> --%>
          </div>
        </div>
        <div class="detailCheckWrap">
          <div>
            <span class="star">
              ★★★★★
              <span class="rate">★★★★★</span>
              <input id="rate" type="range" onmouseover="mouseAction(${rankLandmark/2})" 
              onclick="submitRankPoint()" value="0" step="1" min="0" max="10"/>
            </span>
            <div style="display: flex; justify-content: space-around;">
              <div class="cursor-rate" style="width:60px;">0</div>
              <div class="rank-text"> ${rankLandmark/2} / 5 </div>
              <input type="hidden" class="add-check" value="${addPointCheck}">
            </div>
          </div>
          <div>
            <c:if test="${loginUser.userNo == landmarkDetail.userNo}">
              <div class="detail-in-wrap">
                <a class="detailCheck" href="${contextPath}/landmark-main/write/update?landmark-no=${landmarkDetail.landMarkNo}">수정</a>
                <a class="detailCheck" href="#">삭제</a>
              </div>
              <%-- 삭제남음 --%>
            </c:if>
          </div>
        </div>

        <div class="area_address">
          <h2>${landmarkDetail.landMarkName}</h2>
          <span>${landmarkDetail.locationName}</span>
        </div>
      </div>

      <section id="top_menu">
        <div class="container-1">
          <ul>
            <li class="on" data-num="0"><a href="#section1">사진 보기</a></li>
            <li data-num="1"><a href="#section2">상세 설명</a></li>
            <!-- <li data-num="2"><a href="#section3">section 3</a></li> -->
          </ul>
        </div>
      </section>
      <main id="contents-detail">
        <section id="section1" data-num="0">
          <div class="container-out">
            <div class="container">
              <ul class="slider-container simple-list" id="slider"">
                <c:if test="${!empty landmarkDetail.imageList}">
                  <c:forEach var="images" items="${landmarkDetail.imageList}">
                    <li class="slide">
                      <img class="slide-img" src="${contextPath}${images.landMarkReName}" alt="" />
                    </li>
                  </c:forEach>
                </c:if>
              </ul>

              <a href="javascript:void(0);" id="prev"
                ><i class="fa-solid fa-angle-left"></i
              ></a>
              <a href="javascript:void(0);" id="next"
                ><i class="fa-solid fa-angle-right"></i
              ></a>
            </div>
            <!-- end container -->
          </div>
          <%-- 세컨드 이미지라인 사용 가능성? --%>
          <%-- <div class="second-img">
              <c:forEach var="images" items="${landmarkDetail.imageList}">
                <img src="${contextPath}${images.landMarkReName}" />
              </c:forEach>
          </div> --%>
        </section>
        <section id="section2" class="section2" data-num="1">
          <div class="container-out">
            <div class="detail">
              <h3>상세정보</h3>
              <div class="icon-1">
                <i class="fa-solid fa-chevron-down"></i> 
                <%-- <i style="display:none;"class="fa-solid fa-angle-up"></i> --%>
                <i class="fa-solid fa-chevron-up"></i>
              </div>
            </div>
            <div class="detail-content">
              ${landmarkDetail.landMarkContent}
            </div>
            <div id="map" style="margin-top: 20px; width: 100%; height: 300px">
              지도
            </div>
            <table class="information">
              <tr>
                <%-- <td class="info">문의 및 안내</td> --%>
                <%-- <td class="info-1">061-350-4674</td> --%>
                <%-- <td class="info-2 info">주소</td> --%>
                <%-- <td class="info-1">전라남도 영광군 법성면 진내리</td> --%>
              </tr>
              <tr>
                <%-- <td class="info">휴일</td>
                <td class="info-1">연중무휴</td>
                <td class="info-2 info">주차</td>
                <td class="info-1">있음</td> --%>
              </tr>
              <tr>
                <%-- <td class="info">입 장 료</td>
                <td class="info-1">무료</td> --%>
              </tr>
            </table>
          </div>
          <div class="simg">
            <ul>
              <li class="type2">
                <a href="${contextPath}/landmark-main/write/insert" class="reg1">
                  <span>
                    <i class="fa-solid fa-camera-retro"></i>
                    여러분의 사진을 등록해 보세요.
                  </span>
                </a>
              </li>
            </ul>
          </div>
        </section>
        <!-- <section id="section3" data-num="2">
          <div class="container-out">
            <h2>section 3</h2>
            <p>테스트</p>
          </div>
        </section> -->
      </main>
    </section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <c:if test="${!empty landmarkDetail}">
      <script>
        const landmarkNo = "${landmarkDetail.landMarkNo}"
        const userNo = "${loginUser.userNo}"
        const X = "${landmarkDetail.landMarkX}"
        const Y = "${landmarkDetail.landMarkY}"
        const rate = "${rankLandmark}"
      </script>    
    </c:if>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/landmark/jquery-1.9.1.min.js" ></script>
    <script type="text/javascript" src="${contextPath}/resources/js/landmark/jquery.easing.1.3.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/common/nav.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/landmark/scroll_menu.js" ></script>
    <script type="text/javascript" src="${contextPath}/resources/js/landmark/script.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eb5f070eb82d10474481251b6a63927e"></script>
    <script src="${contextPath}/resources/js/landmark/location.js"></script>
    <script src="${contextPath}/resources/js/landmark/temp.js"></script>
  </body>
</html>
