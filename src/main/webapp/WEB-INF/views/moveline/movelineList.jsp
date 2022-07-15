<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:forEach var="location" items="${LocationList}">
    <c:if test="${locationNum == location.locationNum}">
        <c:set var="locationName" value="${location.locationName}" />
    </c:if>
</c:forEach>

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
                    <c:if test="${!empty LocationList}">
                        <h1 id="first-h1">
                            ${locationName}</a>
                        </h1>
                    </c:if>
                </div>

                <div>
                    <c:if test="${!empty loginMember}">
                        <button id="write-btn">작성하기</button>
                    </c:if>
                </div>
            </section>
            
            <ul class="detail-list">
               <li>
                    <%-- 썸네일 없을시 --%>
                    <c:if test="${!empty thumbnail}">
                        <div class="thumbnail">
                            <img src="${contextPath}/resources/images/user.png" alt="">
                        </div>
                    </c:if>
                    
                    <div class="thumbnail">
                        <img src="${contextPath}/resources/images/randmark/6.jpg" alt="">
                    </div>

                    <div class="ml-detail">
                        <div class="title-area">
                            <p class="ml-title">사랑하는 연인과 타워 여행 어떠세요?</p>
                        </div>

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
                        <button type="button" class="btn-bookmark" onclick="setBookmark();">
                            <span class="icon-bookmark">즐겨찾기</span>
                        </button>
                    </div>
               </li>
            </ul>

            <ul class="detail-list">
               <li>
                    <div class="thumbnail">
                        <img src="" alt="">
                    </div>

                    <div class="ml-detail">
                        <div class="title-area">
                            <p class="ml-title">사랑하는 연인과 타워 여행 어떠세요?</p>
                        </div>

                        <p>
                            <span class="landmarks">롯데타워 </span>
                            <span class="landmarks">63빌딩 </span>
                            <span class="landmarks">남산타워 </span>
                            <span class="landmarks">랜드마크 이름 긴 경우</span>
                            <span class="landmarks">OO타워 </span>
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
                        </p>
                    </div>

                    <div class="ml-detail-plus">
                        <button type="button" class="btn-bookmark" onclick="setBookmark();">
                            <span class="icon-bookmark">즐겨찾기</span>
                        </button>
                    </div>
               </li>
            </ul>

            <%-- jsp 구조 --%>

            <c:choose>
                <c:when test="${empty movelineDetail}">
                    <!-- 목록 조회 결과가 비어있다면 -->
                    <tr>
                        <th colspan="5">게시글이 존재하지 않습니다.</th>
                    </tr>
                </c:when>

                <c:otherwise>

                    <c:forEach var="movelineDetail" items="${movelineDetail}">

                        <ul class="detail-list">
                            <li>
                                <div class="thumbnail">
                                    <c:if test="${!empty thumbnail}">
                                        <img src="${contextPath}/resources/images/randmark/6.jpg" alt="" class="list-thumbnail">
                                    </c:if>  
                                </div>

                                <div class="ml-detail">
                                    <div class="title-area">
                                        <p class="ml-title">${movelineTitle}</p>
                                    </div>
                                    <p>
                                        <span class="landmarks">${landmarkName}</span>
                                    </p>

                                    <p>
                                        <span class="hashtags">${hashName}</span>
                                    </p>
                                </div>

                                <div class="ml-detail-plus">
                                    <button type="button" class="btn-bookmark" onclick="setBookmark();">
                                        <span class="icon-bookmark">즐겨찾기</span>
                                    </button>
                                </div>
                            </li>
                        </ul>
                    </c:forEach>

                </c:otherwise>
            </c:choose>


            
            <%-- 페이지네이션 보류? --%>
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

    <div class="modal">
        <span id="modal-close">&times;</span>
        <img id="modal-image" src="/comm/resources/images/user.png">
    </div>

    <script src="${contextPath}/resources/js/common/nav.js"></script>
    <script src="${contextPath}/resources/js/moveline/movelineSort.js"></script>
</body>
</html>