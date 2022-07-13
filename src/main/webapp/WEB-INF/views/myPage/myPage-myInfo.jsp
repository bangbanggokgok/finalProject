<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="myPage-profile-area">
    <div class="myPage-profile">
        
        <div class="myPage-image-area">
            <form action="profile" method="POST" enctype="multipart/form-data" onsubmit="return profileValidate()">
                
                <div class="myPage-image">
                    <label for="input-image">
                        <c:if test="${empty loginUser.profileImage}">
                            <img src="${contextPath}/resources/images/user.png" id="profile-image">
                        </c:if>
                        <c:if test="${!empty loginUser.profileImage}">
                            <img src="${contextPath}${loginUser.profileImage}" id="profile-image">
                        </c:if>
                    </label>
                    <input type="file" name="uploadImage" id="input-image" accept="image/*">
                </div>
                
                <div class="image-btn-area">
                    <button>변 경</button>
                    <button type="reset" id="delete-image">초기화</button>
                </div>
                
                <!-- 삭제버튼 hidden -->
                <input type="hidden" name="delete" id="delete" value="0">
            </form>
        </div>

        <div class="myPage-myInfo">
            <h2>[ ${loginUser.userName} ]님의 현재 정보</h2>
            <div class="myPage-row">
                <span>아이디 : </span>
                <span>${loginUser.userEmail}</span>
            </div>
            <div class="myPage-row">
                <span>이&nbsp;&nbsp;름 : </span>
                <span>${loginUser.userName}</span>
            </div>
            <div class="myPage-row">
                <span>연락처 : </span>
                <span>${loginUser.userTel}</span>
            </div>
            <div class="myPage-row">
                <span>주&nbsp;&nbsp;소 : </span>
                <span>${loginUser.userAddress}</span>
            </div>
            <div class="myPage-row">
                <span>가입일 : </span>
                <span>${loginUser.registDate}</span>
            </div>
            <div class="myInfo-btn">
                <a href="${contextPath}/myPage/changeInfo">정보수정</a>
            </div>
        </div>
    </div>
</div>

<div class="myPage-nav">
    <ul>
        <li><a href="${contextPath}/myPage/info">내 즐겨찾기 조회</a></li>
        <span>|</span>
        <li><a href="${contextPath}/myPage/course">내 코스 조회</a></li>
        <span>|</span>
        <li><a href="${contextPath}/myPage/reply">내 댓글 조회</a></li>
        <span>|</span>
        <li><a href="${contextPath}/myPage/inquiry">1:1 문의</a></li>
    </ul>
</div>