// 회원 가입 유효성 검사

const checkObj = { 
    "memberEmail"     : false,
    "memberPw"        : false,
    "memberPwConfirm" : false,
    "memberNickname"  : false,
    "memberTel"       : false,
    "sendEmail"       : false   // 인증번호 발송 체크
};



// 이메일 유효성 검사
const memberEmail = document.getElementById("memberEmail");
const emailMessage = document.querySelector("#emailMessage");

memberEmail.addEventListener("input", function(){
    if(memberEmail.value.length == 0){
        emailMessage.innerText = "메일을 받을 수 있는 이메일을 입력해주세요.";
        emailMessage.classList.remove("confirm", "error");

        checkObj.memberEmail = false;
        return;
    }

    const regExp = /^[\w\-\_]{4,}@[\w\-\_]+(\.\w+){1,3}$/;

    if( regExp.test(memberEmail.value) ){ 
        
        // $.ajax({
        //     url : "emailDupCheck",   
        //     data : {"memberEmail" : memberEmail.value},
        //     type : "GET", 
        //     success : function(result){

        //         if(result == 1){ // 중복 O
        //             emailMessage.innerText = "이미 사용중인 이메일 입니다.";
        //             emailMessage.classList.add("error");
        //             emailMessage.classList.remove("confirm");
        //             checkObj.memberEmail = false; 

        //         } else { // 중복 X
                    emailMessage.innerText = "사용 가능한 이메일 형식 입니다.";
                    emailMessage.classList.add("confirm");
                    emailMessage.classList.remove("error");
                    checkObj.memberEmail = true; 
        //         }
        //     },
        //     error : function(){
        //         console.log("에러 발생");
        //     }
        // });
        
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

// 타이머 변수
let checkInterval; // setInterval을 저장할 변수
let min = 4;
let sec = 59;

sendBtn.addEventListener("click", function(){

    if( checkObj.memberEmail ){ 

        // $.ajax({
        //     url : "sendEmail"  ,
        //     data : {"inputEmail" : memberEmail.value},
        //     type : "GET",
        //     success : function(result){

        //         console.log("이메일 발송 성공");
        //         console.log(result);
        //         checkObj.sendEmail = true;
        //     },
        //     error : function(){
        //         console.log("이메일 발송 실패")
        //     }
        // });

        // cMessage.innerText = "5:00"; 
        // min = 4;
        // sec = 59;

        // cMessage.classList.remove("confirm");
        // cMessage.classList.remove("error");

        // checkInterval = setInterval(function(){
        //     if(sec < 10) sec = "0" + sec;
        //     cMessage.innerText = min + ":" + sec;

        //     if(Number(sec) === 0){
        //         min--;
        //         sec = 59;
        //     }else{
        //         sec--;
        //     }

        //     if(min === -1){ // 만료
        //         cMessage.classList.add("error");
        //         cMessage.innerText = "인증번호가 만료되었습니다.";

        //         clearInterval(checkInterval); 
        //     }
        // }, 1000);

        alert("인증번호가 발송되었습니다. 이메일을 확인 후 인증번호를 입력해주세요.");
    }
});