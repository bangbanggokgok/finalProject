<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>코스 디테일</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/moveline/ml-detail-style.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700" rel="stylesheet" />
    <link rel="stylesheet" href="${contextPath}/resources/css/common/nav.css" />

</head>
<body>
    <main>

        <jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>

        <div id="contents">
            <form action="">
                <div id="top1">
                    <div id="top-top">
                        <div class="profileImage">
                            <span class="icon-writer">
                                <img src="../../resources/images/user.png" alt="">
                            </span>
                        </div>
                        <span>김*태</span>
                    </div>
                    
                    <div id="top-middle">
                        <h1>사랑하는 연인과 타워 여행 어떠세요?</h1>
                    </div>

                    <div id="top-bottom">
                        <div>
                            <span>
                                <span>조회수</span>
                                <span>213</span>
                            </span>
                            <button type="button" class="btn-bookmark" onclick="setMookmark();">
                                <span class="icon-bookmark">즐겨찾기</span>
                            </button>
                        </div>

                        <div id="btn-area">
                            <button>수정하기</button>
                            <button>삭제하기</button>
                        </div>
                    </div>

                </div>
                
                <div id="moveline-area">

                    <div id="schedule-info">
                        <ul class="">
                            <li>
                                <span>
                                    <img src="" alt="">
                                </span>
                                <em>지역</em>
                                <Strong>서울</Strong>
                            </li>
                            <li>
                                <span>
                                    <img src="" alt="">
                                </span>
                                <em>코스 총거리 : </em>
                                <Strong>87km</Strong>
                            </li>
                            <li>
                                <span>
                                    <img src="" alt="">
                                </span>
                                <em>테마</em>
                                <Strong>가족</Strong>
                            </li>
                        </ul>
                        <div id="moveline-hashtags">
                            <em>태그</em>
                            <span>
                                <a href="">#해시태그1</a>
                                <a href="">#해시태그2</a>
                                <a href="">#해시태그3</a>
                                <a href="">#해시태그4</a>
                                <a href="">#해시태그5</a>
                                <a href="">#해시태그6</a>
                                <a href="">#해시태그7</a>
                            </span>
                        </div id="">
                            
                    </div>


                    <div id="moveline-content">
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                        내용 입력 란
                    </div>

                    <div id="moveline-hashtags">
                        a태그 써야됨
                        코스용 해시태그 란 #해시태그1
                        #해시태그1
                        #해시태그1
                        #해시태그1
                        #해시태그1
                        #해시태그1
                        #해시태그1
                        #해시태그1 
                        #해시태그1 
                        #해시태그1 
                        #해시태그1 
                        #해시태그1 
                        #해시태그1 
                        #해시태그1 
                        #해시태그1 
                        #해시태그1 
                        #해시태그1
                    </div id="">

                    <div id="moveline-images">
                        <img src="../../resources/images/lottetower.JPEG" alt="">
                        <!-- <img src="../../resources/images/lottetower.JPEG" alt="">
                        <img src="../../resources/images/lottetower.JPEG" alt="">
                        <img src="../../resources/images/lottetower.JPEG" alt="">
                        <img src="../../resources/images/lottetower.JPEG" alt=""> -->
                    <div id="moveline-images">
                        
                        

                    </div>

                    <div id="moveline-map-area">
                        <div class="moveline-map">지도공간</div>
                    </div>

                </div>

                <div id="landmark-area">
                    <div class="landmark-detail">
                        <span class="landmark">롯데타워</span>
                        <span class="landmark">63빌딩</span>
                        <span class="landmark">쌍둥이빌딩</span>
                        <span class="landmark">롯데타워</span>
                        
                        <div class="selected-landmark">롯데타워</div>

                        <div>
                            <span>사진보기</span>
                            <span>상세설명</span>
                        </div>
                    </div>
                    <div id="landmark-images">
                        <img src="../../resources/images/landmark/2.jpg" alt="">
                        <!-- <img src="../../resources/images/landmark/20220720112338_11538.gif" alt="">
                        <img src="../../resources/images/landmark/1.jpg" alt="">
                        <img src="../../resources/images/landmark/20220720114302_94946.png" alt=""> -->
                    </div>

                    <div id="landmark-explain">
                        랜드마크 설명란 랜드마크 설명란랜드마크 설명란랜드마크 설명란랜드마크 설명란랜드마크 설명란랜드마크 설명란랜드마크 설명란
                    </div>
                </div>
                
                <!-- 댓글 -->
                
            </form>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    </main>
    <script>
        const contextPath = "${contextPath}";
        
        // 로그인한 회원 번호
        const loginUserNo = "${loginUser.userNo}";
        const movelineNo = "${movelineNo}";
    </script>
        <script src="${contextPath}/resources/js/common/nav.js"></script>

</body>
</html>