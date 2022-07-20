var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(Y,X), // 지도의 중심좌표
    level: 4, // 지도의 확대 레벨
    mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
}; 

// 지도를 생성한다 
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 지도에 마커를 생성하고 표시한다
var marker = new kakao.maps.Marker({
    position: new kakao.maps.LatLng(Y,X), // 마커의 좌표
    // draggable : true, // 마커를 드래그 가능하도록 설정한다
    map: map // 마커를 표시할 지도 객체
});

// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
// kakao.maps.event.addListener(marker, 'click', function() {
// alert('마커를 클릭했습니다!');
// });

// // 마커에 mouseover 이벤트를 등록한다
// kakao.maps.event.addListener(marker, 'mouseover', function() {
// console.log('마커에 mouseover 이벤트가 발생했습니다!');
// });

// // 마커에 mouseout 이벤트 등록
// kakao.maps.event.addListener(marker, 'mouseout', function() {
// console.log('마커에 mouseout 이벤트가 발생했습니다!');
// });

// // 마커에 dragstart 이벤트 등록
// kakao.maps.event.addListener(marker, 'dragstart', function() {
// console.log('마커에 dragstart 이벤트가 발생했습니다!');
// });

// // 마커에 dragend 이벤트 등록
// kakao.maps.event.addListener(marker, 'dragend', function() {
// console.log('마커에 dragend 이벤트가 발생했습니다!');
// });