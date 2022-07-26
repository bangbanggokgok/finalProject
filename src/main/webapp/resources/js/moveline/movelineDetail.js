const landmark = document.getElementsByClassName("landmark");
const selected = document.getElementsByClassName("selected-landmark");
const showContent = document.getElementById("showContent");



// 특정 랜드마크 이미지 세팅
for(let i=0 ; i<landmark.length ; i++){
    landmark[i].addEventListener("click", function(){


        // var click_val = $("#id").val();
        // alert(click_val);

        // alert(this.getAttribute("id")); 
        // alert(this.getAttribute("value")); 
        
        $.ajax({
            url : contextPath + "/moveline-main/detail/setLandmarkImages",
            data : {"landmarkNo" : this.getAttribute("id") },
            type : "get",
            dataType : "JSON",
            success : function(landmarkImageList){

            alert(landmarkImageList);
            alert(landmarkContentList);

            console.log("size : " + landmarkImageList[0].landMarkReName);
               const test1 = document.getElementById("test1"); // 사진 아래 제거
               const test2 = document.getElementById("landmark-explain"); // 상세설명 내용 제거
               test1.innerHTML = "";
               test2.innerHTML = "";
               
               // 행
               for(let simpleList of landmarkImageList){
                    console.log("reName Log : " + simpleList.landMarkReName);
                    const slide2 = document.createElement("li");
                    slide2.setAttribute("id", "landmark-images");
                    slide2.classList.add("slide2");
                    
                    
                    const slideImg2 = document.createElement("img");
                    slideImg2.setAttribute("src", contextPath+simpleList.landMarkReName);
                    
                    test1.append(slide2);
                    slide2.append(slideImg2);
                }

                for(let content of landMarkContent){
                    console.log("content log : " + content.landMarkContent)

                }

            },
        
            error : function(req, status, error){
                console.log("실패")
                console.log(req.responseText);
            }
        });
    });
}

// 상세설명 비동기
// showContent.addEventListener("click",function(){
    
//     var click_val = $("#id").val();



//     alert(click_val)

// });

// $(".showContent").bind("click", function() {
//     var oData = test($(this).parent().parent()); //이넘이 자신 상위에 상위 요소 가지고 옴.
//     test(oData);
// });




// 코스 삭제
// (function(movelineNo){
//     const deleteBtn = document.getElementById("deleteBtn");


//     console.log("deleteBtn clicked");
    
//     if(deleteBtn != null){
//         deleteBtn.addEventListener("click", function(){

//             let url = contextPath + "/moveline-main/detail/delete/" + movelineNo;

//             if( confirm("정말로 삭제 하시겠습니까?") ){
//                 location.href = url; // get방식으로 url에 요청
//             }

//         });
//     }

// })();

// 코스 삭제
function deleteMoveline(movelineNo){

    if( confirm("정말로 삭제 하시겠습니까?") ){
    } else { 
        return
    }

    $.ajax({
        url : contextPath + "/moveline-main/detail/delete",
        data : {"movelineNo" : movelineNo},
        type : "GET",
        success : function(result){

            console.log("result 값 넘어옴");

            if(result > 0){
                alert("코스를 삭제하였습니다.");
                // alert(message);
                let url = contextPath + "/moveline-main/list"
                location.href = url;
            }else{
                alert("코스를 삭제하지 못하였습니다.");
                // alert(message);
            }
        },
        error : function(req, status, error){
            console.log("코스 삭제 실패");
            console.log(req.responseText);
        }
    });
}


// 코스 신고
function reportMoveline(movelineNo){

    if( confirm("정말로 신고 하시겠습니까?") ){

        $.ajax({
            url : contextPath + "/moveline-main/detail/report",
            data : {"movelineNo" : movelineNo},
            type : "GET",
            success: function(result){
                if(result > 0){
                    alert("신고 되었습니다");
                    selectReplyList(); // 목록을 다시 조회해서 삭제된 글을 제거
                }else{
                    alert("신고 실패");
                }
            },

            error : function(req, status, error){
                console.log("실패")
                console.log(req.responseText);
            }

        });
    }
}


