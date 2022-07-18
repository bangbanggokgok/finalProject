function searchingLocation(locationNum){
    $.ajax({
        url: "list/"+locationNum,
        type: "GET",
        data: { "locationNum": locationNum },
        dataType: "JSON",
        success:function(){

        }
    })
}