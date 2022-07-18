function searchingLocation(locationNum){
    
    $.ajax({
        url: "list/"+locationNum,
        type: "GET",
        data: { "locationNum": locationNum },
        dataType: "JSON",
        success:function(result){
            
            const landMarkList = document.getElementById("landMarkList");

            for(let landMark of result.landMarkList){
                
                // const landRow = document.createElement("li");
                // landRow.classList.add("land-row");


                // const landMarkImage = document.createElement("img");
                // landMarkImage.setAttribute("src", contextPath + landMark.landMarkImage);

                // const landMarkContent = document.createElement("figcaption");
                // landMarkContent.classList.add("land-Title");
                // landMarkContent.classList.add("land-content");
                
                // landMarkList.append(landRow);
                // 요소 생성은 여기서 차근차근 해보십시오
            }
        }
    })
}