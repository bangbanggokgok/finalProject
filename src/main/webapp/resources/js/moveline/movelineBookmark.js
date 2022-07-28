function setBookmark(movelineNo) {
    if (loginUserNo == "") {
      alert("로그인 후 이용하세요.");
      return;
    }
  
    if (confirm("즐겨찾기 하시겠습니까?")) {
      $.ajax({
        url: contextPath + "/moveline-main/list/bookmark",
        data: { movelineNo: movelineNo },
        type: "GET",
        success: function (result) {
          if (result > 0) {
            alert("즐겨찾기 목록에 등록되었습니다.");
          } else {
            console.log("이미 등록");
            alert("이미 즐겨찾기 되어있습니다.");
          }
        },
        error: function (req, status, error) {
          console.log("즐겨찾기 등록 실패");
          console.log(req.responseText);
        },
      });
    }
  }