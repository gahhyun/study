<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginId" value="${sessionScope.id }"/>
<c:set var="user_no" value="${sessionScope.user_no}" />
<c:set var="loginout" value="${sessionScope.id == null ? 'logout' : 'login'}" />
<c:set var="loginoutlink" value="${sessionScope.id==null ? '/login' : '/mypage'}" />
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OTTT</title>     
    <script src="${path}/resources/js/workDetailPage/script/jquery-3.6.1.min.js"></script>
    <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
    crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/workDetailPage/reply.css" >
    <script type="text/javascript" src="${path}/resources/js/workDetailPage/script/reply.js"></script>
  </head>
  <body style="background-color: #202020; color: #fff;" id="area">
    <div class="wrap">
    
      <%@ include file="../fix/header.jsp" %>
      
    </div>
    <section class="sec01" id="sec01">      
      <div class="banner">
        <div class="banner-header">
            <p>
              어디서 보나요?              
            </p>
        </div>
        <div class="banner-body">
         <div class="net-logo">

				<c:forEach var="ContentOTTDTO" items="${contentOTTlist}" >
				  <c:set var="ottImage" value="" />
				  <c:set var="ottLink" value="#" />
				
				  <c:choose>
				    <c:when test="${ContentOTTDTO.ott_no == 1}">
				      <c:set var="ottImage" value="${ContentOTTDTO.ott_img}"  />
				      <c:set var="ottLink" value="https://www.tving.com" />
				    </c:when>
				    <c:when test="${ContentOTTDTO.ott_no == 2}">
				      <c:set var="ottImage" value="${ContentOTTDTO.ott_img}" />
				      <c:set var="ottLink" value="https://www.netflix.com/" />
				    </c:when>
				        <c:when test="${ContentOTTDTO.ott_no == 3}">
				      <c:set var="ottImage" value="${ContentOTTDTO.ott_img}"  />
				      <c:set var="ottLink" value="https://www.wavve.com/" />
				    </c:when>
				        <c:when test="${ContentOTTDTO.ott_no == 4}">
				      <c:set var="ottImage" value="${ContentOTTDTO.ott_img}"  />
				      <c:set var="ottLink" value="https://www.coupangplay.com/" />
				    </c:when>
				        <c:when test="${ContentOTTDTO.ott_no == 5}">
				      <c:set var="ottImage" value="${ContentOTTDTO.ott_img}"  />
				      <c:set var="ottLink" value="https://watcha.com/" />
				    </c:when>
				        <c:when test="${ContentOTTDTO.ott_no == 6}">
				      <c:set var="ottImage" value="${ContentOTTDTO.ott_img}"  />
				      <c:set var="ottLink" value="https://www.disneyplus.com/ko-kr" />
				    </c:when>
				  </c:choose>
				
				  <a href="${ottLink}"><img src="${ottImage}" alt="OTT 로고"></a>
				
				  
				</c:forEach>

            	
                </div>
          

        </div>
      </div>      
      
      <div class="main-img">
        <img src="${contentDTO.main_img }" >
      </div>

      <div class="info">
        <ul>
          <li class="info-title">
          <a href="<c:url value="/detailPage?content_no=${contentDTO.content_no }" />">
         	<h1>${contentDTO.content_nm }</h1>
		  </a>
          </li>
          <br>
          <li class="info-detail">
           
            <span>${contentDTO.country }&nbsp;·&nbsp;</span>
            <c:forEach var="GenreDTO" items="${genrenmlist}" varStatus="loop">
            	<span class="a1"><a href="#">${GenreDTO.genre_nm}</a></span>
            	<c:if test="${!loop.last}">&nbsp;·&nbsp;</c:if>
            	
            </c:forEach>
            <span>&nbsp;·&nbsp;${contentDTO.content_runtime }분&nbsp;·&nbsp;</span>
            <span>${contentDTO.age }세</span>
          </li>
          <br>
          <li class="info-director">
            <span>감독 :&nbsp;</span>
            <span>
              에드워드 버거
            </span>
          </li>
          <li class="info-main_actor">
            <span>주연 :&nbsp;</span>
            <span>
              펠릭스 카머러,&nbsp;
            </span>
            <span>
              알브레히트 슈흐
            </span>
          </li>
          <li class="info-supporting_actor">
            <span>조연 :&nbsp;</span>
            <span>
             데비트 슈트리조,&nbsp;                      
            </span>            
            <span>
              아드리안 그뤼
            </span>
          </li>
        </ul>
      </div>
      </section>
   <section class="myReview" id="myReview">
   
           <div class="left-score">
          <h2>이 영화의 평균 별점</h2>
                             
        <p class="mytextReview" style="font-style: oblique; font-size: 20px;">리뷰</p>
        <div class="asdasd" style="border-top: 3px solid #33ff33;">
        </div>
     <div class="left-box">
            <button id="saw-button" ><img class="saw" src="${path}/resources/images/img/saw.png" alt="봣어요" ></button>
          <button id="mark-button"><img class="mark" src="${path}/resources/images/img/mark.png" alt="봣어요"></button>
          <button id="reply-button"><img class="review-icon" src="${path}/resources/images/img/addcomment.png" alt="봣어요"></button>
        <div class="smr">

          <div class="reply-back">1</div>
          <form id="reply-form">
          <div id="reply-popup" class="popup11">         
              <label for="reply-text" style="background-color: #202020;">댓글을 작성해주세요</label>
              <input type="hidden" name="user_no" value="${sessionScope.user_no}" >
              <input type="hidden" name="user_nicknm" value="${userDTO.user_nicknm }">
              <input type="hidden" name="content_no" value="${Review.content_no}">
   			  <input type="hidden" name="review_no" value="${Review.review_no}">             
              <textarea id="reply-text" name="cmt_content"></textarea>
              <div class="reply-star-footer">   
                <div class="reply-bottom">
                  <div class="checkedblur"><input type="checkbox" id="checkbox-blur"/>스포일러 포함 여부</div>
                <button type="submit" class="submit-reply">             
                  댓글 등록
                </button>
                </div>
              </div>
              <button type="button" id="cancel-reply">
              
                <ul>
                  <li></li>
                  <li></li>
                </ul>
              </button>                        
          </div>
          </form>

    <div class="starpoint_wrap avgStar_wrap">
  <div class="starpoint_box avgStar">
  		<%double ratingAvg = (double) request.getAttribute("rating");  // Mapper에서 전달받은 평균 별점 값		
		// 별점의 평균을 0.5 단위로 반올림

		double roundedRating = (double) (Math.round(ratingAvg * 2)) / 2;%>
    <% for (double i = 0.5; i <= 5; i += 0.5) {
        String label = String.valueOf(i);
        String radioId = "starpoint_" + (int) (i * 2);
        // 만약 평균 별점이 현재 별점과 일치하거나, 평균 별점이 현재 별점 범위 내에 있다면 선택된 라디오 버튼으로 지정
        boolean isChecked = (roundedRating == i) || (roundedRating >= (i - 0.25) && roundedRating < (i + 0.25)); %>
        <c:if test="ifnull">
        
        </c:if>
    <label for="<%= radioId %>" class="label_star" title="<%= label %>"><span class="blind"><%= label %>점</span></label>
    <input type="radio" name="rating" id="<%= radioId %>" class="star_radio" value="<%= label %>" <%= isChecked ? "checked" : "" %>>
    <% } %>
    <span class="starpoint_bg"></span>
  </div>
  		<h3 class="ratingAvg">
		  <%= roundedRating %>/5
		</h3>
	</div>          



        </div>
        
      </div>
      
      
      </div>
      
        <div class="advertisement">
          <p>광고</p>
        </div>
               <div class="review-box1">      
          <div class="review-box-header">
            <div class="user-icon">
            	<a href="javascript:goProfile('${Review.user_no }', '${Review.user_nicknm}')">
            		<img src="${Review.image}" >
           		</a>
            </div>
            <div class="user-name">
              <a href="javascript:goProfile('${Review.user_no }', '${Review.user_nicknm}')">
                <p class="user_nicknm"> ${Review.user_nicknm} </p>
              </a>
              <p class="date-insert" name="review_create_dt"><fmt:formatDate pattern="yy-MM-dd hh:mm" value="${Review.review_create_dt}"/></p>
             <input type="hidden" name="review_no" value="${Review.review_no }">
             <input type="hidden" name="content_no" value="${Review.content_no }"> 
            </div>
            <ul>
              <li class="rating">
                 <img src="${path}/resources/images/img/starone.png" alt="별점">
                ${Review.rating}
              </li>
              <li>
                <div class="heart">        
                    <div>
                    <c:choose>
						<c:when test="${Review.check_like_count == 1}">
	                      	<input class="LikeBtn" id="heart-on" type="image" src="${path}/resources/images/img/heart_on.png" width="35" height="80%"  data-review-no="${Review.review_no}" >
	                    </c:when>
					<c:otherwise>
						<input class="LikeBtn" id="heart-off" type="image" src="${path}/resources/images/img/heart_off.png" width="35" height="80%"  data-review-no="${Review.review_no}" >
					</c:otherwise>
					</c:choose>		
                    </div>             
                </div>
              </li>
            </ul>
          </div>         
          <div class="review-box-body">            
            <p class="review-box-text review_content">${Review.review_content }</p>
          </div>
          <div class="review-box-footer">
            <div>
              <ul>
                <li>
                  <div class="like">
                    <img src="${path}/resources/images/img/좋아요.png" alt="좋아요아이콘">
                  </div>
                  <div class="like-count">
                    <p id="likeCount">
                      ${Review.like_count}개
                    </p>
                   
                 
                  </div>
                </li>
                <li>
                  <div class="footer-comment">
                    <img src="${path}/resources/images/img/댓글.png" alt="댓글아이콘">
                  </div>
                  <div class="comment-count">
                    <p>
                      ${Review.comment_cnt}개
                    </p>
                  </div>
                </li>
              </ul>
            </div>
            	<c:if test="${Review.user_no != sessionScope.user_no}">
   			      <div class="report">
                  		<button><img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                      	<button>신고</button>
                  </div>            		
            	</c:if>
            	<c:if test="${Review.user_no == sessionScope.user_no}">
               <div class="modify" >
                  <button type="button" name="modBtn" id="modify" class="modOnBtn" ><img src="${path }/resources/images/img/review.png">수정</button>
               </div>
            
   			 <button class="removeBtn"><img src="${path}/resources/images/img/delete.png">삭제</button>
   			 </c:if>
          </div>
        </div>
        
        <form id="mod-form" class="mod-form">   
          <div class="popup12 mod-popup">     
              <label for="mod-text" style="background-color: #202020;">리뷰를 작성해주세요</label>
              <input type="hidden" name="user_no" value="${sessionScope.user_no}" > 
              <input type="hidden" name="review_no" class="review_no" value="${Review.review_no}">  
              <input type="hidden" name="content_no" value="${content_no }">          
              <textarea id="review-text" name="review_content" class="text_review" >${Review.review_content}</textarea>
              <div class="review-star-footer">
                <div class="review-star" >별점을 매겨주세요:
                  <div class="starpoint_wrap2">
                    <div class="starpoint_box2">
                      <label for="starpoint_11" class="label_star2" title="0.5"><span class="blind">0.5점</span></label>
                      <label for="starpoint_12" class="label_star2" title="1"><span class="blind">1점</span></label>
                      <label for="starpoint_13" class="label_star2" title="1.5"><span class="blind">1.5점</span></label>
                      <label for="starpoint_14" class="label_star2" title="2"><span class="blind">2점</span></label>
                      <label for="starpoint_15" class="label_star2" title="2.5"><span class="blind">2.5점</span></label>
                      <label for="starpoint_16" class="label_star2" title="3"><span class="blind">3점</span></label>
                      <label for="starpoint_17" class="label_star2" title="3.5"><span class="blind">3.5점</span></label>
                      <label for="starpoint_18" class="label_star2" title="4"><span class="blind">4점</span></label>
                      <label for="starpoint_19" class="label_star2" title="4.5"><span class="blind">4.5점</span></label>
                      <label for="starpoint_20" class="label_star2" title="5"><span class="blind">5점</span></label>
                      <input type="radio" name="rating" id="starpoint_11" class="star_radio2" value="0.5" >
                      <input type="radio" name="rating" id="starpoint_12" class="star_radio2" value="1">
                      <input type="radio" name="rating" id="starpoint_13" class="star_radio2" value="1.5">
                      <input type="radio" name="rating" id="starpoint_14" class="star_radio2" value="2">
                      <input type="radio" name="rating" id="starpoint_15" class="star_radio2" value="2.5">
                      <input type="radio" name="rating" id="starpoint_16" class="star_radio2" value="3">
                      <input type="radio" name="rating" id="starpoint_17" class="star_radio2" value="3.5">
                      <input type="radio" name="rating" id="starpoint_18" class="star_radio2" value="4">
                      <input type="radio" name="rating" id="starpoint_19" class="star_radio2" value="4.5">
                      <input type="radio" name="rating" id="starpoint_20" class="star_radio2" value="5">
                      <span class="starpoint_bg2"></span>
                    </div>
                  </div>
                </div>
   
                <div class="review-bottom">
                  <div class="checkedblur1"><input type="checkbox" id="checkbox-blur"/>스포일러 포함 여부</div>
                <button type="button" class="submitMod-review" id="submit-Mod">     
                  리뷰 수정
                </button>
                </div>
              </div>
              <button type="button" class="modcancel-review">
              
                <ul>
                  <li></li>
                  <li></li>
                </ul>
              </button>                        
          </div>
          </form>
          
          
   </section>
    <section class="sec02" id="sec02">
      <div class="review" id="11">

        <div class="review-count">
        <p>
          총 ${count}개의 댓글이 있습니다.
        </p>
        </div>
        <br>
        
        <c:forEach var="CommentDTO" items="${list}">
         <div class="reply-box">      
          <div class="reply-box-header">
            <div class="user-icon"> 
              <img src="${CommentDTO.image }">
            </div>
            <div class="user-name">
              <a href="../ottt박소율/mypageshow.html">
                <p class="user_nicknm"> ${CommentDTO.user_nicknm} </p>
              </a>
              <p class="reply-date-insert" name="cmt_dt"><fmt:formatDate pattern="yy-MM-dd hh:mm" value="${CommentDTO.cmt_dt}"/></p>
             <input type="hidden" name="review_no" value="${CommentDTO.review_no }"> 
             <input type="hidden" name="cmt_no" value ="${CommentDTO.cmt_no }">
            </div>           
                <div class="heart">        
                    <div>
                 <button onclick="changeImage()">
                         <img id="myImage" src="${path}/resources/images/img/heart_off.png" width="35" height="80%">
                      </button>               
                    </div>             
                </div>                       
          </div>          
          <div class="reply-box-body">            
            <p class="reply-box-text review_content">${CommentDTO.cmt_content }</p>
          </div>
          <div class="reply-box-footer">
            <div>
              <ul>
                <li>
                  <div class="like">
                    <img src="${path}/resources/images/img/좋아요.png" alt="좋아요아이콘">
                  </div>
                  <div class="like-count">
                    <p>
                      9999개
                    </p>
                  </div>
                </li>
              </ul>
            </div>
                  <div class="report">
                  <button><img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                      <button>신고</button>
                  </div>
               <c:if test="${CommentDTO.user_no == sessionScope.user_no}">
               <div class="replymodify" >
                  <button type="button" name="replymodBtn" id="replymodify" class="ReplymodOnBtn" data-cmt-no="${CommentDTO.cmt_no}" data-cmt-content="${CommentDTO.cmt_content}">
                  	<img src="${path }/resources/images/img/review.png">수정
                  </button>
               </div>
   			 <button  class="replyremoveBtn"><img src="${path}/resources/images/img/delete.png">삭제</button>
   			
   			 </c:if>
          </div>
        </div>
       
        
        </c:forEach>
      </div>
         <form id="replymod-form" class="replymod-form">   
          <div class="popup13 replymod-popup">     
              <label for="replymod-text" style="background-color: #202020;">댓글를 작성해주세요</label>
              <input type="hidden" name="user_no" value="${sessionScope.user_no}" > 
              <input type="hidden" name="cmt_no" class="cmt_no" value="${cmt_no}">  
              <input type="hidden" name="content_no" value="${content_no }">          
              <textarea id="reply-text" name="cmt_content" class="text_reply" >${CommentDTO.cmt_content}</textarea>
              <div class="review-star-footer">  
                <div class="modreply-bottom">
                  <div class="checkedblur"><input type="checkbox" id="checkbox-blur"/>스포일러 포함 여부</div>
                <button type="button" class="submitMod-reply" id="submit-Modreply">     
                  댓글 수정
                </button>
                </div>
              </div>
              <button type="button" class="replymodcancel-review">
              
                <ul>
                  <li></li>
                  <li></li>
                </ul>
              </button>                        
          </div>
          </form> 
           <!-- Modal -->
           <div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 9999;">
             <div class="modal-dialog modal-dialog-centered">
               <div class="modal-content">
                 <div class="modal-header">
                   <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
                   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                 </div>
                 <div class="modal-body body">
                 </div>
                 <div class="modal-footer">
                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modal-confirm-button">확인</button>
                 </div>
               </div>
             </div>
           </div> 
    </section>
    
    <footer>

    </footer>    
        
    
    
     <script type="text/javascript">
       function changeImage() {
        var image = document.getElementById('myImage');
        if (image.src.includes('${path}/resources/images/img/likeoff.png')) {
          image.src = '${path}/resources/images/img/likeon.png'; 
        } else {
          image.src = '${path}/resources/images/img/likeoff.png';
        }
      }
       
       
    </script>   
    
   <script type="text/javascript">
   $(document).ready(function() {   
	      
      $('.submit-reply').on("click", function(){
         let form = $("#reply-form")
         form.attr("action", "<c:url value='/detailPage/reply/write'/>")
         form.attr("method", "post")
         
         if(formCheck()){
             form.submit()
          }else{
         	 return false
          }
      })
      
            let formCheck = function() {
         let form = document.getElementById("reply-form")
         if(form.user_no.value==""){
              $(".body").html("로그인 후 댓글을 등록해주세요.");
              $('#Modal').modal('show');
            document.getElementById("reply-text").focus();
            return false
         }         
         if(form.cmt_content.value=="") {
             $(".body").html("내용을 입력해 주세요.");
             $('#Modal').modal('show');
            console.log("reply-text 포커스 설정 직전"); 
            document.getElementById("reply-text").focus();
            console.log("reply-text 포커스 설정 후");
            return false
         }
         return true
      }
  <c:if test="${not empty msg}">
      <c:choose>
          <c:when test="${msg eq 'ok'}">
 		  $(".body").html("정상적으로 등록되었습니다.");
          $('#Modal').modal('show');
          </c:when>
          <c:when test="${msg eq 'fail'}">
     		  $(".body").html("다시 시도해 주세요.");
              $('#Modal').modal('show');
          </c:when>
      </c:choose>
  </c:if>
      
      
      $(".submitMod-review").on("click", function(){
          let form = $("#mod-form")
          
          form.attr("action", "<c:url value='/detailPage/reply/reviewmodify'/>")
          form.attr("method", "post")
            if(modformCheck()){  
             form.submit()
            }else{
            	 return false
            }
       })
       
       let modformCheck = function() {    	  
          let form = document.getElementById("mod-form")
          if(form.user_no.value==""){
          $(".body").html("로그인 후 리뷰를 등록해주세요.");
          $('#Modal').modal('show');
             form.content.focus()
             return false
          }         
          if(form.review_content.value=="") {      
          $(".body").html("내용을 입력해 주세요.");
          $('#Modal').modal('show');
             console.log("reply-text 포커스 설정 직전"); 
             form.content.focus()
             console.log("reply-text 포커스 설정 후");
             return false
          }
          if(form.rating.value==""){
          $(".body").html("별점을 입력해 주세요.");
          $('#Modal').modal('show');
         	 form.content.focus()
         	 return false
          }
          return true
       }
	 <c:if test="${not empty msg}">
	      <c:choose>
	          <c:when test="${msg eq 'MOD_OK'}">
	 		  $(".body").html("수정이 완료되었습니다.");
	          $('#Modal').modal('show');
	          </c:when>
	          <c:when test="${msg eq 'MOD_ERR'}">
	     		  $(".body").html("다시 시도해 주세요.");
	              $('#Modal').modal('show');
	          </c:when>
	      </c:choose>
	  </c:if>
      
	  $(".removeBtn").on("click", function() {
		  let modalBody = $(".body");
		  modalBody.html("리뷰를 삭제하시겠습니까?");
		  $('#Modal').modal('show');

		  // 확인 버튼 클릭 시 리뷰 삭제 실행
		  $('.btn-secondary').on('click', function() {
		    let form = $("<form>");
		    form.attr("action", "<c:url value='//detailPage/reply/reviewremove' />");
		    form.attr("method", "post");

		    let content_no = getParameterValueFromURL('content_no');
		    let review_no = getParameterValueFromURL('review_no');

		    let input1 = $("<input>").attr("type", "hidden").attr("name", "content_no").val(content_no);
		    let input2 = $("<input>").attr("type", "hidden").attr("name", "review_no").val(review_no);

		    form.append(input1);
		    form.append(input2);

		    $("body").append(form);
		    form.submit();
		  });
		});
	
	// URL에서 파라미터 값을 가져오는 함수
	function getParameterValueFromURL(param) {
	  let urlParams = new URLSearchParams(window.location.search);
	  return urlParams.get(param);
	}  
	
	$(".replyremoveBtn").on("click", function() {
		  let modalBody = $(".body");
		  modalBody.html("댓글을 삭제하시겠습니까?");
		  $('#Modal').modal('show');

		  // 확인 버튼 클릭 시 댓글 삭제 실행
		  $('.btn-secondary').on('click', function() {
		    let form = $("<form>");
		    form.attr("action", "<c:url value='/detailPage/reply/replyremove'/>");
		    form.attr("method", "post");

		    let content_no = getParameterValueFromURL('content_no');
		    let review_no = getParameterValueFromURL('review_no');
		    let cmt_no = $("input[name='cmt_no']").val();

		    let input1 = $("<input>").attr("type", "hidden").attr("name", "content_no").val(content_no);
		    let input2 = $("<input>").attr("type", "hidden").attr("name", "review_no").val(review_no);
		    let input3 = $("<input>").attr("type", "hidden").attr("name", "cmt_no").val(cmt_no);

		    form.append(input1);
		    form.append(input2);
		    form.append(input3);

		    $("body").append(form);
		    form.submit();
		  });
		});
	
	 <c:if test="${not empty msg}">
	     <c:choose>
	         <c:when test="${msg eq 'REPLYDEL_OK'}">
			  $(".body").html("삭제가 완료되었습니다.");
	         $('#Modal').modal('show');
	         </c:when>
	         <c:when test="${msg eq 'REPLYDEL_ERR'}">
	    		  $(".body").html("다시 시도해 주세요.");
	             $('#Modal').modal('show');
	         </c:when>
	     </c:choose>
	 </c:if>
		
		// URL에서 파라미터 값을 가져오는 함수
		function getParameterValueFromURL(param) {
		  let urlParams = new URLSearchParams(window.location.search);
		  return urlParams.get(param);
		}
		
		$(".submitMod-reply").on("click", function() {
			  let form = $("#replymod-form");
			  let content_no = getParameterValueFromURL('content_no');
			  let review_no = getParameterValueFromURL('review_no');
			  let cmt_no = $("input[name='cmt_no']").val();

			  // Create form data object
			  let formData = new FormData(form[0]);
			  formData.append("content_no", content_no);
			  formData.append("review_no", review_no);
			  formData.append("cmt_no", cmt_no);

			  $.ajax({
			    url: "<c:url value='/detailPage/reply/replymodify'/>",
			    type: "POST",
			    data: formData,
			    processData: false,
			    contentType: false,
			    dataType: "json",
			    success: function(response) {
			      if (response.success) {
			        // Display success message using modal
			        $(".body").html("수정이 완료되었습니다.");
			        $('#Modal').modal('show');

			        // Disable backdrop click and ESC key close events
			        $('#Modal').on('hide.bs.modal', function(e) {
			          return false;
			        });

			        // Bind click event to modal button
			        $("#modal-confirm-button").on("click", function() {
			          // Fetch updated data and update the relevant section of the page
			          $.ajax({
			            url: "<c:url value='/detailPage/reply'/>",
			            type: "GET",
			            data: {
			              content_no: content_no,
			              review_no: review_no
			            },
			            success: function(data) {
			              // Update the relevant section of the page with the updated data
			              $("#area").html(data);

			              // Clear the form fields
			              form.find("textarea[name='cmt_content']").val("");
			            },
			            error: function(xhr, status, error) {
			              alert("데이터를 가져오는 중 오류가 발생했습니다.");
			            }
			          });

			          // Close the modal
			          $('#Modal').modal('hide');
			        });
			      } else {
			        // Display error message using modal
			        $(".body").html("다시 시도해 주세요.");
			        $('#Modal').modal('show');
			      }
			    },
			    error: function(xhr, status, error) {
			      alert("수정 중 오류가 발생했습니다.");
			    }
			  });
			});
      
   })
   </script>
   


