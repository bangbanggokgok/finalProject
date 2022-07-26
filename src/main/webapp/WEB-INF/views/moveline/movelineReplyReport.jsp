<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신고</title>

<link rel="stylesheet" href="${contextPath}/resources/css/moveline/ml-report.css">
<link rel="stylesheet" href="${contextPath}/resources/css/admin_/adminNav.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>

	<section class="header">
		<section class="pageWrapper">
			<h1 style="font-size: 24px;" class="boardTitle">댓글 신고</h1>
		</section>
	</section>

	<section class="board">
		<section class="pageWrapper">
			<form action="${replyNo}" enctype="multipart/form-data" method="POST">
				<label class="choice">신고사유 선택</label>
                <table>
                    <tbody>
                        <tr>
                                <td><label><input type="radio" name="report" value="욕설/비방" class="title"><span>욕설/비방</span></input></label></td>
                        </tr>
                        <tr>
                                <td><label><input type="radio" name="report" value="잘못된 정보" class="title"><span>잘못된 정보</span></input></label></td>
                        </tr>
                        <tr>
                                <td><label><input type="radio" name="report" value="스팸홍보/도배" class="title"><span>스팸홍보/도배</span></input></label></td>
                        </tr>
                        <tr>
                                <td><label><input type="radio" name="report" value="저작권 침해" class="title"><span>저작권 침해</span></input></label></td>
                        </tr>
                        <tr>
                                <td><label><input type="radio" name="report" value="개인정보 노출" class="title"><span>개인정보 노출</span></input></label></td>
                        </tr>
                        <tr>
                                <td><label><input type="radio" name="report" class="title" value="기타" id="etc"><span>기타</span></input></label></td>
                        </tr>
                    </tbody>
                </table>
                <div id="contentField">
					<label class="contentLabel">내용</label>
					<article class="contentArea">
						<textarea placeholder="내용을 입력해주세요." id="content" name="noticeContent"></textarea>
					</article>
				</div>
				<section class="submitBar">
					<div class="buttonContainer">
						<button class="submitButton">제출하기</button>
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
<script src="${contextPath}/resources/js/moveline/ml-report.js"></script>

</html>