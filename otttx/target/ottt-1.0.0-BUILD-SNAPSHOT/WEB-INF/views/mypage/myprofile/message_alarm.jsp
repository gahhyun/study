<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> 댓글 외 알림</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/mypage/message_alarm.css" >
    <script type="text/javascript" src="js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
  </head>

  <body style="background-color: #202020;">
     
    <div class="wrap">
      <header >
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

      <nav class="mnb">
        <ul>
<li><a href="<c:url value="/mypage/myreview" />" class="mreview">기록</a></li>
          <li><a href="<c:url value="/mypage/wishlist" />">찜목록</a></li>
          <li><a href="<c:url value="/mypage/watched" />">봤어요</a></li>
          <li><a href="<c:url value="/mypage/alarm" />" style="color: #33ff33">알림함</a></li>
          <li><a href="<c:url value="/mypage/message" />" >쪽지함</a></li>
        </ul>
      </nav>


      <div class="push">
        <section class="sec02">
          <span class="alarm-1-1"><img class="profile" src="${path}/resources/images/img/이브이.png" alt="profile" /></span>
          <a href="#">
            <div class="push-alarm">피카츄 님이 댓글에 좋아요를 눌렀습니다.</div>
          </a>
          <button type="button" class="btn-delete"><img src="${path}/resources/images/img/delete-normal.png" alt="delete"></button>
        </section>
      </div>

      <div class="push">
        <section class="sec03">
          <span class="alarm-1-1"><img class="profile" src="${path}/resources/images/img/이브이.png" alt="profile" /></span>
          <a href="#">
            <div class="push-alarm">뚜벅초파이리꼬부기버터풀또가스 님이 댓글에 좋아요를 눌렀습니다.</div>
          </a>
          <button type="button" class="btn-delete"><img src="${path}/resources/images/img/delete-normal.png" alt="delete"></button>
        </section>
      </div>

      <div class="push">
        <section class="sec02">
          <span class="alarm-1-1"><img class="profile" src="${path}/resources/images/img/이브이.png" alt="profile" /></span>
          <a href="#">
            <div class="push-alarm">이브이 님이 댓글에 좋아요를 눌렀습니다.</div>
          </a>
          <button type="button" class="btn-delete"><img src="${path}/resources/images/img/delete-normal.png" alt="delete"></button>
        </section>
      </div>

      <div class="push">
        <section class="sec02">
          <span class="alarm-1-1"><img class="profile" src="${path}/resources/images/img/이브이.png" alt="profile" /></span>
          <a href="#">
            <div class="push-alarm">이브이 님이 댓글에 좋아요를 눌렀습니다.</div>
          </a>
          <button type="button" class="btn-delete"><img src="${path}/resources/images/img/delete-normal.png" alt="delete"></button>
        </section>
      </div>

      <div class="push">
        <section class="sec02">
          <span class="alarm-1-1"><img class="profile" src="${path}/resources/images/img/이브이.png" alt="profile" /></span>
          <a href="#">
            <div class="push-alarm">피카츄 님이 댓글에 좋아요를 눌렀습니다.</div>
          </a>
          <button type="button" class="btn-delete"><img src="${path}/resources/images/img/delete-normal.png" alt="delete"></button>
        </section>
      </div>

    </div>
  </body>
</html>
        