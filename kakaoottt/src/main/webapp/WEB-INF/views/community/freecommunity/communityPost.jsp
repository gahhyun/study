<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="user_no" value="${sessionScope.user_no}" />
<c:set var="loginId" value="${sessionScope.id}" />
<c:set var="loginout" value="${sessionScope.id == null ? 'logout' : 'login'}" />
<c:set var="loginoutlink" value="${sessionScope.id==null ? '/login' : '/mypage'}" />
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html lang="ko">
 	<head>
    	<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<title>communityPost</title>
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    	<script type="text/javascript" src="${path}/resources/js/community/main.js"></script>
    	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    	<link rel="stylesheet" href="${path}/resources/css/community/freecommunity/communityPost.css" >
 	</head>
	<!--  body  --------------------->
 	<body style="background-color: #202020;">
   		<div class="wrap">
				<%@ include file="../../fix/header.jsp" %>
			<div id="line-1" >
         		<%@ include file="../../fix/nav.jsp" %>
   			</div>
       		<div id="line-2">
   				<div class="Lcontent">
      				<form name="schForm" action="<c:url value='/community/freecommunity' />" method="get">
           				<input class="search" type="search" placeholder=" &nbsp;Search" id="schText" name="schText">
              			<input class="searchicon" type="image" id="schBtn"	src="${path}/resources/images/icon/search02.png" id="schBtn" alt="돋보기">
	            	</form>
           			<ul class="movepage">
           				<li style="display: flex;">
             				<div class="list-group">
                 				<a href="<c:url value='/community/freecommunity?category=myPost' />" class="list-group-item list-group-item-action">
                   					<img class="side_img" src="${path}/resources/images/img/KakaoTalk_20230411_161709664.png" alt="post">내가 쓴 게시글
                 				</a>
             				</div>
           				</li>
           				<li style="display: flex;">
               				<div class="list-group">
                   				<a href="<c:url value='/community/freecommunity?category=myLike' />" class="list-group-item list-group-item-action">
                     				<img class="side_img" src="${path}/resources/images/img/heart_on.png" alt="heart">좋아요 누른 게시글
                   				</a>
               				</div>
           				</li>
           				<li style="display: flex;">
               				<div class="list-group">
                   				<a href="<c:url value='/community/freecommunity?category=myComment' />" class="list-group-item list-group-item-action">
                     				<img class="side_img" src="${path}/resources/images/img/comment.png" >댓글 작성 게시물
                   				</a>
               				</div>
           				</li>
           				<li style="display: flex;">
               				<div class="list-group">
                   				<a href="#" class="list-group-item list-group-item-action" style="margin-top: 2vw; height: 35vh;">광고</a>
                 			</div>
           				</li>
           			</ul>
       			</div>
       			<div class="Rcontent" >
           			<div class="maintext">
           				<input type="hidden" name="article_no" id="article_no" value="${articleDTO.article_no}">
           				<div class="pro-dan">
               				<div>
               					<a href="#"><img class="profile" src="${articleDTO.image }" alt="profile" ></a>
                 				<a class="nickname" href="../ottt박소율/mypageshow.html">${articleDTO.user_nicknm }</a>
               				</div>
               				<c:choose>
								<c:when test="${articleDTO.user_no == sessionScope.user_no}">		

								</c:when>
								<c:otherwise>
	       							<div class="btn_warning_div">
					                    <button type="button" class="btn_warning2" data-bs-toggle="dropdown" aria-expanded="false">
					                     신고
					                    </button>
					                    <ul class="dropdown-menu">
					                      <li><a class="dropdown-item" href="#" onclick="fnInsertReport2('${articleDTO.article_no}','${articleDTO.user_no}',1)"  >비방/욕설</a></li>
					                      <li><a class="dropdown-item" href="#" onclick="fnInsertReport2('${articleDTO.article_no}','${articleDTO.user_no}',2)"  >광고/도배</a></li>
					                      <li><a class="dropdown-item" href="#" onclick="fnInsertReport2('${articleDTO.article_no}','${articleDTO.user_no}',3)"  >악의적인 스포</a></li>
					                      <li><a class="dropdown-item" href="#" onclick="fnInsertReport2('${articleDTO.article_no}','${articleDTO.user_no}',4)"  >선정성</a></li>
					                    </ul>
					                </div>
								</c:otherwise>
							</c:choose>
               			</div>
           				<div class="wirted">
         					<!-- 입력 폼 -->
							<form name="updateForm" id="updateForm"	enctype="multipart/form-data" action="<c:url value="/community/update"/>" method="post">
             					<div>
					         		<input type="hidden" name="article_no" value="${articleDTO.article_no}"/>
					         		<input type="hidden" name="user_no" value="${articleDTO.user_no}"/>

             						<c:choose>
										<c:when test="${mode == 'view' }">		
											<a onclick="return false;" style="white-space: pre-wrap;" id="textP">${articleDTO.article_content }</a>
										</c:when>
										<c:otherwise>
       										<textarea class="writeHere" rows="10"	placeholder="Write Here" id="article_content" name="article_content"   onkeydown="resize(this)" onkeyup="resize(this)" name="article_content" > ${articleDTO.article_content } </textarea>
										</c:otherwise>
									</c:choose>
             					</div>
             					<br>
             					<c:choose>
									<c:when test="${mode == 'view' }">		
										<c:if test="${articleDTO.article_image != null}">
											<div class="container">
			                					<img class="poster" src="data:image/png;base64,${articleDTO.article_image}" alt="poster" style="border-radius: 10px;">		
			                				</div>
										</c:if>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${articleDTO.article_image != null}">
												<div  class="container" style="margin-left: 70px;">
		                  							<img src="data:image/png;base64,${articleDTO.article_image}" id="preview" style="border-radius: 5px;"/>
			                  					</div>
											</c:when>
			                  				<c:otherwise>
												<div  class="container" style="margin-left: 70px; display: none">
	                  								<img src="" id="preview" style="border-radius: 5px;"/>
	                  							</div>
			                  				</c:otherwise>
										</c:choose>
										<div>
											<button class="fileDelete" type="button" onclick="javascript:fnFileDelete('Y');">이미지 삭제</button>
										</div>
										<div>
											<div class="inImg">
												<input id="fileInput" name="upFile"	 accept="image/*" type="file" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
												<input type="text" id="userfile" name="userfile" value="${articleDTO.article_image_name}">
				                      			<label for="fileInput" for="btn_file" ><img src="${path}/resources/images/img/writeImg.png" class="img_file"></label>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</form>
		  					<div>
               					<p id="current_date" ><fmt:formatDate value="${articleDTO.article_create_dt}" pattern="yyyy-MM-dd" type="date"/></p>
           					</div>
           				</div>
           				<div class="pro-total">
							<div class="pro-info">
								<c:choose>
									<c:when test="${articleDTO.check_like_count == 1 }">		
				                		<input class="heart" id="pushHeart" type="image" src="${path}/resources/images/img/heart_on.png" alt="heart">
									</c:when>
									<c:otherwise>
			                			<input class="heart" id="pushHeart"	type="image" src="${path}/resources/images/img/heart_off.png" alt="heart">
									</c:otherwise>
								</c:choose>
			                  	<span id="likeCount" style="margin-left: 5px">${articleDTO.like_count }</span> 
			                  	<span><img class="re_comment_img" src="${path}/resources/images/img/comment.png"></span>
			                  	<span style="margin-left: 5px">${articleDTO.comment_count }</span> 
       						</div>
							<c:if test="${articleDTO.user_no eq user_no }">
								<c:choose>
									<c:when test="${mode == 'view' }">			
	              						<div class="modi-del">
					                  		<!-- Button trigger modal -->
						                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">수정</button>
					                     	<!-- Modal -->
					                    	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					                      		<div class="modal-dialog modal-dialog-centered">
					                        		<div class="modal-content">
					                          			<div class="modal-header">
					                            			<h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
					                            			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					                          			</div>
					                          			<div class="modal-body">수정하시겠습니까?</div>
					                          			<div class="modal-footer">
															<!-- jstl 문법으로 업데이트페이지이동 셋팅 -->
															<c:url value="/community/updatePost" var="updateUrl">
														  		<c:param name="article_no" value="${articleDTO.article_no}" />
															</c:url>
					                      	 				<button type="button" class="btn btn-primary"  onclick="location.href='${updateUrl}';" >Yes</button>
					                            			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
					                          			</div>
					                        		</div>
					                 			</div>
					              			</div>
					                   		<!-- Button trigger modal -->
					                    	<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModa2">삭제</button>
					                    	<!-- Modal -->
					                    	<div class="modal fade" id="exampleModa2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					                      		<div class="modal-dialog modal-dialog-centered">
					                        		<div class="modal-content">
					                          			<div class="modal-header">
					                            			<h1 class="modal-title fs-5" id="exampleModalLabe2">알림</h1>
					                            			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					                          			</div>
					                          			<div class="modal-body">삭제하시겠습니까?</div>
					                          			<div class="modal-footer">
					                          				<button type="button" onclick='post_delete();' class="btn btn-primary">Yes</button>
					                            			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
					                          			</div>
					                       			</div>
					                     		 </div>
					              			</div>                    
	           							</div> 
           							</c:when>
           							<c:otherwise>
					              		<div class="modi-del">
					                  		<!-- Button trigger modal -->
						                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">저장</button>
					                     	<!-- Modal -->
					                    	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					                      		<div class="modal-dialog modal-dialog-centered">
					                        		<div class="modal-content">
					                          			<div class="modal-header">
					                            			<h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
					                            			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					                          			</div>
					                          			<div class="modal-body">저장하시겠습니까?</div>
					                          			<div class="modal-footer">		                          			
					                      	 				<button type="button" class="btn btn-primary"  onclick='post_update();' >Yes</button>
					                            			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
					                          			</div>
					                        		</div>
					                 			</div>
					              			</div>
					           			</div> 	           			
           							</c:otherwise>
								</c:choose>     			
           					</c:if>
       					</div>
			             <!-- c:url태그로 감싸면 이와같은 도메인이 완성됨 /ottt/community/delete -->
						<form name="deleteForm" id="deleteForm"	action="<c:url value="/community/delete"/>" method="post">
			         		<input type="hidden" name="article_no" value="${articleDTO.article_no}"/>
			          	</form>
					</div>
					<!--댓글-->
					<ul class="Comment">
						<c:choose>
							<c:when test="${not empty sessionScope.user_no}">
								<li class="comment_write" id="commentCard">
				       				<a href="#"><img class="profile" src="${userDTO.image }" alt="profile"/> </a>
				                	<a class="nickname" href="#">${sessionScope.user_nicknm}</a>
				                	<div>
			                			<textarea class="writeHere" name="cmt_content" placeholder="Write Here" onkeydown="resize(this)" onkeyup="resize(this)" ></textarea>
			                			<input class="btn_commit" onclick="javascript:fnInsertComment();" type="image" src="${path}/resources/images/img/commit.png" alt="commit">
			                		</div>
			                	</li>
							</c:when>
							<c:otherwise>
								<li class="comment_write" id="commentCard">
									<div>로그인이 필요합니다.</div>
				                	<div>
			                			<textarea class="writeHere" name="cmt_content" placeholder="Write Here" onkeydown="resize(this)" onkeyup="resize(this)" ></textarea>
			                			<input class="btn_commit" onclick="javascript:fnInsertComment();" type="image" src="${path}/resources/images/img/commit.png" alt="commit">
			                		</div>
			                	</li>
							</c:otherwise>
						</c:choose>

			      
					</ul>
		        	<div class="modal fade" id="commentModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		          		<div class="modal-dialog modal-dialog-centered">
		            		<div class="modal-content">
			              		<div class="modal-header">
			                		<h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
			                		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			              		</div>
			              		<div class="modal-body body"></div>
			              		<div class="modal-footer">
			                		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
			              		</div>
			            	</div>
			          	</div>
		        	</div>
				</div>
       		</div>
       	</div>
		<script type="text/javascript">

			/********************************************************************************/
			/* 자바스크립트 전역변수 영역, 대문자로 정의												*/
			/********************************************************************************/
			let LOGIN_YN = '${sessionScope.user_no}';	//로그인여부
			let ARTICLE_NO = "${articleDTO.article_no}"
			let PATH = "<c:out value='${path}'/>"; 	//이미지 root 경로
			
			/********************************************************************************/
			/* DOM Ready 영역																	*/
			/* 작성자 gahhyun																	*/
			/********************************************************************************/
			$(document).ready(function(){

				/********************************************************************************/
				/*	이미지 미리보기 											*/
				/********************************************************************************/
				$("#fileInput").on('change', function(){

					if(window.FileReader){
			      		
						var filename = $(this)[0].files[0].name;                  

			     	} else {
					 	
			     		var filename = $(this).val().split('/').pop().split('\\').pop();
			     	}
					
		      		if(!fnValidFileSize($(this)[0].files[0])){	
				 		alert("파일 사이즈가 5MB를 초과합니다.");
				 		$(this).val(null);
					 	return;
	      			}
					
	     			
			 		// 추출한 파일명 삽입
					$("#userfile").val(filename);

			     	fnReadImage($(this)[0]); //미리보기
		   			$(".container").show();

				}); 
				
				//좋아요 누르기 클릭 이벤트
				$("#pushHeart").click(function(){

					if(LOGIN_YN == null || LOGIN_YN == ""){
						swal("로그인 후 이용가능합니다.","로그인을 해주세요.", "warning")
						.then(function(){
							location.href="/ottt/login";                   
						});
						return;					
					}

					// $.post  > post 방식의 ajax 
					fnCallAjax(
						"/community/ajax/selectLikeCount"
						, {"user_no": "${user_no}" , "article_no" : "${articleDTO.article_no}" }
					 	, function(response){
					 		
					 		//통신 성공후 결과값이 출력된다.
					    	console.log("selectLikeCount response > "+response);
					    	
				    		let setUrl = (response.result == 0) ? "/community/ajax/insertLike" : "/community/ajax/deleteLike";
				    		let setImg = (response.result == 0) ? PATH+"/resources/images/img/heart_on.png" : PATH+"/resources/images/img/heart_off.png";
				    		let setCount = (response.result == 0) ? Number($("#likeCount").text())+1 : Number($("#likeCount").text())-1;
				    		
							fnCallAjax(
								setUrl
				    			, {"user_no": "${user_no}" , "article_no" : "${articleDTO.article_no}" }
							    , function(response){
									$("#pushHeart").attr("src", setImg);
									$("#likeCount").text(setCount);
							    }
						    )				 		
					 	}
					)
					
				});
				
				//검색어버튼 Click Event
				$("#schText").keydown(function(event) {
			  		// Enter 키의 keyCode는 13입니다.
				  	if (event.keyCode === 13) {
						$("#schForm").submit();			
				  	};

				});
				
				//검색어버튼 Click Event
				$("#schBtn").click(function(){
					$("#schForm").submit();					
				});

				
				//코맨트 목록 공통 ajax 함수 호출 
				fnGetCommentList();
				
	   		});
			
			/* swal icon
				success 
				error 
				warning 
				info 
				question
	     	*/
	     	
	     	function post_delete(){
	   			//폼서브밋 방식으로 삭제요청
				if(LOGIN_YN == null || LOGIN_YN == ""){
					swal("로그인 후 이용가능합니다.","로그인을 해주세요.", "warning")
					.then(function(){
						location.href="/ottt/login";                   
					});
					return;					
				}
	   			$("#deleteForm").submit();
	     	}
	     	
	     	function post_update() {
				if(LOGIN_YN == null || LOGIN_YN == ""){
					swal("로그인 후 이용가능합니다.","로그인을 해주세요.", "warning")
					.then(function(){
						location.href="/ottt/login";                   
					});
					return;					
				}
	     		$("#updateForm").submit();
			}
	     	
			//파일 사이즈 체크
			function fnValidFileSize(file){
			    if(file.size > 5242880){ //5MB
					return false;
			    }else{
					return true;
			    }
			}

			//파일명 길이체크
			function fnValidFileNameSize(filename){
		    	
				if(filename.length > 20){ //20자
					return false;
			    }else{
					return true;
		    	}
			}

			//이미지 미리보기
			function fnReadImage(input) {
				if(input.files && input.files[0]) {
  					let reader = new FileReader();
		  			reader.onload = function(e){

		  				//let previewImage = document.getElementById("preview");
				   		//previewImage.src = e.target.result;

				   		//미리보기 이미지 주소를 넣고, 가로 세로 사이지를 넣는다.
				   		$("#preview").attr("src",e.target.result).attr("width","400px").attr("height","400px");
			       	
		  			}
		  			// reader가 이미지 읽도록 하기
			       	reader.readAsDataURL(input.files[0]);
		   		}
       		}
			
	   		
	   		/*********************************************************************************************************************
	   		*	게시글 신고하기
	   		*	@param article_no
	   		*	@param target_user_no
	   		*	@param report_type 
	   		*/	   		
	   		function fnInsertReport2(article_no,  target_user_no, report_type){

				if(LOGIN_YN == null || LOGIN_YN == ""){
					swal("로그인 후 이용가능합니다.","로그인을 해주세요.", "warning")
					.then(function(){
						location.href="/ottt/login";                   
					});
					return;					
				}
	   			
	   			let data = {
	   				"article_no" : article_no
	   				, "target_user_no" : target_user_no
	   				, "report_type" : report_type
	   			}
	   			
	   			fnCallAjax(
					"/community/ajax/insertReport" 
   					, data
	   				, function(response){
						console.log("신고저장 ajax 통신결과");
	   					console.log(response);		
	   					if(response.result > 0){
	   						$(".body").html(response.message);
	   			   	    	$("#commentModal").modal("show");
	   					}else {
	   						$(".body").html(response.message)
	   		   	    		$("#commentModal").modal("show");					
	   					}								
   					}
   				);
	   		}
			

	   		/*********************************************************************************************************************
	   		*	게시글 수정 시 이미지 삭제
	   		*/	         
   		function fnFileDelete(type){

			// form 요소의 참조를 가져옵니다.
				var form = document.getElementById("updateForm");
				
   			// hidden input 요소를 생성합니다.
   			var hiddenInput = document.createElement('input');
   			hiddenInput.type = "hidden";
   			hiddenInput.name = "fileDeleteYn"; // hidden 필드의 이름을 지정합니다.
   			hiddenInput.value = "Y"; // hidden 필드의 값을 지정합니다.

				// form에 hidden input을 추가합니다.
				form.appendChild(hiddenInput);

   			$("#userfile").val("");			//파일명 없애기	   			
   			$("#preview").attr("src","");	//이미지 없애기
   			$(".container").hide();
   		}
	   		
   		/********************************************************************************/
		function goProfile(user_no, user_nicknm) {
			let form = document.createElement('form');				
			
			let data = {
					user_no : user_no,
					toURL : path
	        };
			
			for (let key in data) {
		        if (data.hasOwnProperty(key)) {
		            let obj = document.createElement('input');
		            obj.setAttribute('type', 'hidden');
		            obj.setAttribute('name', key);
		            obj.setAttribute('value', data[key]);
		            form.appendChild(obj);
		        }
		    }
			
			form.setAttribute('method','post');
			form.setAttribute('action','/ottt/profile?user=' +user_nicknm);
							
			document.body.appendChild(form);
			form.submit();				
		}
   		
			
			
			
			
			

			/* ============================================================
			* 	댓글 기능 스크립트
			* ============================================================ */
			
			//코맨트 목록 공통 ajax 함수 호출 
			function fnGetCommentList(){
				fnCallAjax("/comment/getCommentList", {"article_no" : ARTICLE_NO}, fnCreateCommentList);				
			}
			
			/**
			* 댓글목록을 문자열로 그리는 함수
			* @param {json} response : 컨트롤러에서 리턴받은 json
			*/
			function fnCreateCommentList(response){

				console.log("ajax 목록호출 통신결과");
				console.log(response);

				let list = response;
				
				//댓글목록 초기화
				$("#commentCard").nextAll().remove();
				
				let createHtml = "";
				
				if(list.length > 0){

					list.forEach(function(v ,i){

						
						createHtml +=	'<li class="comment_show">';
						createHtml +=		'<div class="pro-dan">';
						createHtml +=			'<div style="display: flex;">';
						createHtml +=				'<a href="javascript:goProfile('+v.user_no +',\''+v.user_nicknm+'\')"><img class="profile" src="'+v.image+'" alt="profile" ></a>';
						createHtml +=				'<a a href="javascript:goProfile('+v.user_no +',\''+v.user_nicknm+'\')" class="nickname">'+v.cmt_writer+'</a>';
						createHtml +=				'<p id="current_date"  style="position: relative; left: 35px; bottom: 25px;" >'+fnTimeForToday(v.cmt_dt)+'</p>';
						createHtml +=			'</div>';

						//로그인사용자랑 댓글작성자랑 일치하는지 확인,같다면 수정/삭제 버튼 태그를 그린다.
						if(v.writer_chk == "Y"){
							createHtml += 		'<div class="btn_area">';
							createHtml += 			'<button class="btn btn-secondary" style="text-align: center; width: 56px; height: 35px; font-size: 16px;" onclick="jaascript:fnUpdateForm(\''+i+'\',\'U\')">수정</button>';
							createHtml += 			'<button class="btn btn-secondary" style="display:none; text-align: center; width: 56px; height: 35px; font-size: 16px;" onclick="jaascript:fnUpdateComment('+v.cmt_no+','+i+')">등록</button>';
							createHtml += 			'<button class="btn btn-secondary" style="display:none; text-align: center; width: 56px; height: 35px; font-size: 16px;" onclick="jaascript:fnUpdateForm(\''+i+'\',\'C\')">취소</button>';
							createHtml += 			'<button class="btn btn-secondary" style="text-align: center; width: 56px; height: 35px; font-size: 16px;" onclick="javacript:fnDeleteComment('+v.cmt_no+')" >삭제</button>';
							createHtml +=		'</div>';
							createHtml +=	'</div>';							
						}else {
							createHtml +=			'<div class="btn_warning_div">';
							createHtml +=				'<button type="button" class="btn_warning2" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #202020">신고</button>';
							createHtml +=				'<ul class="dropdown-menu">';
							createHtml +=					'<li><a class="dropdown-item" style="cursor:pointer;" onclick="fnInsertReport('+v.cmt_no+','+v.user_no+',1)" >비방/욕설</a></li>';
							createHtml +=					'<li><a class="dropdown-item" style="cursor:pointer;" onclick="fnInsertReport('+v.cmt_no+','+v.user_no+',2)" >광고/도배</a></li>';
							createHtml +=					'<li><a class="dropdown-item" style="cursor:pointer;" onclick="fnInsertReport('+v.cmt_no+','+v.user_no+',3)" >악의적인 스포</a></li>';
							createHtml +=					'<li><a class="dropdown-item" style="cursor:pointer;" onclick="fnInsertReport('+v.cmt_no+','+v.user_no+',4)" >선정성</a></li>';
							createHtml +=				'</ul>';
							createHtml +=			'</div>';
							createHtml +=		'</div>';							
						}
							createHtml +=		'<div class="comment_write_box">';
						//로그인을 안할 경우
						if(LOGIN_YN == null || LOGIN_YN == ""){
							createHtml +=			'<p style="margin-top: 10px; margin-left: 10px; width: 760px; max-height: max-content; position: relative; left: 54px; bottom: 42px;" >' + v.cmt_content + '</p>';
						//로그인을 했을 경우
						} else {
							if(v.writer_chk == "Y"){
							createHtml +=			'<p>';
							createHtml +=				'<textarea readonly="readonly" style="background-color: #202020; width: 100%; height: max-content; color: #fff; border: none;  resize:none;">'+v.cmt_content+'</textarea>';
							createHtml +=			'</p>';									
							}else {
							createHtml +=			'<p style="margin-top: 10px; margin-left: 10px; width: 760px; max-height: max-content; position: relative; left: 54px; bottom: 42px;" >' + v.cmt_content + '</p>';								
							}
						
						}
						createHtml +=		'</div>';
						createHtml +=	'</li>'; 
					
					});
					$("#commentCard").after(createHtml);
				}else {
					$("#commentCard").after("<li>등록된 댓글이 없습니다. </li>");
				}
			}
			
			/******************************************************************************************************************************
			* 댓글을 저장하는 함수
			*/
			function fnInsertComment(){

				//로그인 여부 체크
				if(LOGIN_YN == null || LOGIN_YN == ""){
					swal("로그인 후 이용가능합니다.","로그인을 해주세요.", "warning")
					.then(function(){
						location.href= PATH+"/login";                   
					});
					return;					
				}
				let cmt_content = $("textarea[name=cmt_content]").val();	
				//댓글내용 유효성 검사
				if(cmt_content.trim() == ""){
					$(".body").html("댓글을 입력해 주세요.")
		   	    	$("#commentModal").modal("show");
					$("textarea[name=cmt_content]").focus();
					return
				}
				//코맨트 저장하기, 공통 ajax 함수 호출 
				fnCallAjax("/comment/insertComment" ,{"article_no" : ARTICLE_NO, "cmt_content" : cmt_content}, fnSaveCallBack)

			}

			/******************************************************************************************************************************
			* 본인 댓글을 삭제하는 함수
			* @param {String} cmt_no : 댓글번호
			*/				
			function fnDeleteComment(cmt_no){
				//코맨트 삭제하기, 공통 ajax 함수 호출 
				fnCallAjax("/comment/deleteComment" ,{"cmt_no" : cmt_no}, fnSaveCallBack);
			}
			
			/*****************************************************************************************************************************
			* 본인 댓글 수정 버튼 클릭 시
			* 댓글을 수정모드로 바꾸는 함수
			* @param {String} i li 위치
			* @param {String} type 수정모드/취소모드 타입
			*/				
			function fnUpdateForm( i, type ){

				//해당 row의 텍스트아레아 정보 가져오기
				let textarea = $("#commentCard").nextAll("li").eq(i).find('div.comment_write_box textarea');

				//덱스트아레아 영역 리드온리 풀기
				textarea.removeAttr("readonly");
				
				//해당 row의 버튼정보 가져오기
				let btn = $("#commentCard").nextAll("li").eq(i).find('div.btn_area button');
				
				/*
					$(btn[0]); 수정
					$(btn[1]); 등록
					$(btn[2]); 취소
					$(btn[3); 삭제
				*/
				if(type == "U"){
					$(btn[0]).hide();
					$(btn[3]).hide();
					$(btn[1]).show();
					$(btn[2]).show();
				}else {
					$(btn[0]).show();
					$(btn[3]).show();
					$(btn[1]).hide();
					$(btn[2]).hide();			
					fnGetCommentList();					
				}
			}
			
			/****************************************************************************************************************************
			* 댓글 수정 완료 후 '등록' 버튼 클릭 시
			* @param {String} cmt_no 코맨트 번호
			* @param {String} i li 위치
			*/
			function fnUpdateComment(cmt_no, i){

				//해당 row의 텍스트아레아 정보 가져오기
				let textarea = $("#commentCard").nextAll("li").eq(i).find('div.comment_write_box textarea');			
				let cmt_content = textarea.val();

				if(cmt_content.trim() == ""){
					$(".body").html("내용을 입력해 주세요.")
		   	    	$("#commentModal").modal("show");
					textarea.focus();
					return
				}

				//저장하는 함수 
				fnCallAjax("/comment/updateComment" ,{"cmt_no" : cmt_no, "cmt_content" : cmt_content}, fnSaveCallBack);

			}
			
			/****************************************************************************************************************************
			* 댓글 저장/수정/삭제 요청 콜백함수
			* @param {json} response : 컨트롤러에서 리턴받은 값
			*/				
			function fnSaveCallBack(response){
				console.log("fnSaveCallBack ajax 통신결과");
				console.log(response);		
				if(response.result > 0){
					$(".body").html(response.message);
		   	    	$("#commentModal").modal("show");
					$("textarea[name=cmt_content]").val("");
					fnGetCommentList();
				}else {
					$(".body").html(response.message)
	   	    		$("#commentModal").modal("show");					
				}
			}
			
			/**************************************************************************************************************************
			* 공통 ajax 호출 함
			* @param {String} url ajax 호출 URL
			* @param {Object} sendData 컨트롤러로 전송하는 데이터
			* @param {Function} callbackFunction ajax 호출이 성공하다음에 실행할 함수
			*/
			function fnCallAjax(url ,sendData, callbackFunction){
				$.post(PATH+url, sendData)
			  	.done(callbackFunction)		//ajax 호출 성공후 실행하는 함수
			  	.fail(function(jqXHR, textStatus, errorThrown) {  // 요청이 실패한 경우 실행되는 함수
					$(".body").html("처리중 오류가 발생하였습니다.")
	   	    		$("#commentModal").modal("show");	
			  		console.log("요청이 실패했습니다.");
				    console.log(jqXHR); // 실패한 XMLHttpRequest 객체에 대한 정보
				    console.log(textStatus); // 실패한 상태에 대한 설명
				    console.log(errorThrown); // 선택적인 예외 개체 (프레임워크에서 제공되는 경우)
			  	});				
			}
			
	         /***********************************************************************************************************************
	         *   날짜 계산(몇일전, 몇시간전, 몇분전)
	         *   @param dateValue{String} 날짜
	         */
         	function fnTimeForToday(dateValue) {
	            
	            const today = new Date();
	            const timeValue = new Date(dateValue);

	            const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
	              
	              if (betweenTime < 1) {
	                 return '방금전';
	              }
	             
	              if (betweenTime < 60) {
	                  return betweenTime+"분전";
	              }

	              var betweenTimeHour = Math.floor(betweenTime / 60);
	              
	              if (betweenTimeHour < 24) {
	                  return betweenTimeHour+"시간전";
	              }

	              var betweenTimeDay = Math.floor(betweenTime / 60 / 24);
	              
	              if (betweenTimeDay < 365) {
	                  return betweenTimeDay+"일전";
	              }

	              return Math.floor(betweenTimeDay / 365)+"년전";
       		}

	         
	   		/*********************************************************************************************************************
	   		*	댓글 신고하기
	   		*	@param cmt_no
	   		*	@param target_user_no
	   		*	@param report_type 
	   		*/
	   		function fnInsertReport(cmt_no, target_user_no, report_type){

				if(LOGIN_YN == null || LOGIN_YN == ""){
					swal("로그인 후 이용가능합니다.","로그인을 해주세요.", "warning")
					.then(function(){
						location.href="/ottt/login";                   
					});
					return;					
				}
	   			
	   			let data = {
	   				"cmt_no" : cmt_no
	   				, "target_user_no" : target_user_no
	   				, "report_type" : report_type
	   			}
	   			
	   			fnCallAjax(
	   				//PATH는? /otttt 임
   					"/community/ajax/insertReport"
	   				, data 
	   				, function(response){
						console.log("신고저장 ajax 통신결과");
	   					console.log(response);		
	   					if(response.result > 0){
	   						$(".body").html(response.message);
	   			   	    	$("#commentModal").modal("show");
	   					}else {
	   						$(".body").html(response.message)
	   		   	    		$("#commentModal").modal("show");					
	   					}								
   					}
   				).fail(function () {
	   			    // Ajax 요청이 실패한 경우 모달 표시
	   			    $(".body").html("이미 신고 되었습니다.");
	   			    $("#commentModal").modal("show");
	   			});		
	   		}
	   		

    	</script>
	</body>
</html>

