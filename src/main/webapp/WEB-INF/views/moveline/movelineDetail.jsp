<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%-- <c:forEach var="landmark" items="${landmarkDetail}">
    <c:if test="${landMarkNo == landmark.landmarkList}">
        <c:set var="landMarkName" value="${landmark.landMarkName}" />
        <c:set var="landMarkContent" value="${landmark.landMarkContent}" />
        <c:set var="landMarkAddress" value="${landmark.landMarkAddress}" />
        <c:set var="landmarkIndex" value="${landmark.landmarkIndex}" />
    </c:if>
</c:forEach> --%>

<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>코스 디테일</title>

    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700" rel="stylesheet" />

    <link rel="stylesheet" href="${contextPath}/resources/css/moveline/ml-detail-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/moveline/reply-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/landmark/landmark.css" />

</head>
<body>
    <main>
        
        <jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>

        <div id="contents">
            <form action="">
                <div id="top1">
                    <div id="top-top">
                        <div class="profileImage">
                            <span class="icon-writer">
                                <img src="${contextPath}/resources/images/user.png" alt="">
                            </span>
                        </div>
                        <span>${movelineDetail.userName}</span>
                    </div>
                    
                    <div id="top-middle">
                        <h1>${movelineDetail.movelineTitle}</h1>
                    </div>

                    <div id="top-bottom">
                        <div>
                            <%-- <span>
                                <span>조회수</span>
                                <span>213</span>
                            </span> --%>
                            <button type="button" class="btn-bookmark"
													onclick="setBookmark(${moveline.movelineNo});">
                                <span class="icon-bookmark">즐겨찾기</span>
                            </button>
                        </div>
                        <c:choose>
                            <c:when test="${!empty loginUser}"> 
                                <div class="btn-area">
                                    <button>수정하기</button>
                                    <button>삭제하기</button>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="btn-area">
                                    <button type="button" id="goToList"><a href="${contextPath}/moveline-main/goToList">목록으로</a></button>
                                    
                                </div>
                            </c:otherwise>
						</c:choose>
                    </div>

                </div>
                
                <div id="moveline-area">

                    <div id="schedule-info">
                        <ul class="schedule">

                            <li class="location-detail">
                                <span>
                                    <img src="${contextPath}/resources/images/movelineDetail/location.png" alt="">
                                </span>
                                <span>
                                    <div class="loca1">지역</div>
                                    <div class="loca2">${movelineDetail.locationName}</div>
                                </span>
                            </li>


                            <li class="theme-detail">
                                <span>
                                    <img src="${contextPath}/resources/images/movelineDetail/theme.png" alt="">
                                </span>
                                <span>
                                    <div class="theme1">테마</div>
                                    <div class="theme2">
                                       <a>${movelineDetail.movelineTheme}</a>
                                    </div>
                                </span>
                            </li>
                        
                            <li class="distance">
                                <span>코스 총 거리</span>
                                <span>87km</span>
                            </li>
                            <div id="moveline-hashtags">
                                <ul>
                                    <c:forEach var="movelineHashtag" items="${movelineHashtag}">
                                            <c:set var="MLHashTag" value="${movelineHashtag.MLHashTag}"/>
                                                <li>#${MLHashTag}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </ul>
                    </div>


                    <div id="moveline-content">
                        ${movelineDetail.movelineContent}
                    </div>
                    <jsp:include page="/WEB-INF/views/moveline/movelineImages.jsp"></jsp:include>
                    
                    <div id="moveline-map-area">
                        <div id="map"></div>
                    </div>


                </div>


                    <div class="landmark-detail">
                        <ul>
                         <c:forEach var="landmarkDetail" items="${landmarkDetail}">
                            <c:set var="landMarkName" value="${landmarkDetail.landMarkName}"/>
                                <li class="landmark">${landMarkName}</li>
                            </c:forEach>
                        </ul>
                        
                        <div class="selected-landmark">롯데타워</div>

                        <ul>
                            <li class="landmark" style="background-color: #bbd0ff; color: white;">사진보기</li>
                            <li class="landmark">상세설명</li>
                        </ul>
                    </div>

                    <div id="landmark-images">
                    <%-- <jsp:include page="/WEB-INF/views/moveline/movelineImages2.jsp"></jsp:include> --%>
                        <c:forEach var="landmarkImage" items="${landmarkImage}">
                            <c:set var="landmarkImage" value="${landmarkImage.landMarkReName}"/>
                            <img class="slide-img" src="${contextPath}/${landmarkImage}" alt="first_img">
                        </c:forEach>
                    </div>

                    <div id="landmark-explain">
                        <c:forEach var="landmarkDetail" items="${landmarkDetail}">
                            <c:set var="landMarkContent" value="${landmarkDetail.landMarkContent}"/>
                            <li class="landmark">${landMarkContent}</li>
                        </c:forEach>
                        
                    </div>
                
                <!-- 댓글 -->
                <jsp:include page="/WEB-INF/views/moveline/movelineReply.jsp"/>
            </form>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    </main>

    <script>
        const contextPath = "${contextPath}";
        const loginUserNo = "${loginUser.userNo}";
    </script>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bbde840e4c89992175cde165d98c8943"></script>

    <script>
        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 3
        };

        var map = new kakao.maps.Map(container, options);
    </script>

    <script src="${contextPath}/resources/js/landmark/landmark.js"></script>
    <script src="${contextPath}/resources/js/common/nav.js"></script>
    <script src="${contextPath}/resources/js/moveline/reply.js"></script>
    <script src="${contextPath}/resources/js/moveline/movelineSort.js"></script>
    

</body>
</html>