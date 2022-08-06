
// 해시태그 세팅
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
