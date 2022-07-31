$(function () {
  /* 
  메뉴를 클릭하면, 몇 번쨰 메뉴를 클릭했는지 순번확인, 
  그 순번에 해당하는 내용이 화면 상단에서 얼마나 떨어져 있는지 거리를 확인(1100), 
  html,body에 스크롤양을 확인한 수치만큼 animate메서드 이용하여 애니메이션 되게 한다. -

  */

  //변수지정
  /*
  메뉴(li)를 변수명 $menu에 지정 
  각 내용들을 변수명 $contents에 지정
  */

  var $menu = $("#top_menu ul li");
  var $contents = $("#contents-detail > section");

  //메뉴 클릭 이동
  /* 
  몇번 쨰 메뉴를 클릭했는지 순번확인해서 변수명 idx 저장
  */
  $menu.click(function (event) {
    //event를 불러와서 preventDEfault를 이용해서 페이지 이동 기본 기능을 막는다
    event.preventDefault();
    var idx = $(this).index();

    var tt = $contents.eq(idx).offset().top - 180;
    console.log(tt);

    //해당 위치로 이동하도록
    $("html, body").animate({ scrollTop: tt });

    //활성화된 메뉴 표시하기
    /* 
    클릭한 그 요소에만 on추가하고 나머지 형제들은 제거한다.
    .siblings('.strong') 형제 자매요소들 중에서 클래스명 strong이 있는 것들만 선택
    */
    //  $(this).addClass('on').siblings().removeClass('on');
  });

  //스크롤 이동 반영하기
  /* 
  윈도우에 스크롤이 생기면 할일
  */
  $(window).scroll(function () {
    //현재 스크롤 양을 변수명 $sct 저장한다.
    var $sct = $(this).scrollTop();

    $contents.each(function (i) {
      var tg = $(this);
      if (tg.offset().top - 250 < $sct) {
        //현재 스크롤을 해당 컨텐츠가 화면 상단에서 거리보다 많이 했따면
        $menu.removeClass("on");
        $menu.eq(i).addClass("on");
      }
    });
  });
});
