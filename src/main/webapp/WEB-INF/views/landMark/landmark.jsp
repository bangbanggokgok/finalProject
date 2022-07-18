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
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/landmark/landmark.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/landmark/style.css" />
    <script src="${contextPath}/resources/js/landmark/landmark.js"></script>

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
          <li class="slide">
            <img
              class="slide-img"
              src="https://images.unsplash.com/photo-1656989177177-73c8c218cbe6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0M3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60"
              alt="first_img"
            />
          </li>
          <li class="slide">
            <img
              class="slide-img"
              src="${contextPath}/resources/images/randmark/4.jpg"
              alt="first_img"
            />
          </li>
          <li class="slide">
            <img
              class="slide-img"
              src="${contextPath}/resources/images/randmark/5.jpg"
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
          <h2 id="zoneTitle">대전</h2>
        </div>
        <div class="region-1">
		<c:if test="${!empty LocationList}">
			<c:forEach var="locations" items="${LocationList}">
				 <span class="region-detail" onclick="functionName(${locations.locationNum})">${locations.locationName}</span>
			</c:forEach>
		</c:if>
		<c:if test="${empty LocationList}">
			비어있음
		</c:if>
<%--           <span class="region-detail">서울</span>
          <span class="region-detail">부산</span>
          <span class="region-detail">대구</span>
          <span class="region-detail">인천</span>
          <span class="region-detail">광주</span>
          <span class="region-detail">대전</span>
          <span class="region-detail">울산</span>
          <span class="region-detail">세종</span>
          <span class="region-detail">경기</span>
          <span class="region-detail">강원</span>
          <span class="region-detail">충북</span>
          <span class="region-detail">충남</span>
          <span class="region-detail">전북</span>
          <span class="region-detail">전남</span>
          <span class="region-detail">경북</span>
          <span class="region-detail">경남</span>
          <span class="region-detail">제주</span> --%>
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
        <ol class="image-list grid-view">
          <li>
            <figure>
              <img
                src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/unsplash_nature1.jpg"
                alt=""
              />
              <figcaption>
                <p>DMZ 평화관광</p>
                <p>분단의 상처에서 평화와 희망의 장소로 함꼐하는 여행</p>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure>
              <img
                src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/unsplash_nature2.jpg"
                alt=""
              />
              <figcaption>
                <p>전통한옥</p>
                <p>
                  한국 고유의 전통문화를 체험할 수 있는 한옥 숙박시설을
                  소개합니다.
                </p>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure>
              <img
                src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/unsplash_nature3.jpg"
                alt=""
              />
              <figcaption>
                <p>두루누비</p>
                <p>대한민국의 걷기 여행길, 자전거 여행길을 소개합니다.</p>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure>
              <img
                src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/unsplash_nature4.jpg"
                alt=""
              />
              <figcaption>
                <p>지역명사문화여행</p>
                <p>남다른 체험 콘텐츠를 가진 15인의 대표 명사와 함꼐하세요!</p>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure>
              <img
                src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/unsplash_nature5.jpg"
                alt=""
              />
              <figcaption>
                <p>생태녹색관광</p>
                <p>아름다운 자연과 즐거운 체험이 있는 생태여행</p>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure>
              <img
                src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/unsplash_nature6.jpg"
                alt=""
              />
              <figcaption>
                <p>문화관광축제</p>
                <p>
                  365일 축제 중!<br />
                  함께 떠나는 축제 여행
                </p>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure>
              <img
                src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/unsplash_nature7.jpg"
                alt=""
              />
              <figcaption>
                <p>한국관광의별</p>
                <p>한 해 동안 가장 빛난 별을 찾아 소개합니다.</p>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure>
              <img
                src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/unsplash_nature8.jpg"
                alt=""
              />
              <figcaption>
                <p>고캠핑</p>
                <p>
                  대한민국 곳곳의 등록 '캠핑장' 정보 모두 확인하고 안전하게
                  즐기세요!
                </p>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure>
              <img
                src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/unsplash_nature9.jpg"
                alt=""
              />
              <figcaption>
                <p>대한민국 테마여행10선</p>
                <p>당신의 여행에 10개의 테마를 선사합니다.</p>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure>
              <img
                src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/unsplash_nature10.jpg"
                alt=""
              />
              <figcaption>
                <p>산업관광</p>
                <p>
                  전공 산업부터 예술/문화/첨단 산업까지!<br />
                  체험 산업관광지
                </p>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure>
              <img
                src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/unsplash_nature11.jpg"
                alt=""
              />
              <figcaption>
                <p>휴가문화개선</p>
                <p>휴가가 있는 일상을 만들어가는 캠페인</p>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure>
              <img
                src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/unsplash_nature12.jpg"
                alt=""
              />
              <figcaption>
                <p>비대면 안심관광지</p>
                <p>
                  생활 속 거리두기가 가능해 안심하고 여행할 수 있는 힐링여행지!
                </p>
              </figcaption>
            </figure>
          </li>
        </ol>
      </div>
    </section>
    <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"
    ></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/common/nav.js"></script>
    <script src="${contextPath}/resources/js/landmark/main.js"></script>
  </body>
</html>
