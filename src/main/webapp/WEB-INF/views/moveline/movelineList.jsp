<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>코스 목록 조회 페이지</title>
   <link rel="stylesheet" href="${contextPath}/resources/css/moveline/ml-list-style.css">

   <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="${contextPath}/resources/css/common/nav.css" />

</head>
<body>
    
    <main>

        <jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>

        <div id="contents">
            <section id="top">
                <div>
                    <h1>서울</h1>
                </div>
                <div>
                    <button id="write-form">작성하기</button>
                </div>
            </section>
            
            <ul class="detail-list">
               <li>
                    <div class="thumbnail">
                        <img src="${contextPath}/resources/images/randmark/6.jpg" alt="">
                    </div>

                    <div class="ml-detail">
                        <div><p id="ml-title">사랑하는 연인과 타워 여행 어떠세요?</p></div>
                        <p>
                            <span class="landmarks">롯데타워 </span>
                            <span class="landmarks">63빌딩 </span>
                            <span class="landmarks">남산타워 </span>
                            <span class="landmarks">랜드마크 이름 긴 경우</span>
                            <span class="landmarks">OO타워 </span>
                            <span class="landmarks">OO타워</span>
                            <span class="landmarks">OO타워</span>
                            <span class="landmarks">OO타워</span>
                            <span class="landmarks">OO타워</span>
                            <span class="landmarks">OO타워</span>
                            <span class="landmarks">OO타워</span>
                        </p>

                        <p>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                        </p>
                    </div>

                    <div class="ml-detail-plus">
                        <button type="button" class="btn-bookmark" onclick="setBookmark();"><span class="icon-bookmark">즐겨찾기</span></button>
                    </div>
               </li>
            </ul>



            <ul class="detail-list">
                <li>
                     <div class="thumbnail">
                         <img src="../../resources/images/randmark/6.jpg" alt="">
                     </div>
                     <div class="ml-detail">
                         <div><p id="ml-title">사랑하는 연인과 타워 여행 어떠세요?</p></div>
                         <p>
                             <span class="landmarks">롯데타워 </span>
                             <span class="landmarks">63빌딩 </span>
                             <span class="landmarks">남산타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워</span>
                         </p>
                         <p>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                         </p>
                     </div>
                </li>
            </ul>

            <ul class="detail-list">
                <li>
                     <div class="thumbnail">
                         <img src="../../resources/images/randmark/6.jpg" alt="">
                     </div>
                     <div class="ml-detail">
                         <div><p id="ml-title">사랑하는 연인과 타워 여행 어떠세요?</p></div>
                         <p>
                             <span class="landmarks">롯데타워 </span>
                             <span class="landmarks">63빌딩 </span>
                             <span class="landmarks">남산타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워</span>
                         </p>
                         <p>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                         </p>
                     </div>
                </li>
            </ul>

            <ul class="detail-list">
                <li>
                     <div class="thumbnail">
                         <img src="../../resources/images/randmark/6.jpg" alt="">
                     </div>
                     <div class="ml-detail">
                         <div><p id="ml-title">사랑하는 연인과 타워 여행 어떠세요?</p></div>
                         <p>
                             <span class="landmarks">롯데타워 </span>
                             <span class="landmarks">63빌딩 </span>
                             <span class="landmarks">남산타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워</span>
                         </p>
                         <p>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                         </p>
                     </div>
                </li>
            </ul>

             <ul class="detail-list">
                <li>
                     <div class="thumbnail">
                         <img src="../../resources/images/randmark/6.jpg" alt="">
                     </div>
                     <div class="ml-detail">
                         <div><p id="ml-title">사랑하는 연인과 타워 여행 어떠세요?</p></div>
                         <p>
                             <span class="landmarks">롯데타워 </span>
                             <span class="landmarks">63빌딩 </span>
                             <span class="landmarks">남산타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워</span>
                         </p>
                         <p>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                         </p>
                     </div>
                </li>
            </ul>
            <ul class="detail-list">
               <li>
                    <div class="thumbnail">
                        <img src="../../resources/images/randmark/6.jpg" alt="">
                    </div>

                    <div class="ml-detail">
                        <div><p id="ml-title">사랑하는 연인과 타워 여행 어떠세요?</p></div>
                        <p>
                            <span class="landmarks">롯데타워 </span>
                            <span class="landmarks">63빌딩 </span>
                            <span class="landmarks">남산타워 </span>
                            <span class="landmarks">랜드마크 이름 긴 경우</span>
                            <span class="landmarks">OO타워 </span>
                            <span class="landmarks">OO타워</span>
                            <span class="landmarks">OO타워</span>
                            <span class="landmarks">OO타워</span>
                            <span class="landmarks">OO타워</span>
                            <span class="landmarks">OO타워</span>
                            <span class="landmarks">OO타워</span>
                        </p>

                        <p>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                            <span class="hashtags">#해시태그1</span>
                        </p>
                    </div>

                    <div class="ml-detail-plus">
                        <button type="button" class="btn-bookmark" onclick="setBookmark();"><span class="icon-bookmark">즐겨찾기</span></button>
                    </div>
               </li>
            </ul>



            <ul class="detail-list">
                <li>
                     <div class="thumbnail">
                         <img src="../../resources/images/randmark/6.jpg" alt="">
                     </div>
                     <div class="ml-detail">
                         <div><p id="ml-title">사랑하는 연인과 타워 여행 어떠세요?</p></div>
                         <p>
                             <span class="landmarks">롯데타워 </span>
                             <span class="landmarks">63빌딩 </span>
                             <span class="landmarks">남산타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워</span>
                         </p>
                         <p>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                         </p>
                     </div>
                </li>
            </ul>

            <ul class="detail-list">
                <li>
                     <div class="thumbnail">
                         <img src="../../resources/images/randmark/6.jpg" alt="">
                     </div>
                     <div class="ml-detail">
                         <div><p id="ml-title">사랑하는 연인과 타워 여행 어떠세요?</p></div>
                         <p>
                             <span class="landmarks">롯데타워 </span>
                             <span class="landmarks">63빌딩 </span>
                             <span class="landmarks">남산타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워</span>
                         </p>
                         <p>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                         </p>
                     </div>
                </li>
            </ul>

            <ul class="detail-list">
                <li>
                     <div class="thumbnail">
                         <img src="../../resources/images/randmark/6.jpg" alt="">
                     </div>
                     <div class="ml-detail">
                         <div><p id="ml-title">사랑하는 연인과 타워 여행 어떠세요?</p></div>
                         <p>
                             <span class="landmarks">롯데타워 </span>
                             <span class="landmarks">63빌딩 </span>
                             <span class="landmarks">남산타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워</span>
                         </p>
                         <p>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                             <span class="hashtags">#해시태그1</span>
                         </p>
                     </div>
                </li>
            </ul>

             <ul class="detail-list">
                <li>
                     <div class="thumbnail">
                         <img src="../../resources/images/randmark/6.jpg" alt="">
                     </div>
                     <div class="ml-detail">
                         <div><p id="ml-title">사랑하는 연인과 타워 여행 어떠세요?</p></div>
                         <p>
                             <span class="landmarks">롯데타워 </span>
                             <span class="landmarks">63빌딩 </span>
                             <span class="landmarks">남산타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워 </span>
                             <span class="landmarks">OO타워</span>
                         </p>
                         
                     </div>
                </li>
            </ul>

            <div class="pagination-area">
                <ul class="pagination">
                    <li><a href="#">&lt;&lt;</a></li>
                    <li><a href="#">&lt;</a></li>

                    <li><a class="current">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">7</a></li>
                    <li><a href="#">8</a></li>
                    <li><a href="#">9</a></li>
                    <li><a href="#">10</a></li>

                    <li><a href="#">&gt;</a></li>
                    <li><a href="#">&gt;&gt;</a></li>
                </ul>
            </div>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    </main>


    <script src="${contextPath}/resources/js/common/nav.js"></script>
</body>
</html>