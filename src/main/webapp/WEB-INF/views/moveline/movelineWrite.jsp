<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>코스 작성</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/moveline/ml-write-style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>


    <section class="header">
        <section class="pageWrapper">
            <h1 class="boardTitle">나만의 코스를 만들어주세요!</h1>
        </section>
    </section>

    <section class="board">
        <section class="pageWrapper"> 
            <form action="#" method="POST" enctype="multipart/form-data" onsubmit="return mlWriteValidation()">
                <div class="titleFields">
                    <div>
                        <label class="title" for="title">코스 제목</label>
                        <input placeholder="제목을 입력해주세요." maxlength="50" class="titleInput" id="title" name="courseName" value="${movelineTitle}">
                        
                        <!-- 지역 리스트 조회 필요-->
                        <label class="optionList">지역 선택</label>

                        <select name="locationsList" id="locations-list" 
                        onchange="connectLocation(this.value);"
                        style="width:400px;height:40px;">

                        <option value="locationNull" selected disabled>지역을 선택해주세요.</option>
                            <c:forEach var="locations" items="${locationList}">
                                <option value="${locations.locationName}">${locations.locationName}</option>        
                            </c:forEach>
                        </select>

                        <%-- 안됨 --%>
                        <%-- <c:forEach var="landmarkList" items="${landmarkList}">
                            <c:set var="landmarkName" value="${landmarkList.landMarkName}"/>
                            ${landmarkName}
                        </c:forEach> --%>
                        
                        <!-- 랜드마크 리스트 조회 -->
                        <label class="optionList">랜드마크 담기<span>(최소 2개, 최대 8개)</span></label> 
                        <select class="landmarkList" name="landmarkList" id="landmark-list1">
                            <!-- 랜드마크 리스트 가져와서 담기 -->
                            <c:forEach var="list" items="${landmarkList}">
                                <c:set var="landmarkName" value="${list.landMarkName}"/>
                                <option value="landmarkNull" selected disabled>랜드마크1</option>
                                <option value="${landmarkName}">${landmarkName}</option>        
                            </c:forEach>
                            ${list.landMarkName}
                        </select>

                        



                        
                        <div>
                            <label class="optionList">테마 선택<span>(중복 체크 가능)</span></label>
                            <div class="themeSelect">
                                <input type="checkbox" name="themeSelect" id="theme1"><label for="theme1">가족</label>
                                <input type="checkbox" name="themeSelect" id="theme2"><label for="theme2">아이</label>
                                <input type="checkbox" name="themeSelect" id="theme3"><label for="theme3">데이트</label>
                                <input type="checkbox" name="themeSelect" id="theme4"><label for="theme4">도보</label>
                                <input type="checkbox" name="themeSelect" id="theme5"><label for="theme5">힐링</label>
                                <input type="checkbox" name="themeSelect" id="theme6"><label for="theme6">맛집</label>
                                <input type="checkbox" name="themeSelect" id="theme7"><label for="theme7">캠핑</label>
                            </div>
                        </div>

                    </div>
                </div>
    

                <!-- 업로드 이미지 -->
                <label class="addImg" style="font-weight:bold;">사진 첨부<span>(1장 필수)</span></label>
                <div class="img-box">
    
                    <div class="boardImg">
                        <label for="img0">
                            <img class="far fa-plus-circle fa-lg preview" src="">
                        </label>
                        <input type="file" class="input-img" id="img0" name="images" accept="image/*" style="display:none;">
                        <span class="delete-image">&times;</span>
                    </div>

                    <div class="boardImg">
                        <label for="img1">
                            <img class="far fa-plus-circle fa-lg preview" src="">
                        </label>
                        <input type="file" class="input-img" id="img1" name="images" accept="image/*" style="display:none;">
                        <span class="delete-image">&times;</span>
                    </div>
    
                    <div class="boardImg">
                        <label for="img2">
                            <img class="far fa-plus-circle fa-lg preview" src="">
                        </label>
                        <input type="file" class="input-img" id="img2" name="images" accept="image/*" style="display:none;">
                        <span class="delete-image">&times;</span>
                    </div>
                    
                    <div class="boardImg">
                        <label for="img3">
                            <img class="far fa-plus-circle fa-lg preview" src="">
                        </label>
                        <input type="file" class="input-img" id="img3" name="images" accept="image/*" style="display:none;">
                        <span class="delete-image">&times;</span>
                    </div>
                    
                    <input type="hidden" name="deleteList" id="deleteList" value="">
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
                                <input type="text" name="hashTag" placeholder="# 태그를 입력해주세요" class="tag_input" style="width: 300px;">
                                <div class="layer_auto_tag" style="display: none;">
                                    <ul class="auto_tag_list"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
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
	<script>
        const contextPath = "${contextPath}";
        const loginUserNo = "${loginUser.userNo}";
    </script>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
<script src="${contextPath}/resources/js/moveline/movelineWrite.js"></script>
</html>