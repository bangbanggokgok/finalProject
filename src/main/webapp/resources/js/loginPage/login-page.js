
function handler(index) {
    $(".controller").children().removeClass("selected-div");
    $(".controller").children().eq(index).addClass("selected-div");
    $(".content").children().addClass("hidden-object");
    $(".content").children().eq(index).removeClass("hidden-object");
    $("input").val("");
};

function findEmail() {

    const userTel = $("input[name=userTel]").val();
    const uesrName = $("input[name=uesrName]").val();

    if ($.trim(userTel).length == 0) {
        alert("해당 전화번호를 기입해주세요.");
        return false;
    }
    if ($.trim(uesrName).length == 0) {
        alert("가입했던 성함을 입력해주세요.");
        return false;
    }

    // 이메일찾는 함수
    // 모달 실험해야함
    $.ajax({
        url:"login-page/find-email",
        type: "POST",
        data: {"userTel": userTel,
               "userName" : userName},
        success : function(a){
            $('.all').children().toggleClass("all-modal");
            $('.all').children().children().toggleClass("all-modal");
            $('.all').children().children().children().toggleClass("all-modal");
        },
        error: function(){

        }
    })
};

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
})

// 모달테스트용
$("#a").click(function(){
    $('.all *').toggleClass("unstaged");
    $('.all *').toggleClass("all-modal-opacity");
    $('.all *').toggleClass("all-modal");
})