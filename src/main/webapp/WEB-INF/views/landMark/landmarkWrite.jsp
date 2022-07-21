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
            <form action="" method="POST" enctype="multipart/form-data" onsubmit="return checkSubmit()">
                <div class="titleFields">
                    <div>
                        <select name="locationsList" id="locations-list" style="width:400px;height:40px;">
                            <option value="locationNull">지역을 선택해주세요</option>
                            <c:forEach var="locations" items="${LocationList}">
                                <option value="${locations.locationNum}" 
                                    <c:if test="${landmarkDetail.locationName == locations.locationName}">selected</c:if>
                                >${locations.locationName}</option>        
                            </c:forEach>
                        </select>
                        <div style="height:20px;"></div>
                        <label class="title" style="font-weight:bold;">랜드마크 이름</label>
                        <input placeholder="이름을 입력해주세요." maxlength="50" class="titleInput" id="title" name="landmarkName" value="${landmarkDetail.landMarkName}">
                    </div>
                </div>
<%-- 
                <c:forEach items="${detail.imageList}" var="boardImage">
                <c:choose>
                    <c:when test="${landMarkImage.landMarkImageLV} == 0">
                        <c:set var="img0"  value="${contextPath}${landMarkImage.landMarkReName}" />
                    </c:when>

                    <c:when test="${landMarkImage.landMarkImageLV} == 1">
                        <c:set var="img1"  value="${contextPath}${landMarkImage.landMarkReName}" />
                    </c:when>

                </c:choose>
            </c:forEach>
 --%>

                <!-- 업로드 이미지 -->
                <label class="addImg" style="font-weight:bold;">사진 첨부</label>
                <div class="img-box">
    
                    <div class="boardImg">
                        <label for="img1">
                        	<c:if test="${!empty landmarkDetail.imageList[0]}">
	                            <img class="far fa-plus-circle fa-lg preview" src="${contextPath}${landmarkDetail.imageList[0].landMarkReName}"> 
                        	</c:if>
							<c:if test="${empty landmarkDetail.imageList[0]}">
	                            <img class="far fa-plus-circle fa-lg preview" src=""> 
                        	</c:if>
                        </label>
                        <input type="file" class="input-img" id="img1" name="images" accept="image/*" style="display:none;">
                        <span class="delete-image">&times;</span>
                    </div>
    
                    <div class="boardImg">
                        <label for="img2">
                        	<c:if test="${!empty landmarkDetail.imageList[1]}">
	                            <img class="far fa-plus-circle fa-lg preview" 
	                            src="${contextPath}${landmarkDetail.imageList[1].landMarkReName}"> 
                        	</c:if>
							<c:if test="${empty landmarkDetail.imageList[1]}">
	                            <img class="far fa-plus-circle fa-lg preview" src=""> 
                        	</c:if>
                        </label>
                        <input type="file" class="input-img" id="img2" 
                            name="images" accept="image/*" style="display:none;">
                        <span class="delete-image">&times;</span>
                    </div>
    
                    <div class="boardImg">
                        <label for="img3">
                        	<c:if test="${!empty landmarkDetail.imageList[2]}">
	                            <img class="far fa-plus-circle fa-lg preview" 
	                            src="${contextPath}${landmarkDetail.imageList[1].landMarkReName}"> 
                        	</c:if>
							<c:if test="${empty landmarkDetail.imageList[2]}">
	                            <img class="far fa-plus-circle fa-lg preview" src=""> 
                        	</c:if>
                        </label>
                        <input type="file" class="input-img" id="img3" name="images" accept="image/*" style="display:none;">
                        <span class="delete-image">&times;</span>
                    </div>
                    
                    <div class="boardImg">
                        <label for="img4">
                        	<c:if test="${!empty landmarkDetail.imageList[3]}">
	                            <img class="far fa-plus-circle fa-lg preview" 
	                            src="${contextPath}${landmarkDetail.imageList[1].landMarkReName}"> 
                        	</c:if>
							<c:if test="${empty landmarkDetail.imageList[3]}">
	                            <img class="far fa-plus-circle fa-lg preview" src=""> 
                        	</c:if>
                        </label>
                        <input type="file" class="input-img" id="img4" name="images" accept="image/*" style="display:none;">
                        <span class="delete-image">&times;</span>
                    </div>

                </div>

                <div class="contentField">
                    <label class="contentLabel">상세정보</label>
                    <article class="contentArea">
                        <textarea name="contents" placeholder="내용을 입력해주세요." class="content" id="contents">${landmarkDetail.landMarkContent}</textarea>
                    </article>

                    <div class="WritingTag">
                        <div class="tag_inner">
                            <strong class="blind">태그 입력</strong>
                            <div class="tag_input_box inactive">
                                <input type="text" name="hashTag" placeholder="# 태그를 입력해주세요" class="tag_input" style="width: 300px;">
                                <div class="layer_auto_tag" style="display: none;">
                                    <ul class="auto_tag_list"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="text" name="lng" style="display:none;" value="${landmarkDetail.landMarkX}">
                <input type="text" name="lat" style="display:none;" value="${landmarkDetail.landMarkY}">
                <input type="hidden" name="deleteList" id="deleteList" value="">
               
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
    <c:if test="${!empty landmarkDetail}">
        <script>
            let lng = ${landmarkDetail.landMarkX};
            let lat = ${landmarkDetail.landMarkY};
        </script>
    </c:if>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f20849e53010080fd527a7640414c916"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f20849e53010080fd527a7640414c916&libraries=services,clusterer,drawing"></script>
    <script src="${contextPath}/resources/js/landmark/landmarkWrite.js"></script>
</body>
</html>