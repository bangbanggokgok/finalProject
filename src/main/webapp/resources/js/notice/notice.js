const event = document.getElementById("event");
const notice = document.getElementById("notice");
const all = document.getElementById("all");

$(".list div").click(function () {
    let selectType = $(this).attr("value");
    if(selectType === 'notice'){
        notice.style.color = "rgb(51, 151, 255)";
        event.style.color = "black";
        all.style.color = "black";
    } else if(selectType === 'event'){
        event.style.color = "rgb(51, 151, 255)";
        notice.style.color = "black";
        all.style.color = "black"
    } else{
        all.style.color = "rgb(51, 151, 255)";
        notice.style.color = "black";
        event.style.color = "black";
    }
});




function noticeType(selectType, cp){
// $(document).ready(function () {
        $(".list div").click(function () {
            let selectType = $(this).attr("value");
            $.ajax({
                url : contextPath + "/notice/type/{list}",
                data : {selectType : selectType, cp : cp}, 
                dataType: "JSON",
                success : function(result){
                    if(result != null){
                        let noticeList = result.allNoticeList;
                        let paging = result.pagination;
                        let cp = paging.currentPage;
                        console.log(paging);
                        const noticePage = document.getElementById("noticePage");
                        const pagination = document.getElementById("pagination");
                        noticePage.innerHTML = "";
                        // pagination.innerHTML = "";
                        const pageList = document.getElementsByClassName("pagination-area")[0];                    
                        pageList.innerHTML = "";
                        for(let list of noticeList){
                            // 내용
                            const noticeRow = document.createElement("li");
                            noticeRow.classList.add("noticeRow");
                            noticePage.append(noticeRow);
    
                            const titleWrapper = document.createElement("li");
                            titleWrapper.classList.add("titleWrapper");
                            noticeRow.append(titleWrapper);
    
                            const noticeBadge = document.createElement("span");
                            if(list.noticeType === "notice"){
                                noticeBadge.classList.add("noticeBadge");
                                noticeBadge.innerHTML = "공지";
                            } else{
                                noticeBadge.classList.add("eventBadge");
                                noticeBadge.innerHTML = "이벤트";
                            }
                            titleWrapper.append(noticeBadge);
    
                            const noticeTitle = document.createElement("p");
                            noticeTitle.classList.add("noticeTitle");
                            titleWrapper.append(noticeTitle);
    
                            const noticeTitleA = document.createElement("a");
                            noticeTitleA.setAttribute("href", "../notice/detail/" + list.noticeNo)
                            noticeTitleA.innerHTML = list.noticeTitle;
                            noticeTitle.append(noticeTitleA);

                            const noticeDate = document.createElement("p");
                            noticeDate.classList.add("noticeDate");
                            noticeDate.innerHTML = list.noticeCreate;
                            titleWrapper.append(noticeDate);
                        }
                        // 페이지
                        const paginationUl = document.createElement("ul");
                        pageList.append(paginationUl);
                        paginationUl.classList.add("pagination");
                        const startPage = document.createElement("li");
                        paginationUl.append(startPage);

                        const startPageA = document.createElement("a");
                        startPageA.innerHTML = "<i class='fal fa-angle-double-left'></i>";
                        startPage.append(startPageA);

                        const prevPage = document.createElement("li");
                        paginationUl.append(prevPage);

                        const prevPageA = document.createElement("a");
                        prevPageA.innerHTML = "<i class='fal fa-angle-left'></i>";
                        prevPage.append(prevPageA);

                        for(let i = paging.startPage;i<=paging.endPage;i++){
                            
                            const pageNumber = document.createElement("li");
                            const a = document.createElement("a");
                            a.innerText = i;
                            a.setAttribute("style", "cursor:pointer;");
                            // a.setAttribute("href", "#");
                            a.setAttribute("onclick", "noticeType(" + selectType + ","+ i + ")");
                            pageNumber.append(a);
                            paginationUl.append(pageNumber);
                            if(i=== paging.currentPage){
                                a.classList.add("current");
                            }
                        }
    
                        const nextPage = document.createElement("li");
                        paginationUl.append(nextPage);

                        const nextPageA = document.createElement("a");
                        nextPageA.innerHTML = "<i class='fal fa-angle-right'></i>";
                        nextPage.append(nextPageA);

                        const endPage = document.createElement("li");
                        paginationUl.append(endPage);

                        const endPageA = document.createElement("a");
                        endPageA.innerHTML = "<i class='fal fa-angle-double-right'></i>";
                        endPage.append(endPageA);
    
                    } else { 
                        alert("실패.");
                    }
    
                },
    
                error : function(req, status, error){
                    console.log("예외")
                    console.log(req.responseText);
                }
            })
        })
    // })
};
