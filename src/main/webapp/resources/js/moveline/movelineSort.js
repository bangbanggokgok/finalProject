// const bookmarkBtn = document.querySelector(".btn-bookmark");
// const bookmarkOn = document.querySelector(".bookmarkOn");
// const bookmarkOff = document.querySelector(".bookmarkOff");

// bookmarkBtn.addEventListener("click", () => {
//   bookmarkOn.classList.toggle("active");
//   bookmarkOff.classList.toggle("d-none");
// });


// 지역 구분 세팅
function located(num) {
  $.ajax({
    url: "moveline-main/list",
    dataType: "json",
    success: function (list) {
      const tlist = document.getElementById("tlist");
      // const t-list = document.getElementsByClassName("t-list")[0];

      tlist.innerHTML = "";

      for (let hash of list) {
        const li = document.createElement("li");

        const a = document.createElement("a");
        a.innerText = item.mlHashName;

        li.append(a);

        tlist.append(li);

        const pathname = location.pathname;

        let url = pathname.substring(0, pathname.indexOf("/", 1));

        url = "/moveline-main/list/main";
      }

      location.href = url;
    },

    error: function () {
      console.log("에러 발생");
    },
  });
}




// // 테마별 코스 목록 조회
(function () {
  const movelineTheme = document.getElementsByName("movelineTheme");

  for (let i = 0; i < movelineTheme.length; i++) {
    movelineTheme[i].addEventListener("click", function () {
      location.href = "list/theme?theme=" + this.innerText;
    });
  }
})();

// 전체 코스 목록 조회
(function(){

    const selectAll = document.getElementById("selectAll");

    selectAll.addEventListener("click", function(){
        console.log("this.innerText");
        console.log(this.innerText);
        location.href = "list/selectAll?selectAll=" + this.innerText;
    });
})();






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
