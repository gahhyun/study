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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/login/loginform.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>로그인</title>
    
    	<style type="text/css">
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
	width: 70px;
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
              <a href="<c:url value="/community/freecommunity" />">게시판</a>
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
			
		<form action="<c:url value='/login' />" method="post" onsubmit="return frmCheck(this)">
			<div class = "Login">
				<img src = "${path}/resources/images/logo/OTTT.png" width="420" height="120">
			
				<div id="msg">
					<c:if test= "${not empty param.msg}" >
					<i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
					</c:if>
				</div>
				
				<input type="text" name="user_id" placeholder="ID를 입력해주세요" value="${cookie.id.value}" autofocus="autofocus" style="border:0 solid black" />
				<input type="password" name="user_pwd" style="border:0 solid black" placeholder="비밀번호를 입력해주세요" />
				<input type="hidden" name="toURL" value= "${param.toURL }" />
				
				<button>로그인</button>
				         
				<div>
					<label><input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "" : "checked"} />아이디 기억</label>
				</div>
				<a>
					<input type="button" value="회원가입" onClick="location.href='<c:url value="/signin/register" />'" class="join" >
					<input type="button" value="아이디 찾기" onClick="location.href='<c:url value="/login/findID" />'" class="join">
					<input type="button" value="비밀번호 찾기" onClick="location.href='<c:url value="/login/findPwd" />'" class="join">
				</a>
				<a href= "#">
					<img src="${path}/resources/images/img/ㄴㅂ.png" width="290" height="40" class="naver">
				</a>
				<a href= "#">
					<img src = "${path}/resources/images/img/카톡.png" width="290" height="40" class="kakao">
				</a>
				<a href= "#">
					<img src = "${path}/resources/images/img/구글로그인.png" width="290" height="40" class="google">
            	</a>
           	</div>
		</form>
	</div>
	
	<script type="text/javascript">
	$(document).ready(function() {
        let pwdMsg = "<%= request.getParameter("pwdMsg") %>";
        if (pwdMsg == "MOD_PWD") {
            $(".body").html("비밀번호가 변경되었습니다.<br>다시 로그인해주세요.");
            $('#Modal').modal('show');
        }
        if (pwdMsg == "ERR_PWD") {
            $(".body").html("비밀번호 변경에 실패했습니다.<br>다시 시도해주세요.");
            $('#Modal').modal('show');
        }
    });

		function frmCheck(frm) {
	
			let msg = ''
			
			if (frm.user_id.value.length == 0){
				setMessage("id를 입력해주세요", frm.id)
				return false;
			}
			
			if (frm.user_pwd.value.length == 0){
				setMessage("비밀번호를 입력해주세요", frm.pwd)
				return false;
			}
			
			return true;
			
		}
			
		function setMessage(msg, element) {
			document.getElementById("msg").innerHTML
					= `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`
			if(element) {
				element.select()	//값이 잘못 입력되었을 때 다시 입력 
			}
		}
		
	</script>
	
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
