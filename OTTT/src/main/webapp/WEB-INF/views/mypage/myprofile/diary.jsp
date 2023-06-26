<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>나의 다이어리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/mypage/diary.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
	<div class="wrap">
		<%@ include file="../../fix/header.jsp" %>

		<section class="sec01">
			<c:choose>
				<c:when test="${userChk eq true }"><%@ include file="../../fix/mnb.jsp" %></c:when>
				<c:otherwise><%@ include file="../../fix/mnb2.jsp" %></c:otherwise>
			</c:choose>
		</section>

		<section class="sec02">
			<div class="main">
				<div class="blank"></div>
				<form action="" id="diary-main">
					<input type="hidden" name="content_no" 
							value="${mode== 'new' ? contentDTO.content_no : myDiaryDTO.content_no }"/>
					<input type="hidden" name="user_no" 
							value="${mode== 'new' ? sessionScope.user_no : myDiaryDTO.user_no }"/>
					<div class="l-main">
						<img class="poster" src="${myDiaryDTO.thumbnail == null ? contentDTO.thumbnail : myDiaryDTO.thumbnail }" >
						<input type="hidden" name="thumbnail" 
							value="${myDiaryDTO.thumbnail == null ? contentDTO.thumbnail : myDiaryDTO.thumbnail }"/>
						
						<div class="lBot">
							<button id="listBtn" class="btn-write" type="button" >뒤로</button>
						</div>
					</div>
					
					
					<div class="c-main">
						<div class="c-title">
							<input class="diary-title" readonly="readonly" name="content_nm" type="text"
								value="${myDiaryDTO.content_nm == null ? contentDTO.content_nm : myDiaryDTO.content_nm}" />
								
						</div>
						<div class="diary">
							<label for="story"></label>
							<textarea id="story" name="mydiary_content"
								${mode=="new" ? "" : "readonly='readonly'" }
							 spellcheck="false">${mode== 'new' ? '' : myDiaryDTO.mydiary_content }</textarea>
						</div>
					</div>
					
					<div class="r-main">
						<div class="rTop">
							<c:if test="${sessionScope.user_no eq myDiaryDTO.user_no || mode == 'new'}">
								<fieldset class="pnp-button" >
									<input type="hidden" id="pub" name="public_yn_cd" value="1" style="display: none">
									<label for="pub">전체 공개</label><br>
									
				                    <input type="hidden" id="Npub" name="public_yn_cd" value="0" style="display: none">
				                    <label for="Npub" >비공개</label><br>
				                    
				                    <input type="hidden" id="Fpub" name="public_yn_cd" value="2" style="display: none">
				                    <label for="Fpub" >팔로워</label><br>
				                    
		                		</fieldset>
	                		</c:if>
						</div>
						
						<div class="rBot">
							<c:if test="${mode == 'new' }">
								<button id="writeBtn" class="btn-write" type="button" >등록</button>
							</c:if>
							
							<c:if test="${sessionScope.user_no eq myDiaryDTO.user_no && mode != 'new'}">
								<button id="modBtn" class="btn-write" type="button" >수정</button>
								&nbsp;/&nbsp;
								<button id="removeBtn" class="btn-write" type="button" >삭제</button>								
							</c:if>								
						</div>
					</div>
				</form>
			</div>
		</section>
	</div>
	 
	<script type="text/javascript">
	 	$(document).ready(function() {
	 		
	 		let inputs = document.querySelectorAll('input[name="public_yn_cd"]');

	 		// 선택된 input 요소에 대해 반복문 실행
	 		inputs.forEach(function(input) {
		 	  	if (input.value === '${myDiaryDTO.public_yn_cd}') {
		 	    	input.checked = true
		 	    	document.querySelector('label[for="' + input.id + '"]').style.color = '#33ff33';
		 	   	}
	 		});
	 		
	 		/* let publicYnCd = '${myDiaryDTO.public_yn_cd.toString()}';

		 	// 라디오 버튼 요소들을 선택합니다.
		 	let radioButtons = document.querySelectorAll('input[name="public_yn_cd"]');

		 	// 라디오 버튼을 순회하며 필터링합니다.
		 	radioButtons.forEach(function(radioButton) {
		 		if (radioButton.value === publicYnCd) {
		 			radioButton.checked = true; // 선택 상태로 설정
		 			
	 			} else {
	 				radioButton.style.display = 'none'; // 숨기도록 설정
	 				
 				}
		 	}); */

	 		
 			let isMode = function() {
 				let mode = '${mode}'
 				
 				if(mode == 'new') {
 					$(".pnp-button").attr('disabled',false)
 					$(".pnp-button input").attr('type', 'radio')
 					$(".pnp-button input").css('display', '');
 					$("#pub").attr("checked",true)
 				}
 					
 			}
 			
 			isMode()
 			
 			$('#writeBtn').on('click', function() {
 				let form = $("#diary-main")
				form.attr("action", "<c:url value='/mypage/mydiary/write' />")
				form.attr("method", "post")
				
				if(formCheck()) {
					form.submit()
				}
				
			})
			
			let formCheck = function() {
    			let form = document.getElementById("diary-main")
    			
    			if(form.mydiary_content.value=="") {
    				alert("내욜 입력해 주세요.")
    				form.mydiary_content.focus();
    				return false;
    			}    			
    			
    			return true;
			}
	 		
	 		$('#listBtn').on('click', function name() {
	 			location.href = '<c:url value="/mypage/mydiary${searchItem.list}" />'
			})

	 		$('#modBtn').on('click', function() {
	 			let form = $('#diary-main')	 			
	 			let isReadonly = $("textarea[name=mydiary_content]").attr('readonly')
	 			
	 			//수정상태 변환
	 			if(isReadonly == 'readonly') {
	 				$("textarea[name=mydiary_content]").attr('readonly', false);
	 				
	 				let inputs = document.querySelectorAll('input[name="public_yn_cd"]');
	 				inputs.forEach(function(input) {
	 					input.type = 'radio';
	 					input.style.display = ''
 					});
	 				
	 				$("#modBtn").html('등록')
	 				$("#removeBtn").html('취소')
	 				return;
	 			}
	 			
	 			if (!confirm("수정하시겠습니까?")) return;
	 			
	 			form.attr("action", "<c:url value='/mypage/mydiary/modify${searchItem.string}&page=${searchItem.page}' />")
	 			form.attr("method", "post")
	 			
	 			
	 			if(formchk()) {
	 				form.submit()
	 			}	 			
				
			})
			
			$('#removeBtn').on('click', function() {
				
				let form = $('#diary-main')	 			
	 			let isReadonly = $("textarea[name=mydiary_content]").attr('readonly')
	 			
	 			if(isReadonly != 'readonly') {
	 				location.href = "<c:url value='/mypage/mydiary/diary?user=${myDiaryDTO.user_nicknm}&content=${myDiaryDTO.content_no}' />";
		 			
		 			return false;
	 			}

				if (!confirm("정말로 삭제하시겠습니까?")) return;
				
				form.attr("action", "<c:url value='/mypage/mydiary/remove${searchItem.queryString}' />")
				form.attr("method", "post")
				form.submit()
				
			})
			
			
			let formchk = function() {
	 			let form = document.getElementById('diary-main')
	 			
	 			if(form.story.value == '') {
	 				alert("내용을 입력해주세요")
	 				form.story.focus();
	 				return false;
	 			}
	 			
	 			return true;				
			}
	 		
			
		})	 
	</script>
	 
	<script type="text/javascript">
    	let msg = "${msg}"
    	if(msg == "WRT_ERR") alert("다이어리 등록에 실패했습니다. 다시 시도해 주세요")
    	if(msg == "MOD_ERR") alert("다이어리 수정에 실패했습니다. 다시 시도해 주세요")
    	if(msg == "DEL_ERR") alert("다이어리 삭제에 실패했습니다. 다시 시도해 주세요")
    	if(msg == "MOD_OK") alert("다이어리 수정에 성공했습니다")
    	if(msg == "DEL_OK") alert("다이어리 삭제에 성공했습니다")
    </script>
	 

</body>
</html>