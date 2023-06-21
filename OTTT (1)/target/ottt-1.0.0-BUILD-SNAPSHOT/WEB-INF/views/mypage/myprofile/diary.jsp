<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ottt</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/mypage/mypage.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
	<div class="wrap">
	
	<%@ include file="../../fix/header.jsp" %>		

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
						<img class="poster" src="${path}/resources/images/poster/begin.jpg" alt="비긴어게인">
					</div>
					
					<div class="c-main">
						<div class="c-title">
							<span class="diary-title">비긴어게인</span>
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
		                  <button class="done" type="button" onclick="">등록</button>
		                </div>          
		
					</div>      
				</form>
			</div>
		</section>
	</div>

</body>
</html>