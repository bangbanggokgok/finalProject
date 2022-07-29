// 사진 첨부 이미지 미리보기
const inputImage = document.getElementsByClassName("input-img");
const preview = document.getElementsByClassName("preview");
const deleteImage = document.getElementsByClassName("delete-image");
const deleteList = document.getElementById("deleteList");
const deleteSet = new Set();

for (let i = 0; i < inputImage.length; i++) {
    inputImage[i].addEventListener("change", function () {

        if (this.files[0] != undefined) {
            const reader = new FileReader();
            reader.readAsDataURL(this.files[0]);
            reader.onload = function (e) {
                preview[i].setAttribute("src", e.target.result);
                deleteSet.delete(i);
            }
        } else {
            preview[i].removeAttribute("src");
        }
    });

    // 미리보기 x 클릭
    deleteImage[i].addEventListener("click", function () {

        if (preview[i].getAttribute("src") != "") {
            preview[i].removeAttribute("src");
            inputImage[i].value = "";
            deleteSet.add(i);
        }
    });
}

// 유효성 검사
function mlWriteValidation() {
    const titleInput = document.getElementsByClassName("titleInput")[0];
    const locationsList = document.getElementById("locations-list");
    const landmarkList1 = document.getElementById("landmark-list1");
    const landmarkList2 = document.getElementById("landmark-list2");
    const themeSelect = document.querySelectorAll('input[name="themeSelect"]:checked');
    const img0 = document.getElementById("img0");
    const content = document.getElementsByClassName("content")[0];

    if (titleInput.value.trim().length == 0) {
        alert("제목을 입력해주세요.");
        titleInput.value = "";
        titleInput.focus();
        return false;
    }

    if (locationsList.value == "locationNull") {
        alert("지역을 선택해주세요.");
        return false;
    }

    if (landmarkList1.value == "landmarkNull" || landmarkList2.value == "landmarkNull") {
        alert("랜드마크는 최소 2개 이상 선택해주세요.");
        return false;
    }

    if (themeSelect.length == 0) {
        alert("테마를 선택해주세요.");
        return false;
    }

    if (img0.value == "") {
        alert("사진을 1장 이상 첨부해주세요.");
        return false;
    }

    if (content.value.trim().length == 0) {
        alert("내용을 입력해주세요.");
        content.value = "";
        content.focus();
        return false;
    }
    return true;
}

let bookmarkList = "";

function listSelect(result) {
    const locationName = $("[name=locationsValue] > option:selected").eq(0).text();

    if (bookmarkList != result) {
        bookmarkList = result;
    }

    $(".modal").children('div:eq(1)').children("div:eq(0)").html("")
    $(".modal").children('div:eq(0)').children("div:eq(0)").text("내 랜드마크 즐겨찾는 목록 ( " + locationName + " ) ");
    $(".modal").children('div:eq(0)').children("div:eq(0)").css("font-size", "24px")
    $(".modal").children('div:eq(0)').children("div:eq(0)").css("letter-spacing", "-2.3px")

    //사라질
    $('.all *').toggleClass("all-modal-opacity");
    $('.all *').toggleClass("unstaged");

    //생길
    $('.all *').toggleClass("all-modal");
    $('.all *').toggleClass("z-index-class")

    $('body').css('overflow', 'hidden');

    for (let landmark of result) {

        const landmarkBox = document.createElement("div");
        landmarkBox.classList.add("landmark-box")

        const checkBox = document.createElement("input");
        checkBox.setAttribute("type", "hidden");
        checkBox.setAttribute("value", landmark.landMarkNo);
        checkBox.classList.add("checkBox")

        const img = document.createElement("img");
        img.setAttribute("src", contextPath + landmark.thumbnail);
        img.classList.add("land-img");

        const landmarkName = document.createElement("div");
        const span = document.createElement("span");
        span.innerText = landmark.landMarkName;
        landmarkName.append(span);
        landmarkName.classList.add("land-name-div")
        const addButton = document.createElement("button");
        addButton.classList.add("add-button");
        addButton.setAttribute("type","button")
        addButton.setAttribute("onclick","addFunction(this)");
        addButton.innerText = "추가하기";

        const hiddenY = document.createElement("input");
        const hiddenX = document.createElement("input");
        hiddenX.value = landmark.landmarkX;
        hiddenY.value = landmark.landmarkY;
        hiddenX.setAttribute("type", "hidden");
        hiddenY.setAttribute("type", "hidden");

        landmarkBox.append(checkBox, img, landmarkName, addButton, hiddenY, hiddenX);

        const idNumber = landmark.landMarkNo+"";
        if(landmarkIndexArray.get(idNumber) == landmarkBox.innerHTML){
            addButton.setAttribute("disabled","disabled");
            addButton.innerText = "이미 추가됨";
            addButton.classList.toggle("add-button");
            addButton.classList.toggle("no-button");
            landmarkBox.style.backgroundColor = "rgba(0, 0, 0, 0.24)"
        }
       
        $(".modal").children('div:eq(1)').children("div:eq(0)").append(landmarkBox);
    };
};

