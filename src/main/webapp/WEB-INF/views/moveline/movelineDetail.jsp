<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
                        <h1>${movelineDetail.movelineTitle}</h1>
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
                        
<<<<<<< HEAD
                            <c:choose>
                                <c:when test="${loginUser.userNo == movelineDetail.userNo}">

                                    <c:if test="${!empty loginUser}"> 
                                        <div class="btn-area">
                                            <button type="button" onclick="location.href='${contextPath}/moveline-main/list/write?cp=${pagination.currentPage}'">수정하기</button>
                                            <button id="deleteBtn" type="button" value="${movelineNo}">삭제하기</button>
                                        </div>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <div class="btn-area">
                                        <button type="button" id="reportMoveline" onclick="location.href='../../report/moveline/${movelineNo}'">신고하기</button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
=======
                            <c:if test="${!empty loginUser}">
                                <div class="btn-area">
                                    <c:if test="${loginUser.userNo == movelineDetail.userNo || loginUser.adminFlag == 'Y'}"> 
                                        <button type="button" onclick="location.href='${contextPath}/moveline-main/list/write?cp=${pagination.currentPage}'">수정하기</button>
                                        <button id="deleteBtn" type="button" value="${movelineNo}">삭제하기</button>
                                    </c:if>
                                        <button type="button" id="reportMoveline" onclick="location.href='../../report/moveline/${movelineNo}'">신고하기</button>
                                </div>
                            </c:if>
>>>>>>> origin/aotthf
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
                    </div>
                    <jsp:include page="/WEB-INF/views/moveline/movelineImages.jsp"></jsp:include>
                    
                    <div id="moveline-map-area" class="landmark-list">
                        <div id="map" class="landmark-list"></div>
                    </div>

                </div>


                <div id="land-start">랜드마크
                </div>

                <div class="landmark-detail">
                    <ul>
                        <c:forEach var="landmarkDetail" items="${landmarkDetail}">
                            <c:set var="landmarkName" value="${landmarkDetail.landMarkName}"/>
                            <c:set var="landmarkNo" value="${landmarkDetail.landMarkNo}"/>
                            <c:set var="landMarkContent" value="${landmarkDetail.landMarkContent}"/>
                            <%-- <c:set var="landMarkX" value="${landmarkDetail.landMarkX}"/>
                            <c:set var="landMarkY" value="${landmarkDetail.landMarkY}"/> --%>
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
            const landmarkDetailLength = "${fn:length(landMarkJson)}";
            var landMarkXList = new Array();
            var landMarkYList = new Array();
            <c:forEach var="detail" items="${landMarkJson}">
                landMarkXList.push("${detail.landMarkX}");
                landMarkYList.push("${detail.landMarkY}");
            </c:forEach>
            var averageX = 0;
            var averageY = 0;
            var positions = new Array();
            var linePath = new Array();

            for(let i=0;i<landMarkXList.length;i++) {
                averageX += parseFloat(landMarkXList[i]);
                averageY += parseFloat(landMarkYList[i]);
                positions.push({"latlng":new kakao.maps.LatLng(parseFloat(landMarkYList[i]),parseFloat(landMarkXList[i]))});
                linePath.push(new kakao.maps.LatLng(parseFloat(landMarkYList[i]),parseFloat(landMarkXList[i])));
            }
            

            var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
                mapOption = { 
                    // center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    center: new kakao.maps.LatLng(averageY/landMarkYList.length,averageX/landMarkXList.length), // 지도의 중심좌표
                    level: 7 // 지도의 확대 레벨
                };

            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            // 마커를 표시할 위치와 title 객체 배열입니다 
            // var positions = [
            //     {
            //         latlng: new kakao.maps.LatLng(33.450705, 126.570677)
            //     },
            //     {
            //         latlng: new kakao.maps.LatLng(33.450936, 126.569477)
            //     },
            //     {
            //         latlng: new kakao.maps.LatLng(33.450879, 126.569940)
            //     }
            // ];

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
                    image : markerImage // 마커 이미지 
                });
            }

            // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
            // var linePath = [
            //     new kakao.maps.LatLng(33.450705, 126.570677),
            //     new kakao.maps.LatLng(33.450936, 126.569477),
            //     new kakao.maps.LatLng(33.450879, 126.569940) 
            // ];

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

            function getDistanceFromLatLonInKm(lat1,lng1,lat2,lng2) {
                function deg2rad(deg) {
                    return deg * (Math.PI/180)
                }

                var R = 6371; // Radius of the earth in km
                var dLat = deg2rad(lat2-lat1);  // deg2rad below
                var dLon = deg2rad(lng2-lng1);
                var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
                var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
                var d = R * c; // Distance in km
                return d;
            }

            function displayCircleDot(position, distance) {

                // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
                var circleOverlay = new kakao.maps.CustomOverlay({
                    content: '<span class="dot"></span>',
                    position: position,
                    zIndex: 1
                });

                // 지도에 표시합니다
                circleOverlay.setMap(map);

                if (distance > 0) {
                    // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
                    var distanceOverlay = new kakao.maps.CustomOverlay({
                        content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
                        position: position,
                        yAnchor: 1,
                        zIndex: 2
                    });

                    // 지도에 표시합니다
                    distanceOverlay.setMap(map);
                }

                // 배열에 추가합니다
                dots.push({circle:circleOverlay, distance: distanceOverlay});
            }
        } );
        // const contextPath = ${contextPath};
    </script>

    <script src="${contextPath}/resources/js/common/nav.js"></script>
    <script src="${contextPath}/resources/js/moveline/modal-test.js"></script>
    <script src="${contextPath}/resources/js/moveline/movelineBookmark.js"></script>
    <script src="${contextPath}/resources/js/landmark/landmark.js"></script>
    <script src="${contextPath}/resources/js/moveline/landmarkImageList.js"></script>
    <script src="${contextPath}/resources/js/moveline/reply.js"></script>
    <script src="${contextPath}/resources/js/moveline/movelineDetail.js"></script>
    <script src="${contextPath}/resources/js/moveline/detailMap.js"></script>
</html>