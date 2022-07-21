

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
// let noticePage = document.getElementById("noticePage");
const notice = document.getElementById("notice");
let allPage = document.getElementById("allPage");

notice.addEventListener("click", function(){

    $.ajax({
        url : contextPath + "/notice/{list}/1",
        data : "",
        dataType: "JSON",
        success : function(result){
            
            if(result != null){
                console.log(result.allNoticeList[0].noticeNo);
                noticeList = result.allNoticeList;
                // console.log(noticeList[0]);
                const noticePage = document.getElementById("noticePage");
                noticePage.innerHTML = "";
                for(let list of noticeList){
                    console.log(list.noticeType);
                    // console.log(noticeList[i]);
                    // const noticeRow = document.createElement("li");
                    // noticeRow.classList.add("noticeRow");
                    // titleWrapper.innerText = list.noticeType;
                }
            
                alert("성공");
            } else { 
                alert("실패.");
            }

        },

        error : function(req, status, error){
            console.log("예외")
            console.log(req.responseText);
        }
    });
});


// function show_noticePage(){
//     }
//     $.ajax({
//         url : contextPath + "/notice/{list}/1",
//         data : "",
//         dataType: "JSON",
//         success : function(result){
            
//             if(result != null){ 
//                 console.log(result);
//                 const noticePage = document.getElementById("noticePage");
//                 noticePage.innerHTML = "";

                
              
//                 alert("성공");
//                 console.log(result);
//             } else { 
//                 alert("실패.");
//             }

//         },

//         error : function(req, status, error){
//             console.log("예외")
//             console.log(req.responseText);
//         }
//     });
