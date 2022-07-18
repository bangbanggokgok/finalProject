// 내정보 수정 관련

// 프로필 이미지 미리보기
const inputImage = document.getElementById("input-image");
if (inputImage != null) {
  inputImage.addEventListener("change", function () {

    if (this.files[0] != undefined) {
      const reader = new FileReader();
      reader.readAsDataURL(this.files[0]);

      reader.onload = function (e) {
        const profileImage = document.getElementById("profile-image");
        profileImage.setAttribute("src", e.target.result);
        document.getElementById("delete").value = 0;
      }
    }
  });
}

// 프로필 이미지 선택 유효성 검사
function profileValidate() {
  const inputImage = document.getElementById("input-image");
  const del = document.getElementById("delete");

  if (inputImage.value == "" && del.value == 0) {
    alert("이미지를 선택한 후 변경 버튼을 클릭해주세요.");
    return false;
  }
  return true;
}

// 프로필 취소 버튼 클릭 시
if (document.getElementById("delete-image") != null) {
  document.getElementById("delete-image").addEventListener("click", function () {

    const del = document.getElementById("delete");

    if (del.value == 0) {
      document.getElementById("profile-image").setAttribute("src", "../resources/images/user.png");

      document.getElementById("input-image").value = "";
      del.value = 1;
    }
  });
}



// 정보 수정 유효성 검사
function infoValidate() {

  const userName = document.getElementById("userName");
  const userTel = document.getElementById("userTel");
  const postcode = document.getElementById("sample2_postcode");
  const address = document.getElementById("sample2_address");
  const detailAddress = document.getElementById("sample2_detailAddress");

  const regExp1 = /^[가-힣]{2,8}$/;
  const regExp2 = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

  // 닉네임 유효성 검사
  if (userName.value.length == 0) {
    alert("이름을 입력해주세요.");
    userName.focus();
    return false;
  }

  if (!regExp1.test(userName.value)) {
    alert("이름은 한글만 작성해주세요.");
    userName.focus();
    return false;
  }

  // 전화번호 유효성 검사
  if (userTel.value.length == 0) {
    alert("전화번호를 입력해주세요.(- 제외)");
    userTel.focus();
    return false;
  }

  if (!regExp2.test(userTel.value)) {
    alert(" 전화번호 형식이 올바르지 않습니다.");
    userTel.focus();
    return false;
  }

  // 주소 유효성 검사
  if (postcode.value.length == 0 || address.value.length == 0) {
    alert("주소를 입력해주세요.")
    sample2_execDaumPostcode();
    return false;
  }

  if (detailAddress.value.length == 0) {
    alert("상세 주소를 입력해주세요.")
    detailAddress.focus();
    return false;
  }

  return true;
}


// 다음 주소 API
// 우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById('layer');

function closeDaumPostcode() {
  // iframe을 넣은 element를 안보이게 한다.
  element_layer.style.display = 'none';
}

function sample2_execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var addr = ''; // 주소 변수
      var extraAddr = ''; // 참고항목 변수

      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
      if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
        addr = data.roadAddress;
      } else { // 사용자가 지번 주소를 선택했을 경우(J)
        addr = data.jibunAddress;
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('sample2_postcode').value = data.zonecode;
      document.getElementById("sample2_address").value = addr;
      // 커서를 상세주소 필드로 이동한다.
      document.getElementById("sample2_detailAddress").focus();

      // iframe을 넣은 element를 안보이게 한다.
      // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
      element_layer.style.display = 'none';
    },
    width: '100%',
    height: '100%',
    maxSuggestItems: 5
  }).embed(element_layer);

  // iframe을 넣은 element를 보이게 한다.
  element_layer.style.display = 'block';

  // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
  initLayerPosition();
}

// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
function initLayerPosition() {
  var width = 500; //우편번호서비스가 들어갈 element의 width
  var height = 450; //우편번호서비스가 들어갈 element의 height
  var borderWidth = 5; //샘플에서 사용하는 border의 두께

  // 위에서 선언한 값들을 실제 element에 넣는다.
  element_layer.style.width = width + 'px';
  element_layer.style.height = height + 'px';
  element_layer.style.border = borderWidth + 'px solid';
  // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
  element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth) + 'px';
  element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth) + 'px';
}



// 비밀번호 변경
const userPw = document.getElementById("userPw");
const changePw = document.getElementById("changePw");
const changePwConfirm = document.getElementById("changePwConfirm");
const pwMessage = document.getElementById("pwMessage");
const regExp = /^[\w!@#_-]{6,20}$/;

if (changePw != null) {
  changePw.addEventListener("input", function () {

    if (regExp.test(changePw.value)) {

      if (changePwConfirm.value.length == 0 || regExp.test(changePwConfirm.value)) {
        pwMessage.innerText = "유효한 비밀번호 형식입니다.";
        pwMessage.classList.add("confirm");
        pwMessage.classList.remove("error");
      }
    } else {
      pwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
      pwMessage.classList.add("error");
      pwMessage.classList.remove("confirm");
      return false;
    }

    checkPw();
    return true;
  });
}

if (changePwConfirm != null) {
  changePwConfirm.addEventListener("input", checkPw);
}

function checkPw() {
  if (changePw.value == changePwConfirm.value) {
    pwConfirmMessage.innerText = "비밀번호가 일치합니다.";
    pwConfirmMessage.classList.add("confirm");
    pwConfirmMessage.classList.remove("error");

  } else {
    pwConfirmMessage.innerText = "비밀번호가 일치하지 않습니다.";
    pwConfirmMessage.classList.add("error");
    pwConfirmMessage.classList.remove("confirm");
    return false;
  }
}

function printAlert(el, message) {
  alert(message);
  el.focus();
  return false;
}

function changePwValidate() {

  if (userPw.value.trim().length == 0) {
    alert("현재 비밀번호를 입력해주세요.");
    userPw.value = "";
    userPw.focus();
    return false;
  }

  if (changePw.value.trim().length == 0) {
    alert("변경할 비밀번호를 입력해주세요.");
    changePw.value = "";
    changePw.focus();
    return false;
  }

  if (!regExp.test(changePw.value)) {
    alert("영어, 숫자, 특수문자(!,@,#,-,_) 6~20 글자 사이로 작성해주세요.");
    changePw.focus();
    return false;
  }

  if (changePwConfirm.value.trim().length == 0) {
    return printAlert(changePwConfirm, "비밀번호 확인을 입력해주세요.");
  }
  return true;
}



// 회원 탈퇴
function secessionValidate() {
  if (userPw.value.trim().length == 0) {
    alert("비밀번호를 입력해주세요.");
    userPw.value = "";
    userPw.focus();
    return false;
  }
  if (!confirm("정말 탈퇴 하시겠습니까?")) { //  취소를 누른 경우
    return false;
  }
  return true;
}
