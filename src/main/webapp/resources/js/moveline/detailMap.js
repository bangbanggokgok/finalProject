let landmarkIndexArray = new Map();
let addGgomsu = 0;
let mapCenterX = 0;
let mapCenterY = 0;
let landCount = 0;
var marker;
var infowindow;
var polyline;

var markers = [];
var infowindows = [];
let linePath = [];
var polylines = [];
var polyline = null;

function addFunction(e){
    const listBookmark = document.getElementsByClassName("landmark-list")[0];
    const idNumber = ""+e.previousSibling.previousSibling.previousSibling.value;
    //유효성
    landmarkIndexArray.set(idNumber, e.parentElement.innerHTML);
    
    if(addGgomsu == 0){
        listBookmark.innerHTML = "";
    }

    addGgomsu++;

    //이벤트용 div
    const useEventDiv = document.createElement("div");
    useEventDiv.classList.add("use-event-div");
    
    //복사토글
    toggleControll(true,e);
    const landmarkBox = document.createElement("div");
    landmarkBox.append(e.parentElement);
    listBookmark.height += 94;
    
    //색인 삽입
    const controllIndex = document.createElement("div");
    controllIndex.classList.add("controll-index");
    e.parentElement.append(controllIndex);
    
    useEventDiv.innerHTML = "<div class="+"\"use-event-div\">"+landmarkBox.innerHTML+"</div>";
    
    //복사
    listBookmark.innerHTML += useEventDiv.innerHTML;
    //튤팁 색인삭제
    $(landmarkBox).remove('.controll-index');
    //원본리셋
    toggleControll(false,e);

    $(".land-name-div > span").addClass("href-link");
    modalAnimation();
    $(".href-link").on("click", (e) => {
    const link = e.currentTarget.parentNode.previousSibling.previousSibling.value; // landmark PK
    window.open("http://localhost:8080/bangbanggokgok/moveline-main/detail/" + linkLocation + "/" + link
        , e.currentTarget.innerText);
    });

    mapCenterX += e.nextSibling.value;
    mapCenterY += e.nextSibling.nextSibling.value;
    landCount++;
    // landmarkIndexArray e.currentTarget.parentElement;

    mapOption = {
        center: new kakao.maps.LatLng(mapCenterX/landCount, mapCenterY/landCount), // 지도의 중심좌표
        level: 2, // 지도의 확대 레벨
        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
    }; 

    marker = createMarker(e.nextSibling.value,e.nextSibling.nextSibling.value);

    infowindow = createInfowindow(e.previousSibling.firstChild.innerText);

    infowindow.open(map, marker);

    lineDraw(e.nextSibling.value,e.nextSibling.nextSibling.value)
    markers.push(marker);
    infowindows.push(infowindow);

    setMarkers(map)
};  

function createMarker(x,y){
    return new kakao.maps.Marker({
        position: new kakao.maps.LatLng(x, y), // 마커의 좌표
        map: map // 마커를 표시할 지도 객체
    });
};

function createInfowindow(title){
    return new kakao.maps.InfoWindow({
        content : '<div style="padding:5px;text-align:center;">'+title+'</div>' // 인포윈도우에 표시할 내용
    });
};

function lineDraw(x,y){
    if(polyline) polyline.setMap(null);
    if(x!=null){
        linePath.push(new kakao.maps.LatLng(x, y));
    }
    
    polyline = new kakao.maps.Polyline({
        path: linePath, // 선을 구성하는 좌표배열 입니다
        strokeWeight: 5, // 선의 두께 입니다
        strokeColor: '#1BB3FE', // 선의 색깔입니다
        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: 'solid' // 선의 스타일입니다
    });
    polyline.setMap(map)
    //polylines.push(polyline);
    // 지도에 선을 표시합니다 
};

$(document).on('.landmark-list > .use-event-div','dragstart',function(){
    console.log(1);
});

function removeFunction(c){
    
    let array = [];
    for(let j=0;j<document.getElementsByClassName("landmark-box").length;j++){
        array.push(document.getElementsByClassName("landmark-box")[j].id);
    }
    const l = array.indexOf(c.id);
    // console.log(c);
    // console.log(document.getElementsByClassName("landmark-box"));
    $(c.parentElement).remove();
    if($(".landmark-list").children().text() == ""){
        $(".landmark-list").html("<h2>아직 추가된 랜드마크가 없어요.</h2>")
        addGgomsu = 0 ;
    } else {
        $(".landmark-list").height -= 94;
    }

    landmarkIndexArray.set(c.firstChild.value+"","");
    mapCenterX -= c.lastChild.previousSibling.previousSibling.value;
    mapCenterY -= c.lastChild.previousSibling.value;
    landCount--;
    
    mapOption = {
        center: new kakao.maps.LatLng(mapCenterX/landCount, mapCenterY/landCount), // 지도의 중심좌표
        level: 2, // 지도의 확대 레벨
        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
    };
    setMarkers(null,l);
};

function setMarkers(value,l) {
    // console.log('setMarkers', map)
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
        infowindows[i].setMap(null);
        //polylines[i].setMap(null);
    }
    if(!isNaN(l)){
        markers.splice(l,1);
        infowindows.splice(l,1);
        linePath.splice(l,1);
        // console.log("markers : " + marker, "infowindows : " + infowindows);
        // console.log("linepath : " + linePath);
        // polylines.splice(l,1);
    }
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
        infowindows[i].setMap(map);
        // polylines[i].setMap(map);
    }
    console.log(markers);
    console.log(infowindows);
    // console.log(polylines);
    lineDraw()
}


function toggleControll(boolean,e){
    if(boolean){
        e.innerText = "제거하기"
        e.setAttribute("onclick","removeFunction("+"index"+addGgomsu+")")
        e.parentElement.id = "index"+addGgomsu;
    } else {
        e.innerHTML = "추가하기";
        e.setAttribute("onclick","addFunction(this)");
    }
    e.classList.toggle("add-button");
    e.classList.toggle("remove-button");
};

function modalAnimation() {
    //스크롤홀딩
    $('body').css('overflow', 'auto');
    //생성
    $('.all *').toggleClass("all-modal-opacity");
    //삭제
    $('.all *').toggleClass("all-modal");
    //데이터밀고
    $(".modal").children('div:eq(1)').children("div:eq(0)").html("");
    //스르륵애니
    $('.all *').on('transitionend', function (e) {
        $('.all *').off('transitionend', arguments.callee);
        $('.all *').toggleClass("z-index-class")
        $('.all *').toggleClass("unstaged");
    });
}

$('.close').eq(0).click(modalAnimation);


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

mapOption = {
    center: new kakao.maps.LatLng(37.563023, 126.95410), // 지도의 중심좌표
    level: 2, // 지도의 확대 레벨
    mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
}; 

var map = new kakao.maps.Map(mapContainer, mapOption); 
