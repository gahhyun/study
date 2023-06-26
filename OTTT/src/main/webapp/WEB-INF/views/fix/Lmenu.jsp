<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/fix/Lmenu.css" >
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <title>Document</title>
</head>
<body>
	<div class="Lcontent">
		<div class="Lmenu">
			<ul>
				<li id="Ldiary">
					<img class="mimg" src="${path}/resources/images/img/free-icon-diary-6393039.png" alt="다이어리">
					<a href="<c:url value="/mypage/mydiary?user=${userDTO.user_nicknm }" />">나만의 다이어리</a>
				</li>
				<li id="Lreview">
                	<img class="mimg" src="${path}/resources/images/img/free-icon-review-3501894.png" alt="리뷰">
                	<a href="<c:url value="/mypage/myreview?user=${userDTO.user_nicknm }" />">나의 리뷰</a>
              	</li>
              	<li id="Lwrite">
                	<img class="mimg" src="${path}/resources/images/img/KakaoTalk_20230411_161709664.png" alt="게시글">
                	<a href="<c:url value="/community/freecommunity?user=${userDTO.user_nicknm }&category=myPost" />">내가 쓴 게시글</a>
              	</li>
              	<li id="Llike">
	                <img class="mimg" src="${path}/resources/images/img/heart_on.png" alt="좋아요">
	                <a href="<c:url value="/community/freecommunity?user=${userDTO.user_nicknm }&category=myLike" />">좋아요 누른 게시글</a>
	            </li>
    	        <li id="Lcomments">
                	<img class="mimg" src="${path}/resources/images/img/comment.png" alt="댓글">
                	<a href="<c:url value="/community/freecommunity?user=${userDTO.user_nicknm }&category=myComment" />">나의 댓글</a>
              	</li>
           	</ul>
		</div>
    </div>
</body>
</html>