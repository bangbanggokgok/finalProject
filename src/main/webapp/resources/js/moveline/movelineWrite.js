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


// 랜드마크 선택
// const landmarkList = document.getElementsByClassName("landmarkList");

// for (let list of landmarkList) {
//     list.addEventListener("change", function () {

//         if (list.value != "landmarkNull") {
//             this.nextElementSibling.style.display = "block";
//         } else {
//             this.nextElementSibling.style.display = "none";
//             this.nextElementSibling.value = "landmarkNull";
//         }
//     });
// }

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

// 선택 된 지역에 해당하는 랜드마크 조회
// function connectLocation(value){

//     alert("clicked");
//     // const locationName = getAttribute.value;
//     // const locationName = btn.parentElement.previousElementSibling.value;


//     $.ajax({
//         url : contextPath + "/moveline-main/list/write/connectLocation",
//         data : {"locationName" : value},
//         type : "GET",
//         success : function(landmarkList){
//             if(landmarkList.length != null){
//                 alert("지역-랜드마크 조회 성공");

//                 // const lm = document.getElementsByClassName("landmarkList");

//                 // for(var i in landmarkList.landMarkName){

//                 //     const option = document.createElement("option");
//                 //     option.innerText = land.landMarkName;
//                 //     lm.append(option);
//                 //     const pathname = location.pathname;

//                 //     let url = pathname.substring(0,  pathnazme.indexOf("/", 1))

//                 //     url = "/moveline-main/list/write"

//                 //     var lmName = landmarkList.landMarkName[i];

//                 // }

//                 // location.href = url;
//                 return true;
//             }else{
//                 alert("지역-랜드마크 조회 실패");
//             }
//             return true;

//         },
//         error : function(req, status, error){
//             console.log("즐겨찾기 등록 실패");
//             console.log(req.responseText);
//         }

//     });

// };







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

let landmarkIndexArray = [];
let addGgomsu = 0
function addFunction(e){
    const listBookmark = document.getElementsByClassName("landmark-list")[0];
    
    if(addGgomsu == 0){
        listBookmark.innerHTML = "";
    }

    addGgomsu++;

    toggleControll(true,e);
    const landmarkBox = document.createElement("div");
    landmarkBox.classList.add("landmark-box");
    landmarkBox.append(e.parentElement);
    listBookmark.innerHTML += landmarkBox.innerHTML;
    toggleControll(false,e);

    $(".land-name-div > span").addClass("href-link");
    modalAnimation();
    $(".href-link").on("click", (e) => {
    const link = e.currentTarget.parentNode.previousSibling.previousSibling.value; // landmark PK
    window.open("http://localhost:8080/bangbanggokgok/landmark-main/detail/" + linkLocation + "/" + link
        , e.currentTarget.innerText);
    });
};

function removeFunction(c){
    $(c).remove();
    if($(".landmark-list").children().text() == ""){
        $(".landmark-list").html("<h2>아직 추가된 랜드마크가 없어요.</h2>")
    }
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

function hoverEvent(){
    $(".hover-action").hover(
        (event)=>{
            const a = event.currentTarget;
            $(a).css("transition-duration","120ms");
            $(a).css("transform","translate(0, -3px)");
            $(a).css("box-shadow","5px 5px 7px 1px rgba(43, 42, 42, 0.413)");
        },
        (event)=>{
            const a = event.currentTarget;
            $(a).css("transition-duration","none");
            $(a).css("transform","none");
            $(a).css("box-shadow","none");
        });
}


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
    
