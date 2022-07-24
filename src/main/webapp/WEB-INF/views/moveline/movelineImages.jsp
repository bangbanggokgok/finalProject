<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script
      src="https://kit.fontawesome.com/243327ab3a.js"
      crossorigin="anonymous"
    ></script>
</head>
<body>
  <section id="slide1">
      <div class="container">
        <ul class="slider-container simple-list" id="slider">
          <c:forEach var="moveLineImg" items="${movelineImage}">
            <li class="slide">
              <c:set var="moveLineImg" value="${moveLineImg.movelineRename}"/>
              <img class="slide-img" src="${contextPath}/${moveLineImg}" alt="first_img">
            </li>
          </c:forEach>
          <c:forEach var="landmarkImage" items="${landmarkImage}">
              <li class="slide" id="landmark-images">
                <c:set var="landmarkImage" value="${landmarkImage.landMarkReName}"/>
                <img clas="slide-img" src="${contextPath}/${landmarkImage}" alt="first_img">
              </li>
          </c:forEach>
        </ul>

        <p class="pager">
          <!-- <span data-idx="0">1</span>
                      <span data-idx="1">2</span>
                      <span data-idx="2">3</span>
                      <span data-idx="3">4</span>
                      <span data-idx="4">5</span>
                      <span data-idx="5">6</span> -->
        </p>

        <a id="prev">
          <li class="fa-solid fa-angle-left"></li>
        </a>
        <a id="next">
          <li class="fa-solid fa-angle-right"></li>
        </a>
      </div>
  </section>


</body>
</html>