<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>



<%-- <c:forEach var="moveline" items="${preMoveLineList}">
    <c:if test="${movelineNo == moveline.movelineNo}">
        <c:set var="movelineTitle" value="${moveline.movelineTitle}" />
        <c:set var="landMarkName" value="${moveline.landMarkName}" />
        <c:set var="landMarkX" value="${moveline.landMarkX}" />
        <c:set var="locationName" value="${moveline.locationName}" />
        <c:set var="thumbnail" value="${moveline.thumbnail}" />
    </c:if>
</c:forEach> --%>

        <link rel="stylesheet" href="${contextPath}/resources/css/moveline/ml-sort-style.css">
        <jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>

        <section>
            <div id="contents">
                <div id="location-area">
                    <h1 class="location-sort">지역별</h1>
                    <ul id="locations">
                    	<c:if test="${!empty locationList}">
	                    	<c:forEach var="location" items="${locationList}">
		                        
		                        	<a href="list/location/${location.locationNum}"><li class="location-div">${location.locationName}</li></a>
		                        
	                    	</c:forEach>
                    	</c:if>
                        <li class="location-div" id="selectAll">전체</li>
                    </ul>
                </div> 
        
                <div id="course-area">
                    <h1>테마별</h1>
                    <div id="courses">
                        <ul class="c-list">
                            <li name="movelineTheme" class="movelineTheme">가족</li>
                            <li name="movelineTheme" class="movelineTheme">아이</li>
                            <li name="movelineTheme" class="movelineTheme">데이트</li>
                            <li name="movelineTheme" class="movelineTheme">도보</li>
                            <li name="movelineTheme" class="movelineTheme">힐링</li>
                            <li name="movelineTheme" class="movelineTheme">맛집</li>
                            <li name="movelineTheme" class="movelineTheme">캠핑</li>
                        </ul>
                    </div>
                </div>

                <div id="hashTag-area">
                    <h1>해시태그별</h1>
                    <div id="tags">
                        <ul id="tlist" class="t-list">
                            <%-- <li>
                                <a href="list/hashtag?hashTagName=${hashtag.MLHashTag}">해시태그1</a>
                            </li> --%>

                            <c:if test="${!empty preHashTagList}">
                                <c:forEach var="hashtag" items="${preHashTagList}">
                                    <li>
                                        <a href="list/hashtag?hashtag=${hashtag.MLHashTag}">#${hashtag.MLHashTag}</a>
                                    </li>
                                </c:forEach>
                            </c:if>

                        </ul>
                    </div>
                </div>

                <div class="sample-area">
                        <c:if test="${!empty preMoveLineList}">
                            <c:forEach var="moveline" items="${preMoveLineList}">
                                <div class="samples">
                                    <div class="s-pic">
                                        <a href="${contextPath}/moveline-main/detail/${moveline.movelineNo}">
                                            <strong>${moveline.movelineTitle}</strong>
                                            <ul>
                                                <li>지역 : ${moveline.locationName}</li>
                                                <%-- <li>총거리 : ${moveline.landMarkX}</li> --%>
                                            </ul>
                                        </a>

                                        <c:if test="${empty moveline.thumbnail}">
                                            <div class="thumbnail">
                                                <img src="${contextPath}/resources/images/user.png" alt=""
                                                class="list-thumbnail">
                                            </div>
                                        </c:if>

                                        <c:if test="${!empty moveline.thumbnail}">
                                            <div class="thumbnail">
                                                <img src="${contextPath}${moveline.thumbnail}" alt=""
                                                class="list-thumbnail">
                                            </div>
                                        </c:if>
                                        
                                    </div>
                                    
                                    <c:forEach var="landmark" items="${moveline.landmarkList}">
                                            <ul class="s-list">
                                                <li><span><a href="">${landmark.landMarkName}</a></span></li>
                                            </ul>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </c:if>
                    
                </div>
            </div>
        </section>

        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
        
    </main>
    <script>
		const contextPath = "${contextPath}";
    </script>
    <script src="${contextPath}/resources/js/moveline/movelineSort.js"></script>
</body>
</html>