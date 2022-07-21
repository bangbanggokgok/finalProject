const addReply = document.getElementById("addReply");
const replyContent = document.getElementById("replyContent");

addReply.addEventListener("click", function(){ 

    if(replyContent.value.trim().length == 0){ 
        alert("답변을 작성 해 주세요.");

        replyContent.value = ""; 
        replyContent.focus();
        return;
    }

    $.ajax({
        url : contextPath + "/admin/qna/insert",
        data : {"questionAnswer" : replyContent.value,
                "userNo" : userNo,
                "questionNo" : questionNo },
        type : "post",
        success : function(result){
            
            if(result > 0){ 

                alert("답변이 등록되었습니다.");

                 location.reload();
                $('#answer').load(location.href+' answer');

            } else { 
                alert("답변 등록에 실패하였습니다.");
                console.log(result);
            }
        },

        error : function(req, status, error){
            console.log("댓글 등록 실패")
            console.log(req.responseText);
        }
    });

});