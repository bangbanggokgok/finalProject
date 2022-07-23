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
  <section class="slide1">
      <div class="container">
          <ul class="slider-container simple-list" class="slider">
            <c:forEach var="landmarkImage" items="${landmarkImage}">
              <li class="slide" id="landmark-images">
                <c:set var="landmarkImage" value="${landmarkImage.landMarkReName}"/>
                <img clas="slide-img" src="${contextPath}/${landmarkImage}" alt="">
              </li>
            </c:forEach>
          </ul>

          <p class="pager">
          </p>

          <a class="prev">
            <li class="fa-solid fa-angle-left"></li>
          </a>
            <li class="fa-solid fa-angle-right"></li>
          <a class="next">
          </a>
      </div>
  </section>

</body>
</html>