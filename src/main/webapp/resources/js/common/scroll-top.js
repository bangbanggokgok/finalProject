var btt = document.getElementById("back-to-top"),
docElem = document.documentElement,
offset,
scrollPos,
docHeight;

docHeight = Math.max(docElem.offsetHeight, docElem.scrollHeight);

if (docHeight != "undefined") {
offset = docHeight / 4;
}

window.addEventListener("scroll", function () {
scrollPos = docElem.scrollTop;

btt.className = scrollPos > offset ? "visible" : "";
});

btt.addEventListener("click", function (e) {
e.preventDefault();
// docElem.scrollTop = 0;
scrollToTop();
});
function scrollToTop() {
//일정시간 마다 할 일 setubterval(할일, 시간);   0.0015 == 15

var scrollInterval = setInterval(function () {
  if (scrollPos != 0) {
    window.scrollBy(0, -55);
  } else {
    clearInterval(scrollInterval);
  }
}, 15);
}