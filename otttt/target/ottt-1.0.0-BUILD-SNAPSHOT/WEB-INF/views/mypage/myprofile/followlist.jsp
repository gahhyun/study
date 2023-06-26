<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>followlist</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/mypage/followlist.css" >
    <script type="text/javascript" src="js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
  </head>
  <body style="background-color: #202020;">
     
    <div class="wrap">
      <header>
        <div class="logo">
          <a href="<c:url value="/" />">
				  <img src="${path}/resources/images/logo/OTTT.png" alt="로고">
				</a>
			</div>
			<nav class="gnb">
				<ul>
            <li>
              <a href="<c:url value="/genre/movie" />">영화</a>
            </li>
            <li>
              <a href="<c:url value="/genre/drama" />">드라마</a>
            </li>
            <li>
              <a href="<c:url value="/genre/interest" />">예능</a>
            </li>
            <li>
              <a href="<c:url value="/genre/animation" />">애니</a>
            </li>
            <li>
              <a href="<c:url value="/community" />">게시판</a>
            </li>
          </ul>
        </nav>
        <div class="h-icon">
          <ul>
            <li>
              <a href="<c:url value='/search' />">
              </a>
            </li>
            <li>
              <a href="<c:url value='/mypage' />">
              </a>
            </li>
          </ul>
        </div>
      </header>

      <section class="sec01">      
        <div class="mypage-info">
          <div class="porfile">
            <img  src="${path}/resources/images/img/이브이.png" alt="프로필이미지">
          </div>
        <div class="user">
            <ul>
              <li class="user-name">
                <span>뚜 벅</span>
              </li>
              <li class="user-follow">
                <span onclick="location.href='#'">팔로워</span>
                <span>|</span>
                <span onclick="location.href='#'">팔로잉</span>
              </li>
            </ul>
        </div>
        <div class="btn_more_div" >
              <a href="<c:url value='/mypage/setting' />">
                <img src="${path}/resources/images/img/톱니.png" class="set-img" >
              </a>
        </div>
       </div>
      </section>
          
      <div class="line-green"></div>

      <div class="push">
        <section class="sec02">
          <span class="alarm-1-1">
          <a href="#">
            <img class="fol-pro" src="${path}/resources/images/img/이브이.png" alt="profile" /></span>
            <div class="push-alarm">피카츄</div>
          </a>
          <input type="checkbox" class="btn-check" id="btn-check-outlined00" autocomplete="off" checked>
        <label class="btn btn-outline-primary" for="btn-check-outlined00">팔로우 취소</label><br>
        </section>
        
      </div>



  </div>
  </body>
</html>