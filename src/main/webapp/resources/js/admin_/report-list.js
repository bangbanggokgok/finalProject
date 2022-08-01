
$(document).on("click","#wait",function(){
    if(confirm("신고처리 하시겠습니까?") == true){
        let reportNo = $(this).attr("value");
        $.ajax({
            url : contextPath + "/admin/report/situation",
            data : {"reportNo" : reportNo },
            type : "get",
            success : function(result){
                
                if(result > 0){ 
                    alert("처리 되었습니다.");
    
                    location.reload();
                    $('.noticePage').load(location.href+' noticePage');
                } else { 
                    alert("처리 실패.");
                    console.log(result);
                }
            },
    
            error : function(req, status, error){
                console.log("신고 처리 실패")
                console.log(req.responseText);
            }
        })
    } else{
        return false;
    }

});
