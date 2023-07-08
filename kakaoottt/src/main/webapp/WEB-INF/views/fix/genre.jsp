<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Document</title>
</head>
<body>
	<section class="sec00">
		<form action="<c:url value='/genre/content' />" method="get">
		<input type="hidden" name="category" value="${category}"/>
        <div class="ott-logo-box">
        	<input type="checkbox" id="ott1" name="ott" value="1" />
        		<img class="ott-logo-img"
        			src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/tving.png"/>
        			
          	<input type="checkbox" id="ott2" name="ott" value="2"/>
            	<img class="ott-logo-img"
              		src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/netplix.png"/>
              		
            <input type="checkbox" id="ott3" name="ott" value="3"/>
            	<img class="ott-logo-img"
              		src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/wave.png"/>
            
            <input type="checkbox" id="ott4" name="ott" value="4"/>
            	<img class="ott-logo-img"
              		src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/couple.png"/>
              		
       		<input type="checkbox" id="ott5" name="ott" value="5"/>
            	<img class="ott-logo-img"
              		src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/watcha.png"/>
              		
            <input type="checkbox" id="ott6" name="ott" value="6"/>
            	<img class="ott-logo-img"
              		src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/disney.png"/>
        </div>       
        
	        <hr class="ott-logo-divider" />
	        
	        <c:if test="${category ne 'interest' }">
	        <ul class="ott-logo-text">
	        	<li>
	        		<input id="genre1" type="checkbox" name="genre" value="1">
	        		<label for="genre1">액션</label>
	       		</li>
	      		<li>
	      			<input id="genre2" type="checkbox" name="genre" value="2">
	      			<label for="genre2">어드벤쳐</label>
	   			</li>
				<li>
					<input id="genre3" type="checkbox" name="genre" value="3">
					<label for="genre3">SF</label>
				</li>
				<li>
					<input id="genre4" type="checkbox" name="genre" value="4">
	            	<label for="genre4">판타지</label>
	           	</li>
	           	<li>
	           		<input id="genre5" type="checkbox" name="genre" value="5">
	            	<label for="genre5">드라마</label>
	           	</li>
	           	<li>
	           		<input id="genre6" type="checkbox" name="genre" value="6">
	            	<label for="genre6">코미디</label>
	           	</li>
	           	<li>
	           		<input id="genre7" type="checkbox" name="genre" value="7">
	           		<label for="genre7">시대극</label>
	       		</li>
	       		<li>
	       			<input id="genre8" type="checkbox" name="genre" value="8">
	            	<label for="genre8">로맨스/멜로</label>
				</li>
				<li>
					<input id="genre9" type="checkbox" name="genre" value="9">
					<label for="genre9">공포/스릴러</label>
				</li>
				<li>
					<input id="genre10" type="checkbox" name="genre" value="10">
	            	<label for="genre10">미스터리</label>
	           	</li>
	           	<li>
	           		<input id="genre11" type="checkbox" name="genre" value="11">
	            	<label for="genre11">범죄</label>
	           	</li>
	           	<li>
	           		<input id="genre12" type="checkbox" name="genre" value="12">
	            	<label for="genre12">음악/뮤지컬</label>
	           	</li>
	           	 <li>
	           	 	<input id="genre13" type="checkbox" name="genre" value="13">
	            	<label for="genre13">스포츠</label>
	           	</li>
	           	<li>
	           		<input id="genre14" type="checkbox" name="genre" value="14">
	           		<label for="genre14">다큐멘터리</label>
	       		</li>
	       		<li>
	       			<input id="genre15" type="checkbox" name="genre" value="15">
	            	<label for="genre15">가족</label>
	           	</li>
	           	<li>
	           		<input id="genre16" type="checkbox" name="genre" value="16">
	            	<label for="genre16">역사</label>
	           	</li>
	       	</ul>
       	</c:if>
       	<button type="submit" class="subBtn">검색</button>
       	       	
        </form>		

      </section>
      
	<script type="text/javascript">
      	$(document).ready(function() {
      		$('.ott-logo-img').click(function() {
      		    let checkboxId = $(this).prev('input[type="checkbox"]').attr('id');
      		    let checkbox = $('#' + checkboxId);

      		    // 체크박스가 체크되어 있는지 확인
      		    if (checkbox.is(':checked')) {
      		      checkbox.prop('checked', false); // 체크 해제
      		      checkbox.next('img').css({
      		        'outline': 'none',
      		        'border-radius': '0'
      		      });
      		    } else {
      		      checkbox.prop('checked', true); // 체크 설정
      		      checkbox.next('img').css({
      		        'outline': '3px solid #33ff33',
      		        'border-radius': '10px'
      		      });
      		    }
      		  });
		})
		
    </script>
    
</body>
</html>