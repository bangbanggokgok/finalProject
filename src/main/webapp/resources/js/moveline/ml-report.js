let contentField = document.getElementById("contentField");
let etc = document.getElementById("etc");

let report = document.querySelectorAll('input[name="report"]:checked').length;
function Onsave(){
    let report = document.querySelectorAll('input[name="report"]:checked').length;
    if(report == 0){
        alert("신고사유를 선택해주세요.");
        return false;
    }
}



$("input:radio[name=report]").click(function(){
    if($("input[name=report]:checked").val() == "기타"){
        contentField.style.display = "block";
        $('#etc').val(document.getElementById('content').value);
        console.log(etc);
    }else{
        contentField.style.display = "none";
        $('#etc').val("기타");
    }
});
