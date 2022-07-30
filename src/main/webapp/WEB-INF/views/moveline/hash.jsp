c<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>태그 추가삭제하기</title>
    <link rel="stylesheet" type="text/css" href="/tag_create.css">
    <script type="module" src="/tag_create.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/moveline/hash.js">
</head>
<body>

    <div style="margin-top:40px; margin-left:40px;" class="content">
        <div style="display: flex;">
            <h1 style="width: 150px; margin-right:30px;">태그 입력</h1>
            <input type="text" id="tag" name="hashTag" size="20" placeholder="태그입력" />
        </div>

        <ul id="tag-list">

            <c:if test="${!empty movelineHashtag.hashList[i]}">
            </c:if>
        </ul>

    </div>


</body>

<script src="${contextPath}/resources/js/moveline/hash.js"></script>


</html>
