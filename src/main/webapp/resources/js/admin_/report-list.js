
const reportFlag = document.getElementById("wait");

reportFlag.addEventListener("click", function(){ 
    console.log('${reportList.reportNo}');
    //"reportNo" : reportNo,
    
    console.log(reportList.reportNo)

    $.ajax({
        url : contextPath + "/admin/report/situation",
        data : "",
        type : "get",
        success : function(result){
            
            if(result > 0){ 

                alert("처리 되었습니다.");

                

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
