<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/member/signUp.css">
	<link
		href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
		rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>
	<main>
		<section class="signUp-content">
			<h1 class="page-title">회원가입</h1>
            <form action="sign-up" method="POST" name="signUp-form" onsubmit="return signUpValidate()">
                <div class="signUp-row">
                    <label for="userEmail">아이디(이메일)</label>
                    <input type="text" id="userEmail" 
					name="userEmail" placeholder="ex) user@xx.co.kr" maxlength="30" autocomplete="off" required>
                    <button type="button" id="sendBtn">인증번호 전송</button>
                    <button type="button" id="resendBtn" style='display:none;'>인증번호 재발급</button>
                    <input type="number" name="re" id="re" hidden value='0'>
                </div>
                <span class="signUp-message" id="emailMessage">사용 가능한 이메일 주소를 입력해주세요.</span>

                <div class="signUp-row">
                    <label for="cNumber">인증번호</label>
                    <input type="text" id="cNumber" placeholder="인증번호 6자리" maxlength="6" autocomplete="off">
                    <button type="button" id="cBtn">확인</button>
                </div>
                <span class="signUp-message" id="cMessage">인증 번호를 입력해주세요.</span>

                <div class="signUp-row">
                    <label for="userName">이름</label>
                    <input type="text" id="userName" 
					name="userName" placeholder="ex) 유저일" maxlength="8" required>
                </div>
                <span class="signUp-message" id="nameMessage">한글만 입력해주세요.</span>
                
                <div class="signUp-row">
                    <label for="userPW">비밀번호</label>
                    <input type="password" id="userPW" 
					name="userPW" placeholder="비밀번호 입력" maxlength="20" required>
                </div>
                <span class="signUp-message" id="pwMessage">영어, 숫자, 특수문자(!,@,#,-,_)를 6~20글자 사이로 입력해주세요.</span>

                <div class="signUp-row">
                    <label for="userPWConfirm">비밀번호 확인</label>
                    <input type="password" id="userPWConfirm" placeholder="비밀번호 확인" maxlength="20" required>
                </div>
                <span class="signUp-message" id="pwConfirmMessage"></span>

                <div class="signUp-row">
                    <label for="userTel">전화번호</label>
                    <input type="text" id="userTel" 
					name="userTel" placeholder="ex) 01012345678" maxlength="11" required>
                </div>
                <span class="signUp-message" id="telMessage">전화번호를 입력해주세요.(- 제외)</span>

                <div class="signUp-row">
                    <label>주소</label>
                    <input type="text" id="sample2_postcode" name="userAddress"
                        placeholder="우편번호" maxlength="6" required readonly>
                    <button type="button" onclick="sample2_execDaumPostcode()">우편번호 찾기</button>
                </div>
                    
                <div class="signUp-row">
                    <label></label>
                    <input type="text" id="sample2_address" name="userAddress" placeholder="도로명주소" required readonly>
                </div>
                
                <div class="signUp-row">
                    <label></label>
                    <input type="text" id="sample2_detailAddress" name="userAddress" placeholder="상세주소" required>
                </div>
                <span class="signUp-message" id="addrMessage">주소를 입력해주세요.</span>

                <div class="signUp-row">
                    <button id="signUp-btn">가 입 하 기</button>
                </div>
				<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
				</div>
            </form>
        </section>
	</main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${contextPath}/resources/js/member/signUp.js"></script>
</body>
</html>