<script type="text/javascript">
    $(document).ready(function() {
         const reviewButton = $('#reply-button');
         const reviewPopup = $('#reply-popup');
         const cancelButton = $('#cancel-reply');
         const submitButton = $('#submit-reply');
         
         const modButton = $('.modOnBtn');
         const modPopup = $('.mod-popup');
         const submitModButton = $('.submitMod-review');
         const modCancelButton = $('.modcancel-review');
         
         const ReplymodButton = $('.ReplymodOnBtn');
         const ReplymodPopup = $('.replymod-popup');
         const ReplysubmitModButton = $('.submitMod-reply');
         const ReplymodCancelButton = $('.replymodcancel-review');
         
         
         reviewButton.on('click', function() {
           reviewPopup.css('display', 'block');
           $('.reply-back').fadeIn();
           $('.popup11').fadeIn();
         });

         submitButton.on('click', function() {
           reviewPopup.css('display', 'none');
           $('.reply-back').fadeOut();
         });

         cancelButton.on('click', function() {
           reviewPopup.css('display', 'none');
           $('.reply-back').fadeOut();
         });
         
         modButton.on('click', function() {           
           modPopup.css('display', 'block');
           $('.reply-back').fadeIn();
           $('.popup12').fadeIn();
           
           
         });
         
         submitModButton.on('click', function() {
           modPopup.css('display', 'none');
           $('.reply-back').fadeOut();
         });

         modCancelButton.on('click', function() {
           modPopup.css('display', 'none');
           $('.reply-back').fadeOut();
         });
         
     	ReplymodButton.on('click', function() {   
     		const cmt_no = $(this).data('cmt-no');
     		const cmt_content = $(this).data('cmt-content'); // 수정 버튼의 data-cmt-content 값을 가져옴
    		ReplymodPopup.css('display', 'block');    		
            $('.reply-back').fadeIn();
            $('.popup13').fadeIn();    
            $('input[name="cmt_no"]').val(cmt_no);
            $('textarea[name="cmt_content"]').val(cmt_content); // replymod-form의 cmt_content 필드에 설정
          });
    	
    	ReplysubmitModButton.on('click', function() {
    		ReplymodPopup.css('display', 'none');
            $('.reply-back').fadeOut();
          });
    	
    	ReplymodCancelButton.on('click', function() {           
    		ReplymodPopup.css('display', 'none');
            $('.reply-back').fadeOut();                      
          });
       });
    

    </script>
    
    
    	<script type="text/javascript">
	let LOGIN_YN = '${sessionScope.user_no}';
	let PATH = "<c:out value='${path}'/>";

	$(document).ready(function() {
	    // 좋아요 상태 확인 및 버튼 이미지 설정
	    $('.LikeBtn').each(function() {
	        const review_no = $(this).data('review-no');
	        const btn = $(this);
	        var likeCount = btn.closest('.review-box1').find('.review-box-footer #likeCount');

	        $.post(
	            '/ottt/reply/selectLikeCount',
	            { 'user_no': '${user_no}', 'review_no': review_no },
	            function(data) {
	                let result = data.result;

	                if (result == 0) {
	                    // 좋아요 상태인 경우
	                    btn.attr('src', PATH + '/resources/images/img/heart_off.png');
	                } else {
	                    // 좋아요 상태가 아닌 경우
	                    btn.attr('src', PATH + '/resources/images/img/heart_on.png');
	                }
	            }
	        );
	    });

	    $(".LikeBtn").click(function() {
	        let btn = $(this);
	        const review_no = $(this).data('review-no');
	        $('input[name="review_no"]').val(review_no);
	        var likeCount = btn.closest('.review-box1').find(".review-box-footer #likeCount");

	        if (LOGIN_YN == null || LOGIN_YN == "") {
	            alert("로그인 후 이용가능합니다.", "로그인을 해주세요.", "warning");

	            location.href = "/ottt/login";

	            return;
	        }

	        $.post(
	            "/ottt/reply/selectLikeCount",
	            { "user_no": "${user_no}", "review_no": review_no },
	            function(data) {
	                let result = data.result;

	                if (result == 0) {
	                    // 저장하는 post ajax
	                    $.post(
	                        "/ottt/reply/insertLike",
	                        { "user_no": "${user_no}", "review_no": review_no },
	                        function(data) {
	                            btn.attr("src", PATH + "/resources/images/img/heart_on.png");
	                            likeCount.text(parseInt(likeCount.text()) + 1 + '개');
	                            
	                            console.log(likeCount);
	                        }
	                    );
	                } else {
	                    // 삭제하는 post ajax
	                    $.post(
	                        "/ottt/reply/deleteLike",
	                        { "user_no": "${user_no}", "review_no": review_no },
	                        function(data) {
	                            btn.attr("src", PATH + "/resources/images/img/heart_off.png");
	                            likeCount.text(parseInt(likeCount.text()) - 1 + '개');
	                            
	                            console.log(likeCount);
	                        }
	                    );
	                }
	            }
	        );
	    });
	});
	</script>
    
    
    

    <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"
    ></script>
  </body>
</html>