<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- <c:forEach var="landmark" items="${landmarkDetail}">
    <c:if test="${landMarkNo == landmark.landmarkList}">
        <c:set var="landMarkName" value="${landmark.landMarkName}" />
        <c:set var="landMarkContent" value="${landmark.landMarkContent}" />
        <c:set var="landMarkAddress" value="${landmark.landMarkAddress}" />
        <c:set var="landmarkIndex" value="${landmark.landmarkIndex}" />
        <c:set var="landMarkNo" value="${landmark.landMarkNo}"/>
    </c:if>
</c:forEach> --%>
<%-- <c:forEach var="i" begin="${landmarkDetail.landMarkNo}">
    <c:set var="landMarkNo" value="${landmarkDetail.landMarkNo[i]}"/>
</c:forEach> --%>


<%-- <c:forEach var="landmarkDetail" items="${landmarkDetail}">
   <c:if test="${landMarkNo == landmarkDetail.landMarkNo}">
      <c:set var="landmarkName" value="${landmarkDetail.landmarkName}" />
      <c:set var="landMarkNo" value="${landmarkDetail.landMarkNo}" />
   </c:if>
</c:forEach> --%>

<%-- <c:forEach var="landmarkDetail" items="${landmarkDetail}">
    <c:set var="landMarkNo" value="${landmarkDetail.landMarkNo}"/>
</c:forEach> --%>


<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>코스 디테일${landMarkNo}</title>

    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700" rel="stylesheet" />

    <link rel="stylesheet" href="${contextPath}/resources/css/moveline/ml-detail-style.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/moveline/reply-style.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/landmark/landmark.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/moveline/landmarkImageList.css" />

</head>
<body>
    <main>
        
        <jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>

        ${listURL}

        <div id="contents">
                <div id="top1">
                    <div id="top-top">
                        <div class="profileImage">
                            <span class="icon-writer">
                                <img src="${contextPath}${movelineDetail.profileImage}" alt="">
                            </span>
                        </div>
                        <span>${movelineDetail.userName}</span>
                    </div>
                    
                    <div id="top-middle">
                        <h1>${movelineDetail.movelineTitle} ${movelineNo}</h1>
                    </div>


                    <div id="top-bottom-area">
                        <div>
                            <button type="button" class="btn-bookmark">
                                <span class="icon-bookmark">
                                    <img class='bookmarkOff' src="${contextPath}/resources/images/movelineDetail/즐겨찾기off.png/" alt="즐겨찾기off">
                                    <img class='bookmarkOn' src="${contextPath}/resources/images/movelineDetail/즐겨찾기on.png/" alt="즐겨찾기on">
                                    <input class="bookmarkValue" type="hidden" value = "${checkBookmark}" id="${movelineNo}">
                                </span>
                             
                            </button>
                        </div>
                        <div id="top-bottom">
                        
                            <c:choose>
                                <c:when test="${loginUser.userNo == movelineDetail.userNo}">

                                    <c:if test="${!empty loginUser}"> 
                                        <div class="btn-area">
                                            <button type="button" onclick="location.href='${contextPath}/moveline-main/list/write?cp=${pagination.currentPage}'">수정하기</button>
                                            <button id="deleteBtn" type="button" value="${movelineNo}">삭제하기</button>
                                            <button type="button" id="reportMoveline" onclick="location.href='../../report/moveline/${movelineNo}'">신고하기</button>
                                        </div>
                                    </c:if>
                                </c:when>
                            </c:choose>
                            <div class="btn-area">
                            </div>
                        <button type="button" id="goToList">목록으로</button>

                        </div>
                    </div>
                </div>
                
                <div id="moveline-area">
                <c:choose>
                    <c:when test="${!empty movelineDetail.updateDate}"> 
                        <div class="date">수정일 : ${movelineDetail.updateDate}</div>
                    </c:when>
                    <c:when test="${!empty movelineDetail.createDate}"> 
                        <div class="date">작성일 : ${movelineDetail.createDate}</div>
                    </c:when>
                </c:choose>
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
                                <div></div>
                                <ul>
                                    <c:forEach var="movelineHashtag" items="${movelineHashtag}">
                                            <c:set var="MLHashTag" value="${movelineHashtag.MLHashTag}"/>
                                                <a href="../list/hashtag?hashtag=${MLHashTag}">#${MLHashTag}</a>
                                    </c:forEach>
                                </ul>
                            </div>
                        </ul>
                    </div>


                    <div id="moveline-content">
                        ${movelineDetail.movelineContent}
                        ${movelineDetail.userNo}
                        ${loginUserNo}
                    </div>
                    <jsp:include page="/WEB-INF/views/moveline/movelineImages.jsp"></jsp:include>
                    
                    <div id="moveline-map-area">
                        <div id="map"></div>
                    </div>

                </div>


                <div id="land-start">랜드마크
                    <span><img src="${contextPath}/resources/images/movelineDetail/여행일러스트.jpg" style="width:100px;"></span>
                </div>

                <div class="landmark-detail">
                    <ul>
                        <c:forEach var="landmarkDetail" items="${landmarkDetail}">
                            <c:set var="landmarkName" value="${landmarkDetail.landMarkName}"/>
                            <c:set var="landmarkNo" value="${landmarkDetail.landMarkNo}"/>
                            <c:set var="landMarkContent" value="${landmarkDetail.landMarkContent}"/>
                                <button type="button" id="btn-modal2" class="landmark showContent" value="${landmarkNo}" name="${landMarkContent}">${landmarkName}</button>
                        </c:forEach>
                    </ul>
                    
                    <ul>
                        <jsp:include page="/WEB-INF/views/moveline/modal.jsp"></jsp:include>
                    </ul>
                </div>

                

                
            
                <!-- 댓글 -->
                <jsp:include page="/WEB-INF/views/moveline/movelineReply.jsp"/>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    </main>

    <div class="modal">
      <span id="modal-close">&times;</span> <img id="modal-image"
         src="">
   </div>

    <script>
        const contextPath = "${contextPath}";
        const userNo = "${loginUser.userNo}";
        const movelineNo = "${movelineDetail.movelineNo}";
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

    

</body>
    <script src="${contextPath}/resources/js/common/nav.js"></script>
    <script src="${contextPath}/resources/js/moveline/modal-test.js"></script>
    <script src="${contextPath}/resources/js/moveline/movelineBookmark.js"></script>
    <script src="${contextPath}/resources/js/moveline/reply.js"></script>
    <script src="${contextPath}/resources/js/landmark/landmark.js"></script>
    <script src="${contextPath}/resources/js/moveline/landmarkImageList.js"></script>
    <script src="${contextPath}/resources/js/moveline/movelineDetail.js"></script>
</html>