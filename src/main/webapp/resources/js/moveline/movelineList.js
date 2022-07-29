// 썸네일 클릭 시 확대 이벤트
// 즉시 실행 함수
(function () {
    const thumbnail = document.getElementsByClassName("list-thumbnail");
  
    if (thumbnail.length > 0) {
      // 목록에 썸네일 이미지가 있을 경우에만 이벤트 추가
  
      // 애초에 모달이 없어요
  
      const modal = document.querySelector(".modal");
      const modalImage = document.getElementById("modal-image");
      const modalClose = document.getElementById("modal-close");
  
      for (let th of thumbnail) {
        th.addEventListener("click", function () {
          modalImage.setAttribute("src", th.getAttribute("src"));
  
          modal.classList.toggle("show"); // add
        });
      }
  
      // X버튼
      modalClose.addEventListener("click", function () {
        modal.classList.toggle("hide"); // hide 클래스 추가
  
        setTimeout(function () {
          // 0.45초 후 동작
          modal.classList.toggle("hide"); // hide 클래스 제거
  
          modal.classList.toggle("show"); // remove
        }, 450);
      });
    }
  })();

// //즐겨찾기 버튼 js - 목록페이지
// const bookmarkBtn2 = document.querySelectorAll('.btn-bookmark2'); 
// const bookmarkOn2 = document.querySelector(".bookmarkOn2");
// const bookmarkOff2 = document.querySelector(".bookmarkOff2");

// for(let i of bookmarkBtn2){
//   i.addEventListener('click', () =>{
//       bookmarkOn2.classList.toggle('active2');
//       bookmarkOff2.classList.toggle('d-none2');
//   });
// }

// // for(let i=0; i<bookmarkBtn2.length; i++){
// //   bookmarkOn2[i].classList.toggle('active');
// //   bookmarkOff2[i].classList.toggle('d-none');
// // }



// // var obj = { 'France': 'Paris', 'England': 'London' };
// // // Iterate over the property names:
// // for (let country of Object.keys(obj)) {
// //     var capital = obj[country];
// //     console.log(country, capital);
// // }

// // for (const [country, capital] of Object.entries(obj))
// //     console.log(country, capital);

// (() => {
//   if ($(".bookmarkValue2").val() == 0) {
//       $(".bookmarkOff2").toggleClass("hide");
//   }

//   if ($(".bookmarkValue2").val() == 1) {
//       $(".bookmarkOn2").toggleClass("active2");
//   }
// })();

// $(".btn-bookmark2").click(() => {
//   if (userNo == "") {
//     alert("로그인 후 이용하세요.");
//     return;
//   }

//       if (userNo != 0) {
        
//           if ($(".bookmarkValue2").val() == 0) {
//               $.ajax({
//                   url: contextPath + "/moveline-main/list/bookmarkSet/" + movelineNo,
//                   data: { "userNo": userNo },
//                   type: "get",
//                   success: function (result) {
//                       result = result * 1
//                       if (result == '1') {
//                           alert("해당 랜드마크를 즐겨찾기 목록에 추가하였습니다.");
//                           $(".bookmarkOn2").toggleClass("hide");
//                           $(".bookmarkOff2").toggleClass("hide");
//                           $(".bookmarkValue2").val('1');
//                       };
//                   }
//               });
//           }
//           if ($(".bookmarkValue2").val() != 0) {
//             alert("movelineNo");
//               if (confirm("즐겨찾기를 삭제하시겠습니까?")) {
//                   $.ajax({
//                       url: contextPath + "/moveline-main/list/bookmarkDelete/" + movelineNo,
//                       data: { "userNo": userNo },
//                       type: "get",
//                       success: function (result) {
//                           alert("해당 랜드마크를 즐겨찾기 목록에서 삭제하였습니다.");
//                           $(".bookmarkOn2").toggleClass("hide");
//                           $(".bookmarkOff2").toggleClass("hide");
//                           $(".bookmarkValue2").val('0');
//                       }
//                   })
//               }
//           }
//       }
//   });