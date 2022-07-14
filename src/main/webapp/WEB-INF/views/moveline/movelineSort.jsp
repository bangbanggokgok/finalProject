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
                    <div id="locations">
                    	<c:if test="">
	                    	<c:forEach var="locationList" items="${locationList}">
		                        <div class="location-div">
		                        	<a href="location/${locationList.locationNum}">${location.locationName}</a>
		                        </div>
	                    	</c:forEach>
                    	</c:if>
                    </div>
                </div> 
        
                <div id="course-area">
                    <h1>코스별</h1>
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
                        <ul class="t-list">
                            <li><a href="">#해쉬태그1</a></li>
                            <li><a href="">#해쉬태그2</a></li>
                            <li><a href="">#해쉬태그3</a></li>
                            <li><a href="">#해쉬태그4</a></li>
                            <li><a href="">#해쉬태그5</a></li>
                        </ul>
                    </div>
                </div>

                <div id="sample-area">
                    <div class="samples">
                        <div class="s-pic">
                            <a href="">
                                <strong>사랑하는 연인과 타워 여행 어떠세요?</strong>
                                <ul>
                                    <li>지역 : 서울</li>
                                    <li>총거리 : 86.4km</li>
                                </ul>
                            </a>
                            <img src="${contextPath}/resources/images/randmark/1.jpg" alt="">
                        </div>
                        <ul class="s-list">
                            <li><span><a href="">롯데타워</a></span></li>
                            <li><span><a href="">63빌딩</a></span></li>
                            <li><span><a href="">남산타워</a></span></li>
                            <li><span><a href="">OO타워</a></span></li>
                            <li><span><a href="">OO타워</a></span></li>
                            <li><span><a href="">OO타워</a></span></li>
                        </ul>
                    </div>

                    <div class="samples">
                        <div class="s-pic">
                            <a href="">
                                <strong>사랑하는 연인과 타워 여행 어떠세요?</strong>
                                <ul>
                                    <li>지역 : 서울</li>
                                    <li>총거리 : 86.4km</li>
                                </ul>
                            </a>
                            <img src="${contextPath}/resources/images/randmark/2.jpg" alt="">
                        </div>
                        <ul class="s-list">
                            <li><span><a href="">롯데타워</a></span></li>
                            <li><span><a href="">63빌딩</a></span></li>
                            <li><span><a href="">남산타워</a></span></li>
                            <li><span><a href="">OO타워</a></span></li>
                            <li><span><a href="">OO타워</a></span></li>
                            <li><span><a href="">OO타워</a></span></li>
                        </ul>
                    </div>

                    <div class="samples">
                        <div class="s-pic">
                            <a href="">
                                <strong>사랑하는 연인과 타워 여행 어떠세요?</strong>
                                <ul>
                                    <li>지역 : 서울</li>
                                    <li>총거리 : 86.4km</li>
                                </ul>
                            </a>
                            <img src="${contextPath}/resources/images/randmark/3.jpg" alt="">
                        </div>
                        <ul class="s-list">
                            <li><span><a href="">롯데타워</a></span></li>
                            <li><span><a href="">63빌딩</a></span></li>
                            <li><span><a href="">남산타워</a></span></li>
                            <li><span><a href="">OO타워</a></span></li>
                            <li><span><a href="">OO타워</a></span></li>
                            <li><span><a href="">OO타워</a></span></li>
                            <li><span><a href="">OO타워</a></span></li>
                            <li><span><a href="">OO타워</a></span></li>
                            <li><span><a href="">OO타워</a></span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    </main>




    <script src="${contextPath}/resources/js/common/nav.js"></script>
    <script src="${contextPath}/resources/js/moveline-sort.js"></script>
</body>
</html>