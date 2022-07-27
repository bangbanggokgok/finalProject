<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이페이지</title>

	<link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage-main.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage-course.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage-favorite.css">

	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/4f7f0292da.js" crossorigin="anonymous"></script>
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
					<div class="landmark-area">
                        <div class="landmarkSlider">
							<c:if test="${!empty landmarkList}">
								<i class="fa-solid fa-circle-chevron-left fa-3x" id="landmarkLeft" style="color:#1BB3FE;" onclick="landmarkLeftSlide()"></i>
								<i class="fa-solid fa-circle-chevron-right fa-3x" id="landmarkRight" style="color:#1BB3FE;" onclick="landmarkRightSlide()"></i>
							</c:if>
						</div>

						<div class="landmark-list" id="landmark-list">
							<c:if test="${!empty landmarkList}">
								<c:forEach var="landmark" items="${landmarkList}">
									<div class="landmark-content">
										<div class="landmark-img">
											<img src="${contextPath}${landmark.thumbnail}">
										</div>
										<div class="landmark-text">
											<h3><a href="${contextPath}/landmark-main/detail/${landmark.locationType}/${landmark.landMarkNo}">[ ${landmark.landMarkName} ]</a></h3>
											<div>${landmark.landMarkContent}</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${empty landmarkList}">
								아직 즐겨찾는 랜드마크가 없습니다.
								마음에든 랜드마크를 추가 해주세요.
							</c:if>
						</div>
					</div>

                    <!-- 코스 즐겨찾기 -->
                    <div class="course-area">
                        <div class="courseSlider">
							<c:if test="${!empty moveLineList}">
								<i class="fa-solid fa-circle-chevron-left fa-3x" id="courseLeft" style="color:#bbd0ff;" onclick="courseLeftSlide()"></i>
								<i class="fa-solid fa-circle-chevron-right fa-3x" id="courseRight" style="color:#bbd0ff;" onclick="courseRightSlide()"></i>
							</c:if>
                        </div>

                        <div class="course-list" id="course-list">
							<c:if test="${!empty moveLineList}">
								<c:forEach var="course" items="${moveLineList}">
									<div class="course-content">
										<div class="course-img">
											<a href="${contextPath}/moveline-main/detail/${course.movelineNo}">
												<h1>${course.movelineTitle}</h1>
												<ul>
													<li>지역 : ${course.locationName}</li>
												</ul>
											</a>
											<img src="${contextPath}${course.reNameImage}">
										</div>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${empty landmarkList}">
								아직 즐겨찾는 코스가 없습니다.
								마음에든 코스를 추가 해주세요.
							</c:if>
                        </div>
                    </div>

				</div>
			</section>
		</div>

	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		const contextPath = "${contextPath}";
		const movelineNo = "${course.movelineNo}";
		const movelineTitle = "${course.movelineTitle}";
		const locationName = "${course.locationName}";
		const reNameImage = "${course.reNameImage}";
	</script>

	<script src="${contextPath}/resources/js/myPage/myPage.js"></script>
	<script src="${contextPath}/resources/js/myPage/favorite.js"></script>

</body>
</html>