(function () {
    if (document.getElementsByClassName("preview")[0].attributes.src.value != "") {
        document.getElementById("deleteList").value = "";
    }
})();
//  getLng() 위 가로 x
//  getLat() 경 세로 y
//지도 관련
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스

var options = { //지도를 생성할 때 필요한 기본 옵션
    center: new kakao.maps.LatLng(lat, lng), //지도의 중심좌표.
    level: 2 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options);

var marker = new kakao.maps.Marker({
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter()
});



// 지도에 마커를 표시합니다
marker.setMap(map);


kakao.maps.event.addListener(map, 'click', function (mouseEvent) {

    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng;
    marker.setPosition(latlng);

    document.getElementsByName("lng")[0].value = latlng.getLng();;
    document.getElementsByName("lat")[0].value = latlng.getLat();
    console.log(document.getElementsByName("lng")[0].value);
    console.log(document.getElementsByName("lat")[0].value);
});


const inputImage = document.getElementsByClassName("input-img");
const preview = document.getElementsByClassName("preview");
const deleteImage = document.getElementsByClassName("delete-image");

const deleteList = document.getElementById("deleteList")
const deleteSet = new Set();

for (let i = 0; i < inputImage.length; i++) {
    inputImage[i].addEventListener("change", function () {
        if (this.files[0] != undefined) {
            const reader = new FileReader();
            reader.readAsDataURL(this.files[0]);  // 파일 url따오기
            deleteList.value = "";
            reader.onload = function (e) {      // 적제 완료 시 
                preview[i].setAttribute("src", e.target.result);
                deleteSet.delete(i);
            }
        } else {
            preview[i].removeAttribute("src");
        }
    });
    deleteImage[i].addEventListener("click", function () {
        if (preview[i].getAttribute("src") != "") {
            inputImage[i].value = "";
            preview[i].removeAttribute("src");
            deleteSet.add(i);
        }
    });
};






// document.getElementsByClassName("submitButton")[0].addEventListener("click",function submitAction(){
//     if(confirm("랜드마크를 등록 하시겠습니까?")){
//         const contents = document.getElementById("contents").value;
//         const title = document.getElementById("title").value;
//         const hashTag = document.getElementsByClassName("tag_input")[0].value;
//         console.log(hashTag);
//         const hashTagArray = hashTag.split("#");
//         console.log(hashTagArray);
//         const selectLocation = document.getElementById("locations-list").value;
//         const images = document.getElementsByClassName("images")

//         $.ajax({
//             url: selectLocation,
//             data: {"landmarkContents": contents,
//                     "landmarkName": title,
//                     "hashTag": hashTagArray,
//                     "lng":lng,
//                     "lat":lat,
//                     "locationNum":selectLocation},
//             type: "POST"
//         })
//     }
// });

function checkSubmit() {
    console.log("함수 동작");

    const locationList = document.getElementById("locations-list");
    const landmarkName = document.getElementById("title");
    const landmarkContent = document.getElementById("contents");
    const images = document.getElementsByName("images");


    if (!confirm("랜드마크를 등록 하시겠습니까?")) {

        alert("랜드마크 등록이 취소되었습니다.")

        return false;
    } else {
        if (locationList.value == "locationNull") {
            alert("지역을 선택해주세요.");
            locationList.focus();
            return false;
        }

        if (landmarkName.value.trim().length == 0) {
            alert("랜드마크 이름을 입력해주세요.");
            landmarkName.focus();
            return false;
        }

        if (landmarkContent.value.trim().length == 0) {
            alert("랜드마크 소개를 입력해주세요.");
            landmarkContent.focus();
            return false;
        }

        if (images[0].value == "" && deleteList.value != "") {
            alert("썸네일 사진을 넣어주세요.");
            return false;
        }

        if (images[0].value == "" && deleteList.value == "") {
            return true;
        }



        // let flag = true;
        // for (let img of images) {
        //     if (img.value != "") {
        //         flag = false;
        //         break;
        //     }
        // }

        // if (flag && deleteSet.length == 0) {
        //     return true;
        // }

        // if (flag) {
        //     alert("랜드마크 사진을 넣어주세요.");
        //     return false;
        // }



        /*if(!images.match(regExp)){
            alert("jpg,png 파일만 사용할 수 있습니다.");
            return false;
         }*/
        //  return true;
    };
};
