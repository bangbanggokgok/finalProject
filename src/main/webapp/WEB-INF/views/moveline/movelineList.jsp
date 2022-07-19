<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<c:forEach var="location" items="${LocationList}">
	<c:if test="${locationNum == location.locationNum}">
		<c:set var="locationName" value="${location.locationName}" />
	</c:if>
</c:forEach>

<c:set var="moveline2" value="${map.MovelineBylocation}"/>
<c:set var="pagination" value="${map.pagination}" />
<c:set var="movelineList" value="${map.movelineList}" />
<c:set var="listByHashTag" value="${map.listByHashTag}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>코스 목록 조회 페이지</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/moveline/ml-list-style.css">

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700"
	rel="stylesheet" />

<link rel="stylesheet"
	href="${contextPath}/resources/css/common/nav.css" />

</head>
<body>

	<main>

		<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>


		<c:if test="${!empty param.hashtag}">
            <c:set var="hash" value="${param.hashtag}" />
        </c:if>

		<section>

			<div id="contents">
				<section id="top">
					<div>
						<c:choose>
							<c:when test="${empty hash}">
								<h1 id="first-h1">
									<a>${locationName}</a>
								</h1>
							</c:when>
							<c:when test="${!empty hash}">
								<h1 id="first-h1">
									<a>#${hash}</a>
								</h1>
							</c:when>

						</c:choose>
					</div>

					<div>
						<c:if test="${!empty loginUser}">
							<button id="write-btn">작성하기</button>
						</c:if>
					</div>
				</section>

				<%-- jsp 구조 --%>
				<c:choose>
					<c:when test="${empty movelineList}">
						<!-- 목록 조회 결과가 비어있다면 -->
						<tr>
							<th colspan="5">등록된 코스가 없습니다.</th>
						</tr>
					</c:when>

					<c:otherwise>

					
                        <c:if test="${!empty movelineList}">
							<c:forEach var="moveline" items="${movelineList}">
                                <ul class="detail-list">
                                    <li>
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
										
											<div class="ml-detail">
												<div class="title-area">
													<p class="ml-title">${moveline.movelineTitle}</p>
												</div>
													<ul class="s-list">
														<c:forEach var="landmark" items="${moveline.landmarkList}">
															<c:if test="${!empty landmark}">
																<span class="landmarks">${landmark.landMarkName}</span>
															</c:if>
														</c:forEach>
													</ul>
													<p>
														<c:forEach var="hashtag" items="${moveline.hashtagList}">
															<c:if test="${!empty hashtag}">
																	<span class="hashtags">#${hashtag.MLHashTag}</span>
															</c:if>
														</c:forEach>
													</p>
											</div>

                                        <div class="ml-detail-plus">
                                            <button type="button" class="btn-bookmark"
                                                onclick="setBookmark(${moveline.movelineNo});">
                                                <span class="icon-bookmark">즐겨찾기</span>
                                            </button>
                                        </div>
                                    
                                    </li>
                                </ul>
                            </c:forEach>
                        </c:if>
                    </c:otherwise>

				</c:choose>

				<div class="pagination-area">
					<c:choose>
						<c:when test="${empty hash}">
							<c:set var="url" value="?cp=" />
						</c:when>

						<c:when test="${!empty hash}">
							<c:set var="url" value="?hashtag=${hash}&cp=" />
						</c:when>
					</c:choose>
					<ul class="pagination">
						<!-- 첫 페이지로 이동 -->
						<li><a href="${url}1${sURL}">&lt;&lt;</a></li>

						<!-- 이전 목록 마지막 번호로 이동 -->
						<li><a href="${url}${pagination.prevPage}${sURL}">&lt;</a></li>

						<!-- 범위가 정해진 일반 for문 사용 -->
						<c:forEach var="i" begin="${pagination.startPage}"
							end="${pagination.endPage}" step="1">

							<c:choose>
								<c:when test="${i == pagination.currentPage}">
									<li><a class="current">${i}</a></li>
								</c:when>

								<c:otherwise>
									<li><a href="${url}${i}${sURL}">${i}</a></li>
								</c:otherwise>
							</c:choose>

						</c:forEach>

						<!-- 다음 목록 시작 번호로 이동 -->
						<li><a href="${url}${pagination.nextPage}${sURL}">&gt;</a></li>

						<!-- 끝 페이지로 이동 -->
						<li><a href="${url}${pagination.maxPage}${sURL}">&gt;&gt;</a></li>

					</ul>
				</div>
			</div>
		</section>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</main>

	<div class="modal">
		<span id="modal-close">&times;</span> <img id="modal-image"
			src="/comm/resources/images/user.png">
	</div>

	<script>
		const contextPath = "${contextPath}";
	</script>

	<script src="${contextPath}/resources/js/common/nav.js"></script>
	<script src="${contextPath}/resources/js/moveline/movelineSort.js"></script>
</body>
</html>