// 코스 조회 슬라이드
const leftBtn = document.getElementById("leftBtn");
const rightBtn = document.getElementById("rightBtn");
let currentPage = 1;
let pageSize = document.getElementsByClassName("course-content");

if(leftBtn != null){
  leftBtn.addEventListener("click", function(){
    if (currentPage == 1) {
      document.querySelector(".course-list").style.transform = "translateX(0px)";
      alert("첫 페이지입니다.");
    } else {
      currentPage = currentPage - 1;
      document.querySelector(".course-list").style.transform = "translateX(-" + (currentPage-1)*250 + "px)";
    }
  });
}
if(rightBtn!=null){
  rightBtn.addEventListener("click", function(){
    if((currentPage+3) == pageSize.length || pageSize.length < 5){
      alert("마지막 페이지입니다.");
    } 
    if((currentPage+3) < pageSize.length){
      document.querySelector(".course-list").style.transform = "translateX(-" + currentPage*250 + "px)";
      currentPage = currentPage + 1;
    }
  });
}
