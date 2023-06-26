<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ottt</title>

    <link rel="stylesheet" href="${path}/resources/css/mypage/eidtdiary.css" >
    <script src="./script/jquery-3.6.1.min.js"></script>
    <script src="./script/script.js"></script>
</head>
<body>
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
                <!-- <img src="./images/icon/search02.png" alt="검색"> -->
              </a>
            </li>
            <li>
              <a href="<c:url value='/mypage' />">
                <!-- <img src="./images/icon/user01.png" alt="내 정보"> -->
              </a>
            </li>
          </ul>
        	</div>
		</header>

		<section class="sec01">
			<nav class="mnb">
				<ul>
					<li>
						<a href="<c:url value="/mypage/myreview" />" class="mreview">기록</a>
					</li>
					<li>
					    <a href="<c:url value="/mypage/wishlist" />">찜목록</a>
					</li>
					<li>
					    <a href="<c:url value="/mypage/watched" />">봤어요</a>
					</li>
					<li>
					  	<a href="<c:url value="/mypage/alarm" />">알림함</a>
					</li>
					<li>
					  	<a href="<c:url value="/mypage/message" />">쪽지함</a>
					</li>
				</ul>
            </nav>
		</section>

		<section class="sec02">
			<div class="main">
				<div class="blank"></div>
				<form action="#" id="diary-main">
					<div class="l-main">
						<img class="poster" src="${path}/resources/images/poster/lala.jfif" alt="라라랜드">
					</div>
					
					<div class="c-main">
						<div class="c-title">
							<span class="diary-title">라라랜드</span>
						</div>
						<div class="diary">
							<label for="story"></label>
							<textarea id="story" name="story"
							 placeholder="내용" spellcheck="false"></textarea>
						</div>
					</div>
					
					<div class="r-main">
						<img class="star" src="./images/icon/point.png" alt="별점">
						<div class="rTop">
							<fieldset class="pnp-button">
								<input type="radio" id="pub"
								 name="public" value="Y">
								<label for="pub">전체 공개</label><br>
								
			                    <input type="radio" id="Npub"
			                    name="public" value="N">
			                    <label for="Npub">비공개</label><br>
	
			                    <input type="radio" id="Fpub"
			                    name="public" value="F">
			                    <label for="Npub">팔로워</label><br>
	                			</fieldset>
						</div>
						
						<div class="rBot">
							<button id="done" class="edit" type="button" onclick="">수정</button>
							&nbsp;/&nbsp;
							<button id="cancle" class="edit" type="button" onclick="">삭제</button>
						</div>
					</div>
				 </form>
			 </div>
		 </section>
	 </div>

</body>
</html>