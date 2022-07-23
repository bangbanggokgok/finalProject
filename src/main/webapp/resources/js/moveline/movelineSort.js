function located(num){

    $.ajax({
        url : "moveline-main/list",
        dataType : "json",
        success : function( list ){

            const tlist = document.getElementById("tlist");
            // const t-list = document.getElementsByClassName("t-list")[0];

            tlist.innerHTML = "";

            for(let hash of list){

                const li = document.createElement("li");

                const a = document.createElement("a");
                a.innerText = item.mlHashName;
                
                li.append(a);

                tlist.append(li);

                const pathname = location.pathname;

                let url = pathname.substring(0,  pathname.indexOf("/", 1))

                url = "/moveline-main/list/main"

            }

            location.href = url;

        },

        error : function(){
            console.log("에러 발생");
        }
    });
}


// 썸네일 클릭 시 확대 이벤트 
// 즉시 실행 함수
// (function(){
//     const thumbnail = document.getElementsByClassName("list-thumbnail");

//     if(thumbnail.length > 0){ // 목록에 썸네일 이미지가 있을 경우에만 이벤트 추가
      
//         const modal = document.querySelector('.modal');
//         const modalImage = document.getElementById("modal-image");
//         const modalClose = document.getElementById("modal-close");

//         for(let th of thumbnail){
//             th.addEventListener("click", function(){
//                 modalImage.setAttribute("src", th.getAttribute("src") );
               
//                 modal.classList.toggle('show'); // add
//             });
//         }

//         // X버튼
//         modalClose.addEventListener("click", function(){
            
//             modal.classList.toggle('hide'); // hide 클래스 추가

//             setTimeout(function(){ // 0.45초 후 동작
//                 modal.classList.toggle('hide'); // hide 클래스 제거

//                 modal.classList.toggle('show'); // remove
//             }, 450);
//         });


//     }

// })();


function setBookmark(movelineNo){

    if(loginUserNo == ""){
        alert("로그인 후 이용하세요.");
        return;
    }

    if(confirm("즐겨찾기 하시겠습니까?")){
        $.ajax({
            url : contextPath + "/moveline-main/list/bookmark",
            data : {"movelineNo" : movelineNo},
            type : "GET",
            success : function(result){
                
                if(result > 0){
                    alert("즐겨찾기 목록에 등록되었습니다.");
                } else { 
                    console.log("이미 등록");
                    alert("이미 즐겨찾기 되어있습니다.");
                }
            },
            error : function(req, status, error){
                console.log("즐겨찾기 등록 실패");
                console.log(req.responseText);
            }
        })
    }
}


// 테마별 코스 목록 조회
(function(){
    
    const movelineTheme = document.getElementsByName("movelineTheme");
    
    for(let i = 0; i < movelineTheme.length; i++){
        movelineTheme[i].addEventListener("click", function(){
            location.href = "list/theme?theme=" + this.innerText;
        });
    }
})();


// 전체 코스 목록 조회
// (function(){
    
//     const selectAll = document.getElementById("selectAll");
    
//     selectAll.addEventListener("click", function(){
//         console.log("this.innerText");
//         console.log(this.innerText);
//         location.href = "list/selectAll?selectAll=" + this.innerText;
//     });
// })();

/* function bookmarkValidate(){


    
    if(loginUserNo == ""){
        alert("로그인이 필요합니다.");
        return;
    }
    return true;
} */




// (function(){
//     const goToList = document.getElementById("goToList"); // 존재하지 않으면 null

//     if(goToList != null){ // 버튼이 화면에 존재할 때
//         goToList.addEventListener("click", function(){
//             const pathname = location.pathname;
//             let url = pathname.substring(0,  pathname.indexOf("/", 1))
//             location.href = url; // get방식으로 url에 요청

//         });
//     }

// })();

// function goToList(){
    
//     if(goToList != null){ 
//         $.ajax({
//             url : contextPath + "/moveline-main/goToList",
//             data : {"movelineNo" : movelineNo},
//             type : "GET",
//             success : function(result){
                
//                 if(result > 0){
//                     alert("즐겨찾기 목록에 등록되었습니다.");
//                 } else { 
//                     console.log("이미 등록");
//                     alert("이미 즐겨찾기 되어있습니다.");
//                 }
//             },
//             error : function(req, status, error){
//                 console.log("즐겨찾기 등록 실패");
//                 console.log(req.responseText);
//             }
//         })
//     }
// }