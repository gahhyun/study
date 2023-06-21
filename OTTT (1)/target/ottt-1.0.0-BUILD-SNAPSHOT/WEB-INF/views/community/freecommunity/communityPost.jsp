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
			<header >
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
			              	<a href="<c:url value="/community/freecommunity" />" style="color: #33ff33;">게시판</a>
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
			<div id="line-1" >
         			<nav class="nav">
         				<a class="nav-link1" href="<c:url value='/community/freecommunity' />" style="color: #33ff33;">자유게시판</a>
	          		<a class="nav-link1" href="<c:url value='/community/endmovie/tving' />">종료예정작</a>
		          	<a class="nav-link1" href="<c:url value='/community/priceInfoTving' />">가격정보</a>
	        	  	<a class="nav-link1" href="<c:url value='/community/QnA' />">Q&A</a>
		          	<a class="nav-link1" href="<c:url value='/community/notice' />">공지사항</a>
       			</nav>
   			</div>
       		<div id="line-2">
   				<div class="Lcontent">
      				<form name="post_search" action="" method="get">
           				<input class="search" type="search" placeholder=" &nbsp;Search">
           				<input class="searchicon" type="image" src="${path}/resources/images/icon/search02.png" alt="돋보기">
           			</form>
           			<ul class="movepage">
           				<li style="display: flex;">
             				<div class="list-group">
                 				<a href="<c:url value='/mycommynity/postcommu' />" class="list-group-item list-group-item-action">
                   					<img class="side_img" src="${path}/resources/images/img/KakaoTalk_20230411_161709664.png" alt="post">내가 쓴 게시글
                 				</a>
             				</div>
           				</li>
           				<li style="display: flex;">
               				<div class="list-group">
                   				<a href="<c:url value='/mycommynity/likecommunity' />" class="list-group-item list-group-item-action">
                     				<img class="side_img" src="${path}/resources/images/img/heart_on.png" alt="heart">좋아요 누른 게시글
                   				</a>
               				</div>
           				</li>
           				<li style="display: flex;">
               				<div class="list-group">
                   				<a href="<c:url value='/mycommynity/comment' />" class="list-group-item list-group-item-action">
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
               					<a href="#"><img class="profile" src="${path}/resources/images/icon/user01.png" alt="profile" ></a>
                 				<a class="nickname" href="../ottt박소율/mypageshow.html">${articleDTO.user_nicknm }</a>
               				</div>
                 			<div class="btn_warning_div">
                   				<button type="button" class="btn_warning2" data-bs-toggle="dropdown" aria-expanded="false">
                    					신고
                   				</button>
                   				<ul class="dropdown-menu">
                  					<li><a class="dropdown-item" href="#">비방/욕설</a></li>
			                      	<li><a class="dropdown-item" href="#">광고/도배</a></li>
			                      	<li><a class="dropdown-item" href="#">악의적인 스포</a></li>
			                      	<li><a class="dropdown-item" href="#">선정성</a></li>
                   				</ul>
                 			</div>
               			</div>
           				<div class="wirted">
         					<!-- 입력 폼 -->
							<form name="updateForm" id="updateForm"	enctype="multipart/form-data" action="<c:url value="/community/update"/>" method="post">
             					<div>
					         		<input type="hidden" name="article_no" value="${articleDTO.article_no}"/>
					         		<input type="hidden" name="user_no" value="${articleDTO.user_no}"/>
									<!--  ${mode == "view" ? "readonly='readonly" : ""}  -->
									<!-- 보기모드일때 textarea에  readonly="readonly"를 넣고 수정모드일때는 지운다. -->
       								<textarea class="writeHere"	placeholder="Write Here" id="article_content" name="article_content" <c:if test="${mode == 'view' }">readonly='readonly'</c:if>  onkeydown="resize(this)" onkeyup="resize(this)" name="article_content" > ${articleDTO.article_content } </textarea>
             					</div>
             					<c:choose>
									<c:when test="${mode == 'view' }">		
										<c:if test="${articleDTO.article_image != null}">
											<div class="container">
			                					<img class="poster" src="data:image/png;base64,${articleDTO.article_image}" alt="poster">		
			                				</div>
										</c:if>
									</c:when>
									<c:otherwise>
										<div style="margin-left: 70px">
				                  			<img src="" id="preview" style="border-radius: 5px;"/>
				                  		</div>
										<div class="container">
											<div class="">
												<input id="fileInput" name="upFile"	 accept="image/*" type="file" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
												<input type="text" id="userfile" name="userfile" value="${articleDTO.article_image_name}">
				                      			<label for="fileInput" for="btn_file" ><img src="${path}/resources/images/img/writeImg.png" class="img_file"></label>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</form>
		  					<div>
               					<p id="current_date" >${articleDTO.article_create_dt}</p>
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
			        	<li class="comment_write">
			       			<a href="#"><img class="profile" src="${path}/resources/images/icon/user01.png" alt="profile" ></a>
			                <a class="nickname" href="#">${sessionScope.user_nicknm }</a>
			        		<div>
			                	<textarea class="writeHere" placeholder="Write Here" onkeydown="resize(this)" onkeyup="resize(this)" ></textarea>
			                	<input class="btn_commit" type="image" src="${path}/resources/images/img/commit.png" alt="commit">
			                </div>
			          	</li>
						<li class="comment_show">
							<div class="pro-dan">
          						<div>
			                  		<a href="#"><img class="profile" src="${path}/resources/images/icon/user01.png" alt="profile" ></a>
			                  		<a class="nickname" href="../ottt박소율/mypageshow.html">user</a>
               					</div>
               					<div class="btn_warning_div">
				                    <button type="button" class="btn_warning2" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: #202020">
				                     신고
				                    </button>
                 						<ul class="dropdown-menu">
			                      		<li><a class="dropdown-item" href="#">비방/욕설</a></li>
				                      	<li><a class="dropdown-item" href="#">광고/도배</a></li>
				                      	<li><a class="dropdown-item" href="#">악의적인 스포</a></li>
				                      	<li><a class="dropdown-item" href="#">선정성</a></li>
                   					</ul>
               					</div>
               				</div>
               				<div class="comment_write_box">
               					<p>댓글 내용이 나타남</p>
               				</div>
      					</li> 
					</ul>
				</div>
       		</div>
       	</div>
		<script type="text/javascript">

			/********************************************************************************/
			/* 자바스크립트 전역변수 영역, 대문자로 정의												*/
			/********************************************************************************/
			let LOGIN_YN = '${sessionScope.user_no}';	//로그인여부
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
					
	     			if(!fnValidFileNameSize(filename)){
			     		alert("파일명이 20자를 초과합니다.");
			     		$(this).val(null);
			     		return;
				 	}
	     			
			 		// 추출한 파일명 삽입
					$("#userfile").val(filename);

			     	fnReadImage($(this)[0]); //미리보기

				}); 
				
				
				$("#pushHeart").click(function(){

					if(LOGIN_YN == null || LOGIN_YN == ""){
						swal("로그인 후 이용가능합니다.","로그인을 해주세요.", "warning")
						.then(function(){
							location.href="/ottt/login";                   
						});
						return;					
					}
					
					// $.post  > post 방식의 ajax 
					$.post(
						"/ottt/community/ajax/selectLikeCount"
					    , {"user_no": "${user_no}" , "article_no" : "${articleDTO.article_no}" }
					    , function(data){
					    	
					    	//통신 성공후 결과값이 출력된다.
					    	console.log(data);
					    	//data = {result: 0, message: 'success'} 오브젝트형태의 데이터임
					    	let result = data.result // 1이나 0이 담겨있어요
					    	
					    	if(result == 0){

					    		//저장하는 post ajax
					    		
					    		//1. 비동기 post ajax로 저장하는 컨트롤러 호출 , 필수값 보내야함
					    		//2. 필수값 : 아티클번호, 회원번호
					    		//3. 주소는 이거  /ottt/community/ajax/selectLikeCount
					    		//4. 제이쿼리의 attr을 사용하여 이미지를 on으로 변경하기
   								$.post(
									"/ottt/community/ajax/insertLike"
								    , {"user_no": "${user_no}" , "article_no" : "${articleDTO.article_no}" }
								    , function(data){
										$("#pushHeart").attr("src", PATH+"/resources/images/img/heart_on.png");
										$("#likeCount").text(Number($("#likeCount").text())+1);
								    }
							    );

					    	}else {
					    		//삭제하는 post ajax
					    		
					    		//1. 비동기 post ajax로 저장하는 컨트롤러 호출 , 필수값 보내야함
					    		//2. 필수값 : 아티클번호, 회원번호
					    		//3. 주소는 이거  /ottt/community//ajax/deleteLike
					    		//4. 제이쿼리의 attr을 사용하여 이미지를 off으로 변경하기
   								$.post(
									"/ottt/community/ajax/deleteLike"
								    , {"user_no": "${user_no}" , "article_no" : "${articleDTO.article_no}" }
								    , function(data){
   										$("#pushHeart").attr("src", PATH+"/resources/images/img/heart_off.png");
   										$("#likeCount").text(Number($("#likeCount").text())-1);
					    			}
							    );
					    		
					    	}
					    	
					    }
					)	
					
				});
				
				
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
	
	     	/*
	      	function post_delete(article_no) {
	      		$.ajax({
	    				type: "POST",
	      				url: "/ottt/community/delete",
	      				data: {article_no: article_no},
	      				success: function(data) {
							 	if(data == "Y"){
							 		alert("글 삭제 완료!");
							 		location.href = "/community/freecommunity";
							 	}
						},
						error: function() {
							alert("실패");
							//console.log(data);
							
						}
	      		});
			}
	      	
	      	*/
    	</script>
	</body>
</html>
