<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>설정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/mypage/setting.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
	<div class="wrap">
		<%@ include file="../../fix/header.jsp" %>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$(".byebye").on("click", function() {
					if (!confirm("정말 탈퇴할거야??")) return;
					
					let form = $("#form")
					form.attr("action", "<c:url value='/mypage/setting/goodbye ' />")
					form.attr("method", "post")
					form.submit()
				})				
				
			})
		</script>
		
		<script type="text/javascript">
			let msg = "${msg}"
			if(msg == "hi") alert("가지마")
			if(msg == "CHG_OK") alert("비밀번호 변경에 성공하셨습니다")
    	</script>

		<form class="sec01" action="" id="form">
			<div class="info-main">
				<div>
				    <a href="<c:url value='/mypage/setting/myprofile' />">프로필 변경</a>
				</div>
				<div>
				    <a href="<c:url value='/mypage/setting/myinfo' />">비밀번호 변경</a>
				</div>
				<div>
				    <a href="<c:url value='/mypage/setting/addInfo' />">내 정보 변경</a>
				</div>
				<div>
				    <button class="byebye">회원탈퇴</button>
				</div>
				<div class="backBtn">
				    <a href="<c:url value='/mypage?user=${sessionScope.user_nicknm }' />">뒤로</a>
				</div>
			</div>
		</form>
	</div>

</body>
</html>