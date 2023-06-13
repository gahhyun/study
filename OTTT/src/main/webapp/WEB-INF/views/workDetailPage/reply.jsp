<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginId" value="${sessionScope.id }"/>
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
  </head>
  <body style="background-color: #202020; color: #fff;">
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
          <!-- <a href="#">
            <img class="netfilx" src="./images/icon/넷플릭스.png" alt="넷플릭스아이콘">
          </a> -->
          <a href="https://www.netflix.com/watch/81260280?trackId=255824129&tctx=0%2C0%2CNAPA%40%40%7Cfe45a776-cd54-4ea6-a3bc-f0f6ce3da1e0-30173404_titles%2F1%2F%2F%EC%84%9C%EB%B6%80%EC%A0%84%EC%84%A0%2F0%2F0%2CNAPA%40%40%7Cfe45a776-cd54-4ea6-a3bc-f0f6ce3da1e0-30173404_titles%2F1%2F%2F%EC%84%9C%EB%B6%80%EC%A0%84%EC%84%A0%2F0%2F0%2Cunknown%2C%2Cfe45a776-cd54-4ea6-a3bc-f0f6ce3da1e0-30173404%7C1%2CtitlesResults%2C81260280%2CVideo%3A81260280%2CdetailsPagePlayButton">
            <img class="watcha" src="${path}/resources/images/icon/netplix.png" alt="넷플릭스아이콘">
          </a>
        </div>
      </div>      
      
      <div class="main-img">
        <img src="${path}/resources/images/서부 전선 이상 없다.png" alt="서부 전선 이상 없다 이미지">
      </div>

      <div class="info">
        <ul>
          <li class="info-title">
            <h1>서부 전선 이상 없다.</h1>
            <h4>Im Westen nichts Neues</h4>
          </li>
          <br>
          <li class="info-detail">
            <span>2023·&nbsp;</span>
            <span>미국·&nbsp;</span>
            <span class="a1"><a href="#">전쟁·&nbsp;</a></span>
            <span>148분·&nbsp;</span>
            <span>청불</span>
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
          <button id="reply-button"><img class="review-icon" src="${path}/resources/images/img/review.png" alt="봣어요"></button>
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
              <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
            </div>
            <div class="user-name">
              <a href="../ottt박소율/mypageshow.html">
                <p class="user_nicknm"> ${Review.user_nicknm} </p>
              </a>
              <p class="date-insert" name="review_create_dt"><fmt:formatDate pattern="yy-MM-dd hh:mm" value="${Review.review_create_dt}"/></p>
             <input type="hidden" name="review_no" value="${Review.review_no }"> 
            </div>
            <ul>
              <li class="rating">
                 <img src="${path}/resources/images/img/starone.PNG" alt="별점">
                ${Review.rating}
              </li>
              <li>
                <div class="heart">        
                    <div>
                 <button onclick="changeImage()">
                         <img id="myImage" src="${path}/resources/images/img/likeoff.png" width="35" height="80%">
                      </button>               
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
                    <p>
                      9999개
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
                  <button type="button" name="modBtn" id="modify" class="modOnBtn" onclick="getReviewNo(this)"><img src="${path }/resources/images/img/review.png">수정</button>
               </div>
            
   			 <button class="removeBtn"><img src="${path}/resources/images/img/delete.png">삭제</button>
   			 </c:if>
          </div>
        </div>
        
        <form id="mod-form" class="mod-form">   
          <div class="popup12 mod-popup">     
              <label for="mod-text" style="background-color: #202020;">리뷰를 작성해주세요</label>
              <input type="hidden" name="user_no" value="${sessionScope.user_no}" > 
              <input type="hidden" name="review_no" class="review_no" value="${myReview.review_no}">            
              <textarea id="review-text" name="review_content" >${ReviewDTO.review_content}</textarea>
              <div class="reveiw-star-footer">
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
                  <div class="checkedblur"><input type="checkbox" id="checkbox-blur"/>스포일러 포함 여부</div>
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
      <div class="review">

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
              <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
            </div>
            <div class="user-name">
              <a href="../ottt박소율/mypageshow.html">
                <p class="user_nicknm"> ${CommentDTO.user_nicknm} </p>
              </a>
              <p class="reply-date-insert" name="cmt_dt"><fmt:formatDate pattern="yy-MM-dd hh:mm" value="${CommentDTO.cmt_dt}"/></p>
             <input type="hidden" name="review_no" value="${CommentDTO.review_no }"> 
             <input type="text" name="cmt_no" value ="${CommentDTO.cmt_no }">
            </div>           
                <div class="heart">        
                    <div>
                 <button onclick="changeImage()">
                         <img id="myImage" src="${path}/resources/images/img/likeoff.png" width="35" height="80%">
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
                  <button type="button" name="modBtn" id="replymodify" class="modOnBtn" onclick="getReviewNo(this)"><img src="${path }/resources/images/img/review.png">수정</button>
               </div>
   			 <button  class="replyremoveBtn"><img src="${path}/resources/images/img/delete.png">삭제</button>
   			
   			 </c:if>
          </div>
        </div>
       
        
        </c:forEach>
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
         alert("댓글이 정상적으로 등록되었습니다.")
      })
      
          $(".replyremoveBtn").on("click", function() {
          if (!confirm("리뷰를 삭제하시겠습니까?"))
          	return;
          
          let form = $("form")
          form.attr("action", "<c:url value='/detailPage/reply/remove' />")
          form.attr("method", "post")
          form.submit()   
       })
       
       
      
      let formCheck = function() {
         let form = document.getElementById("reply-form")
         if(form.user_no.value==""){
            alert("로그인 후 댓글을 등록해주세요.")
            document.getElementById("reply-text").focus();
            return false
         }         
         if(form.cmt_content.value=="") {
            alert("내용을 입력해 주세요.")
            console.log("reply-text 포커스 설정 직전"); 
            document.getElementById("reply-text").focus();
            console.log("reply-text 포커스 설정 후");
            return false
         }
         return true
      }

  
      
      
      
      
      
      $(".submitMod-review").on("click", function(){
         let form = $("#mod-form")
         
         form.attr("action", "<c:url value='/detailPage/review/modify'/>")
         form.attr("method", "post")
           if(modformCheck())  
            form.submit()
            
            alert("수정이 정상적으로 완료되었습니다.")
      })
      
      let modformCheck = function() {
         let form = document.getElementById("mod-form")
         if(form.user_no.value==""){
            alert("로그인 후 리뷰를 등록해주세요.")
            /* form.content.focus() */
            return false
         }         
         if(form.review_content.value=="") {
            alert("내용을 입력해 주세요.")
            /* form.content.focus() */
            return false
         }
         if(form.rating.value==""){
        	 alert("별점을 입력해 주세요.")
        	 /* form.content.focus() */
        	 return false
         }
         return true
      }
      
      
   })
   </script>
   
   <script>
function getReviewNo(element) {
  var reviewNo = element.parentNode.parentNode.querySelector('.review_no').val();
  console.log(reviewNo); // reviewno 값을 출력하거나 원하는 처리를 수행합니다.
}
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
           $('.review-back').fadeIn();
           $('.popup12').fadeIn();
           
           
         });
         
         submitModButton.on('click', function() {
           modPopup.css('display', 'none');
           $('.review-back').fadeOut();
         });

         modCancelButton.on('click', function() {
           modPopup.css('display', 'none');
           $('.review-back').fadeOut();
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