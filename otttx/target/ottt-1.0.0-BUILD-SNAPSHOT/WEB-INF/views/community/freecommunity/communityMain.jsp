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
		<a href="#" class="upBtn">&uarr;</a>
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
              				<a href="<c:url value='${loginoutlink}' /> " class="${loginout}">
                				<!-- <img src="./images/icon/user01.png" alt="내 정보"> -->
              				</a>
            			</li>
          			</ul>
        		</div>
      		</header>
      		<!--meun bar Start-->  
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
		                  		<li>
	                    			<img src="${path}/resources/images/icon/user01.png" alt="프로필사진">
		                  		</li>
		                  		<li>
	                      			<textarea class="writeHere" placeholder="Write Here" onkeydown="resize(this)" onkeyup="resize(this)" id="article_content" name="article_content" ></textarea>
		                  		</li>
								<li style="margin-left: 70px">
		                  			<img src="" id="preview" style="border-radius: 5px;"/>
		                  		</li>

		                  		<li class="btn_s">
									<div class="form-group">
										<input id="fileInput" name="upFile"   accept="image/*" type="file" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);" onchange="readURL(this)">
										<input type="text" id="userfile" name="userfile">
		                      			<label for="fileInput" for="btn_file" ><img src="${path}/resources/images/img/writeImg.png" class="img_file"></label>
									</div>
		                      		<img src="${path}/resources/images/img/commit.png" alt="commit" class="btn_commit"	id="commitBtn">             
		                  		</li>

	          				</ul>
	        			</form> 
            		</div>
            		<div class="post_list" id="post_list"></div>
         		</div>
        	</div>
        	<div id="loading" class="loading"></div>
    	</div>
	    <script>
	    
			/********************************************************************************/
			/* 자바스크립트 전역변수 영역, 대문자로 정의												*/
			/********************************************************************************/
			let PATH = "<c:out value='${path}'/>"; 	//이미지 root 경로
			let URL = 	"<c:url value='/community/post?article_no='/>";	//상세페이지 이동 URL 설정
			let LOGIN_YN = '${sessionScope.user_no}';	//로그인여부
			let OFFSET = 0;
			let TOTAL_COUNT = 0;
			let CATEGORY = "all";
			console.log("path :"+PATH);
			console.log("url  :"+URL);
			
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

				/********************************************************************************/
				/*	DOM ajaxStart 영역 ajax 호출시 로딩효과											*/
				/********************************************************************************/
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
				$("#commitBtn").click(function(){
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
				
			//목록 생성 함수, $.post 에서 success 함수로 사용
			function fnCreatArticleList(response){
				
				console.log("ajax 통신결과");
				console.log(response);
				
				let createHtml = "";
				
				//목록의 건수가 있을때
				if(response.list && response.list.length > 0){
					
					//총개수
					TOTAL_COUNT = response.totalCount;
					
					//목록
					let list = response.list;
					
					checkListSize = list.length;
					
					//화살표 함수형 foreach 반복문
					list.forEach( function(v) {
	
						createHtml += 	'<ul class="post" >';
						createHtml += 		'<div class="post_info">';
						createHtml +=			'<div style="display: flex;">';
						createHtml +=				'<a href="#"><img class="usur_img" src="'+ PATH +'/resources/images/icon/user01.png" alt="profile"></a>';
						createHtml +=				'<a href="#"><span class="nickname">'+ v.user_nicknm +'</span></a>';
						createHtml +=				'<span id="current_date" >'+ v.article_create_dt +'</span>';
						createHtml +=			'</div>';
						createHtml +=			'<div>';
						createHtml +=				'<div>';	
						createHtml +=					'<button type="button" class="btn_warning" data-bs-toggle="dropdown" >신고</button>';
						createHtml +=					'<ul class="dropdown-menu" >';
						createHtml +=						'<li><a class="dropdown-item" href="#">욕설/비방</a></li>';
						createHtml +=						'<li><a class="dropdown-item" href="#">광고/도배</a></li>';
						createHtml +=						'<li><a class="dropdown-item" href="#">악의적인 스포</a></li>';
						createHtml +=						'<li><a class="dropdown-item" href="#">선정성</a></li>';
						createHtml +=					'</ul>';                   
						createHtml +=				'</div>';
						createHtml +=			'</div>';
						createHtml +=		'</div>'                
						createHtml +=		'<div style="width: 900px;">';
						createHtml +=			'<a href="'+ URL + v.article_no +'" class="main_article" >'+ v.article_content +'</a>';
						//이미지의 데이터가 있으면 태그를 생성
						if(v.article_image+"" != "" && v.article_image != null){
							createHtml +=		'<a href="'+ URL + v.article_no +'" class="main_article"><img style="width:400px; height:400px; border-radius: 5px; margin-bottom: 25px; object-fit: cover;" src="data:image/png;base64, '+v.article_image+'" alt="이미지"></a>';
						}
						createHtml +=		'</div>';
						createHtml +=		'<div>';
						createHtml +=			'<div>';
						createHtml +=				'<input class="heart_img" type="image" src="'+ PATH +'/resources/images/img/heart_on.png" alt="heart">';
						createHtml +=				'<span>'+ v.like_count +'</span>'; 
						createHtml +=				'<input class="re_comment_img" type="image" src="'+ PATH +'/resources/images/img/comment.png" alt="comment">';
						createHtml +=				'<span>'+ v.comment_count +'</span>';                  
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
				   		$("#preview").attr("src",e.target.result).attr("width","500px").attr("height","500px");
			       	
		  			}
		  			// reader가 이미지 읽도록 하기
			       	reader.readAsDataURL(input.files[0]);
		   		}
       		}
		</script>
	</body>
</html>
