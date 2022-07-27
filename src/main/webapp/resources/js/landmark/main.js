const imageList = document.querySelector(".image-list");
const btns = document.querySelectorAll(".view-options button");
let imageListItems = document.querySelectorAll(".image-list li");
const active = "active";
const listView = "list-view";
const gridView = "grid-view";
const dNone = "d-none";
const regions = document.querySelectorAll(".region-detail");
const zoneTitle = document.querySelector("#zoneTitle");

for (let region of regions) {
  region.addEventListener("click", () => {
    zoneTitle.innerText = region.innerText;
  });
}

//버튼 활성화
for (const btn of btns) {
  //배열명 btns 하나하나 각각의 요소를 btn이라는 요소로 설정한다
  btn.addEventListener("click", function () {
    const parent = this.parentElement;
    document.querySelector(".view-options .active").classList.remove(active);
    parent.classList.add(active);

    if (parent.classList.contains("show-list")) {
      parent.previousElementSibling.previousElementSibling.classList.add(dNone);
      imageList.classList.remove(gridView);
      imageList.classList.add(listView);
    } else {
      parent.previousElementSibling.classList.remove(dNone);
      imageList.classList.remove(listView);
      imageList.classList.add(gridView);
    }
  });
}

// 리스트 너비 조절 Range 스크립트
const rangeInput = document.querySelector('input[type="range"]');

rangeInput.addEventListener("input", function () {
  //this.value
  document.documentElement.style.setProperty(
    "--minRangeValue",
    `${this.value}px`
  );
  //this.value + 'px'랑 같다
  //선택자.style.backgroundColor = 'blue';
  //선택자.style.setProperty('background-color', 'blue');
});

//검색키워드로 필터 적용
// const captions = document.querySelectorAll(
//   ".image-list figcaption p:first-child"
//   // image-list figcaption p:first-child
// );
// const myArray = [];
// let counter = 1;

// for (const caption of captions) {
//   myArray.push({
//     id: counter++,
//     text: caption.textContent,
//   });
// }
// console.log(myArray);

let myArrayList = [];
let counter = 1;

listSelectLandmark();

function listSelectLandmark() {
  const captions = document.querySelectorAll(
    ".image-list figcaption p:first-child"
    // image-list figcaption p:first-child
  );
  // myArrayList = [];
  for (let caption of captions) {
    myArrayList.push({
      id: counter++,
      text: caption.textContent,
    });
  }
}

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
      imageListItems = [];
      const ol = document.getElementById("landMakrList");
      ol.innerHTML = "";
      const pageList = document.getElementsByClassName("pagination-list")[0];
      pageList.innerHTML = "";

      if (map.landMarkList != "") {
        for (let landMark of map.landMarkList) {
          const li = document.createElement("li");
          const figure = document.createElement("figure");
          const img = document.createElement("img");
          const figcaption = document.createElement("figcaption");
          const p1 = document.createElement("p");
          const p2 = document.createElement("p");
          li.append(figure);
          figure.append(img);
          img.setAttribute("src", contextPath + landMark.thumbnail);
          figure.append(figcaption);
          p1.innerText = landMark.landMarkName;
          p2.innerText = landMark.landMarkContent;
          p2.classList.add("land-content");
          figcaption.append(p1);
          figcaption.append(p2);
          ol.append(li);
          imageListItems.push(li);
          //          <div class="pagination-list">
          //     <ul class="pagination">
          //       <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
          //             <li><a onclick="loadLocation(${map.hihi},${i})" style="cursor: pointer;">${i}</a></li>
          //       </c:forEach>
          //     </ul>
          //   </div>
        }
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

      listSelectLandmark();

      keyupHandler();

      document.getElementById("zoneTitle").innerText =
        document.getElementsByClassName("clicked")[0].innerText;
    },
  });
}

const searchInput = document.querySelector(".abc");
// const photosCounter = document.querySelector(".toolbar .counter span");
searchInput.addEventListener("keyup", keyupHandler);
//keyup : 키보드 눌르고 때는 순간
//keydown : 사용자가 키보드 눌렀을 떄 한번만 작동
//keypress : 사용자가 키보드 눌렀을 떄 계속 작동

function keyupHandler() {
  for (let item of imageListItems) {
    item.classList.add(dNone);
  }
  // const keywords = this.value;

  // const filteredArray = myArrayList.filter((el) =>
  //   el.text.toLowerCase().includes(keywords.toLowerCase())
  // );
  // console.log(filteredArray);

  // if (filteredArray.length > 0) {
  //   for (const el of filteredArray) {
  //     //.image-list li:nth-child(2)
  //     //.image-list li:nth-child(el.id)
  //     document
  //       .querySelector(`.image-list li:nth-child(${el.id})`)
  //       .classList.remove(dNone);
  //   }
  // }
  // photosCounter.textContent = filteredArray.length;
}

var region = document.getElementsByClassName("region-detail");

function handleClick(event) {
  // console.log(event.target);
  // console.log(this);
  // 콘솔창을 보면 둘다 동일한 값이 나온다

  // console.log(event.target.classList);

  if (event.target.classList[1] === "clicked") {
    event.target.classList.remove("clicked");
  } else {
    for (var i = 0; i < region.length; i++) {
      region[i].classList.remove("clicked");
    }

    event.target.classList.add("clicked");
  }
}

function init() {
  for (var i = 0; i < region.length; i++) {
    region[i].addEventListener("click", handleClick);
  }
}

init();
//filter
// var arr = {3,15,9,20,25};
// var arr2 = arr.filter(function(n){
//     return n % 5 == 0;  // 5로 나눴을 떄 나머지가 0인 값들만 다시 arr2 배열에 새로 넣겠다
// });
// console.log(arr2);

// var arr = [3,15,9,20,25];
// var arr2 = arr.filter(n=>{    return n % 5 == 0; });
// console.log(arr2);

// var arr = [3,15,9,20,25];
// var arr2 = arr.filter(n=>n % 5 == 0);
// console.log(arr2);
