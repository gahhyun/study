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
    	<title>communityMain</title>
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    	<link rel="stylesheet" href="${path}/resources/css/community/freecommunity/communityMain.css" >
    	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    	<script type="text/javascript" src="${path}/resources/js/community/main.js"></script>
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 	</head>
  	<body style="background-color: #202020;">
    	<div class="wrap">
<!-- 		<a href="#" class="upBtn" style="z-index: 999;">&uarr;</a> -->
      		<%@ include file="../../fix/header.jsp" %>
      		<!--meun bar Start-->  
        	<div id="line-1" >
          		<nav class="nav">
          			<a class="nav-link1" href="<c:url value='/community/freecommunity' />" style="color: #33ff33;">자유게시판</a>
          			<a class="nav-link1" href="<c:url value='/community/endmovie' />">종료예정작</a>
          			<a class="nav-link1" href="<c:url value='/community/priceInfoTving' />">가격정보</a>
          			<a class="nav-link1" href="<c:url value='/community/QnA' />">Q&A</a>
          			<a class="nav-link1" href="<c:url value='/community/notice' />">공지사항</a>
        		</nav>
        	</div>
        	<div id="line-2">
          		<div class="Lcontent">
              		<input class="search" type="search" placeholder=" &nbsp;Search" id="schText" name="schText">
              		<input class="searchicon" type="image" id="schBtn"	src="${path}/resources/images/icon/search02.png" alt="돋보기">
	            	<ul class="movepage">
	              		<li style="display: flex;">
	                		<div class="list-group">
	                    		<a href="#" class="list-group-item list-group-item-action" onclick="javascript:fnCategory('myPost');">
	                      			<img class="side_img" src="${path}/resources/images/img/KakaoTalk_20230411_161709664.png" alt="post">내가 쓴 게시글
	                    		</a>
	                		</div>
	              		</li>
	              		<li style="display: flex;">
	                  		<div class="list-group">
	                      		<a href="#" class="list-group-item list-group-item-action" onclick="javascript:fnCategory('myLike');">
	                        		<img class="side_img" src="${path}/resources/images/img/heart_on.png" alt="heart">좋아요 누른 게시글
	                      		</a>
	                  		</div>
	              		</li>
	              		<li style="display: flex;">
	                  		<div class="list-group">
	                     		<a href="#" class="list-group-item list-group-item-action" onclick="javascript:fnCategory('myComment');">
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
            		<div>
            			<!-- 입력 폼 -->
	       				<form id="insertForm" class="frm" method="post" enctype="multipart/form-data" action="<c:url value='/community/freecommunity'/>">  
	           				<ul class="post_write">
		                  		<c:choose>
	                  				<c:when test="${user_no == null || user_no == ''}">
	                  					<li>
	                  						<div>로그인이 필요합니다</div>
	                  					</li>
	                  				</c:when>
	                  				<c:otherwise>
				                  		<li>
			                    			<img src="${user_img }" alt="프로필사진">
				                  		</li>
				                  		<li>
			                      			<textarea class="writeHere" placeholder="Write Here" onkeydown="resize(this)" onkeyup="resize(this)" id="article_content" name="article_content" ></textarea>
				                  		</li>
										<li style="margin-left: 70px">
				                  			<img src="" id="preview" style="border-radius: 5px;"/>
				                  		</li>
	                  				</c:otherwise>
	                  			</c:choose>
		                  		<li class="btn_s">
									<div class="form-group">
										<input id="fileInput" name="upFile"   accept="image/*" type="file" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);" onchange="readURL(this)">
										<input type="hidden" id="userfile" name="userfile" >
		                      			<label for="fileInput" for="btn_file" ><img src="${path}/resources/images/img/writeImg.png" class="img_file"></label>
									</div>
		                      		<img src="${path}/resources/images/img/commit.png" alt="commit" class="btn_commit"	 data-bs-toggle="modal" data-bs-target="#commitBtn">      
		                    		<!-- Modal -->
			                    	<div class="modal fade" id="commitBtn" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			                      		<div class="modal-dialog modal-dialog-centered">
			                        		<div class="modal-content">
			                          			<div class="modal-header">
			                            			<h1 class="modal-title fs-5" id="exampleModalLabe2">알림</h1>
			                            			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			                          			</div>
			                          			<div class="modal-body">등록하시겠습니까?</div>
			                          			<div class="modal-footer">
			                          				<button type="button" id="saveBtn"class="btn btn-primary">Yes</button>
			                            			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
			                          			</div>
			                       			</div>
			                     		 </div>
			              			</div>         
		                  		</li>

	          				</ul>
	        			</form> 
            		</div>
            		<div class="post_list" id="post_list"></div>
         		</div>
        	</div>
        	<div id="loading" class="loading"></div>
        	
	        	<div class="modal fade" id="postMainModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
	    <script>
	    
			/********************************************************************************/
			/* 자바스크립트 전역변수 영역, 대문자로 정의												*/
			/********************************************************************************/
			let PATH = "<c:out value='${path}'/>"; 	//이미지 root 경로
			let URL = 	"<c:url value='/community/post?article_no='/>";	//상세페이지 이동 URL 설정
			let LOGIN_YN = "${sessionScope.user_no}";	//로그인여부
			let OFFSET = 0;
			let TOTAL_COUNT = 0;
			let CATEGORY =  "${category}" != "" ? "${category}" : "all";
			let schText = "${schText}";
			let INDEX = 0;
			console.log("path :"+PATH);
			console.log("url  :"+URL);
			
			/********************************************************************************/
			/* DOM Ready 영역																	*/
			/* 작성자 gahhyun																	*/
			/********************************************************************************/
			$(document).ready(function(){
				
				if($.trim(schText) != ""){
					$("#schText").val(schText);
				 	$("#schBtn").trigger("click");
				}
				
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

				});

				/********************************************************************************/
				/*	DOM ajaxStart 영역 ajax 호출시 로딩효과											*/
				/*******************************************************************************/
 	      		$(document).ajaxStart(function() {
	          		$('#loading').show();
	        	}).ajaxStop(function() {
	          		setTimeout(function() {
		            	$('#loading').hide();
		          	}, 1000); // 1초의 지연 효과를 줍니다.
	        	});
				 
				
				/********************************************************************************/
				/*	스크롤 Event정의 영역															*/
				/********************************************************************************/
				$(window).scroll(function() {

      				// 현재 스크롤 위치
			        let scrollTop = $(window).scrollTop();
			        // 창의 높이
			        let windowHeight = $(window).height();
			        // 문서 전체의 높이
			        let documentHeight = $(document).height();
			
			        // 스크롤 위치가 문서 전체의 높이에서 창의 높이를 뺀 값(바닥 영역)에 도달하면 이벤트 발생
			        if (scrollTop + windowHeight >= documentHeight) {
		          		
		          		console.log("스크롤이 바닥에 도달했습니다.");
		          		
			        	// 이벤트 처리 코드를 여기에 작성하세요
						let ulLength = $("#post_list > ul").length;

						console.log("개시물 총개수(TOTAL_COUNT) : "+TOTAL_COUNT+ "    ul의 개수(ulLength) : "+ulLength);
						
						//총건수가 ul의 개수보다 같거나 작으면 스크롤 호출 중단
						if(TOTAL_COUNT <= ulLength){
							return;
						}
						
						OFFSET += 10;

						//아티클 목록을 불러오는 ajax 함수 호출
						fnCallAjaxSelectArticleList({
							"offset": OFFSET
							, "category": CATEGORY
							, "schText" : $("#schText").val()
						});

			        }
	      		});
				
				/********************************************************************************/
				/*	요소 Event정의 영역																*/
				/********************************************************************************/
				//저장버튼 Click Event
				$("#saveBtn").click(function(){		//commitBtn에서 모달 Yes의 버튼으로 교체
					if(LOGIN_YN == null || LOGIN_YN == ""){
						swal("로그인 후 이용가능합니다.","로그인을 해주세요.", "warning")
						.then(function(){
							location.href="/ottt/login";                   
						});
						return;					
					}
					//자바스크립트 + 제이쿼리를 이용한 입력항목 유효성 체크
					let value = $("#article_content").val();
					if(value == "" || value == null){
						swal("내용을 입력해주세요.", "", "warning");
						return;
					}				
		     		$("#insertForm").submit();		//컨트롤러로 최종 값을 전송
				});
				
				
				//검색어버튼 Click Event
				$("#schText").keydown(function(event) {
				  // Enter 키의 keyCode는 13입니다.
				  if (event.keyCode === 13) {
				    // 목록 영역 클리어
				    $("#post_list").html("");
				    // 아티클 목록을 불러오는 ajax 함수 호출
				    fnCallAjaxSelectArticleList({
				      "offset": OFFSET,
				      "category": "all",
				      "schText": $("#schText").val()
				    });
				  }
				});
				
				//검색어버튼 Click Event
				$("#schBtn").click(function(){
					//목록 영역 클리어
					$("#post_list").html("");
					//아티클 목록을 불러오는 ajax 함수 호출
					fnCallAjaxSelectArticleList({
						"offset": OFFSET
						, "category": "all"
						, "schText" : $("#schText").val()
					});

				});
				
				//화면 로딩시 아티클 목록을 불러오는 ajax 함수 호출
				fnCallAjaxSelectArticleList({
					"offset": OFFSET
					, "category": CATEGORY
					, "schText": $("#schText").val()
				});
				
			});
	
				
			/********************************************************************************/
			/* function 함수 정의 영역															*/
			/* 작성자 gahhyun																	*/
			/********************************************************************************/
			
			//목록 호출 함수
			function fnCallAjaxSelectArticleList(param){
				//ajax-post방식 축약버전 호출방식
				$.post(
					"/ottt/community/ajax/getArticleList"
				    ,param
				    ,fnCreatArticleList
				)				
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
				
			//목록 생성 함수, $.post 에서 success 함수로 사용
			function fnCreatArticleList(response){
				
				console.log("ajax 통신결과");
				console.log(response);
				
				//목록 초기화
				let createHtml = "";
				
				//목록의 건수가 있을때
				if(response.list && response.list.length > 0){
					
					//총개수
					TOTAL_COUNT = response.totalCount;
					
					//목록
					let list = response.list;
					
					checkListSize = list.length;
					
					//화살표 함수형 foreach 반복문
					list.forEach( function(v,i) {
						INDEX ++;
						//등록일 날짜형식 변경 timestamp to yyyy_MM-dd
						let date = new Date(v.article_create_dt);
						let formattedDate = date.toISOString().slice(0, 10);
						
						

						createHtml += 	'<ul class="post" >';
						createHtml += 		'<div class="post_info">';
						if(v.writer_chk == "Y"){
							createHtml +=			'<div style="display: flex;">';
							createHtml +=				'<a href="javascript:goProfile('+v.user_no +',\''+v.user_nicknm+'\')"><img class="usur_img" src="'+ v.image +'" alt="profile"></a>';
							createHtml +=				'<a href="javascript:goProfile('+v.user_no +',\''+v.user_nicknm+'\')"><span class="nickname">'+ v.user_nicknm +'</span></a>';
							createHtml +=				'<span id="current_date" >'+ formattedDate +'</span>';
							createHtml +=			'</div>';
							createHtml +=		'</div>'										
						}else {
							createHtml +=			'<div style="display: flex;">';
							createHtml +=				'<a href="javascript:goProfile('+v.user_no +',\''+v.user_nicknm+'\')"><img class="usur_img" src="'+ v.image +'" alt="profile"></a>';
							createHtml +=				'<a href="javascript:goProfile('+v.user_no +',\''+v.user_nicknm+'\')"><span class="nickname">'+ v.user_nicknm +'</span></a>';
							createHtml +=				'<span id="current_date" >'+ formattedDate +'</span>';
							createHtml +=			'</div>';
							createHtml +=			'<div>';
							createHtml +=				'<div>';	
							createHtml +=					'<button type="button" class="btn_warning" data-bs-toggle="dropdown" >신고</button>';
							createHtml +=					'<ul class="dropdown-menu" >';
							createHtml +=						'<li><a class="dropdown-item"  onclick="fnInsertReport('+v.article_no+','+v.user_no+',1)"  >욕설/비방</a></li>';
							createHtml +=						'<li><a class="dropdown-item"  onclick="fnInsertReport('+v.article_no+','+v.user_no+',2)"  >광고/도배</a></li>';
							createHtml +=						'<li><a class="dropdown-item"  onclick="fnInsertReport('+v.article_no+','+v.user_no+',3)"  >악의적인 스포</a></li>';
							createHtml +=						'<li><a class="dropdown-item"  onclick="fnInsertReport('+v.article_no+','+v.user_no+',4)"  >선정성</a></li>';
							createHtml +=					'</ul>';                   
							createHtml +=				'</div>';
							createHtml +=			'</div>';
							createHtml +=		'</div>'							
						}
						createHtml +=		'<div style="width: 900px;">';
						let formattedContent = v.article_content.replace(/\n/gi, "<br/>"); 
						createHtml +=			'<a href="'+ URL + v.article_no +'" class="main_article" >'+ formattedContent +'</a><br>';
						//이미지의 데이터가 있으면 태그를 생성
						if(v.article_image+"" != "" && v.article_image != null){
							createHtml +=		'<a href="'+ URL + v.article_no +'" class="main_article"><img style="width:400px; height:400px; border-radius: 5px; margin-bottom: 25px; object-fit: cover;" src="data:image/png;base64, '+v.article_image+'" alt="이미지"></a>';
						}
						createHtml +=		'</div>';
						createHtml +=		'<div>';
						createHtml +=			'<div>';
						
						//로그인 여부 및 내가 누른하트표시 on off
						let heartOnOffImg = (v.check_like_count == 1 ? "on" : "off");
						
						createHtml +=				'<input onclick="javascript:fnPushHeart('+ v.article_no +','+INDEX+');" class="heart_img" type="image" id="pushHeart_'+INDEX+'" src="'+ PATH +'/resources/images/img/heart_'+heartOnOffImg+'.png" alt="heart">';
						createHtml +=				'<span style="margin-left: 4px;" id="likeCount_'+INDEX+'"	>'+ v.like_count +'</span>'; 
						createHtml +=				'<input class="re_comment_img" type="image" src="'+ PATH +'/resources/images/img/comment.png" alt="comment">';
						createHtml +=				'<span style="margin-left: 4px;">'+ v.comment_count +'</span>';                  
						createHtml +=			'</div>';
						createHtml +=		'</div>';
						createHtml +=	'</ul>';
					
					});
					
					//반복문으로 목록을 그리고 id가 post_list인 div 하위에 추가한다.
					$("#post_list").append(createHtml);
					
					//총건수가 총게시물 이하일때 버튼을 숨긴다.
					let ulLength = $("#post_list > ul").length;
					if(TOTAL_COUNT <= ulLength){
						$("#loadMoreBtn").hide();		//더보기 버튼 숨김
					}else {
						$("#loadMoreBtn").show();
					}
					
				//데이터가 없을때 처리
				}else {
					//목록 영역 클리어
					$("#post_list").html("");
					$("#post_list").append('<div>게시물이 없습니다. </div>');				
					$("#loadMoreBtn").hide();		//더보기 버튼 숨김
				}	
			}
				
			//왼쪽메뉴 카테고리별 호출
			function fnCategory(category){
				
				if(LOGIN_YN == null || LOGIN_YN == ""){
					swal("로그인 후 이용가능합니다.","로그인을 해주세요.", "warning")
					.then(function(){
						location.href="/ottt/login";                   
					});
					return;					
				}
				OFFSET = 0;
				TOTAL_COUNT = 0;
				CATEGORY = category;
				//목록 영역 클리어
				$("#post_list").html("");
				//ajax 함수 호출
				fnCallAjaxSelectArticleList({ "offset": OFFSET, "category": CATEGORY});
			}
			

			//파일 사이즈 체크
			function fnValidFileSize(file){
			    if(file.size > 5242880){ //5MB
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
				   		$("#preview").attr("src",e.target.result).attr("width","500px").attr("height","500px");
			       	
		  			}
		  			// reader가 이미지 읽도록 하기
			       	reader.readAsDataURL(input.files[0]);
		   		}
       		}

			
			//좋아요 누르기 클릭 이벤트
			function fnPushHeart(article_no, index){
				
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
				    , {"user_no": "${sessionScope.user_no}" , "article_no" : article_no }
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
				    			, {"user_no": "${sessionScope.user_no}" , "article_no" : article_no }
							    , function(data){

							    	$("#pushHeart_"+index).attr("src", PATH+"/resources/images/img/heart_on.png");
									$("#likeCount_"+index).text(Number($("#likeCount_"+index).text())+1);

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
				    			, {"user_no": "${sessionScope.user_no}" , "article_no" : article_no }
							    , function(data){
							    	$("#pushHeart_"+index).attr("src", PATH+"/resources/images/img/heart_off.png");
									$("#likeCount_"+index).text(Number($("#likeCount_"+index).text())-1);
							    }
					    	);
				    		
				    	}
				    	
				    }
				)	
			}

	   		/**
	   		*	신고하기
	   		*	@param article_no 
	   		*	@param target_user_no
	   		*	@param report_type 
	   		*/
	   		function fnInsertReport(article_no,  target_user_no, report_type){

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
	   			
	   			$.post(
	   				//PATH는? /otttt 임
   					PATH+"/community/ajax/insertReport"
	   				, data 
	   				, function(response){
						console.log("신고저장 ajax 통신결과");
	   					console.log(response);		
	   					if(response.result > 0){
	   						$(".body").html(response.message);
	   			   	    	$("#postMainModal").modal("show");
	   					}else {
	   						$(".body").html(response.message)
	   		   	    		$("#postMainModal").modal("show");					
	   					}								
   					}
   				);		
	   			
	   		}
			
		</script>
	</body>
</html>
