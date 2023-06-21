<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
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
    <link rel="stylesheet" href="./css/main.css" >
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
              <a href="<c:url value="/community" />">게시판</a>
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
        </div>
        </div>
          
        <div>
          </div>
      </section>
      <section class="sec03">
        <div class="left-score">
          <h2>이 영화의 평균 별점</h2>
      <div class="left-box">
        <img class="star" src="${path }/resources/images/img/star.png" alt="별점">
        <h3>4.9/5</h3>
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

              <textarea id="review-text" name="review-text"></textarea>
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
                        <input type="radio" name="starpoint" id="starpoint_1" class="star_radio">
                        <input type="radio" name="starpoint" id="starpoint_2" class="star_radio">
                        <input type="radio" name="starpoint" id="starpoint_3" class="star_radio">
                        <input type="radio" name="starpoint" id="starpoint_4" class="star_radio">
                        <input type="radio" name="starpoint" id="starpoint_5" class="star_radio">
                        <input type="radio" name="starpoint" id="starpoint_6" class="star_radio">
                        <input type="radio" name="starpoint" id="starpoint_7" class="star_radio">
                        <input type="radio" name="starpoint" id="starpoint_8" class="star_radio">
                        <input type="radio" name="starpoint" id="starpoint_9" class="star_radio">
                        <input type="radio" name="starpoint" id="starpoint_10" class="star_radio">
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
         <!-- <div id="review-result">

            
          </div> -->
          
        </div>
      </div>
      
    </div>
      <div class="right-box" id="reviews-container">
        <div class="review-count">
          <p>총 70개의 리뷰가 있습니다.</p>           
          <div class="more-see">
            <a href="<c:url value='/detailPage/review' />">
              <p>더보기</p>
            </a>
  
          </div>
        </div>
        
        <div class="review-box">
          <div class="review-blur">
            <span class="red">스포일러</span>
            가 포함된 리뷰입니다. 보시려면
            <span class="red">여기</span>
            를 클릭해주세요
          </div>
          <div class="review-box-header">
            <div class="user-icon">
              <img src="${path }/resources/images/icon/user.png" alt="유저 이미지파일">
            </div>
            <div class="user-name">
              <a href="../ottt박소율/mypageshow.html">
                유저 닉네임
              </a>
            </div>
            <img class="star1" src="${path }/resources/images/img/star.png" alt="별점">
                <div class="heart">        
                    <div>
                      <div class="heart_img"></div>
                    </div>             
                </div>
          </div>
          <a href="<c:url value='/detailPage/reply' />">
          <div class="review-box-body">
            <p class="review-box-text">"내용 들어갈 자리"</p>
          </div>
        </a>
          <div class="review-box-footer">
            <div class="f-left">
                  <div class="like">
                    <img src="${path }/resources/images/img/좋아요.png" alt="좋아요아이콘">
                  </div>
                  <div class="like-count">
                    <p>
                      9999개
                    </p>
                  </div>
                  <div class="footer-comment">
                    <img src="${path }/resources/images/img/comment.png" alt="댓글아이콘">
                  </div>
                  <div class="comment-count">
                    <p>
                      9999개
                    </p>
                  </div>
            </div>
            <div class="f-right">
                  <div class="report">
                  <button><img src="${path }/resources/images/img/신고하기.png" alt="신고"></button>
                    <button>신고</button>
                  </div>
            </div>
          </div>
        </div>
      


      <div class="review-box">
        <div class="review-blur">
          <span class="red">스포일러</span>
          가 포함된 리뷰입니다. 보시려면
          <span class="red">여기</span>
          를 클릭해주세요
        </div>
        <div class="review-box-header">
          <div class="user-icon">
            <img src="${path }/resources/images/icon/user.png" alt="유저 이미지파일">
          </div>
          <div class="user-name">
            <a href="../ottt박소율/mypageshow.html">
              유저 닉네임
            </a>
          </div>
          <img class="star1" src="${path }/resources/images/img/star.png" alt="별점">
              <div class="heart">        
                  <div>
                    <div class="heart_img"></div>
                  </div>             
              </div>
        </div>
        <a href="<c:url value='/detailPage/reply' />">
        <div class="review-box-body">
          <p class="review-box-text">"내용 들어갈 자리"</p>
        </div>
      </a>
        <div class="review-box-footer">
          <div class="f-left">


                <div class="like">
                  <img src="${path }/resources/images/img/좋아요.png" alt="좋아요아이콘">
                </div>
                <div class="like-count">
                  <p>
                    9999개
                  </p>
                </div>
                <div class="footer-comment">
                  <img src="${path }/resources/images/img/comment.png" alt="댓글아이콘">
                </div>
                <div class="comment-count">
                  <p>
                    9999개
                  </p>
                </div>
          </div>
          <div class="f-right">
                <div class="report">
                  <button><img src="${path }/resources/images/img/신고하기.png" alt="신고"></button>
                <button>신고</button>
                </div>

          </div>
        </div>
      </div>
   


    <div class="review-box">
      <div class="review-box-header">
        <div class="user-icon">
          <img src="${path }/resources/images/icon/user.png" alt="유저 이미지파일">
        </div>
        <div class="user-name">
          <a href="../ottt박소율/mypageshow.html">
            유저 닉네임
          </a>
        </div>
        <img class="star1" src="${path }/resources/images/img/star.png" alt="별점">
            <div class="heart">        
                <div>
                  <div class="heart_img"></div>
                </div>             
            </div>

      </div>
      <a href="<c:url value='/detailPage/reply' />">
      <div class="review-box-body">
        <p class="review-box-text">"내용 들어갈 자리"</p>
      </div>
    </a>
      <div class="review-box-footer">
        <div class="f-left">


              <div class="like">
                <img src="${path }/resources/images/img/좋아요.png" alt="좋아요아이콘">
              </div>
              <div class="like-count">
                <p>
                  9999개
                </p>
              </div>


              <div class="footer-comment">
                <img src="${path }/resources/images/img/comment.png" alt="댓글아이콘">
              </div>
              <div class="comment-count">
                <p>
                  9999개
                </p>
              </div>
        </div>
        <div class="f-right">
              <div class="report">
              <button><img src="${path }/resources/images/img/신고하기.png" alt="신고"></button>
            <button>신고</button>
                </a>
              </div>
        </div>
      </div>
    </div>
  </div>
  </section>
  <section class="sec04">
    <div class="bottom-bot">
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
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>