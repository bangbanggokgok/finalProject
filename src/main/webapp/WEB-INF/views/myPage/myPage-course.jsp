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

    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/4f7f0292da.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <main>
        <div class="myPage-container">

            <jsp:include page="/WEB-INF/views/myPage/myPage-myInfo.jsp"/>

            <section class="board-list">
                <h1 class="board-name">내 코스</h1>

                <div class="courseSlider">
                    <c:if test="${!empty movelineList}">
                        <i class="fa-solid fa-circle-chevron-left fa-3x" id="leftBtn" style="color:#bbd0ff;"></i>
                        <i class="fa-solid fa-circle-chevron-right fa-3x" id="rightBtn" style="color:#bbd0ff;"></i>
                    </c:if>
                </div>
                
                <div class="course-list" id="course-list">
					<c:if test="${empty movelineList}">
						등록한 코스가 없습니다.
					</c:if>

					<c:if test="${!empty movelineList}">
						<c:forEach var="moveline" items="${movelineList}">
							<div class="course-content">
								<div class="course-img">
									<a href="${contextPath}/moveline-main/detail/${moveline.movelineNo}">
										<h1>${moveline.movelineTitle}</h1>
										<ul>
											<li>지역 : ${moveline.locationName}</li>
										</ul>
									</a>
									<img src="${contextPath}${moveline.reNameImage}">
								</div>
							</div>
						</c:forEach>
					</c:if>
                </div>
            </section>
			
        </div>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="${contextPath}/resources/js/myPage/myPage.js"></script>
    <script src="${contextPath}/resources/js/myPage/course.js"></script>

</body>
</html>