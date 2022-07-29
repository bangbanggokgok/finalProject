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

      document.getElementById("zoneTitle").innerText =
        document.getElementsByClassName("clicked")[0].innerText;
    },
  });
}
