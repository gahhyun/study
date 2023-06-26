<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/mypage/mypage.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
	<div class="wrap">
	
	<%@ include file="../../fix/header.jsp" %>

      	<section class="sec01">      
        	<div class="mypage-info">
	          	<div class="porfile">
	            	<img  src=${userDTO.image } alt="프로필이미지">
	          	</div>
	          	<div class="user">
	          		<ul>
	          			<li class="user-name">
	          				<span>${userDTO.user_nicknm }</span>
          				</li>
		              	<li class="user-follow">
		                	<span class="user-follow-l"><a href="<c:url value="/mypage/follower" />">팔로워</a></span>
		                	&nbsp;|&nbsp;
		                	<span class="user-follow-l"><a href="<c:url value="/mypage/following" />">팔로잉</a></span>
		              	</li>
	              	</ul>
              	</div>
              	
              	<div class="set">
              		<ul>
              			<li>
              				<a href="<c:url value="/mypage/setting" />">
              				<img class="set-img" src="${path}/resources/images/img/톱니.png" alt="설정이미지">
            				</a>
           				</li>
           				<li>
           					<a href='<c:url value="/logout" />' class="logout">로그 아웃</a>
       					</li>
   					</ul>
				</div>
			</div>
		</section>
		
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
		
		<section class="sec02">
			<div class="mymenu">
				<div class="mycontent">
					<ul>
						<li class="mydiary">
							<img class="mimg" src="${path}/resources/images/img/free-icon-diary-6393039.png" alt="다이어리">
							<a href="<c:url value="/mypage/mydiary" />">나만의 다이어리</a>
						</li>
			            <li class="myrivew">
			            	<img class="mimg" src="${path}/resources/images/img/free-icon-review-3501894.png" alt="리뷰">
			                <a href="<c:url value="/mypage/myreview" />">나의 리뷰</a>
			            </li>
			            <li class="#">
			                <img class="mimg" src="${path}/resources/images/img/free-icon-heart-6063477 2.png" alt="다이어리">
			                <a href="#">좋아요 누른 리뷰</a>
			            </li>
			            <li class="#">
			                <img class="mimg" src="${path}/resources/images/img/comment.png" alt="리뷰">
			                <a href="#">댓글 작성 리뷰</a>
			            </li>
		            </ul>
	            </div>
        
		        <div class="mypost">
		        	<ul>
		        		<li class="mywrite">
		                	<img class="mimg" src="${path}/resources/images/img/KakaoTalk_20230411_161709664.png" alt="게시글">
		                	<a href="<c:url value="/mycommynity/postcommu" />">내가 쓴 게시글</a>
		                </li>
		              	<li class="mylike">
		                	<img class="mimg" src="${path}/resources/images/img/free-icon-heart-6063477 2.png" alt="좋아요">
		                	<a href="<c:url value="/mycommynity/likecommunity" />">좋아요 누른 게시글</a>
		              	</li>
		              	<li class="mycomment">
			                <img class="mimg" src="${path}/resources/images/img/comment.png" alt="댓글">
			                <a href="<c:url value="/mycommynity/comment" />">나의 댓글</a>
		                </li>
	                </ul>
                </div>
               
			</div>
		</section>
	</div>
</body>
</html>