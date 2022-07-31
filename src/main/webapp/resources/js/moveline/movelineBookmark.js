// let movelineNo;

//즐겨찾기 버튼 js - 목록페이지
const bookmarkBtn2 = document.querySelectorAll('.btn-bookmark2');
const bookmarkOn2 = document.querySelectorAll(".bookmarkOn2");
const bookmarkOff2 = document.querySelectorAll(".bookmarkOff2");

// for(let i of bookmarkBtn2){
//   i.addEventListener('click', () =>{
//       bookmarkOn2.classList.toggle('active');
//       bookmarkOff2.classList.toggle('d-none');
//   });
// }

for (let i = 0; i < bookmarkBtn2.length; i++) {
    bookmarkBtn2[i].addEventListener("click", function () {
        bookmarkOn2[i].classList.toggle('d-none');
        bookmarkOff2[i].classList.toggle('active');
    });
}



(() => {
    if ($(".bookmarkValue2").val() == 0) {
        $(".bookmarkOn").toggleClass("d-none");
        $(".bookmarkOff").toggleClass("active");    }

    if ($(".bookmarkValue2").val() == 1) {
        $(".bookmarkOn2").toggleClass("active");
        $(".bookmarkOff2").toggleClass("d-none");    }
})();


for (let i = 0; i < bookmarkBtn2.length; i++) {

    $(bookmarkBtn2[i]).click(function () {

        if (userNo == "") {
            alert("로그인 후 이용하세요.");
            return;
        }
        if (userNo != 0) {
            movelineNo = this.value;
            if ($(this).find(".bookmarkValue2").val() == 0) {
                $.ajax({
                    url: contextPath + "/moveline-main/list/bookmarkSet/" + movelineNo,
                    data: { "userNo": userNo },
                    type: "get",
                    success: function (result) {
                        result = result * 1
                        if (result == '1') {
                            alert("해당 랜드마크를 즐겨찾기 목록에 추가하였습니다.");
                            $(".bookmarkOn2").toggleClass("active");
                            $(".bookmarkOff2").toggleClass("d-none");
                            $(".bookmarkValue2").val('1');
                        };
                    }
                });
            }
            else {
                alert("movelineNo");
                if (confirm("즐겨찾기를 삭제하시겠습니까?")) {
                    $.ajax({
                        url: contextPath + "/moveline-main/list/bookmarkDelete/" + movelineNo,
                        data: { "userNo": userNo },
                        type: "get",
                        success: function (result) {
                            alert("해당 랜드마크를 즐겨찾기 목록에서 삭제하였습니다.");
                            $(".bookmarkOn2").toggleClass("d-none");
                            $(".bookmarkOff2").toggleClass("active");
                            $(".bookmarkValue2").val('0');
                        }
                    })
                }
            }
        }
    });
}


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



//즐겨찾기 버튼 js - 상세페이지
const bookmarkBtn = document.querySelector(".btn-bookmark");
const bookmarkOn = document.querySelector(".bookmarkOn");
const bookmarkOff = document.querySelector(".bookmarkOff");

bookmarkBtn.addEventListener("click", () => {
    bookmarkOn.classList.toggle("active");
    bookmarkOff.classList.toggle("d-none");
});


(() => {
    if ($(".bookmarkValue").val() == 0) {
        $(".bookmarkOn").toggleClass("d-none");
        $(".bookmarkOff").toggleClass("active");
    }

    if ($(".bookmarkValue").val() == 1) {
        $(".bookmarkOn").toggleClass("active");
        $(".bookmarkOff").toggleClass("d-none");
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
                url: contextPath + "/moveline-main/list/bookmarkSet/" + movelineNo,
                data: { "userNo": userNo },
                type: "get",
                success: function (result) {
                    result = result * 1
                    if (result == '1') {
                        alert("해당 랜드마크를 즐겨찾기 목록에 추가하였습니다.");
                        $(".bookmarkOn").toggleClass("active");
                        $(".bookmarkOff").toggleClass("d-none");
                        $(".bookmarkValue").val('1');
                    };
                }
            });
        }
        if ($(".bookmarkValue").val() != 0) {
            if (confirm("즐겨찾기를 삭제하시겠습니까?")) {
                $.ajax({
                    url: contextPath + "/moveline-main/list/bookmarkDelete/" + movelineNo,
                    data: { "userNo": userNo },
                    type: "get",
                    success: function (result) {
                        alert("해당 랜드마크를 즐겨찾기 목록에서 삭제하였습니다.");
                        $(".bookmarkOn").toggleClass("d-none");
                        $(".bookmarkOff").toggleClass("active");
                        $(".bookmarkValue").val('0');
                    }
                })
            }
        }
    }
});






// for(let i=0; i<bookmarkBtn2.length; i++){
//   bookmarkOn2[i].classList.toggle('active');
//   bookmarkOff2[i].classList.toggle('d-none');
// }



// var obj = { 'France': 'Paris', 'England': 'London' };
// // Iterate over the property names:
// for (let country of Object.keys(obj)) {
//     var capital = obj[country];
//     console.log(country, capital);
// }

// for (const [country, capital] of Object.entries(obj))
//     console.log(country, capital);

