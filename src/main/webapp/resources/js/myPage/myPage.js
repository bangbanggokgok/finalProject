
// 즐겨찾기 탭
$(document).ready(function() {
    $(".tab_title li").click(function() {
      var idx = $(this).index();

      $(".tab_title li").removeClass("current-tab");
      $(".tab_title li").eq(idx).addClass("current-tab");

      $(".tab_content > div").hide();

      $(".tab_content > div").eq(idx).show();
      $(".tab_content > div").eq(idx).css("display", "flex");
    })
});



// 프로필 이미지 미리보기
const inputImage = document.getElementById("input-image");
if(inputImage != null){
  inputImage.addEventListener("change", function(){

    if(this.files[0] != undefined){
      const reader = new FileReader();
      reader.readAsDataURL(this.files[0]);

      reader.onload = function(e){
        const profileImage = document.getElementById("profile-image");
        profileImage.setAttribute("src", e.target.result);
        document.getElementById("delete").value = 0;
      }
    }
  });
}

// 프로필 이미지 선택 유효성 검사
function profileValidate(){
  const inputImage = document.getElementById("input-image");
  const del = document.getElementById("delete");

  if(inputImage.value == "" && del.value == 0){ 
      alert("이미지를 선택한 후 변경 버튼을 클릭해주세요.");
      return false;
  }
  return true;
}

// 프로필 취소 버튼 클릭 시
if(document.getElementById("delete-image") != null){
  document.getElementById("delete-image").addEventListener("click", function(){

      const del = document.getElementById("delete");

      if(del.value == 0){ 
          document.getElementById("profile-image").setAttribute("src", "../resources/images/user.png");                     

          document.getElementById("input-image").value = "";
          del.value = 1; 
      }
  });
}

