<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
      integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="${contextPath}/resources/css/index.css" />
    <script
      src="https://kit.fontawesome.com/243327ab3a.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <div
      id="carouselExampleCaptions"
      class="carousel slide main-content"
      data-ride="carousel"
    >
      <ol class="carousel-indicators">
        <li
          data-target="#carouselExampleCaptions"
          data-slide-to="0"
          class="active"
        ></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
            <a href="#">
                <img
                class="img-back"
                src="${contextPath}/resources/images/main/Busan.jpg"
                class="d-block w-100"/>
                <div class="carousel-caption d-none d-md-block">
                    <h5>부산 여행의 하이라이트! 반짝 반짝 빛나는 부산의 밤!</h5>
                    <p>수 백대의 드론으로 수놓는 밤, 100층 전망대 야경까지!</p>
                </div>
            </a>
          
        </div>
        <div class="carousel-item">
            <a href="#">
                <img
                class="img-back"
                src="${contextPath}/resources/images/main/Cheongwadae.jpg"
                class="d-block w-100"
                alt="..."/>
                <div class="carousel-caption d-none d-md-block">
                    <h5>74년 만에 공개된 비밀 정원, 청와대 이야기</h5>
                    <p>활짝 열린 청와대 방방곡곡 숨은 이야기를 찾는 여행</p>
                </div>
            </a>
        </div>
        <div class="carousel-item">
            <a href="#">
                <img
                src="${contextPath}/resources/images/main/Gangneung.jpg"
                class="d-block w-100"
                alt="..."/>

                <div class="carousel-caption d-none d-md-block">
                    <h5>올 여름 해수욕장 완전 정복! 내가 바라던 바다</h5>
                    <p>시원한 해수욕장 바람과 즐거운 해수욕을 즐기세요!</p>
                </div>
            </a>
          
        </div>
      </div>
      <a
        class="carousel-control-prev"
        href="#carouselExampleCaptions"
        role="button"
        data-slide="prev"
      >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      
      <a
        class="carousel-control-next"
        href="#carouselExampleCaptions"
        role="button"
        data-slide="next"
      >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    <div class="shadow-lg p-3 mb-5 bg-white rounded">
      <h3 class="border-bottom weight">오늘의 추천 여행지!</h3>
    </div>

    <div class="row">
      <div class="col-lg-3 col-md-6 flex">
        <a href="#">
            <div class="card" style="width: 18rem">
                <img
                src="${contextPath}/resources/images/main/a.jpg"
                class="card-img-top"
                alt="..."/>
                <div class="card-body">
                    <h3 class="weight">방방곡곡 다른 경치, 강릉</h3>
                    <p class="card-text">
                    무더운 여름, 시원한 초원의 바람을 맞이하세요.
                    </p>
                </div>
            </div>
        </a>
      </div>
      <div class="col-lg-3 col-md-6 flex">
        <a href ="#">
            <div class="card" style="width: 18rem">
                <img
                    src="${contextPath}/resources/images/main/정동진.jpg"
                    class="card-img-top"
                    alt="..."
                />
                <div class="card-body">
                    <h3 class="weight">분위기 맛집, 정동진</h3>
                    <p class="card-text">
                    지친 일상, 복잡한 마음을 떨쳐내고 싶다면 여기!
                    </p>
                </div>
            </div>
        </a>
      </div>
      <div class="col-lg-3 col-md-6 flex">
        <a href ="#">
            <div class="card" style="width: 18rem">
                <img
                    src="${contextPath}/resources/images/main/전주.jpg"
                    class="card-img-top img-1"
                    alt="..."
                />
                <div class="card-body">
                    <h3 class="weight">전주 한옥마을</h3>
                    <p class="card-text">한옥과 도시의 조화로움을 느껴보세요!</p>
                </div>
            </div>
        </a>
      </div>
      <div class="col-lg-3 col-md-6 flex">
        <a href ="#">
            <div class="card" style="width: 18rem">
                <img src="${contextPath}/resources/images/main/seoul.jpg" class="card-img-top" alt="..." />
                <div class="card-body">
                    <h3 class="weight">대한민국의 대표, 서울</h3>
                    <p class="card-text">구석구석 숨은 서울을 여행해 보세요!</p>
                </div>
            </div>
        </a>
      </div>
    </div>

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">
          지금 바로 자신만의 코스와 랜드마크를 소개해보세요!<br/>
        </h2>
        <span class="text-muted">방방곡곡 어디든 GO!</span>
        <a href="moveline-main/write/insert">
            <button type="button" class="btn btn-outline-dark">코스 작성하기</button>
        </a>
        <a href="landmark-main/write/insert">
            <button type="button" class="btn btn-outline-dark">랜드마크 작성하기</button>
        </a>
        <div class="row cos">
          <div class="col-sm-12 col-md-4 flex">
            <div class="card-1" style="width: 18rem">
              <img src="${contextPath}/resources/images/main/jeju.jpg" class="card-img-top img-1" alt="..."/>
              <div class="card-body">
                <h3 class="weight">Step 1.</h3>
                <p class="card-text">여행할 여행지를 정해보세요!</p>
              </div>
            </div>
          </div>
          <div class="col-sm-12 col-md-4 flex">
            <div class="card-1" style="width: 18rem">
              <img src="${contextPath}/resources/images/main/camera.jpg" class="card-img-top img-1" alt="..."/>
              <div class="card-body">
                <h3 class="weight">Step 2.</h3>
                <p class="card-text">예쁜 경치를 찍어주세요!</p>
              </div>
            </div>
          </div>
          <div class="col-sm-12 col-md-4 flex">
            <div class="card-1" style="width: 18rem">
              <img src="${contextPath}/resources/images/main/전주.jpg" class="card-img-top img-1" alt="..."/>
              <div class="card-body">
                <h3 class="weight">Step 3.</h3>
                <p class="card-text">방방곡곡에 여러분의 사진을 올려주세요!</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-5">
        <div class="embed-responsive embed-responsive-16by9">
          <iframe
            width="560"
            height="315"
            src="https://www.youtube.com/embed/xRbPAVnqtcs"
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen
          ></iframe>
        </div>
      </div>
    </div>

    <c:set var="act" value="5" />
    <div class="region">
      <c:if test="${act >= 16}">
        <div class="d-flex justify-content-center">
      </c:if>
      <c:forEach var="locations" items="${locationList}">
        <c:if test="${act % 5 == 0}">
          <div class="d-flex justify-content-around">
        </c:if>
            <a href="landmark-main/list/${locations.locationNum}">
                <div class="card bg-dark text-white">
                    <img
                    src="${contextPath}/resources/images/main/location-image/${locations.locationName}.jpg"
                    class="card-img"
                    alt="..."/>
                    <div class="card-img-overlay">
                        <h5 class="card-title">${locations.locationName}</h5>
                    </div>
                </div>
            </a>
          <div style="display:none;">${act = act+1}</div>
        <c:if test="${act % 5 == 0}">
          </div>
        </c:if>
      </c:forEach>
      <c:if test="${act >= 16}">
        </div>
      </c:if>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
      integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
      integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
      crossorigin="anonymous"
    ></script>
    <script src="${contextPath}/resources/js/common/scroll-top.js"></script>
  </body>
</html>
