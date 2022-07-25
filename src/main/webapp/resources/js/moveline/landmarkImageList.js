//  -------------------------------------------------------------

// document.addEventListener('DOMContentLoaded', function(){ 
    
    // 변수 지정
    var $slideWrap2 = document.querySelector('.container2'),
        $slideContainer2 = document.querySelector('.slider-container2'),
        $slide2 = document.querySelectorAll('.slide2'),
        $navPrev2 = document.getElementById('prev2'),
        $slideHeight2 = 0,
        $slideCount2 = $slide2.length,
        $currentIndex2 = 0,
        $timer2 = undefined,
        $pagerHTML2 = '',
        $pager2 = document.querySelector('.pager2'),
        // $pagerBtn = document.querySelectorAll('.pager span'),
        $navNext2 = document.getElementById('next2');
                   
        //슬라이드의 높이 확인하여 부모의 높이로 지정하기 - 대상.offsetHeight
        for(var i = 0; i < $slideCount2 ; i++){
           if($slideHeight2 < $slide2[i].offsetHeight){
                $slideHeight2 = $slide2[i].offsetHeight;
           }
        }

        $slideWrap2.style.height = $slideHeight2 +'px';
        $slideContainer2.style.height = $slideHeight2 +'px';

        // 슬라이드가 있으면 가로로 배열하기
        for(var a = 0; a < $slideCount2; a++){
            $slide2[a].style.left = a * 100 + '%'; 
            // <span data-idx="1">2</span>
            $pagerHTML2 += '<span data-idx="'+ a +'">'+(a+1)+'</span>';
            $pager2.innerHTML = $pagerHTML2;
        }
        var $pagerBtn2 = document.querySelectorAll('.pager2 span');
       
        
        // 슬라이드 이동 함수 
        function goToSlide(idx){
            $slideContainer2.classList.add('animated');
            $slideContainer2.style.left = -100 * idx + '%';
            $currentIndex2 = idx;        
            
            //모든 $pagerBtn에 active 제거, 클릭된 요소에만 active 추가
            for(var y = 0; y<$pagerBtn2.length; y++){
                $pagerBtn2[y].classList.remove('active');
            }
            $pagerBtn2[idx].classList.add('active');
        }//goToSlide

        goToSlide(0);

        // 버튼을 클릭하면 슬라이드 이동시키기
        $navPrev2.addEventListener('click',function(){            
            //goToSlide($currentIndex - 1);

            if($currentIndex2 == 0){
                //$navPrev.classList.add('disabled');
                goToSlide($slideCount2 - 1);
            }else{
                //$navPrev.classList.remove('disabled');
                goToSlide($currentIndex2 - 1);
            } 
        });

        $navNext2.addEventListener('click',function(){
            //goToSlide($currentIndex + 1);

           if($currentIndex2 == $slideCount2 - 1){
               // $navNext.classList.add('disabled');
               goToSlide(0);
           }else{
               // $navNext.classList.remove('disabled');
               goToSlide($currentIndex2 + 1);
           }
        });

    //자동 슬라이드
   // 4초마다 goToSlide(숫자); 0, 1, 2, 3,....5, 0
   // setInterval(할일, 4000);
   // 함수 = 할일 = function() { 실제 할일} 
   //실제 할일 = goToSlide(숫자); 0, 1, 2, 3,....5, 0


   
   //clearInterval(대상)
   // 자동 슬라이드 함수 
   function startAutoSlide(){
        $timer2 = setInterval(function(){
        //goToSlide(숫자); 0, 1, 2, 3,....5, 0
        // ci 0번 4초  1, ci 1 4초 2, .... ,ci 5 4초 , ni  0
    
        var nextIdx =($currentIndex2 + 1) % $slideCount2; // 나눈 나머지 
        goToSlide(nextIdx);
       },4000);
   }
   startAutoSlide();

   function stopAutoSlide(){
        clearInterval($timer2);
   }

   /*
   $slideWrap에 마우스가 들어오면 할일, 나가면 할일
   */
   $slideWrap2.addEventListener('mouseenter',function(){
        stopAutoSlide();
   });
   $slideWrap2.addEventListener('mouseleave',function(){
        startAutoSlide();
   });

   //pager로 슬라이드 이동하기 
   for(var x = 0; x < $pagerBtn2.length; x++){
        $pagerBtn2[x].addEventListener('click',function(event){ 
            console.log(event.target.innerText);
            //innerText 내용 반환 A.innerText / A.innerText = 'B';
            //innerHTML의 태그를 반환 A.innerHTML / a.innerHTML = '<h2>'

            // var pagerNum = event.target.getAttribute('data-idx');
            var pagerNum2 = event.target.innerText - 1;
            goToSlide(pagerNum2);
            

        });
   }