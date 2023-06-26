<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>비밀번호 재설정</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${path}/resources/css/login/pwdreset.css" >
</head>

<!--  body  --------------------->
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
		
		<section class="sec00">			
			<form method="get" action="<c:url value='/login' />" id="membership">
			<h1 style="font-size: 21px; display: inline-block;">비밀번호 재설정</h1>
				<div class="password">
					<input type="password" id="password" title="PW" maxlength="20"  placeholder="비밀번호 입력" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^\da-zA-Z])(.{8,20})$">
					<span class="errorMsg" id="passwordErrorMsg"></span>
				</div>
				<div class="passwordCheck">
					<input type="password" id="passwordCheck" title="PWC" maxlength="20" placeholder="비밀번호 재확인" required>
					<span class="errorMsg" id="passwordCheckErrorMsg"></span>
				</div>
				
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<script>
       				$(document).ready(function() {
       					
       					// 비밀번호 유효성 검사
				        $('#password').on('blur', function() {
				            var passwordValue = $(this).val();
				            var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
				            if (!passwordRegex.test(passwordValue)) {
				              $('#passwordErrorMsg').text('영문, 숫자, 특수문자를 포함하여 최소8자리 이상으로 입력해야 합니다.');
				            } else {
				              $('#passwordErrorMsg').text('');
				            }
				          });
				          
				          // 비밀번호 재확인
				          $('#passwordCheck').on('blur', function() {
				            var passwordValue = $('#password').val();
				            var passwordCheckValue = $(this).val();
				            if (passwordValue !== passwordCheckValue) {
				              $('#passwordCheckErrorMsg').text('비밀번호가 일치하지 않습니다.');
				            } else {
				              $('#passwordCheckErrorMsg').text('');
				            }
				          });
				        });
				</script>
 
           
               	<div class="complate" style="display: inline-block; Spointer-events: none;;">
                   	<input type="submit" value="완료">

                   </div>
                     	
                   
			</form>	
		</section>
	</div>
    
  </body>
</html>