let locationNumberBox = 0;
let linkLocation = 0;
$(".modalTest").eq(0).click(() => {
    const locationValue = document.getElementById("locations-list").value;
    if (locationNumberBox == locationValue) {
        listSelect(bookmarkList)
    }
    if (locationValue != "locationNull") {
        $('.modal').css("top", window.scrollY);
        if (locationNumberBox != locationValue) {
            locationNumberBox = locationValue;
            $.ajax({
                url: "validate-mybookmark-list",
                data: { "locationValue": locationValue },
                type: "get",
                dataType: "json",
                success: function (result) {
                    linkLocation = locationValue;
                    listSelect(result);
                }
            });
        }
    }

    if (locationValue == "locationNull") {
        alert("지역을 선택하고 목록 버튼을 눌러주세요.");
        $("[name=locationValue]").focus();
    }
});

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
    window.open("http://localhost:8080/bangbanggokgok/landmark-main/detail/" + linkLocation + "/" + link
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
    
}

function removeFunction(c){
    
    let array = [];
    for(let j=0;j<document.getElementsByClassName("landmark-box").length;j++){
        array.push(document.getElementsByClassName("landmark-box")[j].id);
    }
    const l = array.indexOf(c.id);
    // console.log(c);
    // console.log(document.getElementsByClassName("landmark-box"));
    $(c).remove();
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
    console.log('setMarkers', map)
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
        infowindows[i].setMap(null);
        //polylines[i].setMap(null);
    }
    if(l){
        markers.splice(l,1);
        infowindows.splice(l,1);
       //polylines.splice(l,1);
        linePath.splice(l,1);
        // delete markers[l]
        // delete infowindows[l]
        // delete polylines[l]
        // delete linePath[l]
    }
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
        infowindows[i].setMap(map);
        //polylines[i].setMap(map);
    }
    console.log(markers);
    console.log(infowindows);
    //console.log(polylines);
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

// $(document).on('.use-event-div',{
//     'dragstart':function(){
//         console.log(1)
//     },
//     'dragend':function(){
//         console.log(2);
//     }
// })

// 망작
// const height = $(".landmark-list").eq(0).height()
// const test = document.getElementsByClassName("landmark-list")[0];
// $('.controll-index').mousedown(function(event){
    
//     const cursorIndex = $(this).parent();
//     // document.body.append(a);
//     document.body.append(cursorIndex);
//     cursorIndex.css("position","inherit")
//     // a.css("zIndex" , "1000");
//     $(".landmark-list").eq(0).height(height);
//     // onmouseenter="mouseEnter()" onmousemove="mouseMove()"
//     test.onmousemove = (e)=>{
//         console.log(cursorIndex);
//         console.log(e.offsetY);
//         cursorIndex.css("top",e.offsetY)
//     }

//     $('.controll-index').on("mousemove", function(event){
//         // function moveAt(offsetX, offsetY) {
            
//         // }
//         // moveAt(cursorX, cursorY);
        
//         event.preventDefault();
//     });

//     $('.controll-index').on("mouseup", function(event){
//         event.preventDefault();
//         if (event.target.className == "use-event-div") {
//             // dragged.parentNode.removeChild(dragged);
//             // event.target.appendChild(dragged);
//         }
//         // endEvent(test);
//     });
// });

// function endEvent(target){
    //     target.removeAttribute("onmouseenter","mouseEnter()");
    //     target.removeAttribute("onmousemove","mouseMove()");
// }

// function mouseEnter(){
    
// }

// function mouseMove(e){
//     console.log();
//     console.log();
// }

// function selectLandmarkValue() {
    
    //     const tempObj = {};
    //     for (let i = 0; i < $(".checkBox:checked").length; i++) {
        //         tempObj[$(".checkBox:checked").eq(i).val()] = $(".checkBox:checked").eq(i).parent();
        //     };
        
        //     if (tempObj == "") {
            //         alert("등록할 랜드마크를 골라주세요");
            //         return
            //     }
            
            //     if (tempObj != "") {
                //         const list = document.getElementsByClassName("landmark-list")[0];
                //         list.innerHTML = ""
                //         let number = 1;
                //         for (let key in tempObj) {
                    //             const landmarkBox = document.createElement("div");
