<<<<<<< HEAD
function searchingLocation(locationNum) {
  $.ajax({
    url: "nsync/" + locationNum,
    type: "GET",
    data: { locationNum: locationNum },
    dataType: "JSON",
    success: function (map) {
      // const landMarkList = document.getElementById("landMarkList");
      // 이 요소는 좀 생각해봐야할지도
      const ol = document.getElementById("landMakrList");
      ol.innerHTML = "";
      //이거 맞던가
      if (map.landMarkList != "") {
        for (let landMark of map.landMarkList) {
          // console.log(map.landMarkList);
          // console.log(landMark);
          // const landRow = document.createElement("li");
          // landRow.classList.add("land-row");

          // ol.append(landRow);

          // const figure = document.createElement("figure")
          // const landMarkImage = document.createElement("img");
          // landMarkImage.setAttribute("src",landMark.thumbnail);
          // figure.append(landMarkImage);
          // console.log(landMark.thumbnail);

          // const figcaption = document.createElement("figcaption");
          // figcaption.classList.add("landMark");
          // // 아이디 어케주더라

          // const landMarkTitle = document.createElement("p");
          // landMarkTitle.innerText = landMark.landMarkTitle;
          // landMarkTitle.classList.add("land-Title");
          // console.log(landMark.landMarkTitle);

          // const landMarkContent = document.createElement("p");
          // landMarkContent.innerText = landMark.landMarkContent;
          // landMarkContent.classList.add("land-content");
          // console.log(landMark.landMarkContent);

          // figcaption.append(landMarkTitle,landMarkContent);

          // landRow.append(figure,figcaption);

          // 빠진거 있는지 봐봐야겟네요

          const li = document.createElement("li");
          const figure = document.createElement("figure");
          const img = document.createElement("img");
          const a = document.createElement("a");
          a.append(img);
          a.setAttribute(
            "href",
            "../detail/" + locationNum + "/" + landMark.landMarkNo
          );
          const figcaption = document.createElement("figcaption");
          const p1 = document.createElement("p");
          const p2 = document.createElement("p");
          li.classList.add("land-row");
          li.append(figure);
          figure.append(a);
          img.setAttribute("src", contextPath + landMark.thumbnail);
          figure.append(figcaption);
          p1.classList.add("land-Title");
          p1.innerText = landMark.landMarkName;
          p2.classList.add("land-content");
          p2.innerText = landMark.landMarkContent;
          figcaption.classList.add("landMark");
          figcaption.append(p1);
          figcaption.append(p2);
          ol.append(li);
          //일단 여기까지 합시다
=======
function searchingLocation(locationNum, num) {
    console.log('dd');
    console.log(locationNum);
    console.log(num);

    $.ajax({
        url: "nsync/" + locationNum,
        type: "GET",
        data: { "locationNum": locationNum,
                "page" : num  },
        dataType: "JSON",
        success: function (map) {

            let selectnum = num;
            let paginBtn = '';
            let changeLandMarkList ='';
            let page = map.page;
            let startpage = map.startpage;
            let endpage = map.endpage;
            let landMarkList = map.landMarkList;
            
            

            if(landMarkList.length > 0){
                
                const cutlandMarkList = chunk(landMarkList, 9);
               

                $.each(cutlandMarkList[num - 1], function(key, value){      
                    
                    changeLandMarkList += '<ol class="image-list grid-view" id="landMakrList">';
                    changeLandMarkList += '<li class="land-row">';    
                    changeLandMarkList += '<figure>';
                    changeLandMarkList += '<a href="../detail/'+value.locationType+'/'+value.landMarkNo+'">';
                    changeLandMarkList += '<img src="'+contextPath+value.thumbnail+'">';
                    changeLandMarkList += '</a>';
                    changeLandMarkList += '<figcaption class="landMark">';
                    changeLandMarkList += '<p class="land-Title">'+value.landMarkName+'</p>';
                    changeLandMarkList += '<p class="land-content">'+value.landMarkContent+'</p>';
                    changeLandMarkList += '</figcpation>';
                    changeLandMarkList += '</figure>';
                    changeLandMarkList += '</li>';
                    changeLandMarkList += '</ol>';
                });
            }else{
                changeLandMarkList += '<h1 style="display:flex;justify-content: center;">아직 등록된 랜드마크가 없어요.</h1>'
            };
            for (let num = startpage; num <= endpage; num++){
                
                if(num == 1){
                    paginBtn += '<a href="#" onclick="pageprev(' + locationNum + ', ' + selectnum + ')" >' + '&lt' + '</a>';
                }
             
                if (num == page){
                    paginBtn += '<a href="#" onclick="searchingLocation(' + locationNum + ', ' + num + '); return false;" class="selectpage">' + num + '</a>';
                }else{
                    paginBtn += '<a href="#" onclick="searchingLocation(' + locationNum + ', ' + num + '); return false;">' + num + '</a>';
                }
                if(num == endpage){
                    paginBtn += '<a href="#" onclick="pagenext(' + locationNum + ', ' + selectnum + ','+endpage+')" >' + '&gt' + '</a>';
                }
             }

             

            $(landMarkHtml).html(changeLandMarkList)
            $(pagination).html(paginBtn)
>>>>>>> e40b918 (페이지네이션, 링크 수정)
        }
      }
      if (map.landMarkList == "") {
        ol.innerHTML =
          '<h1 style="display:flex;justify-content: center;">아직 등록된 랜드마크가 없어요.</h1>';
      }
      document.getElementById("zoneTitle").innerText =
        document.getElementsByClassName("clicked")[0].innerText;
    },
  });
}
<<<<<<< HEAD
=======

function loadLocation(locationNum, num) {
    console.log(locationNum);
    $.ajax({
        url: "nsync/" + locationNum,
        type: "GET",
        data: { "locationNum": locationNum,
                "page" : num  },
        dataType: "JSON",
        success: function (map) {
            
            // console.log(map.rankLandMarkList);
            
            let selectnum = num;
            let paginBtn = '';
            let changeLandMarkList ='';
            let page = map.page;
            let startpage = map.startpage;
            let endpage = map.endpage;
            let landMarkList = map.landMarkList;

            let slideList = map.rankLandMarkList;
            let i = 0;
            let slide = '';
            
            if(landMarkList.length > 0){
                
                const cutlandMarkList = chunk(landMarkList, 9);
                $.each(cutlandMarkList[0], function(key, value){      
                    
                    changeLandMarkList += '<ol class="image-list grid-view" id="landMakrList">';
                    changeLandMarkList += '<li class="land-row">';    
                    changeLandMarkList += '<figure>';
                    changeLandMarkList += '<a href="../detail/'+value.locationType+'/'+value.landMarkNo+'">';
                    changeLandMarkList += '<img src="'+contextPath+value.thumbnail+'">';
                    changeLandMarkList += '</a>';
                    changeLandMarkList += '<figcaption class="landMark">';
                    changeLandMarkList += '<p class="land-Title">'+value.landMarkName+'</p>';
                    changeLandMarkList += '<p class="land-content">'+value.landMarkContent+'</p>';
                    changeLandMarkList += '</figcpation>';
                    changeLandMarkList += '</figure>';
                    changeLandMarkList += '</li>';
                    changeLandMarkList += '</ol>';
                });

            }else{
                changeLandMarkList += '<h1 style="display:flex;justify-content: center;">아직 등록된 랜드마크가 없어요.</h1>'
            };
            for (let num = startpage; num <= endpage; num++){

                if(num == 1){
                    paginBtn += '<a href="#" onclick="pageprev(' + locationNum + ', ' + selectnum + ')" >' + '&lt' + '</a>';
                }
             
                if (num == page){
                    paginBtn += '<a href="#" onclick="searchingLocation(' + locationNum + ', ' + num + '); return false;" class="selectpage">' + num + '</a>';
                }else{
                    paginBtn += '<a href="#" onclick="searchingLocation(' + locationNum + ', ' + num + '); return false;">' + num + '</a>';
                }
                if(num == endpage){
                    paginBtn += '<a href="#" onclick="pagenext(' + locationNum + ', ' + selectnum + ','+endpage+')" >' + '&gt' + '</a>';
                }

             }
             for(i; i <= 5; i++ ){
                console.log(slideList[i].thumbnail);
                slide += '<li class="slide">';    
                slide += '<img class="slide-img" alt="first_img" src="'+contextPath+slideList[i].thumbnail+'">';
                slide += '</li>';
             }
             $(landMarkHtml).html(changeLandMarkList)
             $(pagination).html(paginBtn)
             $(slideHtml).html(slide)
        }
    })
}

function pageprev(locationNum,num){

    if(num == 1){
        alert("첫번째 페이지입니다.");
        return false;
    }

    searchingLocation(locationNum,num - 1);

    return true;
}
function pagenext(locationNum,num,endpage){


    if(num == endpage){
        alert("마지막 페이지입니다.");
        return false;
    }

    searchingLocation(locationNum,num + 1);

    return true;
}

function chunk(arr, size) {
    let i = []
    let j = []
    let temparray = []
    let chunk = size;
    for (i = 0, j = arr.length; i < j; i += chunk) {
        temparray.push(arr.slice(i, i + chunk));
    }
    return temparray
}

function movelocation(locationNum){

    localStorage.setItem("ismaincheck", true);
    
    localStorage.setItem("locationNum", locationNum);

    location.href = 'landmark-main/list/'+locationNum;
}
>>>>>>> e40b918 (페이지네이션, 링크 수정)
