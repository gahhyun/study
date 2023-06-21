<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>쪽지창</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script src="${path}/resources/js/mypage/messagewindow.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/resources/css/mypage/messagewindow.css" >
    
  </head>

<body>
<script type="text/javascript">
	$(document).ready(function() {
// 		let formCheck = function() {
// 			let form = document.getElementById("form")
			
// 			if(form.content.value == "") {
// 				console.log("내용 미입력")
// 				alert("내용을 입력하세요.")
// 				form.content.focus()
// 				return false
// 			}
// 			return true
// 		}
		
		$("#writeBtn").on("click", function() {
			//url에서 send_user_no 추출
	        let url = new URL(window.location.href)
	        let searchParams = new URLSearchParams(url.search)
	        let sendUserNo = searchParams.get("send_user_no")
	        
	        var content = $("#messageContent").val()
			
			$.ajax({
				type: "POST",
				url: "/ottt/messagewindow/open",
				data: {
					sendUserNo: sendUserNo,
					content: content
				},
				success: function(response) {

					console.log("전송 성공");
			        alert("쪽지가 전송되었습니다.");
			        window.close();

				},
				error: function() {
					console.log("전송 실패")
					alert("쪽지 전송에 실패했습니다. 다시 시도해 주세요.")
				}
			})
		})
	})
  </script>
  

	
  <div class="wrap">
  	<form action="" id="form" class="frm" method="post">
	    <div class="sec01">
	      <a href="#">
	        <div class="proimg"><img src="${path}/resources/images/img/profile.png"></div>
	      </a>
	      <div class="nickname"></div>
	    </div>
	
	    <div class="sec02">
	      <div class="write">
	        <textarea id="messageContent" name="content" placeholder="내용을 입력하세요."></textarea>      
	      	<div class="count"><span>0</span>/500</div>
	      </div>
	    </div>
	
	    <div class="sec03">
	        <button type="button" id="writeBtn" class="btn btn-write">보내기</button>
	    </div>
	</form>
  </div>
</body>
</html>