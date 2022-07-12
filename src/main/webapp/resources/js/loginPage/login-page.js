
function handler(index) {
    $(".controller").children().removeClass("selected-div");
    $(".controller").children().eq(index).addClass("selected-div");
    $(".content").children().addClass("hidden-object");
    $(".content").children().eq(index).removeClass("hidden-object");
    $("input").val("");
};

function findEmail() {

    const userTel = $("input[name=userTel]").val();
    const userName = $("input[name=userName]").val();

    if ($.trim(userTel).length == 0) {
        alert("해당 전화번호를 기입해주세요.")
        return false;
    }

    if ($.trim(userName).length == 0) {
        alert("가입했던 성함을 입력해주세요.")
        return false;
    }

    $.ajax({
        url:"find-email",
        type: "POST",
        data: {"userTel": userTel,
               "userName" : userName},
        dataType: "JSON",
        success : function(result){
            $("input").val("");
            $('.name-data').text(result.userName+' 의 회원가입된 이메일은 ');
            $('.email-data').text(result.userEmail+' 입니다');
            $('.all *').toggleClass("unstaged");
            $('.all *').toggleClass("all-modal-opacity");
            $('.all *').toggleClass("all-modal");
        },
        error : function(requst,status,error,result){
            console.log("ajax error");
            console.log("상태코드 : " + requst.status);
            $('.name-data').text('해당 회원의 계정은 존재하지 않습니다');
            $('.email-data').text('');
            $('.all *').toggleClass("unstaged");
            $('.all *').toggleClass("all-modal-opacity");
            $('.all *').toggleClass("all-modal");
        }
    });
};
// 이메일찾는 함수
// 모달 실험해야함

function login() {

    if ($.trim($("input[name=email]").val()).length == 0) {
        alert("이메일을 입력해주세요.");
        return false;
    }

    if ($.trim($("input[name=password]").val()).length == 0) {
        alert("비밀번호를 입력해주세요.");
        return false;
    }

    return true;
};

function resetPassword() {

    if ($.trim($("input[name=RPEmail]").val()).length == 0) {
        alert("이메일을 입력해주세요.");
        return false;
    }

    if ($.trim($("input[name=RPUserName]").val()).length == 0) {
        alert("성함을 입력해주세요.");
        return false;
    }
};

$('.close').click(function(){
    $('.all *').toggleClass("all-modal-opacity");
    $('.all *').toggleClass("all-modal");
    
    $('.all *').on('transitionend', function(e){
        $('.all *').toggleClass("unstaged");
        $('.all *').off('transitionend',arguments.callee);
    });
    $('.name-data').text('');
    $('.email-data').text('');
})
