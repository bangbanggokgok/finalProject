const event = document.getElementById("event");
const notice = document.getElementById("notice");
const all = document.getElementById("all");

$(".list div").click(function () {
    let selectType = $(this).attr("value");
    // console.log(selectType);

    if(selectType === 'notice'){
        notice.style.color = "rgb(51, 151, 255)";
        event.style.color = "black";
        all.style.color = "black";
    } else if(selectType === 'event'){
        event.style.color = "rgb(51, 151, 255)";
        notice.style.color = "black";
        all.style.color = "black"
        // console.log(page);
    } else{
        all.style.color = "rgb(51, 151, 255)";
        notice.style.color = "black";
        event.style.color = "black";
    }
});




// function loadLocation(cp){
$(document).ready(function () {
        $(".list div").click(function () {
            let selectType = $(this).attr("value");
            // console.log(list);
            let url = list;
            let paginBtn = '';
            $.ajax({
                url : contextPath + "/notice/type/{list}",
                data : {"selectType" : selectType, "cp" : cp}, 
                dataType: "JSON",
                success : function(result){
                    // console.log(result);
                    if(result != null){
                        let noticeList = result.allNoticeList;
                        let paging = result.pagination;
    
                        const noticePage = document.getElementById("noticePage");
                        const pagination = document.getElementById("pagination");
                        // console.log(paging);
                        noticePage.innerHTML = "";
                        // pagination.innerHTML = "";
                        const pageList = document.getElementsByClassName("pagination-area")[0];                    
                        pageList.innerHTML = "";
                        for(let list of noticeList){
                            console.log(list.noticeTitle);
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
                        for(let i = 0;i<paging.endPage;i++){
                            let j = i+1
                            const pageNumber = document.createElement("li");
                            const a = document.createElement("a");
                            a.innerText = j;
                            a.setAttribute("onclick", "loadLocation(" + j + ")");
                            a.setAttribute("style", "cursor:pointer;");
                            pageNumber.append(a);
                            paginationUl.append(pageNumber);
                        }
    
                        paginationUl.classList.add("pagination");
                        pageList.append(paginationUl);
                        // document.getElementsByClassName("container")[1].append(pageList);
    
    
                        // for (let num = paging.startpage; num <= paging.endpage; num++){
                    
                        //     if(num == 1){
                        //         paginBtn += '<a href="#" onclick="pageprev(' + locationNum + ', ' + selectnum + ')" >' + '&lt' + '</a>';
                        //     }
                         
                        //     if (num == page){
                        //         paginBtn += '<a href="#" onclick="searchingLocation(' + locationNum + ', ' + num + '); return false;" class="selectpage">' + num + '</a>';
                        //     }else{
                        //         paginBtn += '<a href="#" onclick="searchingLocation(' + locationNum + ', ' + num + '); return false;">' + num + '</a>';
                        //     }
                        //     if(num == endpage){
                        //         paginBtn += '<a href="#" onclick="pagenext(' + locationNum + ', ' + selectnum + ','+endpage+')" >' + '&gt' + '</a>';
                        //     }
                        //  }
    
    
    
    
                        // const startPage = document.createElement("li");
                        // pagination.append(startPage);
    
                        // const startPageA = document.createElement("a");
                        // startPageA.setAttribute("href",  "type/" +url + "?cp=1");
                        // startPageA.innerHTML = "&lt;&lt;";
                        // startPage.append(startPageA);
    
                        // const prevPage = document.createElement("li");
                        // pagination.append(prevPage);
    
                        // const prevPageA = document.createElement("a");
                        // prevPageA.setAttribute("href", "/type/"+ url + paging.startPage);
                        // prevPageA.innerHTML = "&lt;";
                        // prevPage.append(prevPageA);
    
                        // for(let i=paging.startPage; i <= paging.endPage; i++){
    
                        //     if(i === paging.currentPage){
                        //         const current = document.createElement("li");
                        //         pagination.append(current);
    
                        //         const currentA = document.createElement("a");
                        //         currentA.classList.add("current");
                        //         currentA.innerHTML = i;
                        //         current.append(currentA);
                        //     } else{
                        //         const li = document.createElement("li");
                        //         pagination.append(li);
    
                        //         const liA = document.createElement("a");
                        //         liA.setAttribute("onclick", "loadLocation(" + i + 1 + ")");
                        //         liA.setAttribute("style", "cursor:pointer;");
                        //         // liA.setAttribute("href", "type/${list}?cp=" + i);
                        //         liA.innerHTML = i;
                        //         li.append(liA);
                        //         console.log(paging);
                        //     }
                        // }
                        // const nextPage = document.createElement("li");
                        // pagination.append(nextPage);
    
                        // const nextPageA = document.createElement("a");
                        // nextPageA.setAttribute("href", "type/${list}?cp=" + paging.nextPage);
                        // nextPageA.innerHTML = "&gt";
                        // nextPage.append(nextPageA);
    
                        // const maxPage = document.createElement("li");
                        // pagination.append(maxPage);
    
                        // const maxPageA = document.createElement("a");
                        // maxPageA.setAttribute("href", "type/${list}?cp=" + paging.maxPage);
                        // maxPageA.innerHTML = "&gt;&gt;";
                        // maxPage.append(maxPageA)
    
    
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
    });
// };
