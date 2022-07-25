<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 작성</title>

<link rel="stylesheet"
	href="${contextPath}/resources/css/admin_/notice-write.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/admin_/adminNav.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>

	<!-- 관리자 메인탭 -->
	<section class="header">
		<section class="pageWrapper">
			<h1 style="font-size: 24px;" class="boardTitle">공지사항</h1>
		</section>
	</section>

	<section class="board">
		<section class="pageWrapper">
			<!-- 폼태그 액션 주소 필 -->
			<form action="insert" enctype="multipart/form-data" method="POST">
				<label class="choice">공지 선택</label>
				<div id="inputFieldsContainer" onclick="drop_choiceFields()">
					<div class="inputFields">
						<div style="color: #333333;" class="title" id="title">선택</div>
						<div id="inputField">
							<i class='fal fa-angle-down'></i>
						</div>
					</div>
				</div>

				<!-- select - option 태그로 수정 하는 건? -->
				<!-- select - option 은 별로 안 이뻐서? -->
				<div style="display: none;" id="choiceFieldsContainer">
					<div class="choiceFeild">
						<div class="choiceFields" id="notice">
							<div style="color: #333333;" class="title" onclick="noticeType(0)">공지</div>
						</div>
					</div>
					<div class="choiceFeild">
						<div class="choiceFields" id="event">
							<div style="color: #333333" class="title" onclick="noticeType(1)">이벤트</div>
						</div>
					</div>
				</div>
				
				<input name="noticeType" id="noticeType" type="hidden">

				<div class="titleFields">
					<div>
						<label class="title">제목</label> 
						<input placeholder="제목을 입력해주세요." maxlength="50" 
						class="titleInput" name="noticeTitle">
					</div>
				</div>
				
				<!-- 이미지 관련 수정 필 -->
				<c:forEach items="${detail.imageList}" var="noticeImage">
					<c:choose>
						<c:when test="${noticeImage.imageLevel == 0}">
							<%-- c:set 변수는 page scope가 기본값 (조건문이 끝나도 사용 가능)  --%>
							<c:set var="img0"
								value="${contextPath}${noticeImage.imageReName}" />
						</c:when>

						<c:when test="${noticeImage.imageLevel == 1}">
							<c:set var="img1"
								value="${contextPath}${noticeImage.imageReName}" />
						</c:when>

						<c:when test="${noticeImage.imageLevel == 2}">
							<c:set var="img2"
								value="${contextPath}${noticeImage.imageReName}" />
						</c:when>

						<c:when test="${noticeImage.imageLevel == 3}">
							<c:set var="img3"
								value="${contextPath}${noticeImage.imageReName}" />
						</c:when>
					</c:choose>
				</c:forEach>

				<!-- 업로드 이미지 -->
				<label class="addImg">사진 첨부</label>
				<div class="img-box">

					<div class="boardImg">
						<label for="img0">
							<img class="preview" src="${img0}">
							<%-- <i class="far fa-plus-circle fa-lg"></i> --%>
						</label>
						<input type="file" class="inputImage" id="img0" name="images" accept="image/*"> 
						<span class="delete-image">&times;</span>
					</div>

					<div class="boardImg">
						<label for="img1">
							<img class="preview" src="${img1}">
							<%-- <i class="far fa-plus-circle fa-lg"></i> --%>
						</label>
						<input type="file" class="inputImage" id="img1" name="images" accept="image/*"> 
						<span class="delete-image">&times;</span>
					</div>

					<div class="boardImg">
						<label for="img2">
							<img class="preview" src="${img2}">
							<%-- <i class="far fa-plus-circle fa-lg"></i> --%>
						</label> 
						<input type="file" class="inputImage" id="img2" name="images" accept="image/*"> 
						<span class="delete-image">&times;</span>
					</div>

					<div class="boardImg">
						<label for="img3"> 
							<img class="preview" src="${img3}">
							<%-- <i class="far fa-plus-circle fa-lg"></i> --%>
						</label> 
						<input type="file" class="inputImage" id="img3" name="images" accept="image/*"> 
						<span class="delete-image">&times;</span>
					</div>

				</div>
				
				<!-- 컨텐츠 에리어 -->
				<div class="contentField">
					<label class="contentLabel">내용</label>
					<article class="contentArea">
						<textarea placeholder="내용을 입력해주세요." class="content"
							name="noticeContent"></textarea>
					</article>
				</div>

				<section class="submitBar">
					<div class="buttonContainer">
						<button class="submitButton">등록하기</button>
					</div>
				</section>
			</form>
			
			<div class="sc-fznxKY bjxHni">
				<section class="sc-fzpmMD fpVDsP"></section>
			</div>
		</section>
	</section>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/js/admin_/notice-write.js"></script>

</html>