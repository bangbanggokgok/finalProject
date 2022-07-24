$(".list div").click(function () {
    let selectUser = $(this).attr("value");
    // console.log(list);
    // let url = list;
    console.log("selectUser : " + selectUser);
    $.ajax({
        url : contextPath + "/admin/user/situation/{list}",
        data : {"selectUser" : selectUser},
        dataType: "JSON",
        success : function(result){
            if(result != null){
                console.log(result);
                const userPage = document.getElementById("userPage");
                const pagination = document.getElementById("pagination");
                userPage.innerHTML = "";
                pagination.innerHTML = "";

                let user = result.userList;
                let paging = result.pagination;
                let url = list;
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
                 const startPage = document.createElement("li");
                 pagination.append(startPage);

                 const startPageA = document.createElement("a");
                 startPageA.setAttribute("href",  "type/" +url + "?cp=1");
                 startPageA.innerHTML = "&lt;&lt;";
                 startPage.append(startPageA);

                 const prevPage = document.createElement("li");
                 pagination.append(prevPage);

                 const prevPageA = document.createElement("a");
                 prevPageA.setAttribute("href", "/type/"+ url + paging.startPage);
                 prevPageA.innerHTML = "&lt;";
                 prevPage.append(prevPageA);

                 for(let i=paging.startPage; i <= paging.endPage; i++){

                     if(i === paging.currentPage){
                         const current = document.createElement("li");
                         pagination.append(current);

                         const currentA = document.createElement("a");
                         currentA.classList.add("current");
                         currentA.innerHTML = i;
                         current.append(currentA);
                     } else{
                         const li = document.createElement("li");
                         pagination.append(li);

                         const liA = document.createElement("a");
                         liA.setAttribute("href", "type/${list}?cp=" + i);
                         liA.innerHTML = i;
                         li.append(liA);
                     }
                 }
                 const nextPage = document.createElement("li");
                 pagination.append(nextPage);

                 const nextPageA = document.createElement("a");
                 nextPageA.setAttribute("href", "type/${list}?cp=" + paging.nextPage);
                 nextPageA.innerHTML = "&gt";
                 nextPage.append(nextPageA);

                 const maxPage = document.createElement("li");
                 pagination.append(maxPage);

                 const maxPageA = document.createElement("a");
                 maxPageA.setAttribute("href", "type/${list}?cp=" + paging.maxPage);
                 maxPageA.innerHTML = "&gt;&gt;";
                 maxPage.append(maxPageA)

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