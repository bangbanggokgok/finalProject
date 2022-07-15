// 문의 게시글 상세조회 목록으로
(function(){
    const goToList = document.getElementById("goToList");

    if(goToList != null){
        goToList.addEventListener("click", function(){
            ///myPage/inquiry/detail/1?cp=1
            ///myPage/inquiry?cp=1

            const pathname = location.pathname;
            let url = pathname.substring(0,  pathname.indexOf("/", 1));
            const params = new URL(location.href).searchParams;
            let cp = "cp=" + params.get("cp");
            
            url += "/myPage/inquiry?"+cp;
            location.href = url;
        });
    }
})();


// 게시글 작성 검사
function q_writeValidate(){
    const qTitle = document.getElementsByClassName("titleInput")[0];
    const qContent = document.getElementsByClassName("content")[0];

    if(qTitle.value.trim().length == 0){
        alert("제목을 입력해주세요.");
        qTitle.value = "";
        qTitle.focus();
        qTitle.style.border = "2px solid #bbd0ff";
        return false;
    }

    if(qContent.value.trim().length == 0){
        alert("내용을 입력해주세요.");
        qContent.value = "";
        qContent.focus();
        qContent.style.border = "2px solid #bbd0ff";
        return false;
    }
    return true;
}
