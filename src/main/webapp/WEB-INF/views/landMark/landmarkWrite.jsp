<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>랜드마크 작성</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/landmark/landmarkWrite.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f20849e53010080fd527a7640414c916"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f20849e53010080fd527a7640414c916&libraries=services,clusterer,drawing"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
    <section class="header">
        <section class="pageWrapper">
            <h1 class="boardTitle">랜드마크 작성</h1>
        </section>
    </section>

    <section class="board">
        <section class="pageWrapper">
            <form action="" method="POST" onsubmit="checkSubmit()">
                <div class="titleFields">
                    <div>
                        <select name="locationsList" id="locations-list" style="width:400px;height:40px;">
                            <option value="locationNull">지역을 선택해주세요</option>
                            <c:forEach var="locations" items="${LocationList}">
                                <option value="${locations.locationNum}">${locations.locationName}</option>        
                            </c:forEach>
                        </select>
                        <div style="height:20px;"></div>
                        <label class="title" style="font-weight:bold;">랜드마크 이름</label>
                        <input placeholder="이름을 입력해주세요." maxlength="50" class="titleInput" id="title" name="landmarkName">
                    </div>
                </div>
    
                <!-- 업로드 이미지 -->
                <label class="addImg" style="font-weight:bold;">사진 첨부</label>
                <div class="img-box">
    
                    <div class="boardImg">
                        <label for="img1">
                            <img class="far fa-plus-circle fa-lg" src="${img1}">
                        </label>
                        <input type="file" class="inputImage" id="img1" name="images" accept="image/*">
                        <span class="delete-image">&times;</span>
                    </div>
    
                    <div class="boardImg">
                        <label for="img2">
                            <img class="far fa-plus-circle fa-lg" src="${img1}">
                        </label>
                        <input type="file" class="inputImage" id="img2" name="images" accept="image/*">
                        <span class="delete-image">&times;</span>
                    </div>
    
                    <div class="boardImg">
                        <label for="img3">
                            <img class="far fa-plus-circle fa-lg" src="${img1}">
                        </label>
                        <input type="file" class="inputImage" id="img3" name="images" accept="image/*">
                        <span class="delete-image">&times;</span>
                    </div>
                    
                    <div class="boardImg">
                        <label for="img4">
                            <img class="far fa-plus-circle fa-lg" src="${img1}">
                        </label>
                        <input type="file" class="inputImage" id="img4" name="images" accept="image/*">
                        <span class="delete-image">&times;</span>
                    </div>

                </div>

                <div class="contentField">
                    <label class="contentLabel">상세정보</label>
                    <article class="contentArea">
                        <textarea name="contents" placeholder="내용을 입력해주세요." class="content" id="contents"></textarea>
                    </article>

                    <div class="WritingTag">
                        <div class="tag_inner">
                            <strong class="blind">태그 입력</strong>
                            <div class="tag_input_box inactive">
                            <%-- 이부분 이해안됨 --%>
                                <input type="text" name="hashTag" placeholder="# 태그를 입력해주세요" class="tag_input" style="width: 300px;">
                                <div class="layer_auto_tag" style="display: none;">
                                    <ul class="auto_tag_list"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="text" name="lng" style="display:none;">
                <input type="text" name="lag" style="display:none;">
                <div class="addressField">
                    <div id="map" style="width:764px;height:400px;"></div>
                </div>
                
                <section class="submitBar">
                    <div class="buttonContainer">
                        <div id="clickLatlng"></div>
                        <button class="submitButton">등록하기</button>
                    </div>
                </section>
            </form>
            <div class="sc-fznxKY bjxHni">
                <section class="sc-fzpmMD fpVDsP"></section>
            </div>
        </section>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script src="${contextPath}/resources/js/landmark/landmarkWrite.js"></script>
</html>