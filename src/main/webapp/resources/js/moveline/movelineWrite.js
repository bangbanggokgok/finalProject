// 사진 첨부 이미지 미리보기
const inputImage = document.getElementsByClassName("input-img");
const preview = document.getElementsByClassName("preview");
const deleteImage = document.getElementsByClassName("delete-image");
const deleteList = document.getElementById("deleteList");
const deleteSet = new Set();

for(let i=0 ; i<inputImage.length ; i++){
    inputImage[i].addEventListener("change", function(){

        if(this.files[0] != undefined){
            const reader = new FileReader();
            reader.readAsDataURL(this.files[0]);
            reader.onload = function(e){
                preview[i].setAttribute("src", e.target.result);
                deleteSet.delete(i);
            }
        } else { 
            preview[i].removeAttribute("src");
        }
    });

    // 미리보기 x 클릭
    deleteImage[i].addEventListener("click", function(){

        if(preview[i].getAttribute("src") != ""){
            preview[i].removeAttribute("src");
            inputImage[i].value = "";
            deleteSet.add(i);
        }
    });
}


// 랜드마크 선택
const landmarkList = document.getElementsByClassName("landmarkList");

for(let list of landmarkList){
    list.addEventListener("change",function(){

        if(list.value != "landmarkNull"){
            this.nextElementSibling.style.display = "block";
        } else {
            this.nextElementSibling.style.display = "none";
            this.nextElementSibling.value = "landmarkNull";
        }
    });
}


// 유효성 검사
function mlWriteValidation(){
    const titleInput = document.getElementsByClassName("titleInput")[0];
    const locationsList = document.getElementById("locations-list");
    const landmarkList1 = document.getElementById("landmark-list1");
    const landmarkList2 = document.getElementById("landmark-list2");
    const themeSelect = document.querySelectorAll('input[name="themeSelect"]:checked');
    const img0 = document.getElementById("img0");
    const content = document.getElementsByClassName("content")[0];

    if(titleInput.value.trim().length == 0){
        alert("제목을 입력해주세요.");
        titleInput.value = "";
        titleInput.focus();
        return false;
    }

    if(locationsList.value == "locationNull"){
        alert("지역을 선택해주세요.");
        return false;
    }

    if(landmarkList1.value == "landmarkNull" || landmarkList2.value == "landmarkNull"){
        alert("랜드마크는 최소 2개 이상 선택해주세요.");
        return false;
    }

    if(themeSelect.length==0){
        alert("테마를 선택해주세요.");
        return false;
    }

    if(img0.value == ""){
        alert("사진을 1장 이상 첨부해주세요.");
        return false;
    }
    
    if(content.value.trim().length == 0){
        alert("내용을 입력해주세요.");
        content.value = "";
        content.focus();
        return false;
    }
    return true;
}
