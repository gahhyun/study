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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/resources/css/mypage/messagewindow.css" >
    <style type="text/css">
    
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
  </head>

	<body>
	<script type="text/javascript">
		connect();
		var socket = null;
		
		function connect() {
			console.log("*************")
			var ws = new WebSocket("ws://localhost:/ottt/replyEcho");	//포트 번호 확인
			socket = ws;
			
			ws.onopen = function () {
				console.log('Info: connection opened.');
			};
			ws.onmessage = function (event) {
				console.log(event.data+'\n');
			};
	
			ws.onclose = function (event) {
				console.log('Info: connection closed.');
				//setTimeout( function(){ connect(); }, 1000); // retry connection!!
			};
			
			ws.onerror = function (event) { console.log('Info: connection closed.'); };		
		}
		
// 		$('#writeBtn').on('click', function(evt) {
//			evt.preventDefault();
//			if (socket.readyState !== 1) return;
//			let msg = $('input#msg').val();
//			ws.send(msg);
//		});

		$(document).ready(function() {
			//쪽지 전송
			$("#writeBtn").on("click", function() {
				//url에서 send_user_no 추출
		        let url = new URL(window.location.href)
		        let searchParams = new URLSearchParams(url.search)
		        let sendUserNo = searchParams.get("send_user_no")
		        let userNo = searchParams.get("user_no")
		        
		        var content = $("#messageContent").val()
		        
		        //쪽지 내용이 비어있는지 아닌지 체크
				if(formCheck()) {
					$.ajax({
						type: "POST",
						url: (sendUserNo != null) ? "/ottt/messagewindow/send" : "/ottt/messagewindow/send2",
						data: (sendUserNo != null) ? {sendUserNo: sendUserNo, content: content }: {userNo:userNo, content: content },
						success: function(response) {
							$(".modal-body.body").html("쪽지가 전송되었습니다.");
					        $('#Modal').modal('show');
					        $("#checkBtn").on("click", function() {
					            window.close();
					          });
						},
						error: function() {
							$(".modal-body.body").html("쪽지 전송에 실패했습니다. 다시 시도해주세요.");
					        $('#Modal').modal('show');
						}
					})
				} else {
					$(".modal-body.body").html("내용을 입력하세요.");
				    $('#Modal').modal('show');
				}
			})
			
			let formCheck = function() {
				let form = document.getElementById("form")
				if(form.content.value == "") {
					//form.content.focus()
					return false
				}
				return true
			}
			
			//글자수제한
			$(".write textarea").keyup(function(){
				var content = $(this).val()
				$(".write .count span").html(content.length)
				if (content.length > 500){
					$(".modal-body.body").html("최대 공백 포함 500자까지 입력 가능합니다.");
			        $('#Modal').modal('show');
					$(this).val(content.substring(0, 500))
					$(".write .count span").html(500)
				}
			})
			

			
		})
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
             <div class="modal-footer" id="modal-footer">
               <button type="button" id="checkBtn" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
             </div>
           </div>
         </div>
       </div>
	
	  <div class="wrap">
	  	<form action="" id="form" class="frm" method="post">
		    <div class="sec01">
		      <div class="proimg"><img src="${userDTO.image }" /></div>
		      <div class="nickname">${userDTO.user_nicknm }</div>
		    </div>
		
		    <div class="sec02">
		      <div class="write">
		        <textarea id="messageContent" name="content" placeholder="내용을 입력하세요."></textarea>      
		      	<div class="count"><span>0</span>/500</div>
		      </div>
		    </div>
		
		    <div class="sec03">
		        <button type="button" id="writeBtn" class="btn btn-write" style="color: black; background-color: #33ff33; border: 3px; width: 70px; height: 40px; border-radius: 10px; font-weight: 600; font-size: 16px; font-weight: 600; position: relative; top: 50%; left: 43%; transform: translate(0, -50%);">보내기</button>
		    </div>
		</form>
	  </div>
	</body>
</html>