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
          <span class="name1">
            <a href="#">
              <i class="fa-solid fa-ranking-star"></i>
              <span>인기</span>
            </a>
          </span>
        </div>
        <div class="area_address">
          <h2>숲쟁이공원</h2>
          <span>전남 영광군</span>
        </div>
        <!-- <div class="post_area">
          <button></button>
        </div> -->
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
              <ul class="slider-container simple-list" id="slider">
                <li class="slide">
                  <img
                    class="slide-img"
                    src="${contextPath}/resources/images/randmark/1.jpg"
                    alt="first_img"
                  />
                </li>
                <li class="slide">
                  <img
                    class="slide-img"
                    src="${contextPath}/resources/images/randmark/2.jpg"
                    alt="first_img"
                  />
                </li>
                <li class="slide">
                  <img
                    class="slide-img"
                    src="${contextPath}/resources/images/randmark/3.jpg"
                    alt="first_img"
                  />
                </li>
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
          <div class="second-img">
            <img src="${contextPath}/resources/images/randmark/3.jpg" alt="" />
            <img src="${contextPath}/resources/images/randmark/3.jpg" alt="" />
          </div>
        </section>
        <section id="section2" class="section2" data-num="1">
          <div class="container-out">
            <div class="detail">
              <h3>상세정보</h3>
              <div class="icon-1">
                <i class="fa-solid fa-chevron-down"></i>
                <i class="fa-solid fa-angle-up"></i>
              </div>
            </div>
            <div class="detail-content">
              조선 중종때 축조된 법성진성의 연장으로 심은 느티나무 등이 300년
              이상 성장하여 성주변으로 울창하게 이루어진 숲으로 아름다운 꽃이
              만발한 숲쟁이꽃동산을 거쳐 백제불교최초도래지와 연결된다. 국가지정
              명승 ''한국의 아름다운 숲''으로 선정되었으며, 매년 국가무형문화재
              법성포단오제가 이곳에서 열려왔다. 숲쟁이 공원을 걷다가 하늘을
              올려다보면 푸른 하늘과 느티나무 잎 사이로 들어오는 따사로운 햇살에
              눈이 부시다. 살랑살랑 불어오는 봄바람에 느티나무잎이 사각사각
              소리를 내며 이따금 노래하는 새들의 소리가 정겹다.
            </div>
            <div id="map" style="margin-top: 20px; width: 100%; height: 300px">
              지도
            </div>
            <table class="information">
              <tr>
                <td class="info">문의 및 안내</td>
                <td class="info-1">061-350-4674</td>
                <td class="info-2 info">주소</td>
                <td class="info-1">전라남도 영광군 법성면 진내리</td>
              </tr>
              <tr>
                <td class="info">휴일</td>
                <td class="info-1">연중무휴</td>
                <td class="info-2 info">주차</td>
                <td class="info-1">있음</td>
              </tr>
              <tr>
                <td class="info">입 장 료</td>
                <td class="info-1">무료</td>
              </tr>
            </table>
          </div>
          <div class="simg">
            <ul>
              <li class="type2">
                <a href="" class="reg1">
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
    <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"
    ></script>
    <script
      type="text/javascript"
      src="${contextPath}/resources/js/landmark/jquery-1.9.1.min.js"
    ></script>
    <script
      type="text/javascript"
      src="${contextPath}/resources/js/landmark/jquery.easing.1.3.min.js"
    ></script>
    <script
      type="text/javascript"
      src="${contextPath}/resources/js/common/nav.js"
    ></script>
    <script
      type="text/javascript"
      src="${contextPath}/resources/js/landmark/scroll_menu.js"
    ></script>
    <script
      type="text/javascript"
      src="${contextPath}/resources/js/landmark/script.js"
    ></script>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eb5f070eb82d10474481251b6a63927e"
    ></script>
    <script src="${contextPath}/resources/js/landmark/location.js"></script>
  </body>
</html>