//             landmarkBox.classList.add("landmark-box", "hover-action");

//             const sequenceDiv = document.createElement("div");
//             sequenceDiv.innerHTML = "<div class=" + "sequence" + ">" + number + "</div>";
//             number++;
//             landmarkBox.innerHTML = sequenceDiv.innerHTML + $(tempObj[key]).html();
//             list.append(landmarkBox);
//         };
//         $(".checkBox").css("display", "none");
//         $(".land-namd-div > span").addClass("href-link");
//         modalAnimation();
//     };

//     $(".href-link").on("click", (e) => {
//         const link = e.currentTarget.parentNode.previousSibling.previousSibling.value;
//         window.open("http://localhost:8080/bangbanggokgok/landmark-main/detail/" + linkLocation + "/" + link
//             , e.currentTarget.innerText);
//     });
//     hoverEvent();
//     mouseEvent();
// };

// function hoverEvent(){
//     $(".hover-action").hover(
//         (event)=>{
//             const a = event.currentTarget;
//             $(a).css("transition-duration","120ms");
//             $(a).css("transform","translate(0, -3px)");
//             $(a).css("box-shadow","5px 5px 7px 1px rgba(43, 42, 42, 0.413)");
//         },
//         (event)=>{
//             const a = event.currentTarget;
//             $(a).css("transition-duration","none");
//             $(a).css("transform","none");
//             $(a).css("box-shadow","none");
//         });
//     }
    
    
    // 망작
    // function mouseEvent(){
        //     const height = $(".landmark-list").eq(0).height()
        //     const mainSpace = $(".landmark-list").eq(0);
        
        //     $(".hover-action").mousedown((event)=>{
            //         // $(".hover-action").css("pointer-events","none");
            //         const tempDiv = document.createElement("div");
            
            //         tempDiv.classList.add("landmark-box");
            //         tempDiv.classList.add("black-box");
            //         mainSpace.append(tempDiv);
            
            //         const landmarkBox = event.currentTarget;
            
            //         $(".hover-action").unbind("mouseenter mouseleave");
            //         $(".landmark-list").eq(0).height(height);
            
            //         landmarkBox.style.position = 'absolute';
            //         landmarkBox.style.zIndex = "1000";
            //         landmarkBox.style.width = "615.6px";
            
            //         document.body.append(landmarkBox);
            
            //         moveAt(event.pageX, event.pageY);
            
            //         document.addEventListener('mousemove', onMouseMove);
            
            //         function onMouseMove(event) {
//             moveAt(event.pageX, event.pageY);
//         }

//         function moveAt(pageX, pageY) {
    //             landmarkBox.style.left = pageX - landmarkBox.offsetWidth / 2 + 'px';
    //             landmarkBox.style.top = pageY - landmarkBox.offsetHeight / 2 + 'px';
    //         }
    
    
    //         // landmarkBox.ondragstart = function() {
        //             //     return false;
        //             // };
        
        //         });
        
        //         $(".hover-action").mousedown((event)=>{
            //             // const landmarkBox = event.currentTarget;
            //             document.removeEventListener('mousemove', onMouseMove);
            //             function onMouseMove(event) {
                //                 moveAt(event.pageX, event.pageY);
                //             }
                //             // landmarkBox.removeEventListener("onmouseup");
                //         })
                
                // };
                
                
// 망작
// $('.controll-index').mousedown((e)=>{
//     $($(e.currentTarget).parent()).css("position",'relative');
//     $(".landmark-list").height(height);
//     // console.log($(".landmark-list").height()); 리스트의 높이 // 1칸당 94
//     // console.log(e.offsetY); 인덱스의 클릭 위치
//     const abc = e.currentTarget.parentElement;

// 망작
// $('.controll-index').mousedown((e)=>{
//     console.log("마우스다운");
// });

// $('.controll-index').on({
//     'dragstart':(startE)=>{
//         $(".landmark-list").height(height);
//         // e.orignalEvent.dataTransfer.setData("text",e.target.id);
//         console.log("드래그시작");
//         console.log(startE.offsetY);
//     },
//     'dragend':(endE)=>{
//         console.log("끝");
//     }
// });

// $('.controll-index').mouseup((e)=>{
//     console.log("마우스업")
// });