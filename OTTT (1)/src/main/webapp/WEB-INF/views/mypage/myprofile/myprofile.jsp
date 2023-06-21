<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>프로필 변경</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/mypage/myprofile.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
	<div class="wrap">
		<%@ include file="../../fix/header.jsp" %>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$(".done").on("click", function() {
 					if (!confirm("프로필을 변경하시겠습니까?")) return;
					
					let form = $("#form")
					form.attr("action", "<c:url value='/mypage/setting/myprofile ' />")
					form.attr("method", "post")
					form.submit()
					
					/*$(".body").html("수정이 완료되었습니다.");
			        $('#Modal').modal('show'); */
					
				})
				
				$(".cancleBtn").on("click", function() {
					location.href = "<c:url value ='/mypage/setting' />"
				})
				
				$(".byebye").on("click", function() {
					if (!confirm("정말 탈퇴할거야??")) return;
					
					let form = $("#form")
					form.attr("action", "<c:url value='/mypage/setting/goodbye ' />")
					form.attr("method", "post")
					form.submit()
				})
				
			    $('#input-file').on('change', function(){
			    	if(window.FileReader){
			    		var filename = $(this)[0].files[0].name;
		                if(!validFileType(filename)){
		                	alert("허용하지 않는 확장자 파일입니다.");
		                    return false;
		                } else{
		                	if(!validFileSize($(this)[0].files[0])){
		                        alert("파일 사이즈가 5MB를 초과합니다.");
		                        return false;
		                    } else{
		                    	if(!validFileNameSize(filename)){
		                            alert("파일명이 20자를 초과합니다.");
		                            return false;
		                        }
		                    }
		                }
		            } else {
		                var filename = $(this).val().split('/').pop().split('\\').pop();
		            }
		            $(this).prev().val(filename); //input upload-name 에 파일명 설정해주기
		
		            readImage($(this)[0]); //미리보기
		        });

			    function validFileType(filename) {
			        let fileTypes = ["png", "jpg", "jpeg"];
					return fileTypes.indexOf(filename.substring(filename.lastIndexOf(".")+1, filename.length).toLowerCase()) >= 0;
				}
				
			    function validFileSize(file){
			        if(file.size > 5242880){ //5MB
			            return false;
			        }else{
			            return true;
			        }
			    }

			    function validFileNameSize(filename){
			        if(filename.length > 20){ //20자
			            return false;
			        }else{
			            return true;
			        }
			    }

			    //이미지 띄우기
			    function readImage(input) {
				    if(input.files && input.files[0]) {
				        let reader = new FileReader();
				        reader.onload = function(e){
				            let previewImage = document.getElementById("preview");
				            previewImage.src = e.target.result;
				        }
				        // reader가 이미지 읽도록 하기
				        reader.readAsDataURL(input.files[0]);
				    }
				}			
				
			})
		</script>
		
		<script type="text/javascript">
			let msg = "${msg}"
			if(msg == "MOD_OK") alert("프로필 변경에 성공했습니다.")
    		if(msg == "MOD_ERR") alert("프로필 변경에 실패했습니다. 다시 시도해 주세요")
    	</script>
		
		<section class="sec01">
			<form action="" id="form" class="info-main" enctype="multipart/form-data">
			<div class="profile-a">
				<img src="${userDTO.image} " class ="profile-img" id="preview" alt="프로필">
				<div class="cancle">
					<button class="cancleBtn" type="button">취소</button>
				</div>				
			</div>
			
			<div class="profile-b">
				<div class="nick">
					<input type="text" name ="new_nicknm" id="nickname" class="input-field" placeholder="${userDTO.user_nicknm }" onchange="readURL(this);"/>
				</div>
				
	            <div class="user_img">
	            	<label class="input-file-button" for="input-file">프로필 이미지</label>
					<input type="file" name=newImg id="input-file" style= "display:none" />	            	
	            </div>
	            
	            <div class="skin">
	            	<a href="#">스킨 변경</a>
	            </div>
	
	            <button class="done" type="button">확인</button>
			</div>
			</form>
		</section>
		
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
		

    	
	</div>


	</body>
</html>