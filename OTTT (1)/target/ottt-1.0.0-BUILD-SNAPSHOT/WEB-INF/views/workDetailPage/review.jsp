<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OTTT</title>     
    <script src="${path}/resources/js/workDetailPage/script/jquery-3.6.1.min.js"></script>
    <script src="${path}/resources/js/workDetailPage/script/review.js"></script>
    <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
    crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/workDetailPage/review.css" >  
  </head>
  <body style="background-color: #202020; color: #fff;">
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
    </div>
    <section class="sec01">      
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

    <section class="sec02">
      <div class="review">
        <div class="left-score">
          <h2>이 영화의 평균 별점</h2>
              <div class="left-box">
        <img class="star" src="${path}/resources/images/img/star.png" alt="별점">
        <h3>4.9/5</h3>
        <div class="smr">
          <button id="saw-button"><img class="saw" src="${path}/resources/images/img/saw.png" alt="봣어요"></button>
          <button id="mark-button"><img class="mark" src="${path}/resources/images/img/mark.png" alt="봣어요"></button>
          <button id="review-button"><img class="review-icon" src="${path}/resources/images/img/review.png" alt="봣어요"></button>
          <div class="review-back">1</div>
          <div id="review-popup" class="popup11">
            <form id="review-form">
              <label for="review-text" style="background-color: #202020;">리뷰를 작성해주세요</label>
              
              <textarea id="review-text" name="review-text"></textarea>
              <div class="reveiw-star-footer">
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
          <div id="review-result">

            
          </div> 
        </div>
      </div>
      </div>
        <div class="advertisement">
          <p>광고</p>
        </div>
        <p class="review-count">
          총 7개의 리뷰가 있습니다.
        </p>
        <br>
        <div class="review-box">
          <div class="review-box-header">
            <div class="user-icon">
              <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
            </div>
            <div class="user-name">
              <a href="../ottt박소율/mypageshow.html">
                유저 닉네임
              </a>
            </div>
            <ul>
              <li>
                <img class="star1" src="${path}/resources/images/img/star.png" alt="별점">
              </li>
              <li>
                <div class="heart">        
                    <div>
                      <div class="heart_img"></div>
                    </div>             
                </div>
              </li>
            </ul>
          </div>
          <a href="<c:url value='/detailPage/reply' />"><div class="review-box-body">				
            <p class="review-box-text">"내용 들어갈 자리"</p>
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
                      <button>신고</button>
                  </div>
          </div>
        </div>
          <br>
            <div class="review-box">
              <div class="review-box-header">
                <div class="user-icon">
                  <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
                </div>
                <div class="user-name">
                  <a href="../ottt박소율/mypageshow.html">
                    유저 닉네임
                  </a>
                </div>
                <ul>
                  <li>
                    <img class="star1" src="${path}/resources/images/img/star.png" alt="별점">
                    <!-- <div class="point">
                      <img src="./images/icon/별점 3점 .PNG" alt="3점">
                      <p>3/5</p>
                    </div> -->
                  </li>
                  <li>
                    
                    <div class="heart">        
                        <div>
                          <div class="heart_img"></div>
                        </div>             
                    </div>
                  </li>
                </ul>
              </div>
              <a href="<c:url value='/detailPage/reply' />">
              <div class="review-box-body">
                <p class="review-box-text">"내용 들어갈 자리"</p>
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
                        <button>
                          <img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                        <button>신고</button>
                      </div>
              </div> 
          </div>         
          <br>
          <div class="review-box">
            <div class="review-box-header">
              <div class="user-icon">
                <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
              </div>
              <div class="user-name">
                <a href="../ottt박소율/mypageshow.html">
                  유저 닉네임
                </a>
              </div>
              <ul>
                  <img class="star1" src="${path}/resources/images/img/star.png" alt="별점">
                  <!-- <div class="point">
                    <img src="./images/icon/별점 5점 .PNG" alt="3점">
                    <p>5/5</p>
                  </div> -->
                <li>
                  <div class="heart">        
                      <div>
                        <div class="heart_img"></div>
                      </div>             
                  </div>
                </li>
              </ul>
            </div>
            <a href="/ottt/reply">
            <div class="review-box-body">
              <p class="review-box-text">"내용 들어갈 자리"</p>
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
                    <button>
                        <img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                      <button>신고</button>
                    </div>
            </div>
          </div>
          <br>
          <div class="review-box">
            <div class="review-box-header">
              <div class="user-icon">
                <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
              </div>
              <div class="user-name">
                <a href="#">
                  유저 닉네임
                </a>
              </div>
              <ul>
                <img class="star1" src="${path}/resources/images/img/star.png" alt="별점">
                  <!-- <div class="point">
                    <img src="./images/icon/별점 2점 .PNG" alt="3점">
                    <p>2/5</p>
                  </div> -->

                <li>
                  <div class="heart">        
                      <div>
                        <div class="heart_img"></div>
                      </div>             
                  </div>
                </li>
              </ul>
            </div>
            <a href="/ottt/reply">
            <div class="review-box-body">
              <p class="review-box-text">"내용 들어갈 자리"</p>
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
                    <button>
                        <img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                      <button>신고</button>
                    </div>
            </div>
          </div>
          <br>
          <div class="review-box">
            <div class="review-box-header">
              <div class="user-icon">
                <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
              </div>
              <div class="user-name">
                <a href="#">
                  유저 닉네임
                </a>
              </div>
              <ul>
                  <img class="star1" src="${path}/resources/images/img/star.png" alt="별점">
                  <!-- <div class="point">
                    <img src="./images/icon/별점 1점 .PNG" alt="3점">
                    <p>1/5</p>
                  </div> -->
                <li>
                  <div class="heart">        
                      <div>
                        <div class="heart_img"></div>
                      </div>             
                  </div>
                </li>
              </ul>
            </div>
            <a href="/ottt/reply">
            <div class="review-box-body">
              <p class="review-box-text">"내용 들어갈 자리"</p>
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
                    <button>
                        <img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                      <button>신고</button>

                    </div>
            </div>
          </div>
          <br>
          <div class="review-box">
            <div class="review-box-header">
              <div class="user-icon">
                <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
              </div>
              <div class="user-name">
                <a href="#">
                  유저 닉네임
                </a>
              </div>
              <ul>
                  <img class="star1" src="${path}/resources/images/img/star.png" alt="별점">
                  <!-- <div class="point">
                    <img src="./images/icon/별점 4점 .PNG" alt="3점">
                    <p>4/5</p>
                  </div> -->
                <li>
                  <div class="heart">        
                      <div>
                        <div class="heart_img"></div>
                      </div>             
                  </div>
                </li>
              </ul>
            </div>
            <a href="/ottt/reply">
            <div class="review-box-body">
              <p class="review-box-text">"내용 들어갈 자리"</p>
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
                    <button>
                        <img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                      <button>신고</button>
                    </div>
            </div>
          </div>
          <br>
          <div class="review-box">
            <div class="review-box-header">
              <div class="user-icon">
                <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
              </div>
              <div class="user-name">
                <a href="#">
                  유저 닉네임
                </a>
              </div>
              <ul>
                <img class="star1" src="${path}/resources/images/img/star.png" alt="별점">
                  <!-- <div class="point">
                    <img src="./images/icon/별점 5점 .PNG" alt="3점">
                    <p>5/5</p>
                  </div> -->
                <li>
                  <div class="heart">        
                      <div>
                        <div class="heart_img"></div>
                      </div>             
                  </div>
                </li>
              </ul>
            </div>
            <a href="/ottt/reply">
            <div class="review-box-body">
              <p class="review-box-text">"내용 들어갈 자리"</p>
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
                    <button>
                        <img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                      <button>신고</button>

                    </div>
            </div>
          </div>
      </div>
    </section>

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