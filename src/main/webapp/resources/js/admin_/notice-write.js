//input 히든태그에 밸류 넣기
// function noticeType(num){
//     const a = document.getElementsByName("noticeType")[0];
//     if(num>0){
//         a.value = "notice";
//     };
//     if(num=0){
//         a.value = "event";
//     };
//     console.log(a.value);
// };


function drop_choiceFields(){
	let click = document.getElementById("choiceFieldsContainer");
	let icon = document.getElementById("inputField");
	if(click.style.display == "none"){
		click.style.display = "block";
		
		// icon.innerHTML = "<i class='fal fa-angle-up'></i>";
	}else{
		click.style.display = "none";
		// icon.innerHTML = "<i class='fal fa-angle-down'></i>";
	}
};


(function(){
	let click = document.getElementById("choiceFieldsContainer");
    const notice = document.getElementById("notice"); 
    const event = document.getElementById("event"); 
    const title = document.getElementById("title");
    const a = document.getElementsByName("noticeType")[0];
	notice.addEventListener("click", function(){
		
		title.innerText = "공지";
		click.style.display = "none";
		a.value = "notice";

		console.log(a.value);
	});

	event.addEventListener("click", function(){
		
		title.innerText = "이벤트";
		click.style.display = "none";
		a.value = "event";

		console.log(a.value);
	});
    
})();


const inputImage = document.getElementsByClassName("inputImage");
const preview = document.getElementsByClassName("preview");
const deleteImage = document.getElementsByClassName("delete-image");
const icon = document.getElementsByClassName("fa-plus-circle");

// 게시글 수정 시 삭제된 이미지의 레벨(위치)를 저장할 input 요소
const deleteList = document.getElementById("deleteList");

// 게시글 수정 시 삭제된 이미지의 레벨(위치)를 기록해둘 Set 생성
const deleteSet = new Set(); // 순서 X, 중복 허용 X (여러번 클릭 시 중복 값 저장 방지)

for(let i=0 ; i<inputImage.length ; i++){
    inputImage[i].addEventListener("change", function(){
        if(this.files[0] != undefined){
            const reader = new FileReader();
            reader.readAsDataURL(this.files[0]);
            reader.onload = function(e){
                preview[i].setAttribute("src", e.target.result);
                deleteSet.delete(i);
				// icon[i].remove();
            }
      
        } else { 
            preview[i].removeAttribute("src");
        }
    });

    deleteImage[i].addEventListener("click", function(){

        if( preview[i].getAttribute("src")  !=  "" ){
            preview[i].removeAttribute("src");
            inputImage[i].value = "";
            deleteSet.add(i);
        }
    });
};






// 유효성 검사
function noticeValidation(){
    const titleInput = document.getElementsByClassName("titleInput")[0];
    const content = document.getElementsByClassName("content")[0];
    const title = document.getElementById("title");
    const notice = document.getElementsByClassName("title")[1];
    const event = document.getElementsByClassName("title")[2];
    const a = document.getElementsByName("noticeType")[0];

    if(a.value.length == 0){
        alert("타입을 선택해주세요.");
        return false
    }

    if(titleInput.value.trim().length == 0){
        alert("제목을 입력해주세요.");
        titleInput.value = "";
        titleInput.focus();
        return false;
    }

    if(content.value.trim().length == 0){
        alert("내용을 입력해주세요.");
        content.focus();
        return false;
    }
    deleteList.value = Array.from(deleteSet);
    return true;
}


