// 회원 가입 유효성 검사

const checkObj = { 
    "memberEmail"     : false,
    "sendEmail"       : false, 
    "memberName"  : false,
    "memberPw"        : false,
    "memberPwConfirm" : false,
    "memberTel"       : false,
    "memberAddress"       : false 
};



// 이메일 유효성 검사
const memberEmail = document.getElementById("userEmail");
const emailMessage = document.querySelector("#emailMessage");

memberEmail.addEventListener("input", function(){
    if(memberEmail.value.length == 0){
        emailMessage.innerText = "메일을 받을 수 있는 이메일을 입력해주세요.";
        emailMessage.classList.remove("confirm", "error");

        checkObj.memberEmail = false;
        return;
    }

    const regExp = /^[\w\-\_]{5,}@[\w\-\_]+(\.\w+){1,3}$/;

    if( regExp.test(memberEmail.value) ){ 
        
        $.ajax({
            url : "email-reduplicate-check",   
            data : {"memberEmail" : memberEmail.value},
            type : "GET", 
            success : function(result){

                if(result == 1){ // 중복 O
                    emailMessage.innerText = "이미 사용중인 이메일 입니다.";
                    emailMessage.classList.add("error");
                    emailMessage.classList.remove("confirm");
                    checkObj.memberEmail = false; 

                } else { // 중복 X
                    emailMessage.innerText = "사용 가능한 이메일 형식 입니다.";
                    emailMessage.classList.add("confirm");
                    emailMessage.classList.remove("error");
                    checkObj.memberEmail = true; 
                }
            },
            error : function(){
                console.log("에러 발생");
            }
        });
        
    }else{
        emailMessage.innerText = "이메일 형식이 유효하지 않습니다.";
        emailMessage.classList.add("error");
        emailMessage.classList.remove("confirm");

        checkObj.memberEmail = false; // 유효 X 기록
    }
});


// 인증번호 발송
const sendBtn = document.getElementById("sendBtn");
const cMessage = document.getElementById("cMessage");
let reValue = document.getElementById("re");

// 타이머 변수
let checkInterval; // setInterval을 저장할 변수
let min = 4;
let sec = 59;

function intervalTime(){
    if(sec < 10) sec = "0" + sec;
    cMessage.innerText = min + ":" + sec;

    if(Number(sec) === 0){
        min--;
        sec = 59;
    }else{
        sec--;
    }

    if(min === -1){ // 만료
        cMessage.classList.add("error");
        cMessage.innerText = "인증번호가 만료되었습니다.";

        clearInterval(checkInterval); 
    }
};

sendBtn.addEventListener("click", function(){

    if( checkObj.memberEmail ){ 
        
        $.ajax({
            url : "sendEmail"  ,
            data : {"inputEmail" : memberEmail.value,
                    "flag": reValue.value},
            type : "GET",
            success : function(result){
                if(reValue.value == 0){
                    reValue.value = 1;
                    sendBtn.innerText = "인증번호 재발송"
                    console.log("이메일 발송 성공");
                    checkObj.sendEmail = true;
    
                    cMessage.innerText = "5:00"; 
                    min = 4;
                    sec = 59;
                    cMessage.classList.remove("confirm", "error");
                    checkInterval = setInterval(intervalTime, 1000);
                }

                if(reValue.value == 1){
                    clearInterval(checkInterval);
                    cMessage.innerText = "5:00"; 
                    min = 4;
                    sec = 59;
                    checkInterval = setInterval(intervalTime, 1000);
                }
            }
        });
       
        alert("인증번호가 발송되었습니다. 이메일을 확인 후 인증번호를 입력해주세요.");
    }
});


// 인증번호 확인 클릭시
const cNumber = document.getElementById("cNumber");
const cBtn = document.getElementById("cBtn");

cBtn.addEventListener("click", function(){

    if(checkObj.sendEmail){

        if( cNumber.value.length == 6 ){

            $.ajax({
                url : "checkNumber",
                data : { "cNumber" : cNumber.value,
                         "inputEmail" : memberEmail.value },
                type : "GET",
                success : function(result){
                    console.log(result);  
                    // 1 : 인증번호 일치 O, 시간 만족O
                    // 2 : 인증번호 일치 O, 시간 만족X
                    // 3 : 인증번호 일치 X

                    if(result == 1){

                        clearInterval(checkInterval); // 타이머 멈춤     

                        cMessage.innerText = "인증되었습니다.";
                        cMessage.classList.add("confirm");
                        cMessage.classList.remove("error");

                    } else if(result == 2){
                        alert("만료된 인증 번호 입니다.");

                    } else{ // 3
                        alert("인증 번호가 일치하기 않습니다.");
                    }
                },
                error : function(){
                    console.log("이메일 인증 실패")
                }
            });

        } else { // 6자리 아님
            alert("인증번호를 정확하게 입력해주세요.");
            cNumber.focus();
        }

    } else { 
        alert("인증번호 받기 버튼을 먼저 클릭해주세요.");
    }
});


// 이름 유효성 검사
const memberName = document.getElementById("userName");
const nameMessage = document.getElementById("nameMessage");

