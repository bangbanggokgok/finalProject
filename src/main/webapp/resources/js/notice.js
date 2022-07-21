


const notice = document.getElementById("notice");
const event = document.getElementById("event");
const all = document.getElementById("all");

$(document).ready(function () {
    $(".list div").click(function () {
        
        let selectType = $(this).attr("value");
        console.log(selectType);
        // if(selectType = 'notice'){
        //     notice.style.color = "rgb(51, 151, 255)";
        //     event.style.color = "black";
        //     all.style.color = "black";
        // } else{
        //     event.style.color = "rgb(51, 151, 255)";
        //     notice.style.color = "black";
        //     all.style.color = "black";

        // }

        $.ajax({
            url : contextPath + "/notice/type/{list}",
            data : {"selectType" : selectType},
            dataType: "JSON",
            success : function(result){
                
                if(result != null){
                    let noticeList = result.allNoticeList;
                    let paging = result.pagination;

                    const noticePage = document.getElementById("noticePage");
                    const pagination = document.getElementById("pagination");
                    const url = "${list}/1?cp=";
                    noticePage.innerHTML = "";
                    pagination.innerHTML = "";
                    for(let list of noticeList){
                        console.log(list.noticeType);
                        // 내용
                        const noticeRow = document.createElement("li");
                        noticeRow.classList.add("noticeRow");
                        noticePage.append(noticeRow);

                        const titleWrapper = document.createElement("li");
                        titleWrapper.classList.add("titleWrapper");
                        noticeRow.append(titleWrapper);

                        const noticeBadge = document.createElement("span");
                        if(list.noticeType = "notice"){
                            noticeBadge.classList.add("noticeBadge");
                            noticeBadge.innerHTML = "공지";
                        } else{
                            noticeBadge.classList.add("noticeEvent");
                            noticeBadge.innerHTML = "이벤트";
                        }
                        titleWrapper.append(noticeBadge);

                        const noticeTitle = document.createElement("p");
                        noticeTitle.classList.add("noticeTitle");
                        noticeTitle.innerHTML = list.noticeTitle;
                        titleWrapper.append(noticeTitle);

                        const noticeDate = document.createElement("p");
                        noticeDate.classList.add("noticeDate");
                        noticeDate.innerHTML = list.noticeCreate;
                        titleWrapper.append(noticeDate);
                    }
                    // 페이지
                    const startPage = document.createElement("li");
                    pagination.append(startPage);

                    const startPageA = document.createElement("a");
                    startPageA.setAttribute("href", "${url}1");
                    startPageA.innerHTML = "&lt;&lt;";
                    startPage.append(startPageA);

                } else { 
                    alert("실패.");
                }

            },

            error : function(req, status, error){
                console.log("예외")
                console.log(req.responseText);
            }
        });
    })
});
