


const notice = document.getElementById("notice");
let allPage = document.getElementById("allPage");

notice.addEventListener("click", function(){

    $.ajax({
        url : contextPath + "/notice/{list}/1",
        data : "",
        dataType: "JSON",
        success : function(result){
            
            if(result != null){
                let noticeList = result.allNoticeList;
                let paging = result.pagination;

                const noticePage = document.getElementById("noticePage");
                const pagination = document.getElementById("pagination");
                
                noticePage.innerHTML = "";
                pagination.innerHTML = "";
                for(let list of noticeList){
                    
                    // 내용
                    const noticeRow = document.createElement("li");
                    noticeRow.classList.add("noticeRow");
                    noticePage.append(noticeRow);

                    const titleWrapper = document.createElement("li");
                    titleWrapper.classList.add("titleWrapper");
                    noticeRow.append(titleWrapper);

                    const noticeBadge = document.createElement("span");
                    noticeBadge.classList.add("noticeBadge");
                    if(list.noticeType = "notice"){
                        noticeBadge.innerHTML = "공지";
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
});