memberName.addEventListener("input", function(){

    if(memberName.value.length == 0){
        memberName.innerText = "한글 이름으로 입력해주세요.";
        memberName.classList.remove("confirm", "error");

        checkObj.memberName = false;
        return;
    }

    const regExp = /^[가-힣]{2,8}$/;

    if( regExp.test(memberName.value) ){ 
        
        nameMessage.innerText = "사용 가능한 이름 형식입니다.";
        nameMessage.classList.add("confirm");
        nameMessage.classList.remove("error");

        checkObj.memberName = true;
    }else{
        nameMessage.innerText = "형식이 유효하지 않습니다.";
        nameMessage.classList.add("error");
        nameMessage.classList.remove("confirm");

        checkObj.memberName = false; 
    }
});


// 비밀번호 유효성 검사
const memberPw = document.getElementById("userPW");
const memberPwConfirm = document.getElementById("userPWConfirm");
const pwMessage = document.getElementById("pwMessage");

memberPw.addEventListener("input", function(){

    if(memberPw.value.length == 0){
        pwMessage.innerText = "영어, 숫자, 특수문자(!,@,#,-,_)를 6~20글자 사이로 작성해주세요.";
        pwMessage.classList.remove("confirm", "error");

        checkObj.memberPw = false; 
        return;
    }
    const regExp = /^[\w!@#_-]{6,20}$/;

    if( regExp.test(memberPw.value) ){ 
        checkObj.memberPw = true; 

        if(memberPwConfirm.value.length == 0){ 
            pwMessage.innerText = "유효한 비밀번호 형식입니다.";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
        } else { 
            checkPw(); 
        }
    }else{
        pwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");

        checkObj.memberPw = false; // 유효 X 기록
    }
});


// 비밀번호 확인 유효성 검사
memberPwConfirm.addEventListener("input", checkPw );
const pwConfirmMessage = document.getElementById("pwConfirmMessage");

function checkPw(){ 
    if(memberPw.value == memberPwConfirm.value){
        pwConfirmMessage.innerText = "비밀번호가 일치합니다.";
        pwConfirmMessage.classList.add("confirm");
        pwConfirmMessage.classList.remove("error");

        checkObj.memberPwConfirm = true;

    } else{
        pwConfirmMessage.innerText = "비밀번호가 일치하지 않습니다.";
        pwConfirmMessage.classList.add("error");
        pwConfirmMessage.classList.remove("confirm");

        checkObj.memberPwConfirm = false;
    }
}


// 전화번호 유효성 검사
const memberTel = document.getElementById("userTel");
const telMessage = document.getElementById("telMessage");

memberTel.addEventListener("input", function(){

    // 입력이 되지 않은 경우
    if(memberTel.value.length == 0){
        telMessage.innerText = "전화번호를 입력해주세요.(- 제외)";
        telMessage.classList.remove("confirm", "error");

        checkObj.memberTel = false;
        return;
    }
    const regExp = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

    if(regExp.test(memberTel.value)){
        telMessage.innerText = "유효한 전화번호 형식입니다.";
        telMessage.classList.add("confirm");
        telMessage.classList.remove("error");

        checkObj.memberTel = true;
        
    } else{
        telMessage.innerText = "전화번호 형식이 올바르지 않습니다.";
        telMessage.classList.add("error");
        telMessage.classList.remove("confirm");

        checkObj.memberTel = false;
    }
});


// 주소 유효성 검사
const postcode = document.getElementById("sample2_postcode");
const detailAddress = document.getElementById("sample2_detailAddress");
const addrMessage = document.getElementById("addrMessage");

postcode.addEventListener("click", function(){
    sample2_execDaumPostcode();
});

detailAddress.addEventListener("input", function(){
    if(postcode.value.length == 0){
        addrMessage.innerText = "우편번호를 먼저 입력해주세요.";
        detailAddress.value = "";
        addrMessage.classList.add("error");
        addrMessage.classList.remove("confirm");

        checkObj.memberAddress = false;
        return;
    } 

    if(detailAddress.value.length == 0 && postcode.value.length != 0){
        addrMessage.innerText = "상세 주소를 입력해주세요.";
        addrMessage.classList.add("error");
        addrMessage.classList.remove("confirm");

        checkObj.memberAddress = false;
        return;

    } else{
        addrMessage.innerText = "";
        checkObj.memberAddress = true;
    }
});



// 다음 주소 API
// 우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById('layer');

function closeDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_layer.style.display = 'none';
}

function sample2_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
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
        width : '100%',
        height : '100%',
        maxSuggestItems : 5
    }).embed(element_layer);

    // iframe을 넣은 element를 보이게 한다.
    element_layer.style.display = 'block';

    // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
    initLayerPosition();
}

// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
function initLayerPosition(){
    var width = 500; //우편번호서비스가 들어갈 element의 width
    var height = 450; //우편번호서비스가 들어갈 element의 height
    var borderWidth = 5; //샘플에서 사용하는 border의 두께

    // 위에서 선언한 값들을 실제 element에 넣는다.
    element_layer.style.width = width + 'px';
    element_layer.style.height = height + 'px';
    element_layer.style.border = borderWidth + 'px solid';
    // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
    element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}



// 입력 확인
function signUpValidate(){
    let str;
    for( let key  in checkObj ){ 

        if( !checkObj[key] ){ 
            switch(key){
            case "memberEmail": str="이메일이"; break;
            case "sendEmail": str="인증번호가"; break;
            case "memberName": str="이름이"; break;
            case "memberPw": str="비밀번호가"; break;    
            case "memberPwConfirm": str="비밀번호 확인이"; break;
            case "memberTel": str="전화번호가"; break;
            case "memberAddress": str="주소가"; break;
            }
            str += " 유효하지 않습니다.";
            alert(str);
            document.getElementById(key).focus();
            return false;
        }
    }
    return true;
}

