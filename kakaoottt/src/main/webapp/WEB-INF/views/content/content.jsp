<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>movie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/content/main.css" >
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
</head>

<!--  body  --------------------->
<body>
		<div class="wrap">
			<%@ include file="../fix/header.jsp" %>
			<br />
			<%@ include file="../fix/genre.jsp" %>
      
			<section class="sec00-1">
				<div class="dropdown-filter">
					<ul>
						<li>
							<select name="button" id="button">
								<option value="최신순" ><a class="dropdown-itemtemp" href="#">최신순</a></option>
								<option value="별점순" ><a class="dropdown-itemtemp" href="#">별점순</a></option>
							</select>
						</li>
					</ul>
				</div>
			</section>
			
			<section class="sec01">
				<c:forEach var="contentDTO" items="${contentList}">
					<div class="work-info">
						<a href="<c:url value="/detailPage?content_no=${contentDTO.content_no }" />">
						<input id="noInput" type="hidden" value="${contentDTO.content_no }" />
						<img src="${contentDTO.thumbnail.toString() }" class="poster"/>
							<div class="work-review">
								<div class="ott-img"  style="cursor: default;">
									<c:forEach var="contentOttDTO" items="${ottList[contentDTO.content_no]}">
									    <c:if test="${contentOttDTO.content_no == contentDTO.content_no}">
						        			<span><img src="${contentOttDTO.ott_img.toString()}"></span>
					        			</c:if>
				        			</c:forEach>
			        			</div>
		        				
		        				<div class="work-cat">
		        					<div class="star-img">
		        						<div><img src="${path}/resources/images/img/onestar.png" style="cursor: default;"></div>
										<div class="score" style="cursor: default;">${contentDTO.rating}</div>
									</div>
									<div id="jjim">
										<c:choose>
											<c:when test="${sessionScope.id != null}">
												<c:set var="isInWishlist" value="false" />
												<c:forEach var="wishlistDTO" items="${wishList}">
													<c:if test="${wishlistDTO.content_no == Integer.parseInt(contentDTO.content_no) && sessionScope.user_no == wishlistDTO.user_no}">
														<c:set var="isInWishlist" value="true" />
													</c:if>
												</c:forEach>
												
												<c:choose>
													<c:when test="${isInWishlist}">
														<button type="button" id="tonojjim" style="width: 25px; height: 30px; background-color:transparent; border: 0;"><img alt="찜" src="${path}/resources/images/img/jjim.png" style="width: 17px; cursor: pointer;"></button>
													</c:when>
													
													<c:otherwise>
														<button type="button" id="tojjim" style="width: 25px; height: 30px; background-color:transparent; border: 0;"><img alt="찜" src="${path}/resources/images/img/nojjim.png" style="width: 17px; cursor: pointer;"></button>
													</c:otherwise>
												</c:choose>
											</c:when>
											
											<c:otherwise>
												<button type="button" id="nojjim" style="width: 25px; height: 30px; background-color:transparent; border: 0;"><img alt="찜" src="${path}/resources/images/img/nojjim.png" style="width: 17px; cursor: pointer;"></button>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</section>
			
			<!-- 페이지 번호 배너-->
			<div class="page-num" style="margin-top: 20px;">
				<nav aria-label="Page navigation example" class="d-flex flex-row justify-content-center">
					<ul class="pagination">
					<c:if test="${pr.showPrev}">
						<li class="page-item">
							<a class="page-link" href='<c:url value="/genre/content${pr.sc.getContentList(pr.beginPage-1)}" />' aria-label="Previous">
							<span aria-hidden="true">&laquo;</span></a>
						</li>
					</c:if>
					
					<c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage }">
						<c:choose>
							<c:when test="${pr.sc.page == i }">
								<li class="page-item"><a class="page-link selpage" href='<c:url value="/genre/content${pr.sc.getContentList(i)}" />'>${i}</a></li>
							</c:when>
					        <c:otherwise>
					        	<li class="page-item"><a class="page-link" href='<c:url value="/genre/content${pr.sc.getContentList(i)}" />'>${i}</a></li>
					        </c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${pr.showNext}">
						<li class="page-item">
							<a class="page-link" href='<c:url value="/genre/content${pr.sc.getContentList(pr.endPage+1)}" />' aria-label="Next">
							<span aria-hidden="true">&raquo;</span></a>
						</li>
					</c:if>
					</ul>
				</nav>
			</div>
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
	        
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous">
	</script>
  
 	<script type="text/javascript">
 		$(document).ready(function() {
	  		
			$(document).on("click", "#tonojjim", function(event) {
				event.preventDefault();
				// 버튼을 클릭했을 때 실행되는 코드
	    	    let content_no = $(this).closest(".work-info").find("#noInput").val()
				let user_no = '${sessionScope.user_no}'
	    	    $.ajax({
	    	    	type: 'DELETE',
					url: '/ottt/genre/genrejjim?content_no=' + content_no + '&user_no=' + user_no,
					headers: {"content-type":"application/json"},
					data: JSON.stringify({content_no:content_no, user_no:user_no}),
					success: function(result){
						document.location.reload(true)
	    	       		$(".body").html("찜 해제 되었습니다.")
	    	        	$('#Modal').modal('show')
	      	        	/* $('#checkBtn').on('click', function() {
	      	        		document.location.reload(true)
						})*/ 	        
	   	      		}, error: function() {
	   	      			$(".body").html("찜해제에 실패했습니다. 다시 시도해주세요.")
	    	      		$('#Modal').modal('show')
	   	      		}
	      		})
	      	})
	        	  
	        $(document).on("click", "#tojjim", function(event) {
	       		
	        	event.preventDefault();
	        	// 버튼을 클릭했을 때 실행되는 코드
	        	let content_no = $(this).closest(".work-info").find("#noInput").val()
	    		let user_no = '${sessionScope.user_no}'
	        	
	    		$.ajax({
	    			type: 'PATCH',
	        	    url: '/ottt/genre/genrejjim?content_no=' + content_no + '&user_no=' + user_no,
	        	    headers: {"content-type":"application/json"},
	        	    data: JSON.stringify({content_no:content_no, user_no:user_no}),
	        	    success: function(result){
	        	    	document.location.reload(true)
	        	        $(".body").html("찜 등록 되었습니다.")
	        	        $('#Modal').modal('show') 
	        	        /* $('#checkBtn').on('click', function() {
	        	        	document.location.reload(true)
						}) */ 
					}, error: function() {
						$(".body").html("찜등록에 실패했습니다. 다시 시도해주세요.")
	        	        $('#Modal').modal('show')
	       	        	}					
	       	    });
			});
	
			$(document).on("click", "#nojjim", function(event) {
				event.preventDefault()
	     	    $(".body").html("로그인이 필요합니다.")
	     	    $('#Modal').modal('show')
			})
			
			
			$(`.${category}`).css('color', '#33ff33');
			

		});	
		
		
	</script>

    <style>

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
    

  </body>
</html>