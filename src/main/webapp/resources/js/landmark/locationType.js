function searchingLocation(locationNum){
    
    $.ajax({
        url: "list/"+locationNum,
        type: "GET",
        data: { "locationNum": locationNum
                 },
        dataType: "JSON",
        success:function(landList){

            const landMakrList = doument.getElementById(landMakrList);

            for(let landMakrList of landList){
                
                const landRow = document.createElement("li");
                landRow.classList.add("land-row");


                const landMarkImage =document.createElement("img");
                 landMarkImage.setAttribute("src", contextPath + landMark.landMarkImage);

                const landMarkContent = document.createElement("figcaption");
                landMarkContent.classList.add("land-Title");
                landMarkContent.classList.add("land-content");
                


            }

            landMakrList.append(landRow);

        }
    })
}