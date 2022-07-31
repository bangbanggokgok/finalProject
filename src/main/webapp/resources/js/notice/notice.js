const notice = document.getElementsByClassName("notice")[0]
const event = document.getElementsByClassName("event")[0]
const all = document.getElementsByClassName("all")[0]
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


$(document).on("click",".type",function(){
    let selectType = $(this).attr("value");
    let cp = $(this).attr("id");
    $.ajax({
        url : contextPath + "/notice/type/{list}",
        data : {"selectType" : selectType, "cp" : cp}, 
        dataType: "JSON",
        success : function(result){
            if(result != null){
                const noticeList = result.allNoticeList;
                const paging = result.pagination;
                const noticePage = document.getElementById("noticePage");
                const pageList = document.getElementsByClassName("pagination-area")[0];                    
                noticePage.innerHTML = "";
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
                startPage.classList.add("type");
                startPage.setAttribute("value", result.allNoticeList[0].noticeType);
                startPage.setAttribute("id", paging.startPage);
                paginationUl.append(startPage);

                const startPageA = document.createElement("div");
                startPageA.innerHTML = "<i class='fal fa-angle-double-left'></i>";

                startPage.append(startPageA);

                const prevPage = document.createElement("li");
                prevPage.classList.add("type");
                prevPage.setAttribute("id", paging.prevPage);
                prevPage.setAttribute("value", result.allNoticeList[0].noticeType);
                paginationUl.append(prevPage);

                const prevPageA = document.createElement("div");
                prevPageA.innerHTML = "<i class='fal fa-angle-left'></i>";
                prevPage.append(prevPageA);

                for(let i = paging.startPage;i<=paging.endPage;i++){
                    
                    const pageNumber = document.createElement("li");
                    const a = document.createElement("div");
                    a.innerText = i;

                    pageNumber.append(a);
                    paginationUl.append(pageNumber);

                    a.classList.add("type");

                    a.setAttribute("value", result.allNoticeList[0].noticeType);
                    a.setAttribute("id", i);
                    if(i=== paging.currentPage){
                        a.classList.add("current");
                    }
                }
                
                const nextPage = document.createElement("li");
                nextPage.classList.add("type");
                nextPage.setAttribute("id", paging.nextPage);
                nextPage.setAttribute("value", result.allNoticeList[0].noticeType);
                paginationUl.append(nextPage);

                const nextPageA = document.createElement("div");
                nextPageA.innerHTML = "<i class='fal fa-angle-right'></i>";
                nextPage.append(nextPageA);

                const endPage = document.createElement("li");
                endPage.classList.add("type");
                endPage.setAttribute("id", paging.endPage);
                endPage.setAttribute("value", result.allNoticeList[0].noticeType);
                paginationUl.append(endPage);

                const endPageA = document.createElement("div");
                endPageA.innerHTML = "<i class='fal fa-angle-double-right'></i>";
                endPage.append(endPageA);
            } 
        }
    })
});



