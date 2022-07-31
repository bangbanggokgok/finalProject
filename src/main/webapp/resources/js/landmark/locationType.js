function loadLocation(locationNum, pageNo) {
  $.ajax({
    url: "nsync/" + locationNum,
    type: "GET",
    data: {
      locationNum: locationNum,
      pageNo: pageNo,
    },
    dataType: "JSON",
    success: function (map) {
      const ol = document.getElementById("landMakrList");
      ol.innerHTML = "";
      const pageList = document.getElementsByClassName("pagination-list")[0];
      pageList.innerHTML = "";
      if (map.landMarkList != "") {
        for (let landMark of map.landMarkList) {
          const li = document.createElement("li");
          const figure = document.createElement("figure");
          const img = document.createElement("img");
          const a = document.createElement("a");
          const figcaption = document.createElement("figcaption");
          const p1 = document.createElement("p");
          p1.classList.add("land-Title");
          const p2 = document.createElement("p");
          li.append(figure);
          figure.append(a);
          a.setAttribute(
            "href",
            "../detail/" + landMark.locationType + "/" + landMark.landMarkNo
          );
          a.append(img);
          img.setAttribute("src", contextPath + landMark.thumbnail);
          figure.append(figcaption);
          p1.innerText = landMark.landMarkName;
          p2.innerText = landMark.landMarkContent;
          p2.classList.add("land-content");
          figcaption.append(p1);
          figcaption.append(p2);
          ol.append(li);
          //          <div class="pagination-list">
          //     <ul class="pagination">
          //       <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
          //             <li><a onclick="loadLocation(${map.hihi},${i})" style="cursor: pointer;">${i}</a></li>
          //       </c:forEach>
          //     </ul>
          //   </div>
        }

        // const imageList = document.querySelector(".image-list");
        // const btns = document.querySelectorAll(".view-options button");
        const imageListItems = document.querySelectorAll(".image-list li");
        // const active = "active";
        // const listView = "list-view";
        // const gridView = "grid-view";
        const dNone = "d-none";
        // const regions = document.querySelectorAll(".region-detail");
        // const zoneTitle = document.querySelector("#zoneTitle");
        // const pageBtn = document.querySelectorAll(".page-btn");
        const pageBtn = document.querySelectorAll(".page-btn");

        for (let page of pageBtn) {
          page.addEventListener("click", () => {
            page.classList.add("red");
          });
        }
        //검색키워드로 필터 적용
        const captions = document.querySelectorAll(
          ".image-list figcaption p:first-child"
          // image-list figcaption p:first-child
        );
        const myArray = [];
        let counter = 1;
        for (const caption of captions) {
          myArray.push({
            id: counter++,
            text: caption.textContent,
          });
        }
        // console.log(myArray);
        const searchInput = document.querySelector(".abc");
        const photosCounter = document.querySelector(".toolbar .counter span");
        searchInput.addEventListener("keyup", keyupHandler);
        //keyup : 키보드 눌르고 때는 순간
        //keydown : 사용자가 키보드 눌렀을 떄 한번만 작동
        //keypress : 사용자가 키보드 눌렀을 떄 계속 작동
        function keyupHandler() {
          for (const item of imageListItems) {
            item.classList.add(dNone);
          }
          const keywords = this.value;
          const filteredArray = myArray.filter((el) =>
            el.text.toLowerCase().includes(keywords.toLowerCase())
          );
          console.log(filteredArray);
          if (filteredArray.length > 0) {
            for (const el of filteredArray) {
              //.image-list li:nth-child(2)
              //.image-list li:nth-child(el.id)
              document
                .querySelector(`.image-list li:nth-child(${el.id})`)
                .classList.remove(dNone);
            }
          }
          // photosCounter.textContent = filteredArray.length;
          // photosCounter.textContent = filteredArray.length;
        }

        // var region = document.getElementsByClassName("region-detail");
        // function handleClick(event) {
        //   // console.log(event.target);
        //   // console.log(this);
        //   // 콘솔창을 보면 둘다 동일한 값이 나온다
        //   // console.log(event.target.classList);
        //   if (event.target.classList[1] === "clicked") {
        //     event.target.classList.remove("clicked");
        //   } else {
        //     for (var i = 0; i < region.length; i++) {
        //       region[i].classList.remove("clicked");
        //     }
        //     event.target.classList.add("clicked");
        //   }
        // }
        // function init() {
        //   for (var i = 0; i < region.length; i++) {
        //     region[i].addEventListener("click", handleClick);
        //   }
        // }
        // init();

        // 페이지관련 로직
        const paginationUl = document.createElement("ul");
        for (let i = 0; i < map.pagination.endPage; i++) {
          let j = i + 1;
          const pageNumber = document.createElement("li");
          const a = document.createElement("a");
          a.innerText = j;
          a.setAttribute(
            "onclick",
            "loadLocation(" + locationNum + "," + j + ")"
          );
          a.setAttribute("style", "cursor:pointer;");
          pageNumber.append(a);
          paginationUl.append(pageNumber);
        }
        paginationUl.classList.add("pagination");
        pageList.append(paginationUl);
        document.getElementsByClassName("container")[1].append(pageList);
      }
      if (map.landMarkList == "") {
        ol.innerHTML =
          "<h1 style=" +
          "text-align:center;" +
          ">아직 등록된 랜드마크가 없어요.</h1>";
      }

      document.getElementById("zoneTitle").innerText =
        document.getElementsByClassName("clicked")[0].innerText;
    },
  });
}
