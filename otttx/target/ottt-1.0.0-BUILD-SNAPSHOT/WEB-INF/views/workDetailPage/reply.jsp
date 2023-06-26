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
    <script src="${path}/resources/js/workDetailPage/script/reply.js"></script>
    <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
    crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/workDetailPage/reply.css" > 
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
          <a href="#">
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
            <span>2023·</span>
            <span>미국·</span>
            <span class="a1"><a href="#">전쟁·</a></span>
            <span>148분·</span>
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
        <div class="advertisement">
          <p>광고</p>
        </div>
        <div class="user-info">
          <div class="info-icon">
            <img src="${path}/resources/images/img/profile.png" alt="유저아이콘">
          </div>
          <div class="user-name">
            <a href="../mypage황정현/mypage.html">
              <p>뚜 벅 님의 리뷰</p>
            </a>
          </div>
        </div>
        <br>
        <div class="review-box">
          <div class="review-box-header">
            <div class="user-icon">
              <img src="${path}/resources/images/img/profile.png" alt="유저 이미지파일">
            </div>
            <div class="user-name">
              <a href="../mypage황정현/mypage.html">
                뚜 벅
              </a>
            </div>
            <ul>
              <li>

              </li>
              <li>
                <div class="heart">        
                    <div>
                      <div class="heart_img"></div>
                    </div>             
                </div>
              </li>
              <li>
              </li>
            </ul>
          </div>
          <div class="review-box-body">
            <p class="review-box-text">"내용 들어갈 자리"</p>
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
                      9999개
                    </p>
                  </div>
                </li>
              </ul>
            </div>
            <div>

                  <div class="report">
                    <button><img src="${path}/resources/images/img/신고하기.png" alt="신고">
                      </button>
                      <button>신고</button>
                  </div>
                  <div class="add-comment">
                    <div class="position1">
                    <button id="review-button"><img src="${path}/resources/images/img/댓글.png" alt="봣어요">답글달기</button>
                  </div>
                  <div class="review-back">1</div>
                  <div id="review-popup" class="popup11">
                    <form id="review-form">
                      <label for="review-text" style="background-color: #202020;"><div>댓글을 작성해주세요</div></label>
        
                      
                      
                      <textarea id="review-text" name="review-text"></textarea>
                      <div class="reveiw-star-footer">

                        
                        <div class="review-bottom">
                        <button type="submit" id="submit-review">
                          댓글 등록
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
          </div>
        </div>
      </div>
    </section>

    <section class="sec03">
      <div class="reply-count">
        <p>
          7개의 Comment.
        </p>
      </div>
      <br>
      <div class="reply-box">
        <div class="reply-box-header">
          <div class="user-icon">
            <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
          </div>
          <div class="user-name">
            <a href="../ottt박소율/mypageshow.html">
              유저 닉네임
            </a>
          </div>
        </div>
        <div class="reply-box-body">
          <p class="reply-box-text">"내용 들어갈 자리"</p>
        </div>
        <div class="reply-box-footer">
          <div>
            <ul>
              <li>
                <div class="like">
                  <img src="${path}/resources/images/img/좋아요.png" alt="좋아요아이콘">
                </div>
                <div class="like-count">
                  <button>
                    9999개
                  </button>
                </div>
              </li>
            </ul>
          </div>
          <div>
            <ul>
              <li>
                <div class="report">
                  
                <button><img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                    <button>신고</button>
                </div>
              </li>
              <li>
                <div class="add-comment">
                  <li>
                    <div class="like-b">
                      <button>
                      <img src="${path}/resources/images/img/좋아요.png" alt="좋아요아이콘">
                    </button>
                    </div>
                    <div class="like-c">
                      <button>좋아요<button>
                    </div>
                  </li>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
        <div class="reply-box">
          <div class="reply-box-header">
            <div class="user-icon">
              <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
            </div>
            <div class="user-name">
              <a href="../ottt박소율/mypageshow.html">
                유저 닉네임
              </a>
            </div>
          </div>
          <div class="reply-box-body">
            <p class="reply-box-text">"내용 들어갈 자리"</p>
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
            <div>
              <ul>
                <li>
                  <div class="report">
                    
                  <button><img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                    <button>신고</button>
                  </div>
                </li>
                <li>
                  <div class="add-comment">
                    <li>
                      <div class="like-b">
                        <img src="${path}/resources/images/img/좋아요.png" alt="좋아요아이콘">
                      </div>
                      <div class="like-c">
                      <button>좋아요</button>
                      </div>
                    </li>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="reply-box">
          <div class="reply-box-header">
            <div class="user-icon">
              <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
            </div>
            <div class="user-name">
              <a href="../ottt박소율/mypageshow.html">
                유저 닉네임
              </a>
            </div>
          </div>
          <div class="reply-box-body">
            <p class="reply-box-text">"내용 들어갈 자리"</p>
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
            <div>
              <ul>
                <li>
                  <div class="report">
                  <button><img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                    <button>신고</button>
                  </div>
                </li>
                <li>
                  <div class="add-comment">
                    <li>
                      <div class="like-b">
                        <img src="${path}/resources/images/img/좋아요.png" alt="좋아요아이콘">
                      </div>
                      <div class="like-c">
                      <button>좋아요</button>
                      </div>
                    </li>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="reply-box">
          <div class="reply-box-header">
            <div class="user-icon">
              <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
            </div>
            <div class="user-name">
              <a href="../ottt박소율/mypageshow.html">
                유저 닉네임
              </a>
            </div>
          </div>
          <div class="reply-box-body">
            <p class="reply-box-text">"내용 들어갈 자리"</p>
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
            <div>
              <ul>
                <li>
                  <div class="report">
                  <button><img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                    <button>신고</button>
                  </div>
                </li>
                <li>
                  <div class="add-comment">
                    <li>
                      <div class="like-b">
                        <img src="${path}/resources/images/img/좋아요.png" alt="좋아요아이콘">
                      </div>
                      <div class="like-c">
                      <button>좋아요</button>
                      </div>
                    </li>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="reply-box">
          <div class="reply-box-header">
            <div class="user-icon">
              <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
            </div>
            <div class="user-name">
              <a href="../ottt박소율/mypageshow.html">
                유저 닉네임
              </a>
            </div>
          </div>
          <div class="reply-box-body">
            <p class="reply-box-text">"내용 들어갈 자리"</p>
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
            <div>
              <ul>
                <li>
                  <div class="report">
                  <button><img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                    <button>신고</button>
                  </div>
                </li>
                <li>
                  <div class="add-comment">
                    <li>
                      <div class="like-b">
                        <img src="${path}/resources/images/img/좋아요.png" alt="좋아요아이콘">
                      </div>
                      <div class="like-c">
                      <button>좋아요</button>
                      </div>
                    </li>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="reply-box">
          <div class="reply-box-header">
            <div class="user-icon">
              <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
            </div>
            <div class="user-name">
              <a href="../ottt박소율/mypageshow.html">
                유저 닉네임
              </a>
            </div>
          </div>
          <div class="reply-box-body">
            <p class="reply-box-text">"내용 들어갈 자리"</p>
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
            <div>
              <ul>
                <li>
                  <div class="report">
                  <button>
                      <img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                    <button>신고</button>
                  </div>
                </li>
                <li>
                  <div class="add-comment">
                    <li>
                      <div class="like-b">
                        <img src="${path}/resources/images/img/좋아요.png" alt="좋아요아이콘">
                      </div>
                      <div class="like-c">
                      <button>좋아요</button>
                      </div>
                    </li>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="reply-box">
          <div class="reply-box-header">
            <div class="user-icon">
              <img src="${path}/resources/images/icon/user.png" alt="유저 이미지파일">
            </div>
            <div class="user-name">
              <a href="../ottt박소율/mypageshow.html">
                유저 닉네임
              </a>
            </div>
          </div>
          <div class="reply-box-body">
            <p class="reply-box-text">"내용 들어갈 자리"</p>
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
            <div>
              <ul>
                <li>
                  <div class="report">
                    <button><img src="${path}/resources/images/img/신고하기.png" alt="신고"></button>
                    <button>신고</button>
                  </div>
                </li>
                <li>
                  <div class="add-comment">
                    <li>
                      <div class="like-b">
                        <img src="${path}/resources/images/img/좋아요.png" alt="좋아요아이콘">
                      </div>
                      <div class="like-c">
                      </button>좋아요</button>
                      </div>
                    </li>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>

    </section>

    <footer>

    </footer>    
        
    </div>
  </body>
</html>