// 변수 지정
var $slideWrap = document.querySelector(".container"),
  $slideContainer = document.querySelector(".slider-container"),
  $slide = document.querySelectorAll(".slide"),
  $navPrev = document.getElementById("prev"),
  $slideHeight = 0,
  $slideCount = $slide.length,
  $currentIndex = 0,
  $pager = document.querySelector(".pager"),
  $pagerBtn = document.querySelectorAll(".pager span"),
  $navNext = document.getElementById("next");

//슬라이드의 높이 확인하여 부모의 높이로 지정하기 - 대상.offsetHeight
for (var i = 0; i < $slideCount; i++) {
  if ($slideHeight < $slide[i].offsetHeight) {
    $slideHeight = $slide[i].offsetHeight;
  }
}
console.log($slideHeight);

$slideWrap.style.height = $slideHeight + "px";
$slideContainer.style.height = $slideHeight + "px";

// 슬라이드가 있으면 가로로 배열하기
for (var a = 0; a < $slideCount; a++) {
  $slide[a].style.left = a * 100 + "%";
}

// 슬라이드 이동 함수
function goToSlide(idx) {
  $slideContainer.classList.add("animated");
  $slideContainer.style.left = -100 * idx + "%";
  $currentIndex = idx;
} //goToSlide

goToSlide(0);

// 버튼을 클릭하면 슬라이드 이동시키기
$navPrev.addEventListener("click", function () {
  //goToSlide($currentIndex - 1);

  if ($currentIndex == 0) {
    //$navPrev.classList.add('disabled');
    goToSlide($slideCount - 1);
  } else {
    //$navPrev.classList.remove('disabled');
    goToSlide($currentIndex - 1);
  }
});

$navNext.addEventListener("click", function () {
  //goToSlide($currentIndex + 1);

  if ($currentIndex == $slideCount - 1) {
    // $navNext.classList.add('disabled');
    goToSlide(0);
  } else {
    // $navNext.classList.remove('disabled');
    goToSlide($currentIndex + 1);
  }
});

//자동 슬라이드

//상세정보 토글
// const $detail = document.querySelector(".detail");
// const $down = document.querySelector(".fa-chevron-down");
// const $up = document.querySelector(".fa-chevron-up");
// const $content = document.querySelector(".detail-content");
// const $contentsDetail = document.querySelector("#contents-detail");
// const $heart = document.querySelector(".heart1");
// const $heartShape = document.querySelector(".heart-img");
// const $redHeartShape = document.querySelector(".redHeart-img");

// $detail.addEventListener("click", function () {
//   $down.classList.toggle("d-none");
//   $up.classList.toggle("active");
//   $content.classList.toggle("active");
//   $contentsDetail.classList.toggle("width");
// });
// $heart.addEventListener("click", function () {
//   $heartShape.classList.toggle("none");
//   $redHeartShape.classList.toggle("active");
//   $redHeartShape.classList.toggle("none");
// });

$(function () {
  $(document).scroll(function () {
    var $nav = $("#top_menu");
    $nav.toggleClass("scrolled", $(this).scrollTop() > $nav.height());
  });
});
