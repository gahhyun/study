<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>찜목록</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${path}/resources/css/mypage/wishlist.css" >

  </head>
  <body>
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
              </a>
            </li>
            <li>
              <a href="<c:url value='/mypage' />">
              </a>
            </li>
          </ul>
        </div>
      </header>

      <section class="sec01">
        <nav class="mnb">
          <ul>
			  <li><a href="<c:url value="/mypage/myreview" />" class="mreview">기록</a></li>
	          <li><a href="<c:url value="/mypage/wishlist" />" style="color: #33ff33">찜목록</a></li>
	          <li><a href="<c:url value="/mypage/watched" />">봤어요</a></li>
	          <li><a href="<c:url value="/mypage/alarm" />">알림함</a></li>
	          <li><a href="<c:url value="/mypage/message" />">쪽지함</a>
          </ul>
        </nav>
      </section>

      <section class="sec02">
        <div class="Lcontent">
          <div class="Lmenu">
            <ul>
                <li>
                  <img class="mimg" src="${path}/resources/images/img/movie.png" alt="영화">
                  <a href="./watched-1movie.html">영화</a>
                </li>
                <li>
                  <img class="mimg" src="${path}/resources/images/img/drama.png" alt="드라마">
                  <a href="./watched-1drama.html">드라마</a>
                </li>
                <li>
                  <img class="mimg" src="${path}/resources/images/img/vrt.png" alt="예능">
                  <a href="./watched-1vrt.html">예능</a>
                </li>
                <li>
                  <img class="mimg" src="${path}/resources/images/img/free-icon-anime-2314736.png" alt="애니">
                  <a href="./watched-1ani.html">애니</a>
                </li>
              </ul>
          </div>



        </div>



        <div class="main">

          <section class="sec_2">
            <div class="btn_more_div" style="text-align: right; margin-top: 20px; ">
              <button type="button" class="btn_more" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: black; color: #fff; width: 50px;">
               정렬 
              </button>
              <ul class="dropdown-menu dropdown-menu-dark">
                <li><a class="dropdown-item" href="#">최신순</a></li>
                <li><a class="dropdown-item" href="#">별점순</a></li>
              </ul>
            </div>
          </section>

          <div class="main-work">
                
            <div class="cont01">
                <div class="posterzip1">

                    <div class="work-info">
                        <a href="<c:url value="/detailPage" />">
                            <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>

                        </a>
                        <div style="text-align: right; border: #fff;">
                            <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off" checked>
                            <label class="btn btn-outline-primary" for="btncheck1"><i class="bi bi-bookmark-fill"></i></label>
                            <div class="title" style="text-align: center; font-size: 13px;"> 서부 전선 이상 없다</div>
                            <div class="review"><img src="${path}/resources/images/img/별1.PNG" class="review-star" alt="star"> 5.0</div>
                        </div>                            
                </div>

                    <div class="work-info">
                        <a href="#">
                            <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                        </a>
                        <div style="text-align: right; border: #fff;">
                            <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off" checked>
                            <label class="btn btn-outline-primary" for="btncheck2"><i class="bi bi-bookmark-fill"></i></label>
                            <div class="title" style="text-align: center; font-size: 13px;"> 동감 </div>
                            <div class="review"><img src="${path}/resources/images/img/별1.PNG" class="review-star" alt="star"> 5.0</div>
                        </div>
                    </div>

                    <div class="work-info">
                        <a href="#">
                            <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                        </a>
                        <div style="text-align: right; border: #fff;">
                            <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off" checked>
                            <label class="btn btn-outline-primary" for="btncheck3"><i class="bi bi-bookmark-fill"></i></label>
                            <div class="title" style="text-align: center; font-size: 13px;"> 스마트폰을떨어뜨렸을뿐인데</div>
                            <div class="review"><img src="${path}/resources/images/img/별1.PNG" class="review-star" alt="star"> 5.0</div>
                        </div>
                    </div>

                    <div class="work-info">
                        <a href="#">
                            <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                        </a>
                        <div style="text-align: right; border: #fff;">
                            <input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off" checked>
                            <label class="btn btn-outline-primary" for="btncheck4"><i class="bi bi-bookmark-fill"></i></label>
                            <div class="title" style="text-align: center; font-size: 13px;"> 더글로리</div>
                            <div class="review"><img src="${path}/resources/images/img/별1.PNG" class="review-star" alt="star"> 5.0</div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <br />

        <div class="main-work">
           
            <div class="cont01">
                <div class="posterzip2">

                    <div class="work-info">
                        <a href="#">
                            <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                        </a>
                        <div style="text-align: right; border: #fff;">
                            <input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off" checked>
                            <label class="btn btn-outline-primary" for="btncheck6"><i class="bi bi-bookmark-fill"></i></label>
                            <div class="title" style="text-align: center; font-size: 13px;"> 서부 전선 이상 없다</div>
                            <div class="review"><img src="${path}/resources/images/img/별1.PNG" class="review-star" alt="star"> 5.0</div>
                        </div>                            
                </div>

                    <div class="work-info">
                        <a href="#">
                            <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                        </a>
                        <div style="text-align: right; border: #fff;">
                            <input type="checkbox" class="btn-check" id="btncheck7" autocomplete="off" checked>
                            <label class="btn btn-outline-primary" for="btncheck7"><i class="bi bi-bookmark-fill"></i></label>
                            <div class="title" style="text-align: center; font-size: 13px;"> 동감 </div>
                            <div class="review"><img src="${path}/resources/images/img/별1.PNG" class="review-star" alt="star"> 5.0</div>
                        </div>
                    </div>

                    <div class="work-info">
                        <a href="#">
                            <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                        </a>
                        <div style="text-align: right; border: #fff;">
                            <input type="checkbox" class="btn-check" id="btncheck8" autocomplete="off" checked>
                            <label class="btn btn-outline-primary" for="btncheck8"><i class="bi bi-bookmark-fill"></i></label>
                            <div class="title" style="text-align: center; font-size: 13px;"> 스마트폰을떨어뜨렸을뿐인데</div>
                            <div class="review"><img src="${path}/resources/images/img/별1.PNG" class="review-star" alt="star"> 5.0</div>
                        </div>
                    </div>

                    <div class="work-info">
                        <a href="#">
                            <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                        </a>
                        <div style="text-align: right; border: #fff;">
                            <input type="checkbox" class="btn-check" id="btncheck9" autocomplete="off" checked>
                            <label class="btn btn-outline-primary" for="btncheck9"><i class="bi bi-bookmark-fill"></i></label>
                            <div class="title" style="text-align: center; font-size: 13px;"> 더글로리</div>
                            <div class="review"><img src="${path}/resources/images/img/별1.PNG" class="review-star" alt="star"> 5.0</div>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <br/>
        
        <div class="main-work">
          
            <div class="cont01">

              <div class="cont01">
                  <div class="posterzip3">

                      <div class="work-info">
                          <a href="#">
                              <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                          </a>
                          <div style="text-align: right; border: #fff;">
                              <input type="checkbox" class="btn-check" id="btncheck11" autocomplete="off" checked>
                              <label class="btn btn-outline-primary" for="btncheck11"><i class="bi bi-bookmark-fill"></i></label>
                              <div class="title" style="text-align: center; font-size: 13px;"> 서부 전선 이상 없다</div>
                              <div class="review"><img src="${path}/resources/images/img/별1.PNG" class="review-star" alt="star"> 5.0</div>
                          </div>                            
                  </div>

                      <div class="work-info">
                          <a href="#">
                              <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                          </a>
                          <div style="text-align: right; border: #fff;">
                              <input type="checkbox" class="btn-check" id="btncheck12" autocomplete="off" checked>
                              <label class="btn btn-outline-primary" for="btncheck12"><i class="bi bi-bookmark-fill"></i></label>
                              <div class="title" style="text-align: center; font-size: 13px;"> 동감 </div>
                              <div class="review"><img src="${path}/resources/images/img/별1.PNG" class="review-star" alt="star"> 5.0</div>
                          </div>
                      </div>

                      <div class="work-info">
                          <a href="#">
                              <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                          </a>
                          <div style="text-align: right; border: #fff;">
                              <input type="checkbox" class="btn-check" id="btncheck13" autocomplete="off" checked>
                              <label class="btn btn-outline-primary" for="btncheck13"><i class="bi bi-bookmark-fill"></i></label>
                              <div class="title" style="text-align: center; font-size: 13px;"> 스마트폰을떨어뜨렸을뿐인데</div>
                          </div>
                          <div class="review"><img src="${path}/resources/images/img/별1.PNG" class="review-star" alt="star"> 5.0</div>
                      </div>

                      <div class="work-info">
                          <a href="#">
                              <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                          </a>
                          <div style="text-align: right; border: #fff;">
                              <input type="checkbox" class="btn-check" id="btncheck14" autocomplete="off" checked>
                              <label class="btn btn-outline-primary" for="btncheck14"><i class="bi bi-bookmark-fill"></i></label>
                              <div class="title" style="text-align: center; font-size: 13px;"> 더글로리</div>
                              <div class="review"><img src="${path}/resources/images/img/별1.PNG" class="review-star" alt="star"> 5.0</div>
                          </div>
                      </div>


                    </div>
                </div>

            </div>

        </div>            





        </div>
        
      </section>

    </div>
    <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>
</html>