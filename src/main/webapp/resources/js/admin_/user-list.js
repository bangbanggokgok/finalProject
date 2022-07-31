
$(".list div").click(function () {
    let register = document.getElementsByClassName("register")[0];
    let secession = document.getElementsByClassName("secession")[0];
    let all = document.getElementById("all");
    let selectType = $(this).attr("value");
    if(selectType === 'register'){
        register.style.color = "rgb(51, 151, 255)";
        secession.style.color = "black";
        all.style.color = "black";
    } else if(selectType === 'secession'){
        secession.style.color = "rgb(51, 151, 255)";
        register.style.color = "black";
        all.style.color = "black"
    } else{
        all.style.color = "rgb(51, 151, 255)";
        secession.style.color = "black";
        register.style.color = "black";
    }
});

$(document).on("click",".type",function(){
    let selectUser = $(this).attr("value");
    let cp = $(this).attr("id");
    $.ajax({
        url : contextPath + "/admin/user/situation/{list}",
        data : {"selectUser" : selectUser, "cp":cp},
        dataType: "JSON",
        success : function(result){
            if(result != null){
                const userPage = document.getElementById("userPage");
                const pageList = document.getElementsByClassName("pagination-area")[0];
                userPage.innerHTML = "";
                pageList.innerHTML = "";

                const user = result.userList;
                const paging = result.pagination;
                for(let list of user){
                    const li = document.createElement("li");
                    userPage.append(li);

                    const contentWrapper = document.createElement("div");
                    contentWrapper.classList.add("contentWrapper");
                    li.append(contentWrapper);

                    const userNo = document.createElement("span");
                    userNo.classList.add("userNo");
                    userNo.innerHTML = list.userNo;
                    contentWrapper.append(userNo);

                    const userName = document.createElement("span");
                    userName.classList.add("title");
                    userName.innerHTML = list.userName;
                    contentWrapper.append(userName);
                    
                    const userEmail = document.createElement("span");
                    userEmail.classList.add("title");
                    userEmail.innerHTML = list.userEmail;
                    contentWrapper.append(userEmail);
                    
                    const registDate = document.createElement("span");
                    registDate.classList.add("title");
                    registDate.innerHTML = list.registDate;
                    contentWrapper.append(registDate);
                    
                    const secessionDate = document.createElement("span");
                    secessionDate.classList.add("title");
                    if(!list.secessionDate){
                        secessionDate.innerText = "-";
                    }else{
                        secessionDate.innerHTML = list.secessionDate;
                    }
                    contentWrapper.append(secessionDate);
                }
                 // 페이지

                const paginationUl = document.createElement("ul");
                pageList.append(paginationUl);
                paginationUl.classList.add("pagination");

                const startPage = document.createElement("li");
                startPage.classList.add("type");
                
                startPage.setAttribute("id", paging.startPage);
                paginationUl.append(startPage);

                const startPageA = document.createElement("div");
                startPageA.innerHTML = "<i class='fal fa-angle-double-left'></i>";

                startPage.append(startPageA);

                const prevPage = document.createElement("li");
                prevPage.classList.add("type");
                prevPage.setAttribute("id", paging.prevPage);
                paginationUl.append(prevPage);

                const prevPageA = document.createElement("div");
                prevPageA.innerHTML = "<i class='fal fa-angle-left'></i>";
                prevPage.append(prevPageA);

                const a = document.createElement("div");
                for(let i = paging.startPage;i<=paging.endPage;i++){
                    
                    const pageNumber = document.createElement("li");
                    a.innerText = i;

                    pageNumber.append(a);
                    paginationUl.append(pageNumber);

                    a.classList.add("type");

                    
                    a.setAttribute("id", i);
                    if(i=== paging.currentPage){
                        a.classList.add("current");
                    }
                }
                
                const nextPage = document.createElement("li");
                nextPage.classList.add("type");
                nextPage.setAttribute("id", paging.nextPage);
                paginationUl.append(nextPage);

                const nextPageA = document.createElement("div");
                nextPageA.innerHTML = "<i class='fal fa-angle-right'></i>";
                nextPage.append(nextPageA);

                const endPage = document.createElement("li");
                endPage.classList.add("type");
                endPage.setAttribute("id", paging.endPage);
                
                paginationUl.append(endPage);

                const endPageA = document.createElement("div");
                endPageA.innerHTML = "<i class='fal fa-angle-double-right'></i>";
                endPage.append(endPageA);
                console.log(selectUser=="register");
                console.log(result.pagination);
                if(selectUser == "register"){
                    startPage.setAttribute("value", "register");
                    prevPage.setAttribute("value", "register");
                    a.setAttribute("value", "register");
                    nextPage.setAttribute("value", "register");
                    endPage.setAttribute("value", "register");
                }else{
                    startPage.setAttribute("value", "secession");
                    prevPage.setAttribute("value", "secession");
                    a.setAttribute("value", "secession");
                    nextPage.setAttribute("value", "secession");
                    endPage.setAttribute("value", "secession");
                }
                console.log(startPage);
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