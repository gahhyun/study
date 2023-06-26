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
    <title>비밀번호 찾기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/resources/css/login/findpwd.css" >
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
			<form method="post" action="<c:url value='/login/checkPwd' />" id="membership">
				<h1 style="font-size: 21px; display: inline-block;">비밀번호 찾기</h1>
				<div class="Id">
					<input type="text" id="id" title="ID" maxlength="15"  placeholder="아이디 입력" >
					<p id="idError" style="color: red;"></p>
              	</div>
              	
                <div class="email">
                	<input type="email" id="email" title="EM" maxlength="20"  placeholder="이메일" >
	                 	<span>
		                  	<select name="직접입력">
			                    <option value="select">직접입력</option>
			                    <option value="남자">naver.com</option>
			                    <option value="여자">gmail.com</option>
		                    </select>
	                    </span>
                    <button id="send-verification-code">인증번호 발송</button>
				</div>
				
                <div class="Certification">
                	<input type="text" id="Certification" title="EM" maxlength="20" placeholder="인증번호" >
                	<button disabled id="completion" onclick="checkCompletion()">인증확인</button>
               	</div>
               	
          
       			
                <div class="complate">
                	<input type="submit" value="다음">
               	</div>
           	 </form>
       	 </section>
  	 </div>
  	 
  </body>
</html>
