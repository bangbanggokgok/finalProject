<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의하기</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage-inquiryWrite.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <section class="header">
        <section class="pageWrapper">
            <h1 font-size="24px" class="boardTitle">1:1 문의하기</h1>
        </section>
    </section>

    <section class="board">
        <section class="pageWrapper">
            <form action="q_write" method="POST" onsubmit="return q_writeValidate()">
                
                <div class="titleFields">
                    <div>
                        <label class="title">제목</label>
                        <input placeholder="제목을 입력해주세요." maxlength="50" class="titleInput">
                    </div>
                </div>

                <div class="contentField">
                    <label class="contentLabel">내용</label>
                    <article class="contentArea">
                        <textarea placeholder="내용을 입력해주세요." class="content"></textarea>
                    </article>
                </div>
                
                <section class="submitBar">
                    <div class="buttonContainer">
                        <button class="submitButton">등록하기</button>
                    </div>
                </section>
                <div class="sc-fznxKY bjxHni">
                    <section class="sc-fzpmMD fpVDsP"></section>
                </div>
            </form>
        </section>
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="${contextPath}/resources/js/myPage/inquiry.js"></script>

</body>

</html>