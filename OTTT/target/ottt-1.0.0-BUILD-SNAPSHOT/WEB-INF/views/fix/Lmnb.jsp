<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/fix/Lmnb.css" >
    <title>Document</title>
</head>
<body>
	<div class="Lcontent">
		
		<div class="Lmenu">
			<ul>
				<li>
					<img class="mimg" src="${path}/resources/images/img/movie.png" alt="영화">
					<a onclick="javascript:fnCategory(1)">영화</a>
				</li>
				<li>
				  	<img class="mimg" src="${path}/resources/images/img/drama.png" alt="드라마">
					<a onclick="javascript:fnCategory(2)">드라마</a>
				</li>
				<li >
				  	<img class="mimg" src="${path}/resources/images/img/vrt.png" alt="예능">
					<a onclick="javascript:fnCategory(3)">예능</a>
				</li>
				<li>
				  	<img class="mimg" src="${path}/resources/images/img/free-icon-anime-2314736.png" alt="애니">
					<a onclick="javascript:fnCategory(4)">애니</a>
				</li>
      		</ul>
   		</div>
	</div>
    
</body>
</html>