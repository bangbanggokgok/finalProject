<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>코스 구분 페이지</title>
   <link rel="stylesheet" href="${contextPath}/resources/css/moveline/ml-sort-style.css">

   <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="${contextPath}/resources/css/common/nav.css" />
    <script src="${contextPath}/resources/js/moveline/movelineSort.js"></script>

    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>

        <section>
            <div id="contents">
                <div id="location-area">
                    <h1 class="location-sort">지역별</h1>
                    <ul id="locations">
                    	<c:if test="${!empty LocationList}">
	                    	<c:forEach var="location" items="${LocationList}">
		                        <li class="location-div">
		                        	<a href="list/location/${location.locationNum}">${location.locationName}</a>
		                        </li>
	                    	</c:forEach>
                    	</c:if>
                        <li class="location-div">전체</li>
                    </ul>
                </div> 
        
                <div id="course-area">
                    <h1>테마별</h1>
                    <div id="courses">
                        <ul class="c-list">
                            <li>가족</li>
                            <li>아이</li>
                            <li>데이트</li>
                            <li>도보</li>
                            <li>힐링</li>
                            <li>맛집</li>
                            <li>캠핑</li>
                        </ul>
                    </div>
                </div>

                <div id="hashTag-area">
                    <h1>해시태그별</h1>
                    <div id="tags">
                        <ul id="tlist" class="t-list">
                            <%-- <li>
                                <a href="list/hashtag?hashTagName=${hashtag.MLHashTag}">해시태그1</a>
                            </li> --%>

                            <c:if test="${!empty preHashTagList}">
                                <c:forEach var="hashtag" items="${preHashTagList}">
                                    <li>
                                        <a href="list/hashtag?hashTagName=${hashtag.mlHashName}">#${hashtag.mlHashName}</a>
                                    </li>
                                </c:forEach>
                            </c:if>

                        </ul>
                    </div>
                </div>

                <div class="sample-area">

                    <c:if test="${!empty preMoveLineList}">
                        <c:forEach var="moveline" items="${preMoveLineList}">
                            <div class="samples">
                                <div class="s-pic">
                                    <a href="">
                                        <strong>${moveline.movelineTitle}</strong>
                                        <ul>
                                            <li>지역 : ${moveline.locationName}</li>
                                            <li>총거리 : ${moveline.landMarkX}</li>
                                        </ul>
                                    </a>
                                    <img src="${moveline.thumbnail}" alt="">
                                </div>
                                <ul class="s-list">
                                    <li><span><a href="">${moveline.landMarkName}</a></span></li>
                                </ul>
                            </div>
                        </c:forEach>
                    </c:if>

                    
                </div>
            </div>
        </section>

        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    </main>




    <script src="${contextPath}/resources/js/common/nav.js"></script>

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script src="${contextPath}/resources/js/moveline/movelineSort.js"></script>
</body>
</html>