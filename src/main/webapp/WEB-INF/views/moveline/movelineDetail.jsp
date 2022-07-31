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


<!-- <c:forEach var="landmarkDetail" items="${landmarkDetail}">
    <c:set var="landmarkName" value="${landmarkDetail.landMarkName}" />
    <c:set var="landMarkNo" value="${landmarkDetail.landMarkNo}" />
</c:forEach>  -->

<%-- <c:forEach var="landmarkDetail" items="${landmarkDetail}">
    <c:set var="landMarkNo" value="${landmarkDetail.landMarkNo}"/>
</c:forEach> --%>


<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>코스 디테일</title>

    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700" rel="stylesheet" />

    <link rel="stylesheet" href="${contextPath}/resources/css/moveline/ml-detail-style.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/moveline/reply-style.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/landmark/landmark.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/moveline/landmarkImageList.css" />

</head>
<body>
    <main>
        
        <jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>

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
                                <button type="button" id="goToList">목록으로</button>
                            </div>

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
                                    <i class="fa-solid fa-car-side"></i>
                                    <%-- <img src="${contextPath}/resources/images/movelineDetail/location.png" alt=""> --%>
                                </span>
                                <span class=loca-wrap>
                                    <div class="loca1">지역</div>
                                    <div class="loca2">${movelineDetail.locationName}</div>
                                </span>
                            </li>


                            <li class="theme-detail">
                                <span>
                                    <%-- <img src="${contextPath}/resources/images/movelineDetail/theme.png" alt=""> --%>
                                    <i class="fa-solid fa-plane"></i>
                                </span>
                                <span class=thema-wrap>
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
                                <%-- <div></div> --%>
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
                    
                    <div id="moveline-map-area" class="landmark-list">
                        <div id="map" class="landmark-list"></div>
                    </div>

                </div>


                <div id="land-start">랜드마크
                    <%-- <span><img src="${contextPath}/resources/images/movelineDetail/여행일러스트.jpg" style="width:100px;"></span> --%>
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

                

                <div class="modal">
                    <span id="modal-close">&times;</span> <img id="modal-image"src="">
                </div>
            
                <!-- 댓글 -->
                <jsp:include page="/WEB-INF/views/moveline/movelineReply.jsp"/>
                <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
        </div>




    </main>

     
    <script>
        const contextPath = "${contextPath}";
        const userNo = "${loginUser.userNo}";
        const movelineNo = "${movelineDetail.movelineNo}";
    </script>

</body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bbde840e4c89992175cde165d98c8943&libraries=services,clusterer,drawing"></script>
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bbde840e4c89992175cde165d98c8943"></script> -->

    <script>

        $( function() {
            $( ".landmark-list" ).sortable();
            
            // alert("${landmarkDetail[0].landMarkX}")
            // alert("${landmarkDetail[0].landMarkY}")
            
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
                mapOption = { 
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };

            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
            
            // 마커를 표시할 위치와 title 객체 배열입니다 
            var positions = [
                {
                    title: '카카오', 
                    latlng: new kakao.maps.LatLng(33.450705, 126.570677)
                },
                {
                    title: '생태연못', 
                    latlng: new kakao.maps.LatLng(33.450936, 126.569477)
                },
                {
                    title: '텃밭', 
                    latlng: new kakao.maps.LatLng(33.450879, 126.569940)
                }
            ];

            // 마커 이미지의 이미지 주소입니다
            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
                
            for (var i = 0; i < positions.length; i ++) {
                
                // 마커 이미지의 이미지 크기 입니다
                var imageSize = new kakao.maps.Size(24, 35); 
                
                // 마커 이미지를 생성합니다    
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
                
                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: positions[i].latlng, // 마커를 표시할 위치
                    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                    image : markerImage // 마커 이미지 
                });
            }

            // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
            var linePath = [
                new kakao.maps.LatLng(33.450705, 126.570677),
                new kakao.maps.LatLng(33.450936, 126.569477),
                new kakao.maps.LatLng(33.450879, 126.569940) 
            ];

            // 지도에 표시할 선을 생성합니다
            var polyline = new kakao.maps.Polyline({
                path: linePath, // 선을 구성하는 좌표배열 입니다
                strokeWeight: 5, // 선의 두께 입니다
                strokeColor: '#FFAE00', // 선의 색깔입니다
                strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                strokeStyle: 'solid' // 선의 스타일입니다
            });

            // 지도에 선을 표시합니다 
            polyline.setMap(map);  
        } );
        // const contextPath = ${contextPath};
    </script>

    <script src="${contextPath}/resources/js/common/nav.js"></script>
    <script src="${contextPath}/resources/js/moveline/modal-test.js"></script>
    <script src="${contextPath}/resources/js/moveline/movelineBookmark.js"></script>
    <script src="${contextPath}/resources/js/moveline/reply.js"></script>
    <script src="${contextPath}/resources/js/landmark/landmark.js"></script>
    <script src="${contextPath}/resources/js/moveline/landmarkImageList.js"></script>
    <script src="${contextPath}/resources/js/moveline/movelineDetail.js"></script>
    <script src="${contextPath}/resources/js/moveline/detailMap.js"></script>
</html>