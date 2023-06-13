<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<c:set var="loginId" value="${sessionScope.id }"/>
<c:set var="loginout" value="${sessionScope.id == null ? 'logout' : 'login'}" />
<c:set var="loginoutlink" value="${sessionScope.id==null ? '/login' : '/mypage'}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ottt</title>
    <style>
     .popup-photo li{
      display: none;
     }

    </style>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="${path}/resources/css/workDetailPage/workDetailPage.css" >
    <script src="${path }/resources/js/workDetailPage/script/jquery-3.6.1.min.js"></script>
    <script src="${path}/resources/js/workDetailPage/script/workDetailPage.js"></script>
   
  </head>
  <body>
    <div class="wrap">
      <div class="popupback"></div>
      <div class="popup-video">
        <ul>
          <li>
            <iframe width="560" height="315" src="https://www.youtube.com/embed/qFqgmaO15x4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
          </li>
          <li>
            <iframe width="560" height="315" src="https://www.youtube.com/embed/qFqgmaO15x4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
          </li>
          <li>
            <iframe width="560" height="315" src="https://www.youtube.com/embed/qFqgmaO15x4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
          </li>
          <li>
            <iframe width="560" height="315" src="https://www.youtube.com/embed/qFqgmaO15x4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
          </li>
        </ul>
      </div>
      <div class="popupback1"></div>
      <div class="popup-photo">
        <ul>
          <li>
            <img src="${path }/resources/images/서부전선 포토/1.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/2.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/3.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/4.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/5.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/6.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/7.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/8.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/9.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/10.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/11.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/12.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/13.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/14.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/15.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/16.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/17.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/18.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/19.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/20.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/21.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/22.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/23.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/25.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/26.png" alt="포토1">
          </li>
          <li>
            <img src="${path }/resources/images/서부전선 포토/27.png" alt="포토1">
          </li>

        </ul>
      </div>
      
      <%@ include file="../fix/header.jsp" %>

    <section class="sec01">
      <div class="main-left">
          <img src="${path}/resources/images/main01.png" alt="서부전선 이상없다">
          <div class="m-txt">
            서부 전선 이상 없다
          </div>
          <div class="main-txt">
            <h3>작품 내용</h3>
            <p>파울이 전쟁에 참여한다 > 죽는다 > 끝.</p>
          </div>

      </div>
      <div class="main-right">
        <div class="right-picture">
        </div>
      <div class="main-t">
        <div class="t-text">
          <div>예고편</div>
        </div>
        <div class="filmside">
        <img src="${path}/resources/images/img/filmside02.png" alt="필름테두리">
        <div class="fs_video">
          <div class="fs_p1">
            <img src="${path}/resources/images/서부전선 예고1.png" alt="예고1">
            <div class="p-btn">
              <img src="${path}/resources/images/img/button01.png" alt="재생버튼">
            </div>
          </div>
          <div class="fs_p2">
            <img src="${path}/resources/images/서부전선 예고2.png" alt="예고2">
            <div class="p-btn">
              <img src="${path}/resources/images/img/button01.png" alt="재생버튼">
            </div>
          </div>

          <div class="fs_p3">
            <img src="${path}/resources/images/서부전선 예고1.png" alt="예고2">
            <div class="p-btn">
              <img src="${path}/resources/images/img/button01.png" alt="재생버튼">
            </div>
          </div>

          <div class="fs_p4">
            <img src="${path}/resources/images/서부전선 예고2.png" alt="예고2">
            <div class="p-btn">
              <img src="${path}/resources/images/img/button01.png" alt="재생버튼">
            </div>
          </div>
        </div>
      </div>
      <div class="button1">
        <img src="${path }/resources/images/img/버튼.png" alt="버튼">
      </div>
      </div>
      <div class="main-p">
        <div class="t-text1">
          <div>포토</div>
          
        </div>
        <div class="phozip">
          <div class="photo">
              <img src="${path }/resources/images/서부전선 포토/1.png" alt="포토1">
          </div>
          <div class="photo">
              <img src="${path }/resources/images/서부전선 포토/2.png" alt="포토2">
          </div>
          <div class="photo">
              <img src="${path }/resources/images/서부전선 포토/3.png" alt="포토3">
          </div>
          <div class="photo">
              <img src="${path }/resources/images/서부전선 포토/4.png" alt="포토3">
          </div>
          <div class="photo">
              <img src="${path }/resources/images/서부전선 포토/5.png" alt="포토3">
          </div>
          <div class="photo">
              <img src="${path }/resources/images/서부전선 포토/6.png" alt="포토3">
          </div>
          <div class="photo">
              <img src="${path }/resources/images/서부전선 포토/7.png" alt="포토3">
          </div>
          <div class="photo">
              <img src="${path }/resources/images/서부전선 포토/8.png" alt="포토3">
          </div>
          <div class="photo">
              <img src="${path }/resources/images/서부전선 포토/9.png" alt="포토3">
          </div>
          <div class="photo">
              <img src="${path }/resources/images/서부전선 포토/10.png" alt="포토3">
          </div>
          <div class="photo">
              <img src="${path }/resources/images/서부전선 포토/11.png" alt="포토3">
          </div>
          <div class="photo">
              <img src="${path }/resources/images/서부전선 포토/12.png" alt="포토3">
          </div>
          <div class="photo">
              <img src="${path }/resources/images/서부전선 포토/13.png" alt="포토3">
          </div>
          <div class="photo">
              <img src="${path }/resources/images/서부전선 포토/14.png" alt="포토3">
          </div>
          <div class="photo">
	            <img src="${path }/resources/images/서부전선 포토/15.png" alt="포토1">
	        </div>
	        <div class="photo">
	            <img src="${path }/resources/images/서부전선 포토/16.png" alt="포토2">
	        </div>
	        <div class="photo">
	            <img src="${path }/resources/images/서부전선 포토/17.png" alt="포토3">
	        </div>
	        <div class="photo">
	            <img src="${path }/resources/images/서부전선 포토/18.png" alt="포토3">
	        </div>
	        <div class="photo">
	            <img src="${path }/resources/images/서부전선 포토/19.png" alt="포토3">
	        </div>
	        <div class="photo">
	            <img src="${path }/resources/images/서부전선 포토/20.png" alt="포토3">
	        </div>
	        <div class="photo">
	            <img src="${path }/resources/images/서부전선 포토/21.png" alt="포토3">
	        </div>
	        <div class="photo">
	            <img src="${path }/resources/images/서부전선 포토/22.png" alt="포토3">
	        </div>
	        <div class="photo">
	            <img src="${path }/resources/images/서부전선 포토/23.png" alt="포토3">
	        </div>
	        <div class="photo">
	            <img src="${path }/resources/images/서부전선 포토/25.png" alt="포토3">
	        </div>
	        <div class="photo">
	            <img src="${path }/resources/images/서부전선 포토/26.png" alt="포토3">
	        </div>
	        <div class="photo">
	            <img src="${path }/resources/images/서부전선 포토/27.png" alt="포토3">
	        </div>




        </div>
        <div class="button3">
          <img src="${path }/resources/images/img/왼쪽 화살표.png" alt="버튼">
        </div>
        <div class="button2">
          <img src="${path }/resources/images/img/오른쪽화살표.png" alt="버튼">
        </div>
      </div>
      </div>
      <section  class="sec02">
        <div class="bottom">
          <div class="bottom-left">
          <div class="where-box">
            <div class="where-box-top">
              <ul>
                <li class="where-text">어디서보나요?</li>
              </ul>
            </div>
            <div class="net-logo">
              <a href="https://www.netflix.com/watch/81260280?trackId=255824129&tctx=0%2C0%2CNAPA%40%40%7Cfe45a776-cd54-4ea6-a3bc-f0f6ce3da1e0-30173404_titles%2F1%2F%2F%EC%84%9C%EB%B6%80%EC%A0%84%EC%84%A0%2F0%2F0%2CNAPA%40%40%7Cfe45a776-cd54-4ea6-a3bc-f0f6ce3da1e0-30173404_titles%2F1%2F%2F%EC%84%9C%EB%B6%80%EC%A0%84%EC%84%A0%2F0%2F0%2Cunknown%2C%2Cfe45a776-cd54-4ea6-a3bc-f0f6ce3da1e0-30173404%7C1%2CtitlesResults%2C81260280%2CVideo%3A81260280%2CdetailsPagePlayButton">
                <img src="${path }/resources/images/icon/netplix.png" alt="넷플릭스 로고">
              </a>
                </div>
              </div>
            
        </div>
                <div class="left-score">
          
      <div class="left-box">
 
        
        <div class="smr">
          <button id="saw-button">
            <img class="saw" src="${path }/resources/images/img/saw.png" alt="봣어요">
          </button>
          <button id="mark-button">
            <img class="mark" src="${path }/resources/images/img/mark.png" alt="봣어요">
          </button>
          <button id="review-button">
            <img class="review-icon" src="${path }/resources/images/img/review.png" alt="봣어요">
          </button>
         
          
          
		 
          <div class="review-back">1</div>
          <div id="review-popup" class="popup11">
            <form id="review-form">
              <label for="review-text" style="background-color: #202020;">리뷰를 작성해주세요</label>
				<input type="hidden" name="user_no" value="${sessionScope.user_no}" >
				<input type="hidden" name="review_no" value="${reviewDTO.review_no }"  />
              <textarea id="review-text" name="review_content"></textarea>
              <div class="reveiw-star-footer">
                <div class="review-star" >별점을 매겨주세요:
                  <div class="review-star" >별점을 매겨주세요:
                    <div class="starpoint_wrap">
                      <div class="starpoint_box">
                        <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
                        <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
                        <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
                        <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
                        <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
                        <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
                        <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
                        <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
                        <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
                        <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
                        <input type="radio" name="rating" id="starpoint_1" class="star_radio" value="0.5">
                        <input type="radio" name="rating" id="starpoint_2" class="star_radio" value="1">
                        <input type="radio" name="rating" id="starpoint_3" class="star_radio" value="1.5">
                        <input type="radio" name="rating" id="starpoint_4" class="star_radio" value="2">
                        <input type="radio" name="rating" id="starpoint_5" class="star_radio" value="2.5">
                        <input type="radio" name="rating" id="starpoint_6" class="star_radio" value="3">
                        <input type="radio" name="rating" id="starpoint_7" class="star_radio" value="3.5">
                        <input type="radio" name="rating" id="starpoint_8" class="star_radio" value="4">
                        <input type="radio" name="rating" id="starpoint_9" class="star_radio" value="4.5">
                        <input type="radio" name="rating" id="starpoint_10" class="star_radio" value="5">
                        <span class="starpoint_bg"></span>
                      </div>
                    </div>
                  </div>
                </div>
                
                <div class="review-bottom">
                  <div class="checkedblur"><input type="checkbox" id="checkbox-blur">스포일러 포함 여부</input></div>
                <button type="submit" id="submit-review">
                  리뷰 등록
                </button>
                </div>
              </div>
              <button type="button" id="cancel-review">
              
                <ul>
                  <li></li>
                  <li></li>
                </ul>
              </button>
            </form>
 
        
        
          </div>

          
        </div>
        <div class="qwer" style="border: 2px solid #33ff33; margin-top:20px; margin-left: 30px; margin-right: 30px; "></div>
        <h2 style="margin-right: 30px; margin-top: 20px;">이 영화의 평균 별점</h2>
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
      
      <div class="bottom-right">
        
        <div class="right-text">
          <span>Im Westen nichts Neues</span>
        </br>
            <span>2023 ·</span>
            <span>미국 ·</span>
            <span class="a1"><a href="#">전쟁</a></span>
            <span>· 148분 ·</span>
            <span>청불</span>
              <br/>
            <span>감독 : 에드워드 버거</span>
              <br/>
            <span>주연 : 펠릭스 카머러, 알브레히트 슈흐, 아론 힐머, 에딘 하사노비치</span>
              <br/>
            <span>조연 : 데비트 슈트리조, 아드리안 그뤼네발트, 안드레아스 돌러</span>
      <section class="myReview" style="font-size: 15px;">
        	<div class="asdasd" style="border-top: 3px solid #33ff33;">
        <p class="mytextReview" style="font-style: oblique; font-size: 20px;">내가 작성한 리뷰</p>
        </div>
        <div class="tesat">
       
        	<c:if test="${myReview == null || myReview.user_nicknm == null}">
				<p class="noReview">등록 된 리뷰가 없습니다.</p>
			</c:if>
			<c:if test="${myReview != null || myReview.user_nicknm != null}">
        	<input type="hidden" name="user_no" value="${myReview.user_no }">
    		<input type="hidden" name="review_no" value="${myReview.review_no }"  />
        <div class="review-box">      
          <div class="review-box-header">
            <div class="user-icon">
              <img class="aaa" src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
            </div>
            <div class="user-name1">
              <a href="../ottt박소율/mypageshow.html">
                <p class="user_nicknm"> ${myReview.user_nicknm} </p></a>
                <p class="date-insert1" name="review_create_dt"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${myReview.review_create_dt}"/></p>
              
            </div>
            <ul>
              <li class="rating1">
              <div class="bbb">
              	<img src="${path}/resources/images/img/starone.PNG" alt="별점">
                ${myReview.rating}
                </div>
              </li>
              <li>
                <div class="heart1">        
                    <div>
					   <button class="LikeBtn">
                      	 <img id="myImage-${myReview.review_no}" src="${path}/resources/images/img/heart_off.png" width="35" height="80%">
                      </button>					
                    </div>             
                </div>
              </li>
            </ul>
          </div>
          <a href="<c:url value='/detailPage/reply' />?content_no=${myReview.content_no}&review_no=${myReview.review_no}">
          <div class="review-box-body">				
            <p class="review-box-text review_content">${myReview.review_content }</p>
          </div>
        </a>
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
                      9999개
                    </p>
                  </div>
                </li>
              </ul>
            </div>
                           <div class="modify" >
                  <button type="button" name="modBtn" id="modify" class="modOnBtn" onclick="getReviewNo(this)"><img src="${path }/resources/images/img/review.png">수정</button>
               </div>
               <div>                    
   			 <button  class="removeBtn"><img src="${path}/resources/images/img/delete.png">삭제</button>
                  
          </div>
          
        </div>
    	</c:if>	
    	
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
        </div>
        
    
    
    
        </div>
          
        <div>
          </div>
      </section>
      <section class="sec03">
      

 
 
 
    

  </section>
  <section class="sec04">
  
    <div class="bottom-bot">
          <div class="right-box" id="reviews-container">
        <div class="review-count">
          <p>총 ${count }개의 리뷰가 있습니다.</p>           
          <div class="more-see">
            <a href="<c:url value='/detailPage/review' />?content_no=${content_no}">
              <p>더보기</p>
            </a>
  			
          </div>
        </div>
        <c:forEach var="ReviewDTO" items="${list}">
        
        <input type="hidden" name="review_no" value="${ReviewDTO.review_no }"  />
        <div class="review-box">      
          <div class="review-box-header">
            <div class="user-icon">
              <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
            </div>
            <div class="user-name">
              <a href="../ottt박소율/mypageshow.html">
                <p class="user_nicknm"> ${ReviewDTO.user_nicknm} </p></a>
                <p class="date-insert" name="review_create_dt"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${ReviewDTO.review_create_dt}"/></p>
              
            </div>
            <ul>
              <li class="rating">
              	<img src="${path}/resources/images/img/starone.PNG" alt="별점">
                ${ReviewDTO.rating}
              </li>
              <li>
                <div class="heart">        
                    <div>
					  <button  class="LikeBtn">
                      	<img id="myImage" src="${path}/resources/images/img/heart_off.png" width="35" height="80%">
                      </button>					
                    </div>             
                </div>
              </li>
            </ul>
          </div>
          <a href="<c:url value='/detailPage/reply' />?content_no=${ReviewDTO.content_no}&review_no=${ReviewDTO.review_no}">
          <div class="review-box-body">				
            <p class="review-box-text review_content">${ReviewDTO.review_content }</p>
          </div>
        </a>
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
                      9999개
                    </p>
                  </div>
                </li>
              </ul>
            </div>

                  <div class="report">
                  <button><img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                      <button class="report-text" >신고</button>
                  </div>
          </div>
          
        </div>
      
        </c:forEach>
  </div>
            <div class="b-text">
              <div>동일한 장르의 작품</div>
              <div><a href="#">더보기</a></div>
            </div>
            <div class="same-movie">
              <button class="left-button"><img src="${path }/resources/images/img/왼쪽 화살표.png" /></button>
              <div class="cont01">
                  <div class="posterzip">
                      
                      <a href="#"><img src="${path }/resources/images/서부전선 동일장르/고지전.jpg" class="poster"/></a>
                      <a href="#"><img src="${path }/resources/images/서부전선 동일장르/덩케르크.jpg" class="poster"/></a>
                      <a href="#"><img src="${path }/resources/images/서부전선 동일장르/인천상륙작전.jpg" class="poster"/></a>
                      <a href="#"><img src="${path }/resources/images/서부전선 동일장르/태극기.jpg" class="poster"/></a>
                      <a href="#"><img src="${path }/resources/images/서부전선 동일장르/헥소고지.jpg" class="poster"/></a>
                      <a href="#"><img src="${path }/resources/images/서부전선 동일장르/고지전.jpg" class="poster"/></a>
                      <a href="#"><img src="${path }/resources/images/서부전선 동일장르/덩케르크.jpg" class="poster"/></a>
                      <a href="#"><img src="${path }/resources/images/서부전선 동일장르/인천상륙작전.jpg" class="poster"/></a>
                      <a href="#"><img src="${path }/resources/images/서부전선 동일장르/태극기.jpg" class="poster"/></a>
                      <a href="#"><img src="${path }/resources/images/서부전선 동일장르/헥소고지.jpg" class="poster"/></a>
                      <a href="#"><img src="${path }/resources/images/서부전선 동일장르/고지전.jpg" class="poster"/></a>
                      <a href="#"><img src="${path }/resources/images/서부전선 동일장르/덩케르크.jpg" class="poster"/></a>
                      <a href="#"><img src="${path }/resources/images/서부전선 동일장르/인천상륙작전.jpg" class="poster"/></a>
                      <a href="#"><img src="${path }/resources/images/서부전선 동일장르/태극기.jpg" class="poster"/></a>
                  </div>
                  
              </div>
              <button class="right-button"><img src="${path }/resources/images/img/오른쪽화살표.png"/></button>
              
          </div>
          </div>
          </section>
      </div>

  </div>
  
  

    <footer>

    </footer>    
        
    </div>
    
