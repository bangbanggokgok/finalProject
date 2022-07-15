<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>

<link rel="stylesheet"
	href="${contextPath}/resources/css/myPage/myPage-main.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/myPage/myPage-course.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/myPage/myPage-favorite.css">

<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />

	<main>
		<div class="myPage-container">

			<jsp:include page="/WEB-INF/views/myPage/myPage-myInfo.jsp" />

			<section class="board-list">
				<h1 class="board-name">내 즐겨찾기</h1>

				<div class="favorite-tab">
					<ul class="tab_title">
						<li class="current-tab">랜드마크</li>
						<li>코스</li>
					</ul>
				</div>

				<div class="tab_content">
					<!-- 랜드마크 즐겨찾기 -->
					<div class="landmark-list" id="landmark-list">
						<c:if test="${!empty landmarkList}">
                    		<c:forEach var="landmark" items="${landmarkList }">
                    		여기에 추가해주세요
                    		</c:forEach>
                    	</c:if>
                    	<c:if test="${empty landmarkList}">
                    		아직 즐겨찾는 랜드마크가 없습니다.
                    		마음에든 랜드마크를 추가 해주세요.
                    	</c:if>
<%-- 						<div class="landmark-content">
							<div class="landmark-img">
								<img src="${contextPath}/resources/images/lottetower.JPEG">
							</div>
							<div class="landmark-text">
								<!-- 클릭 시 랜드마크 바로가기 -->
								<h3>
									<a href="#">[ 롯데타워 ]</a>
								</h3>
								<div>롯데타워 정보정보정보 롯데타워 정보정보정보 롯데타워 정보정보정보 롯데타워 정보정보정보 롯데타워
									정보정보정보 롯데타워 정보정보정보 롯데타워 정보정보정보</div>
							</div>
						</div> --%>
					</div>

					<!-- 코스 즐겨찾기 -->
					<div class="course-list" id="course-list">

<%-- 						<div class="course-content">
							<div class="course-img">
								<a href="#">
									<h1>서울 여행</h1>
									<ul>
										<li>지역 : 서울</li>
										<li>총거리 : 77.7km</li>
									</ul>
								</a> <img src="${contextPath}/resources/images/lottetower.JPEG">
							</div>
						</div> --%>
					</div>
				</div>


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
			</section>
		</div>

	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

	<script src="${contextPath}/resources/js/myPage/myPage.js"></script>

</body>
</html>