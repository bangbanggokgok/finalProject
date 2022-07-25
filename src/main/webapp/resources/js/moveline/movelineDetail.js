const landmark = document.getElementsByClassName("landmark");
const selected = document.getElementsByClassName("selected-landmark");

for(let i=0 ; i<landmark.length ; i++){
    landmark[i].addEventListener("click", function(){

        alert("clicked");
        
        $.ajax({
            url : contextPath + "/detail/setLandmarkImages/",
            data : {"landmarkNo" : landmarkNo },
            type : "get",
            success : function(result){
        
                if(result > 0){
                    alert("특정 랜드마크 조회 성공");
        
                } else {
                    alert("특정 랜드마크 조회 실패");
                }
        
            },
        
            error : function(req, status, error){
                console.log("실패")
                console.log(req.responseText);
            }
        });
    });
}


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


function deleteMoveline(movelineNo){



    $.ajax({
        url : contextPath + "/moveline-main/detail/delete",
        data : {"movelineNo" : movelineNo},
        type : "GET",
        success : function(result){

            // if(result > 0){
            //     alert("코스를 삭제하였습니다.");
            //     // alert(message);
            //     let url = contextPath + "/moveline-main/list"
            //     location.href = url;
            // }else{

            //     alert("코스를 삭제하지 못하였습니다.");
            //     // alert(message);
            // }
            if( confirm("정말로 삭제 하시겠습니까?") ){
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