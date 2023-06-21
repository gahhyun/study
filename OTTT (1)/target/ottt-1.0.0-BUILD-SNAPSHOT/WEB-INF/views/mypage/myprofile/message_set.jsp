<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>쪽지 설정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/mypage/message_set.css" >
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
                <span onclick="location.href='<c:url value="/mypage/follower" />'">팔로워</span>
                <span>|</span>
                <span onclick="location.href='<c:url value="/mypage/following" />'">팔로잉</span>
              </li>
            </ul>
        </div>

        </div>
      </section>

      <nav class="mnb">
        <ul>
          <li><a href="<c:url value="/mypage/myreview" />" class="mreview">기록</a></li>
          <li><a href="<c:url value="/mypage/wishlist" />">찜목록</a></li>
          <li><a href="<c:url value="/mypage/watched" />">봤어요</a></li>
          <li><a href="<c:url value="/mypage/alarm" />">알림함</a></li>
          <li><a href="<c:url value="/mypage/message" />" style="color: #33ff33">쪽지함</a></li>
        </ul>
      </nav>

      <section class="sec02">
      <div class="set" style="padding-bottom: 10px;"><img class="set-img2" src="${path}/resources/images/img/톱니.png" alt="설정이미지">
        <span class="set-message" style="font-size: 35px;">쪽지 설정</span>
      </div>
      </section>

      <section class="sec02">
      <ul>
      <li>
        <div class="form-check">
        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
        <label class="form-check-label" for="flexRadioDefault1">
          전체 받기
        </label>
        </div>
      </li>
      <li>
      <div class="form-check">
        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
        <label class="form-check-label" for="flexRadioDefault2">
          나를 팔로워하는 사람에게 받기
        </label>
      </div>
    </li>
    <li>
      <div class="form-check">
        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3">
        <label class="form-check-label" for="flexRadioDefault3">
            내가 팔로잉하는 사람에게 받기
        </label>
      </div>
    </li>
    <li>
      <div class="form-check">
        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault4" checked>
        <label class="form-check-label" for="flexRadioDefault4">
          전체 거부
        </label>
      </div>
    </li>
    </ul>
      </section>
  </body>
</html>