<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/changeInfo.css">

    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

    <script src="https://kit.fontawesome.com/4f7f0292da.js" crossorigin="anonymous"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <main>

        <section class="myPage-container">
            
            <jsp:include page="/WEB-INF/views/myPage/sideMenu.jsp"/>

            <section class="myInfo-content">
                <h1 class="page-title">회원정보 수정</h1>

                <form action="changeInfo" method="POST" name="myPage-form" onsubmit="return infoValidate()">

                    <div class="myInfo-row">
                        <label for="userName">이름</label>
                        <input type="text" id="userName" name="updateName" maxlength="8" value="${loginUser.userName}">
                    </div>
                    <span class="myInfo-message" id="nameMessage">한글만 입력해주세요.</span>
                    
                    <div class="myInfo-row">
                        <label for="userTel">전화번호</label>
                        <input type="text" id="userTel" name="updateTel" maxlength="11" value="${loginUser.userTel}">
                    </div>
                    <span class="myInfo-message" id="telMessage">전화번호를 입력해주세요.(- 제외)</span>
                
                    <c:set var="addr"  value="${fn:split(loginUser.userAddress, ',,')}"  />     
                    <div class="myInfo-row">
                        <label>주소</label>
                        <input type="text" id="sample2_postcode" name="updateAddress" maxlength="6" value="${addr[0]}">
                        <button type="button" onclick="sample2_execDaumPostcode()">우편번호 찾기</button>
                    </div>
                        
                    <div class="myInfo-row">
                        <label></label>
                        <input type="text" id="sample2_address" name="updateAddress" value="${addr[1]}">
                    </div>
                    
                    <div class="myInfo-row">
                        <label></label>
                        <input type="text" id="sample2_detailAddress" name="updateAddress" value="${addr[2]}">
                    </div>
                    <span class="myInfo-message" id="addrMessage"></span>

                    <div class="myInfo-row">
                        <button id="myInfo-btn">수 정 하 기</button>
                    </div>
                    
                </form>
            </section>
        </section>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- 우편번호 찾기 팝업 -->
    <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
        <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
    </div>

    <!-- 주소 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="${contextPath}/resources/js/myPage/myPage.js"></script>

</body>
</html>