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
					<img class="mimg" src="${path}/resources/images/img/free-icon-diary-6393039.png" >
					<a href="<c:url value="/mypage/mydiary?user=${userDTO.user_nicknm }" />">나만의 다이어리</a>
				</li>
				<li id="Lreview">
                	<img class="mimg" src="${path}/resources/images/img/free-icon-review-3501894.png" >
                	<a href="<c:url value="/mypage/myreview?user=${userDTO.user_nicknm }" />">나의 리뷰</a>
              	</li>
              	<li id="Lwrite">
                	<img class="mimg" src="${path}/resources/images/img/heart_on.png" >
                	<a href="<c:url value="/mypage/myreview?user=${userDTO.user_nicknm }&category=1" />">좋아요 누른 리뷰</a>
              	</li>
              	<li id="Llike">
	                <img class="mimg" src="${path}/resources/images/img/comment.png" >
	                <a href="<c:url value="/mypage/myreview?user=${userDTO.user_nicknm }&category=2" />">댓글 작성 리뷰</a>
	            </li>
           	</ul>
		</div>
    </div>
</body>
</html>