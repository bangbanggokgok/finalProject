(()=>{
    if($(".bookmarkValue").val() == 0){
        $(".heart-img").toggleClass("hide");
    }

    if($(".bookmarkValue").val() == 1){
        $(".redHeart-img").toggleClass("hide");
    }
})();

$(".heart1").click(() => {
    if ($(".bookmarkValue").val() == 0) {
        $.ajax({
            url: landmarkNo + "/landmarkBookmark",
            data: { "userNo": userNo },
            type: "get",
            success: function (result) {
                result = result * 1
                if (result == '1') {
                    alert("해당 랜드마크를 즐겨찾기 목록에 추가되었습니다.");
                    $(".heart-img").toggleClass("hide");
                    $(".redHeart-img").toggleClass("hide");
                    $(".bookmarkValue").val('1');
                };
            }
        });
    }
    if($(".bookmarkValue").val() != 0){
        if (confirm("즐겨찾기를 삭제하시겠습니까?")) {
            $.ajax({
                url: landmarkNo + "/landmarkBookmarkDelete",
                data: { "userNo": userNo },
                type: "get",
                success: function (result) {
                    alert("해당 랜드마크를 즐겨찾기 목록에서 삭제되었습니다.");
                    $(".heart-img").toggleClass("hide");
                    $(".redHeart-img").toggleClass("hide");
                    $(".bookmarkValue").val('0');
                }
            })
        }
    }
});