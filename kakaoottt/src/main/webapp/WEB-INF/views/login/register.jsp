<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/login/register.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
    	.ott-logo-img:hover,
		.ott-logo-img.active {
			outline: 3px solid #33ff33;
		}
		
		/* 모달 */
.modal-content{
    background-color: #202020;
}

.modal-body{
    font-size: 26px;
    text-align: center;
    border: 1px solid #fff;
}

.modal-header{
    border: 1px solid #fff;
}

.modal-footer{
    border: 1px solid #fff;
    display: flex;
    justify-content: flex-end;
}
 
.modi-del{
	display: flex;
    justify-content: flex-end;
}


.qa-main p{
    display: flex;
    justify-content: flex-end;
    font-weight: bold;
}

.btn{
    color: #fff;
    background-color: transparent;
    border-style: none;
    border-color: #fff; 
    font-size: 23px; 
    text-decoration: none;
}


.btn:hover{
    border-color: #33FF33;
    background-color: transparent;
    border-style: solid;
    color: #33FF33; 
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

				<script>
				
				var code = "";		// 이메일 전송 인증번호 저장위한 코드
				
				/* 유효성 검사 통과유무 변수 */
				var idCheck = false;		//아이디 중복검사
				var emailCheck = false;		//이메일 중복검사
				var nmCheck = false;		//닉네임 중복검사
				
				$(document).ready(function() {
					
					//아이디 중복검사
					$('.id_input').on("propertychange change keyup paste input", function(){
						
						var user_id = $('.id_input').val();			// .id_input에 입력되는 값
					  	var data = {user_id : user_id};				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
					  
					  	$.ajax({
					  		type : "post",
						    url : "/ottt/signin/memberIdChk",
						    data : data,
						    success : function(result){
						    	
						    	//console.log("성공 여부" + result);					    	
								if(result != 'success'){
									$('.id_input_re_1').css("display","inline-block");
									$('.id_input_re_2').css("display", "none");
									idCheck = false;
								} else {
									$('.id_input_re_2').css("display","inline-block");
									$('.id_input_re_1').css("display", "none");	
									idCheck = true;
								}
					     
							}// success 종료
					
						}); // ajax 종료
					
					});// function 종료
					
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
			        
			        const form = document.querySelector('form');
		            const genderSelect = form.querySelector('select[name="user_gen"]');
		
		            form.addEventListener('submit', (event) => {
		            	if (genderSelect.value === '') {
		            		event.preventDefault(); // 폼 제출을 막습니다.
		            		$(".body").html("성별을 선택해주세요.");
		    	   	     	$('#Modal').modal('show');
	            		}
	            	});
		            
		          //닉네임 중복검사
					$('.nnmame_input').on("propertychange change keyup paste input", function(){
						
						var user_nicknm = $('.nnmame_input').val();			// .id_input에 입력되는 값
					  	var data = {user_nicknm : user_nicknm};				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
					  
					  	$.ajax({
					  		type : "post",
						    url : "/ottt/signin/nnameIdChk",
						    data : data,
						    success : function(result){
						    	
						    	//console.log("성공 여부" + result);					    	
								if(result != 'success'){
									$('.nickname_input_re_1').css("display","inline-block");
									$('.nickname_input_re_2').css("display", "none");
									nmCheck = false;
									
								} else {
									$('.nickname_input_re_2').css("display","inline-block");
									$('.nickname_input_re_1').css("display", "none");
									nmCheck = true;
								}
					     
							}// success 종료
					
						}); // ajax 종료
					
					});// function 종료
					
					//닉네임 유효성검사
			        $("#nname").on("blur",function(){
					    var nameRegex = /^[가-힣a-zA-Z0-9]{1,8}$/;
					    var nameValue = $(this).val();
					    
					    if(!nameRegex.test(nameValue)){
					        $('#nnameErrorMsg').text('1글자 이상 8글자 이하의 한글, 영문, 숫자만 사용 가능합니다.');
					    } else{
					        $('#nnameErrorMsg').text('');
					    }
					});
					
			        document.getElementById('domain').addEventListener('change', function() {
						var domain = this.value;
						if (domain !== 'select') {
							document.getElementById('email').value += '@' + domain;
						}
					});
				
				/* 입력 이메일 형식 유효성 검사 */
				$("#email").on("blur", function(){
					var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
					var emailValue = $(this).val();
					
					if(!emailRegex.test(emailValue)){
						$("#emailErrorMsg").text('올바른 형식의 이메일을 입력해주세요.');
					} else{
						$("#emailErrorMsg").text('');
					}
				})
				
				//이메일 중복검사
				$('.email_input').on("propertychange change keyup paste input", function(){
					
					var user_email = $('.email_input').val();			// .id_input에 입력되는 값
				  	var data = {user_email : user_email};				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
				  
				  	$.ajax({
				  		type : "post",
					    url : "/ottt/signin/emailChk",
					    data : data,
					    success : function(result){
					    	
					    	console.log("성공 여부" + result);					    	
							if(result != 'success'){
								$('.email_input_re_1').css("display","inline-block");
								$('.email_input_re_2').css("display", "none");
								emailCheck = false;
							} else {
								$('.email_input_re_2').css("display","inline-block");
								$('.email_input_re_1').css("display", "none");
								emailCheck = true;
							}
				     
						}// success 종료
				
					}); // ajax 종료
				
				});// function 종료
				
				/* 인증번호 이메일 전송 */
				$("#send-verification-code").click(function(){
					var email = $("#email").val()		// 입력한 이메일
					var checkBox = $("#Certification")	// 인증번호 입력란
					
					if (!/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/.test(email) || email == null) {
					    $(".body").html("올바른 이메일을 입력해주세요.");
					    $('#Modal').modal('show');
					}else{
						//console.log("data : "+data)
						$(".body").html("인증번호를 발송했습니다.");
				   	    $('#Modal').modal('show');
						$.ajax({
							type: "GET",
							url: "/ottt/signin/mailCheck?email="+email,
							success:function(data){
								code=data
							}							
						})
					}
				})
				
					
				/* 인증번호 비교 */
				$("#completion").click(function(){
					var inputCode = $("#Certification").val()		// 입력코드		
					if(inputCode == code && inputCode != ''){
						$(".body").html("인증번호가 일치합니다.");
				   	    $('#Modal').modal('show');
					}else{
						$(".body").html("인증번호가 일치하지 않습니다.<br>다시 확인해주세요.");
				   	    $('#Modal').modal('show');
					}
					
				})
			        
		        });

				
				function check_register(){
					/* 입력값 변수 */
					var inputCode = $("#Certification").val()		// 입력코드
					var id = $(".id_input").val()					// id입력란
					var email = $("#email").val()					// 이메일 입력란
					var nickname = $("#nname").val()				// 닉네임 입력란
					
					  if(document.getElementById('password').value != document.getElementById('passwordCheck').value){
						  $(".body").html("비밀번호가 일치하지 않습니다.<br>다시 입력해주세요.");
				   	      $('#Modal').modal('show');
				   	      return false;
					  }
					  else if(inputCode != code){
						  $(".body").html("인증번호가 일치하지 않습니다.<br>다시 확인해주세요.");
					   	  $('#Modal').modal('show');
					   	  return false;
					  }else if(idCheck){
						  $(".body").html("이미 사용중인 아이디입니다.");
					   	  $('#Modal').modal('show');
					   	  return false;
					  }else if(emailCheck){
						  $(".body").html("이미 사용중인 이메일입니다.");
					   	  $('#Modal').modal('show');
					   	  return false;
					  }else if(nmCheck){
						  $(".body").html("이미 사용중인 닉네임입니다.");
					   	  $('#Modal').modal('show');
					   	  return false;
					  }
					  return true;
				}
		    	
		        </script>		
        
		<section class="sec00">
		    <form action='<c:url value="/signin/register" />' method="post" id="form" onsubmit="return check_register()">
		    <h1 style="font-size: 21px; display: inline-block;">회원가입</h1>
		    	<div>
					<div class="Id">
							<input type="text" name="user_id" class="id_input" id="id" title="id" maxlength="20"  placeholder="아이디 입력" pattern="^[a-zA-Z0-9]{6,}$" required>
					    <span class="errorMsg" id="idErrorMsg" style="position: absolute; left: 910px;"></span> 
					    <div class="idChk">
					    	<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
							<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
					    </div>
					  
					</div>
					
					<div class="password">
					    <input type="password" name="user_pwd" id="password" title="password" maxlength="20" placeholder="비밀번호 입력" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[^\da-zA-Z])(.{8,20})$">
					    <span class="errorMsg" id="passwordErrorMsg"></span>
					</div>
					
					<div class="passwordCheck">
					    <input type="password" id="passwordCheck" title="password check" maxlength="20" placeholder="비밀번호 재확인">
					    <span class="errorMsg" id="passwordCheckErrorMsg"></span>
					</div>
				</div>
		        
		        <div class="name">
		        	<input type="text" name="user_nm" id="name" title="name" maxlength="10" placeholder="이름" pattern="^[가-힣a-zA-Z]{2,15}$" required>
		        	<span>
		        		<select name="user_gen">
				            <option value="">선택</option>
				            <option value="1">남자</option>
				            <option value="2">여자</option>
				            <option value="0">비공개</option>
			            </select>
		            </span>

					<div class="nname">
						<input type="text" name="user_nicknm" class="nnmame_input" id="nname" title="nickname" maxlength="8" placeholder="닉네임" pattern="^[가-힣a-zA-Z]{2,8}$" required>
						
						<div class="nicknameChk">
							<span class="errorMsg" id="nnameErrorMsg" style="position: absolute; left: 910px;"></span>
					    	<span class="nickname_input_re_1">사용 가능한 닉네임입니다.</span>
							<span class="nickname_input_re_2">닉네임이 이미 존재합니다.</span>
					    </div>
					</div>
		
		          	<div class="email">
		           		<input type="email" name="user_email" class="email_input" id="email" title="email" placeholder="이메일"  pattern="^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$" required >
		           		<span>
		            		<select id="domain" name="직접입력">
								<option value="select">직접입력</option>
								<option value="naver.com">네이버</option>
								<option value="gmail.com">구글</option>
							</select>
						</span>
		           		
		           		<button id="send-verification-code" type="button">인증번호 발송</button>
		           		<div class="emailChk">
							<span class="errorMsg" id="emailErrorMsg" style="position: absolute; left: 910px;"></span>
					    	<span class="email_input_re_1">사용 가능한 이메일입니다.</span>
							<span class="email_input_re_2">이메일이 이미 존재합니다.</span>
					    </div>
           			</div>
           			
           			
		          	<div class="Certification">
		          		<input type="text" id="Certification" title="인증번호" maxlength="6"  placeholder="인증번호" pattern="\d{6}" required>
			          	<button id="completion" type="button">인증확인</button>
		          	</div>
		          	
		          	<div class="back">
		          		<input type="button" value="이전" onClick="location.href='<c:url value="/login" />'">
	          		</div>
	          		
	          		<div class="complate">
	          			<input type="submit" value="회원가입" id="register_btn">
          			</div>
       			</div>
   			</form>
		</section>
	</div>
	
		<!-- Modal -->
	        <div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	          <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	              <div class="modal-header">
	                <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	              </div>
	              <div class="modal-body body">
	              </div>
	              <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
	              </div>
	            </div>
	          </div>
	        </div>
	
</body>
</html>
