(() => {
    if ($(".bookmarkValue").val() == 0) {
        $(".heart-img").toggleClass("hide");
    }

    if ($(".bookmarkValue").val() == 1) {
        $(".redHeart-img").toggleClass("hide");
    }
})();

$(".heart1").click(() => {
    if (userNo == 0) {
        alert("로그인 후 사용 가능");
    }

    if (userNo != 0) {
        if ($(".bookmarkValue").val() == 0) {
            $.ajax({
                url: landmarkNo + "/landmarkBookmark",
                data: { "userNo": userNo },
                type: "get",
                success: function (result) {
                    result = result * 1
                    if (result == '1') {
                        alert("해당 랜드마크를 즐겨찾기 목록에 추가하였습니다.");
                        $(".heart-img").toggleClass("hide");
                        $(".redHeart-img").toggleClass("hide");
                        $(".bookmarkValue").val('1');
                    };
                }
            });
        }
        if ($(".bookmarkValue").val() != 0) {
            if (confirm("즐겨찾기를 삭제하시겠습니까?")) {
                $.ajax({
                    url: landmarkNo + "/landmarkBookmarkDelete",
                    data: { "userNo": userNo },
                    type: "get",
                    success: function (result) {
                        alert("해당 랜드마크를 즐겨찾기 목록에서 삭제하였습니다.");
                        $(".heart-img").toggleClass("hide");
                        $(".redHeart-img").toggleClass("hide");
                        $(".bookmarkValue").val('0');
                    }
                })
            }
        }
    }
});
// ${rankLandmark}

// 조회된 평균 점수
(() => {
    let asd = (rate * 10) + "%"
    $(".rate").css("width", asd);
})();

// 마우스의 위치에 따른 별점 표기
function mouseAction(rankPoint) {
    document.getElementById("rate").onmousemove = function (e) {
        const cursorX = e.offsetX;
        const value = curculateRank(cursorX);
        // width = 160px
        const widthValue = (value * 10) + "%"
        $(".rate").css("width", widthValue);
    };

    document.getElementById("rate").addEventListener("mouseout", function () {
        $(".rate").css("width", (rankPoint * 2) * 10 + "%");
    });
};

function curculateRank(a) {
    const b = Math.floor(a / 16);
    return (b + 1);
};

function submitRankPoint(inputValue) {
    if (userNo != 0) {
        const checkAdd = document.getElementsByClassName("add-check")[0];
        const rankText = document.getElementsByClassName("rank-text")[0];
        // const rate = document.getElementsByClassName("rate")[0];
        const idRate = document.getElementById("rate")
        if (checkAdd.value == 0) {
            $.ajax({
                url: landmarkNo + "/insert-landmark-rankPoint",
                data: {
                    "rankPoint": inputValue,
                    "userNo": userNo
                    },
                type: "get",
                success: function (result) {
                    if (result != -100) {
                        rankText.innerText = "";
                        rankText.innerText = (result / 2).toFixed(1) + " / 5";
                        idRate.setAttribute("onmouseover", "mouseAction(" + result.toFixed(1) + " / 2)");
                        mouseAction((result / 2).toFixed(1));
                        checkAdd.value = 1;
                        alert("별점이 추가 되었습니다.");
                    }
                }
            });
        };
        if (checkAdd.value == 1) {
            if (confirm("별점을 취소하겠습니까?")) {
                $.ajax({
                    url: landmarkNo + "/delet-landmark-rankPoint",
                    data: {
                        "userNo": userNo
                        },
                    type: "get",
                    success: function (result) {
                        if (result != -100) {
                            rankText.innerText = "";
                            rankText.innerText = (result / 2).toFixed(1) + " / 5";
                            idRate.setAttribute("onmouseover", "mouseAction(" + result.toFixed(1) + " / 2)");
                            mouseAction((result / 2).toFixed(1));
                            checkAdd.value = 0;
                            alert("별점이 삭제 되었습니다.");
                        };
                    }
                });
            };
        };
    };
    if (userNo == 0) {
        alert("로그인 후 이용 가능")
    };
};


// const drawStar = (target) => {
//     document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
// };
