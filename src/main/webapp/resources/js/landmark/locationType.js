function searchingLocation(locationNum) {

    $.ajax({
        url: "nsync/" + locationNum,
        type: "GET",
        data: { "locationNum": locationNum },
        dataType: "JSON",
        success: function (map) {
   
            let changeLandMarkList ='';
            let landMarkList = map.landMarkList;
            
            if(landMarkList.length > 0){
                $.each(landMarkList, function(key, value){      
                    changeLandMarkList += '<ol class="image-list grid-view" id="landMakrList">';
                    changeLandMarkList += '<li class="land-row">';    
                    changeLandMarkList += '<figure>';
                    changeLandMarkList += '<a="../detail/'+value.locationType+'/'+value.landMarkNo+'">';
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
            }
            $(landMarkHtml).html(changeLandMarkList)
        }
    })
}