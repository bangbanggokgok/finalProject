
// 네비에서 코스 클릭 시
function located(num){

    $.ajax({
        url : "moveline-main/list"

    })

}






// 썸네일 클릭 시 확대 이벤트 
// 즉시 실행 함수
(function(){
    const thumbnail = document.getElementsByClassName("list-thumbnail");

    if(thumbnail.length > 0){ // 목록에 썸네일 이미지가 있을 경우에만 이벤트 추가
      
        const modal = document.querySelector('.modal');
        const modalImage = document.getElementById("modal-image");
        const modalClose = document.getElementById("modal-close");

        for(let th of thumbnail){
            th.addEventListener("click", function(){
                modalImage.setAttribute("src", th.getAttribute("src") );
               
                modal.classList.toggle('show'); // add
            });
        }

        // X버튼
        modalClose.addEventListener("click", function(){
            
            modal.classList.toggle('hide'); // hide 클래스 추가

            setTimeout(function(){ // 0.45초 후 동작
                modal.classList.toggle('hide'); // hide 클래스 제거

                modal.classList.toggle('show'); // remove
            }, 450);
        });


    }

})();