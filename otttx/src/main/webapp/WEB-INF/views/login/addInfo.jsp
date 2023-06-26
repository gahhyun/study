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
    <link rel="stylesheet" href="${path}/resources/css/login/addinfo.css" >
    <script src="${path}/resources/js/home/jquery-3.6.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <style>
    	.ott-logo-img:hover,
		.ott-logo-img.active {
			outline: 3px solid #33ff33;
		}
		input[name="ott_no"] {
		  display: none;
		}
		
		input[name="ott_no"] + label {
		  display: inline-block;
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

.page-link {
    color: #ffffff; 
    background-color: #202020;
    border-color: #ffffff;
  }
    
  .page-link:focus, .page-link:hover {
    color: #33ff33;
    background-color: #202020; 
    border-color: #33ff33;
  }
    </style>
    <title>추가 정보 입력</title>
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
		
		<script type="text/javascript">
		/* 추가 정보 입력 체크 */
		  function frmCheck(frm) {
			  let msg = '';
			  const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
			
			  if (checkboxes.length === 0) {
			    $(".body").html("최소한 하나의 옵션을 선택해주세요.");
			    $('#Modal').modal('show');
			    return false;
			  }
			  return true;
			}
		
		  function showImage() {
				var checkboxes = document.getElementsByName("ott_no"); // 체크박스 요소들을 가져옵니다.
				
				checkboxes.forEach(function(checkbox) {
					var image = checkbox.nextElementSibling.querySelector(".ott-logo-img"); // 체크박스 다음에 오는 이미지 요소를 가져옵니다.
					
					if (checkbox.checked) {
						image.style.display = "inline-block"; // 체크된 상태일 때 이미지를 보여줍니다.
					} 
				});
			}
		</script>
		
		<form method="get" action="<c:url value="/inserInfo" />" id="membership" onsubmit="return frmCheck(this)">
			<div class="main">
				<h1 style="font-size: 21px; display: inline-block;">추가 정보 입력</h1>
				<div class="OTTcheck" style="border: 1px; padding: 3px;">OTT 선택</div>
				<div class="Genrecheck" style="border: 1px; padding: 3px;">장르 선택</div>
				
				<section class="sec00">
					<div class="ott-logo-box">
						
						<input class="ott" id="ott1" name="ott_no" value="1" type="checkbox" onchange="showImage()">
						<label for="ott1">
							<img class="ott-logo-img" src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/tving.png" />
						</label>

						<input class="ott" id="ott2" name="ott_no" value="2" type="checkbox" onchange="showImage()">
						<label for="ott2">
							<img class="ott-logo-img" src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/netplix.png"	/>
						</label>
						
						<input class="ott" id="ott3" name="ott_no" value="3" type="checkbox" onchange="showImage()">
						<label for="ott3">
							<img class="ott-logo-img" src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/wave.png" />
						</label>
						
						<input class="ott" id="ott4" name="ott_no" value="4" type="checkbox" onchange="showImage()">
						<label for="ott4">
							<img class="ott-logo-img" src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/couple.png" />
						</label>
						
						<input class="ott" id="ott5" name="ott_no" value="5" type="checkbox" onchange="showImage()">
						<label for="ott5">
							<img class="ott-logo-img" src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/watcha.png" />
						</label>
						
						<input class="ott" id="ott6" name="ott_no" value="6" type="checkbox" onchange="showImage()">
						<label for="ott6">
							<img class="ott-logo-img" src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/disney.png" />
						</label>
						
					</div>
					
					<ul class="ott-logo-text" >
						<li>
					    	<input id="movie" type="checkbox" name="genre_no" value="1">&nbsp;&nbsp;
					    	<label for="movie">액션</label>
					  	</li>
					  	<li>
					    	<input id="movie1" type="checkbox" name="genre_no" value="2">&nbsp;&nbsp;
					    	<label for="movie1">어드벤쳐</label>
					  	</li>
					  	<li>
						    <input id="movie2" type="checkbox" name="genre_no" value="3">&nbsp;&nbsp;
						    <label for="movie2">SF</label>
					  	</li>
					  	<li>
					    	<input id="movie3" type="checkbox" name="genre_no" value="4">&nbsp;&nbsp;
					    	<label for="movie3">판타지</label>
					  	</li>
				  		<li>
				    		<input id="movie4" type="checkbox" name="genre_no" value="5">&nbsp;&nbsp;
					    	<label for="movie4">드라마</label>
					  	</li>
					  	<li>
					    	<input id="movie5" type="checkbox" name="genre_no" value="6">&nbsp;&nbsp;
					    	<label for="movie5">코미디</label>
					  	<li>
						    <input id="movie6" type="checkbox" name="genre_no" value="7">&nbsp;&nbsp;
					    	<label for="movie6">시대극</label>
					  	</li>
					  	<li>
					    	<input id="movie7" type="checkbox" name="genre_no" value="8">&nbsp;&nbsp;
					    	<label for="movie7">로맨스/멜로</label>
					  	</li>
					  	<li>
						    <input id="movie8" type="checkbox" name="genre_no" value="9">&nbsp;&nbsp;
					    	<label for="movie8">공포/스릴러</label>
					  	</li>
					  	<li>
						    <input id="movie9" type="checkbox" name="genre_no" value="10">&nbsp;&nbsp;
					    	<label for="movie9">미스터리</label>
					  	</li>
					  	<li>
						    <input id="movie10" type="checkbox" name="genre_no" value="11">&nbsp;&nbsp;
					    	<label for="movie10">범죄</label>
					  	</li>
					  	<li>
						    <input id="movie11" type="checkbox" name="genre_no" value="12">&nbsp;&nbsp;
					    	<label for="movie11">음악/뮤지컬</label>
					  	</li>
					  	<li>
						    <input id="movie12" type="checkbox" name="genre_no" value="13">&nbsp;&nbsp;
					    	<label for="movie12">스포츠</label>
					  	</li>
					  	<li>
						    <input id="movie13" type="checkbox" name="genre_no" value="14">&nbsp;&nbsp;
					    	<label for="movie13">다큐멘터리</label>
					  	</li>
					  	<li>
						    <input id="movie14" type="checkbox" name="genre_no" value="15">&nbsp;&nbsp;
					    	<label for="movie14">가족</label>
					  	</li>
					  	<li>
						    <input id="movie15" type="checkbox" name="genre_no" value="16">&nbsp;&nbsp;
					    	<label for="movie15">역사</label>
					  	</li>
				  	</ul>
		  		</section>
		  	
			  	<div class="back" style="display: inline-block; pointer-events: none;">
					<a href="<c:url value="/" />" style="pointer-events: none;">
						<input type="button" value="건너뛰기" style="pointer-events: auto;">
		  			</a>
				</div>
				
				<div class="complate">
					<input type="submit" value="완료">
				</div>
				
				<script>
					const logos = document.querySelectorAll('.ott-logo-img');
					logos.forEach(function(logo) {
						logo.addEventListener('click', function() {
							logo.classList.toggle('active');
						});
					});
				</script>
			</div>
		</form>
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
	              <div class="modal-footer" id="modal-footer">
	                <button type="button" id="checkBtn" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
	              </div>
	            </div>
	          </div>
	        </div>
		
</body>
</html>
