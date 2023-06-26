<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>내 정보 변경</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/mypage/myinfo.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
	<div class="wrap">
		<%@ include file="../../fix/header.jsp" %>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$(".done").on("click", function() {
 					if (!confirm("정말 바꾸시겠습니까?")) return;
					
					let form = $("#form")
					form.attr("action", "<c:url value='/mypage/setting/myinfo ' />")
					form.attr("method", "post")
					form.submit()
					
					/*$(".body").html("수정이 완료되었습니다.");
			        $('#Modal').modal('show'); */
					
				})
				
				$(".cancleBtn").on("click", function() {
					location.href = "<c:url value ='/mypage/setting' />"
				})				
				
			})
		</script>
		
		<script type="text/javascript">
			let msg = "${msg}"
			if(msg == "CHG_ERR") alert("비밀번호 변경에 실패했습니다. 다시 시도해 주세요")
    	</script>

		<section class="sec01">
			<form action="" id="form" class="info-main">
				<div class="info">
					<label>이메일</label>
					<input type="text" name="user_email" placeholder="${userDTO.user_email }" class="input-field" disabled="disabled"/>
				</div>

				<div class="info">
					<label>비밀번호</label>
            		<input type="password" name="user_pwd" id="pwd" class="input-field" placeholder="비밀번호" autofocus="autofocus"/>
          		</div>
          		
          		<div class="info">
          			<label>비밀번호 확인</label>
		            <input type="password" name="re_pwd" id="repwd" class="input-field" placeholder="비밀번호 확인" />
		        </div>
		        	<div class="button">
		        		<button class="cancleBtn" type="button">취소</button>
		            	<button class="done" type="button">확인</button>
		          	</div>
          	</form>
       	</section>
   	</div>
</body>
</html>