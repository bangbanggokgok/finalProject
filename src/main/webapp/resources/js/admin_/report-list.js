
const reportFlag = document.getElementById("wait");


$("#wait").click(function () {
    
    let reportNo = $(this).attr("value");
    console.log(reportNo);
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
    });

});
