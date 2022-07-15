<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/noticeDetail.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/admin_/adminNav.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
</head>

<body>
    <section class="header">
        <section class="pageWrapper">
            <h1 font-size="24px" class="boardTitle">공지</h1>
        </section>
    </section>

    <section class="board">
        <section class="navWrapper">
            <div class="adminNav">
                <ul class="listWrapper">
                    <div class="adminList">Admin</div>
                    <li id="adminList">
                        <i class="fal fa-clipboard-list-check"></i> 공지사항
                        <div>
                            <a href="">공지/이벤트 조회</a><br>
                            <a href="">공지/이벤트 작성</a>
                        </div>
                    </li>
                    <li id="adminList">
                        <a href=""><i class="fal fa-user-friends"></i> 회원관리</a>
                    </li>
                    <li id="adminList">
                        <a href=""><i class="fal fa-map-marker-question"></i> 1:1 문의조회</a>
                    </li>
                    <li id="adminList">
                        <a href=""><i class="fal fa-siren-on"></i> 신고관리</a>
                    </li>
                </ul>

            </div>

        </section>

        <section class="pageWrapper" id="contentWrapper">
            <form>
                
                <div class="title">공지제목</div>

                <!-- 이미지 조회 -->
                <c:set var="start" value="0"/>
                

                <c:if test="${fn:length(detail.imageList) > start}">

                    <!-- 업로드 이미지 영역 -->
                    <div class="img-box">
                        <c:forEach var="i" begin="${start}" end="${fn:length(detail.imageList) -1 }">
                        
                            <div class="boardImg">
                                <img src="${contextPath}${detail.imageList[i].imageReName}">
                            </div>

                        </c:forEach>
                    </div>
                </c:if> 

                <div class="contentArea">
                    <div class="content">
                    풍부하게 하는 것이다 보라 청춘을 ! 그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은 웅대한 관현악이며
                    </div>
                </div>
                

                <section class="submitBar">
                    <div class="buttonContainer">
                        <button type="button" disabled="" class="submitButton">수정하기</button>
                    </div>
                </section>
            </form>
            <div class="sc-fznxKY bjxHni">
                <section class="sc-fzpmMD fpVDsP"></section>
            </div>
                
            </form>
            
        </section>
    </section>
</body>

</html>