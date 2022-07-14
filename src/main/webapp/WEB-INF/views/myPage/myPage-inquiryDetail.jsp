<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1문의</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPage-inquiryDetail.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <section class="header">
        <section class="pageWrapper">
            <h1 font-size="24px" class="boardTitle">1:1 문의</h1>
        </section>
    </section>

    <section class="board">

        <section class="pageWrapper" id="contentWrapper">
                
                <div class="title">ㅇㅇㅇ에 대해 문의드립니다.<br>
                    <span class="createDate">작성일 : 2022-07-14 11:11:11</span>
                </div>

                <div class="contentArea">
                    <div class="content">
                        풍부하게 하는 것이다 보라 청춘을 ! 그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은 웅대한 관현악이며
                    </div>
                </div>
                
                <div class="replyArea">
                    <div>
                        <p>관리자</p>
                        <p>
                            안녕하세요.. 답변
                            풍부하게 하는 것이다 보라 청춘을 ! 그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은 웅대한 관현악이며
                        </p>
                    </div>
                </div>
            
        </section>
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>