<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700"
	rel="stylesheet" />
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<title>Document</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>
	<main>
		<a href="${contextPath}/landmark-main/list">랜드마크 리스트 확인용</a>
		
		
		<a href="${contextPath}/landmark-main/landmark-detail">랜드마크 확인용</a>
	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<%-- <script src="../resources/js/main.js"></script> --%>
</body>
</html>