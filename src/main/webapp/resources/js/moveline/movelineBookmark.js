// function setBookmark(movelineNo) {
//     if (loginUserNo == "") {
//       alert("로그인 후 이용하세요.");
//       return;
//     }
  
//     $.ajax({
//       url: contextPath + "/moveline-main/list/bookmark",
//       data: { movelineNo: movelineNo },
//       type: "GET",
//       success: function (result) {
//         if (result > 0) {
//           alert("즐겨찾기 목록에 등록되었습니다.");
//         } else {
//           console.log("이미 등록");
//           alert("이미 즐겨찾기 되어있습니다.");
//         }
//       },
//       error: function (req, status, error) {
//         console.log("즐겨찾기 등록 실패");
//         console.log(req.responseText);
//       },
//     });
//   }



  (() => {
    if ($(".bookmarkValue").val() == 0) {
        $(".heart-img").toggleClass("hide");
    }

    if ($(".bookmarkValue").val() == 1) {
        $("bookmarkOn").toggleClass("hide");
    }
})();


$(".btn-bookmark").click(() => {
  if (userNo == "") {
    alert("로그인 후 이용하세요.");
    return;
  }

      if (userNo != 0) {
          if ($(".bookmarkValue").val() == 0) {
              $.ajax({
                  url: movelineNo + "/bookmarkSet",
                  data: { "userNo": userNo },
                  type: "get",
                  success: function (result) {

                    alert("result1 : " + result);
                      result = result * 1
                      if (result == '1') {
                          alert("해당 랜드마크를 즐겨찾기 목록에 추가하였습니다.");
                          $(".bookmarkOff").toggleClass("hide");
                          $(".bookmarkOn").toggleClass("hide");
                          $(".bookmarkValue").val('1');
                      };
                  }
              });
          }
          if ($(".bookmarkValue").val() != 0) {
              if (confirm("즐겨찾기를 삭제하시겠습니까?")) {
                  $.ajax({
                      url: contextPath + "/moveline-main/list/bookmarkDelete",
                      data: { "userNo": userNo },
                      type: "get",
                      success: function (result) {
                          alert("해당 랜드마크를 즐겨찾기 목록에서 삭제하였습니다.");
                          $(".bookmarkOff").toggleClass("hide");
                          $(".bookmarkOn").toggleClass("hide");
                          $(".bookmarkValue").val('0');
                      }
                  })
              }
          }
      }
  });