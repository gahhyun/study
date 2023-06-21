<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/login/register.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <style>
    	.ott-logo-img:hover,
		.ott-logo-img.active {
			outline: 3px solid #33ff33;
		}
    </style>
    <title>회원가입</title>
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
		    <form:form modelAttribute="userDTO" method="post">
		    <h1 style="font-size: 21px; display: inline-block;">회원가입</h1>
		    	<div>
					<div class="Id">
						<input type="text" name="user_id" id="id" title="ID" maxlength="15"  placeholder="아이디 입력" required pattern="^[a-zA-Z0-9]+$">
					    <span class="errorMsg" id="idErrorMsg"></span> 
					    <div class="idChk">
		              	<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
						<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
					  </div>
					</div>
					
					<div class="password">
					    <input type="password" name="user_pwd" id="password" title="PW" maxlength="20" placeholder="비밀번호 입력" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[^\da-zA-Z])(.{8,20})$">
					    <span class="errorMsg" id="passwordErrorMsg"></span>
					</div>
					
					<div class="passwordCheck">
					    <input type="password" id="passwordCheck" title="PWC" maxlength="20" placeholder="비밀번호 재확인" required>
					    <span class="errorMsg" id="passwordCheckErrorMsg"></span>
					</div>
				</div>
				
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				
				<script>
		    	//아이디 중복검사
				$('.id_input').on("propertychange change keyup paste input", function(){
					
					var memberId = $('.id_input').val();			// .id_input에 입력되는 값
				  	var data = {memberId : memberId};				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
				  
				  	$.ajax({
				  		type : "post",
					    url : "/member/memberIdChk",
					    data : data,
					    success : function(result){
					    	
					    	// console.log("성공 여부" + result);					    	
							if(result != 'fail'){
							  $('.id_input_re_1').css("display","inline-block");
							  $('.id_input_re_2').css("display", "none");				
							} else {
							  $('.id_input_re_2').css("display","inline-block");
							  $('.id_input_re_1').css("display", "none");				
							}
				     
						}// success 종료
				
					}); // ajax 종료
				
				});// function 종료
				
				$(document).ready(function() {
					
					// 아이디 유효성 검사
			        $('#id').on('blur', function() {
			        	
			        	var idValue = $(this).val();
			          	var idRegex = /^[a-zA-Z0-9]+$/;
			          	
			          	if (!idRegex.test(idValue)) {
			          		$('#idErrorMsg').text('아이디는 영문자와 숫자만 사용 가능합니다.');
			          	} else if (idValue.length < 6) {
			          		$('#idErrorMsg').text('아이디는 6자 이상이어야 합니다.');
			          	} else {
			          		$('#idErrorMsg').text('');
		          		}
		          	});
		        
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
		        	
			        //이름 유효성검사
			        $("#name").on("blur",function(){
			        	
			        	var nameRegex = /^[가-힣]{2,4}$/;
		            	var nameValue = $(this).val();
		            	
		            	if(!nameRegex.test(nameValue)){
		            		$('#nameErrorMsg').text('한글만 입력 가능합니다.');
	            		} else{
	            			$('#nameErrorMsg').text('');
            			}
	            	});
		        });
		
		     
		        $(document).ready(function(){
		        	
		        	$(".join_button").click(function(){
		        		//회원가입 버튼(회원가입 기능 작동)
		        		if(idValue&&passwordValue&&passwordCheckValue&&passwordRegex&&nameValue&&nameRegex){
		        			$("#membership").attr("action", "/member/join");
		        			$("#membership").submit();
	        			}
		        		
		        		return false;
	        		});
	        	});
		        
		        </script>
		        
		        <div class="name">
		        	<input type="text" name="user_nm" id="name" title="NM" maxlength="10" placeholder="이름" >
		        	<span>
		        		<select name="user_gen">
				            <option value="">선택</option>
				            <option value="1">남자</option>
				            <option value="2">여자</option>
				            <option value="0">비공개</option>
			            </select>
		            </span>
		            
		            <script>
			            const form = document.querySelector('form');
			            const genderSelect = form.querySelector('select[name="user_gen"]');
			
			            form.addEventListener('submit', (event) => {
			            	if (genderSelect.value === '') {
			            		event.preventDefault(); // 폼 제출을 막습니다.
			                	alert('성별을 선택해주세요.');
		            		}
		            	});
					</script>
		
					<div class="nname">
						<input type="text" name="user_nicknm" id="nname" title="NNM" maxlength="10" placeholder="닉네임" >
					</div>
					
					<script>
			            const form2 = document.querySelector('form2');
			            const emailInput = document.querySelector('#email');
			            
			            function validateEmail(email) {
			            	const re = /\S+@\S+\.\S+/;
			            	return re.test(email);
		            	}
			            
			            form.addEventListener('submit', function(event) {
			            	const email = emailInput.value.trim();
			            	if (!validateEmail(email)) {
			            		alert('유효한 이메일 주소를 입력해주세요.');
			            		event.preventDefault();
		            		}
		            	});
		            </script>
		
		          	<div class="email">
		           		<input type="email" name="user_email" id="email" title="EM" maxlength="20"  placeholder="이메일" >
		           		<span>
		            		<select id="domain" name="직접입력">
								<option value="select">직접입력</option>
								<option value="naver.com">네이버</option>
								<option value="gmail.com">구글</option>
							</select>
						</span>
					
			           	<script>
			           		document.getElementById('domain').addEventListener('change', function() {
			           			var domain = this.value;
			           			if (domain !== 'select') {
			           				document.getElementById('email').value += '@' + domain;
	           					}
		           			});
		           		</script>
		           		
		           		<button id="send-verification-code">인증번호 발송</button>
           			</div>
           			
		          	<div class="Certification">
		          		<input type="text" id="Certification" title="EM" maxlength="20"  placeholder="인증번호" >
			          	<button disabled id="completion" onclick="checkCompletion()">인증확인</button>
		          	</div>
		          	
		          	<div class="back">
		          		<input type="button" value="이전" onClick="location.href='<c:url value="/login" />'">
	          		</div>
	          		
	          		<div class="complate">
	          			<input type="submit" value="다음">
          			</div>
       			</div>
   			</form:form>
		</section>
	</div>
	
</body>
</html>
