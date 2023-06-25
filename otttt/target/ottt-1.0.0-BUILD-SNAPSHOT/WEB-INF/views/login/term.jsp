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
    <title>약관동의</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/login/term.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
</head>
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
			<form method="post" action="서버의url" id="membership">
				<h1 style="font-size: 21px; display: inline-block;">약관동의</h1>
				<label class="box1">
					<input type="checkbox" id="agree-all">
					모두 동의
				</label>
				
				<div class="Agree1" style="overflow-y:scroll;  width:500px; height:150px;">
					<div style="border: 1px solid black; padding: 10px;">집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다</div>
				</div>
				
				<label class="box2">
					<input type="checkbox" class="agreecheck" id="agreecheck2">
					약관 동의
				</label>
				
				<div class="Agree2" style="overflow-y:scroll;  width:500px; height:150px;">
					<div style="border: 1px solid black; padding: 10px;">집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다집에가고싶다</div>
				</div>
				
				<label class="box3">
				    <input type="checkbox" class="agreecheck" id="agreecheck3">
				    약관 동의
				</label>

				<script>
				    const agreeAllCheckbox = document.getElementById('agree-all');
				    const agreeCheckboxes = document.querySelectorAll('.agreecheck');
				
				    agreeAllCheckbox.addEventListener('change', (event) => {
				        const isChecked = event.target.checked;
				        agreeCheckboxes.forEach((checkbox) => {
				            checkbox.checked = isChecked;
				        });
				    });
				    
				    const membershipForm = document.getElementById('membership');

				    membershipForm.addEventListener('submit', (event) => {
				    	const isAllAgreed = Array.from(agreeCheckboxes).every((checkbox) => checkbox.checked);
				    	if (!isAllAgreed) {
			    			event.preventDefault();
			    			alert('모든 약관에 동의해주세요.');
		    			}
			    	});
			    </script>
			    
			    <div class="back">
		    		<input type="button" value="이전" onClick="location.href='<c:url value="/login" />'">
                </div>
                
                <div class="complate">
                	<input type="submit" value="다음"onClick="location.href='<c:url value="/signin/register" />'">
               	</div>
			</form>
		</section>
	</div>
	
  </body>
</html>
