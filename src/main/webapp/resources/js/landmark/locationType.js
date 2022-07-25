function searchingLocation(locationNum, num) {

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
            }
        })
    }


function loadLocation(locationNum, num) {
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

            // let slideList = map.rankLandMarkList;
            // let i = 0;
            // let slide = '';
            
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
            //  for(i; i <= 5; i++ ){
                // slide += '<li class="slide">';    
                // slide += '<img class="slide-img" alt="first_img" src="'+contextPath+slideList[i].thumbnail+'">';
                // slide += '</li>';
            //  }
             $(landMarkHtml).html(changeLandMarkList)
             $(pagination).html(paginBtn)
            //  $(slideHtml).html(slide)
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