<script type="text/javascript">
	
	let msg = "${msg}"
		if(msg=="DEL_OK") alert("성공적으로 삭제 되었습니다.")
		if(msg=="DEL_ERR") alert("이미 삭제 되었거나 리뷰가 존재하지 않습니다.")

		let review_no = $("input[name=review_no]").val()

	

	$(document).ready(function() {	
		$('#submit-review').on("click", function(){
			let form = $("#review-form")
			form.attr("action", "<c:url value='/detailPage/review/write'/>")
			form.attr("method", "post")
			
			if(formCheck()){
				form.submit()
			}
			alert("리뷰등록됬다잉.")
		})
		
		let formCheck = function() {
			let form = document.getElementById("review-form")
			if(form.user_no.value==""){
				alert("로그인 해라 좋은 말로 할때")
				form.content.focus()
				return false
			}			
			if(form.review_content.value=="") {
				alert("내용이 비었다 후딱 채워라잉")
				form.content.focus()
				return false
			}
			return true
		}
		
		
		
		$(".removeBtn").on("click", function() {
            if (!confirm("리뷰를 삭제하시겠습니까?"))
            	return;
            
            let form = $("button")
            form.attr("action", "<c:url value='/remove' />")
            form.attr("method", "post")
            form.submit()   
         })
         
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
            form.content.focus()
            return false
         }         
         if(form.review_content.value=="") {
            alert("내용을 입력해 주세요.")
            form.content.focus()
            return false
         }
         if(form.rating.value==""){
        	 alert("별점을 입력해 주세요.")
        	 form.content.focus()
        	 return false
         }
         return true
      }
	})
	
	
	
	
	</script>
	


	<script type="text/javascript">
	var likeval = ${like};
	
	let review_no = ${Detail.review_no};
	let user_no = '${login.user_id}';
	if(likeval > 0){
		console.log(likeval + "좋아요 누름");
		$('.LikeBtn img').attr('src', '${path}/resources/images/img/likeon.png');
		$('.LikeBtn').click(function() {
			$.ajax({
				type :'post',
				url : '<c:url value ="/detailPage/likeDown"/>',
				contentType: 'application/json',
				data : JSON.stringify(
						{
							"review_no" : review_no,
							"user_no" : user_no
						}		
					),
				success : function(data) {
					alert('취소 성공');
				}
			})
		})

	}else{
		console.log(likeval + "좋아요 안누름")
		console.log(user_no);
		$('.LikeBtn').click(function() {
			$.ajax({
				type :'post',
				url : '<c:url value ="/detailPage/likeUp"/>',
				contentType: 'application/json',
				data : JSON.stringify(
						{
							"review_no" : review_no,
							"user_no" : user_no
						}		
					),
				success : function(data) {
					alert('성공염');
				}
			})
		})
	</script>
	
    
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>