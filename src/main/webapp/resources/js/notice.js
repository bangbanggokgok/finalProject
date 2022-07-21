

// notice.addEventListener("click", function(){ 
    
//     let noticePage = document.getElementById("noticePage");
//     let notice = document.getElementById("notice");
//     let allPage = document.getElementById("allPage");

//     if(notice.style.display == "none"){
//         		notice.style.display = "block";
//         		all.style.display = "none";}
        		// event.style.display = "block";
    // $.ajax({
    //     url : contextPath + "/notice/notice/{list}",
    //     data : {"noticeType" : notice.value},
    //     // type : "post",
    //     success : function(result){
            
    //         location.reload();
    //         $('#allNoticeWrapper').load(location.href+' allNoticeWrapper');
    //     },

    //     error : function(req, status, error){
    //         console.log("댓글 등록 실패")
    //         console.log(req.responseText);
    //     }
    // });

// });
let noticePage = document.getElementById("noticePage");
let notice = document.getElementById("notice");
let allPage = document.getElementById("allPage");

function show_noticePage(){

    let noticeValue = document.getElementById("noticeValue");
    console.log(noticeValue.value);

    }
    $.ajax({
        url : contextPath + "/notice/notice/{list}",
        data : "",
        dataType: "JSON",
        success : function(result){
            
            if(result != null){ 
                var map = result[i];
                for(var key in map){
                    console.log(this.noticeNo);
                    console.log(this.noticeType);
                    console.log(this.noticeTitle);
                }

                // document.getElementById("allPage").style.display = "none";
                // location.reload();
                // $('#allNoticeWrapper').load(location.href+' allNoticeWrapper');
                
                // document.getElementById("noticePage").style.display = "block";

                // alert("성공.");
                $.each(result['key'], function(key, value) {
                    alert(value.data);
                });	
  
                console.log(result);
            } else { 
                alert("실패.");
                console.log(result);
            }

        },

        error : function(req, status, error){
            console.log("예외")
            console.log(req.responseText);
        }
    });
