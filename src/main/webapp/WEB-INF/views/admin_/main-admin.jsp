<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 임시메인</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/admin_/adminNav.css">
</head>
<body>
    <div class="adminNav">
		<div class="adminList">Admin</div>
            <ul class="listWrapper">
                <li id="adminList">
                <!-- 네비 디자인 이야기 다시합시다. -->
                    <i class="fal fa-clipboard-list-check">공지사항</i> 
                    <span>
                    	<a href="${contextPath}/notice/list">공지/이벤트 조회</a>
                   	</span>
                    <span>
                    	<a href="${contextPath}/admin/notice/insert">공지/이벤트 작성</a>
                   	</span>
                </li>
                <li id="adminList">
                    <a href="${contextPath}/admin/user/list">
                    	<i class="fal fa-user-friends"></i> 회원관리
                   	</a>
                </li>
                <li id="adminList">
                    <a href="${contextPath}/admin/qna/list">
                    	<i class="fal fa-map-marker-question"></i> 1:1 문의조회
                   	</a>
                </li>
                <li id="adminList">
                    <a href="${contextPath}/report/moveline/${movelineNo}">
                    	<i class="fal fa-map-marker-question"></i> 코스 신고하기
                   	</a>
                    <a href="${contextPath}/report/reply">
                    	<i class="fal fa-map-marker-question"></i> 댓글 신고하기
                   	</a>
                </li>
                <li id="adminList">
                    <a href="${contextPath}/admin/report/course/list">
                    	<i class="fal fa-siren-on"></i> 신고관리
                   	</a>
                    <a href="${contextPath}/admin/report/reply/list">
                    	<i class="fal fa-siren-on"></i> 댓글신고관리
                   	</a>
                </li>
            </ul>
        </div>
</body>
</html>