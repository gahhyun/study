<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>1movie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/genre/main.css" >
    <script type="text/javascript" src="${path}/resources/js/genre/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
  </head>
 
<!--  body  --------------------->
  <body>
    <form action="#" method="post">
    <div class="wrap">
      <header >
        <div class="logo">
          <a href="<c:url value="/" />">
            <img src="${path}/resources/images/logo/OTTT.png" alt="logo">
          </a>
        </div>
        <nav class="gnb">
          <ul>
            <li>
              <a href="<c:url value="/genre/movie" />" style="color: #33ff33;">영화</a>
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
      <br />
      <section class="sec00">
        <div class="ott-logo-box">
          <a href="#">
            <img 
              class="ott-logo-img"
              src="${path}/resources/images/icon/티빙.png"
            />
          </a>
          <a href="#">
            <img
              class="ott-logo-img"
              src="${path}/resources/images/icon/netplix.png"
            />
          </a>
          <a href="#">
            <img
              class="ott-logo-img"
              src="${path}/resources/images/icon/웨이브.png"
            />
          </a>
          <a href="#">
            <img
              class="ott-logo-img"
              src="${path}/resources/images/icon/쿠팡플레이.png"
            />
          </a>
          <a href="#">
            <img
              class="ott-logo-img"
              src="${path}/resources/images/icon/왓챠.png"
            />
          </a>
          <a href="#">
            <img
              class="ott-logo-img"
              src="${path}/resources/images/icon/디즈니플러스.png"
            />
          </a>
        </div>
        <hr class="ott-logo-divider" />
        <ul class="ott-logo-text">
          <li>
            <input id="movie" type="checkbox" value="movie">
            <a href="#"><label for="movie">액션</a></label>
          </li>
          <li>
            <input id="movie1" type="checkbox" value="movie">
            <a href="#"><label for="movie1">어드벤쳐</a></label>
          </li>
          <li>
            <input id="movie2" type="checkbox" value="movie">
            <a href="#"><label for="movie2">SF</a></label>
          </li>
          <li>
            <input id="movie3" type="checkbox" value="movie">
            <a href="#"><label for="movie3">판타지</a></label>
          </li>
          <li>
            <input id="movie4" type="checkbox" value="movie">
            <a href="#"><label for="movie4">드라마</a></label>
          </li>
          <li>
            <input id="movie5" type="checkbox" value="movie">
            <a href="#"><label for="movie5">코미디</a></label>
          </li>
          <li>
            <input id="movie6" type="checkbox" value="movie">
            <a href="#"><label for="movie6">시대극</a></label>
          </li>
          <li>
            <input id="movie7" type="checkbox" value="movie">
            <a href="#"><label for="movie7">로맨스/멜로</a></label>
          </li>
          <li>
            <input id="movie8" type="checkbox" value="movie">
            <a href="#"><label for="movie8">공포/스릴러</a></label>
          </li>
          <li>
            <input id="movie9" type="checkbox" value="movie">
            <a href="#"><label for="movie9">미스터리</a></label>
          </li>
          <li>
            <input id="movie10" type="checkbox" value="movie">
            <a href="#"><label for="movie10">범죄</a></label>
          </li>
          <li>
            <input id="movie11" type="checkbox" value="movie">
            <a href="#"><label for="movie11">음악/뮤지컬</a></label>
          </li>
          <li>
            <input id="movie12" type="checkbox" value="movie">
            <a href="#"><label for="movie12">스포츠</a></label>
          </li>
          <li>
            <input id="movie13" type="checkbox" value="movie">
            <a href="#"><label for="movie13">다큐멘터리</a></label>
          </li>
          <li>
            <input id="movie14" type="checkbox" value="movie">
            <a href="#"><label for="movie14">가족</a></label>
          </li>
          <li>
            <input id="movie15" type="checkbox" value="movie">
            <a href="#"><label for="movie15">역사</a></label>
          </li>
          <button class="submit">Click</button>
        </ul>
      </section>
      <section class="sec00-1">
        <div class="dropdown-filter">
          <li>
            <select name="button" id="button">
             <a class="dropdown-itemtemp" href="#"><option value="최신순" >최신순</a></option>
             <a class="dropdown-itemtemp" href="#"><option value="별점순" >별점순</a></option>
            </select>
          </li>
        </ul>
      </div>
    </section>
      <section class="sec01">
        <div class="work-info">
          <a href="#">
              <img src="./images/popular/theglory.jpg" class="poster"/>
              <div class="work-review">
                  <div class="ott-img">
                      <span><img src="./images/ottlogo/Netflix.png"></span>
                  </div>
                  <div class="work-cat">
                      <div>드라마</div>    
                      <div>범죄</div>
                      <div>한국</div>
                  </div>
                  <div>
                      <img src="./images/main/starpan.png" class="star-img"/>
                  </div>
                  <div class="work-my">
                      <div><a href="#">찜</a></div>
                      <div><a href="#">리뷰쓰기</a></div>
                  </div>
              </div>
          </a>
        </div>
        <div class="work-info">
            <a href="#">
                <img src="./images/popular/smartphonedropdown.jpg" class="poster"/>
                <div class="work-review">
                    <div class="ott-img">
                        <span><img src="./images/ottlogo/Netflix.png"></span>
                    </div>
                    <div class="work-cat">
                        <div>드라마</div>    
                        <div>범죄</div>
                        <div>한국</div>
                    </div>
                    <div>
                        <img src="./images/main/starpan.png" class="star-img"/>
                    </div>
                    <div class="work-my">
                        <div><a href="#">찜</a></div>
                        <div><a href="#">리뷰쓰기</a></div>
                    </div>
                </div>
            </a>
          </div>
          <div class="work-info">
            <a href="#">
                <img src="./images/popular/search.jpg" class="poster"/>
                <div class="work-review">
                    <div class="ott-img">
                        <span><img src="./images/popular/1tascandle.jpg"></span>
                    </div>
                    <div class="work-cat">
                        <div>드라마</div>    
                        <div>범죄</div>
                        <div>한국</div>
                    </div>
                    <div>
                        <img src="./images/main/starpan.png" class="star-img"/>
                    </div>
                    <div class="work-my">
                        <div><a href="#">찜</a></div>
                        <div><a href="#">리뷰쓰기</a></div>
                    </div>
                </div>
            </a>
          </div>
          <div class="work-info">
            <a href="#">
                <img src="./images/popular/doweibi.jpg" class="poster"/>
                <div class="work-review">
                    <div class="ott-img">
                        <span><img src="./images/ottlogo/Netflix.png"></span>
                    </div>
                    <div class="work-cat">
                        <div>드라마</div>    
                        <div>범죄</div>
                        <div>한국</div>
                    </div>
                    <div>
                        <img src="./images/main/starpan.png" class="star-img"/>
                    </div>
                    <div class="work-my">
                        <div><a href="#">찜</a></div>
                        <div><a href="#">리뷰쓰기</a></div>
                    </div>
                </div>
            </a>
          </div>
          <div class="work-info">
            <a href="#">
                <img src="./images/popular/dehangsa.jpg" class="poster"/>
                <div class="work-review">
                    <div class="ott-img">
                        <span><img src="./images/ottlogo/Netflix.png"></span>
                    </div>
                    <div class="work-cat">
                        <div>드라마</div>    
                        <div>범죄</div>
                        <div>한국</div>
                    </div>
                    <div>
                        <img src="./images/main/starpan.png" class="star-img"/>
                    </div>
                    <div class="work-my">
                        <div><a href="#">찜</a></div>
                        <div><a href="#">리뷰쓰기</a></div>
                    </div>
                </div>
            </a>
          </div>
          <div class="work-info">
            <a href="#">
                <img src="./images/popular/doweibi.jpg" class="poster"/>
                <div class="work-review">
                    <div class="ott-img">
                        <span><img src="./images/ottlogo/Netflix.png"></span>
                    </div>
                    <div class="work-cat">
                        <div>드라마</div>    
                        <div>범죄</div>
                        <div>한국</div>
                    </div>
                    <div>
                        <img src="./images/main/starpan.png" class="star-img"/>
                    </div>
                    <div class="work-my">
                        <div><a href="#">찜</a></div>
                        <div><a href="#">리뷰쓰기</a></div>
                    </div>
                </div>
            </a>
          </div>
          <div class="work-info">
            <a href="#">
                <img src="./images/popular/dehangsa.jpg" class="poster"/>
                <div class="work-review">
                    <div class="ott-img">
                        <span><img src="./images/ottlogo/Netflix.png"></span>
                    </div>
                    <div class="work-cat">
                        <div>드라마</div>    
                        <div>범죄</div>
                        <div>한국</div>
                    </div>
                    <div>
                        <img src="./images/main/starpan.png" class="star-img"/>
                    </div>
                    <div class="work-my">
                        <div><a href="#">찜</a></div>
                        <div><a href="#">리뷰쓰기</a></div>
                    </div>
                </div>
            </a>
          </div>
          <div class="work-info">
            <a href="#">
                <img src="./images/popular/doweibi.jpg" class="poster"/>
                <div class="work-review">
                    <div class="ott-img">
                        <span><img src="./images/ottlogo/Netflix.png"></span>
                    </div>
                    <div class="work-cat">
                        <div>드라마</div>    
                        <div>범죄</div>
                        <div>한국</div>
                    </div>
                    <div>
                        <img src="./images/main/starpan.png" class="star-img"/>
                    </div>
                    <div class="work-my">
                        <div><a href="#">찜</a></div>
                        <div><a href="#">리뷰쓰기</a></div>
                    </div>
                </div>
            </a>
          </div>
          <div class="work-info">
            <a href="#">
                <img src="./images/popular/theglory.jpg" class="poster"/>
                <div class="work-review">
                    <div class="ott-img">
                        <span><img src="./images/ottlogo/Netflix.png"></span>
                    </div>
                    <div class="work-cat">
                        <div>드라마</div>    
                        <div>범죄</div>
                        <div>한국</div>
                    </div>
                    <div>
                        <img src="./images/main/starpan.png" class="star-img"/>
                    </div>
                    <div class="work-my">
                        <div><a href="#">찜</a></div>
                        <div><a href="#">리뷰쓰기</a></div>
                    </div>
                </div>
            </a>
          </div>
          <div class="work-info">
              <a href="#">
                  <img src="./images/popular/smartphonedropdown.jpg" class="poster"/>
                  <div class="work-review">
                      <div class="ott-img">
                          <span><img src="./images/ottlogo/Netflix.png"></span>
                      </div>
                      <div class="work-cat">
                          <div>드라마</div>    
                          <div>범죄</div>
                          <div>한국</div>
                      </div>
                      <div>
                          <img src="./images/main/starpan.png" class="star-img"/>
                      </div>
                      <div class="work-my">
                          <div><a href="#">찜</a></div>
                          <div><a href="#">리뷰쓰기</a></div>
                      </div>
                  </div>
              </a>
            </div>
            <div class="work-info">
              <a href="#">
                  <img src="./images/popular/search.jpg" class="poster"/>
                  <div class="work-review">
                      <div class="ott-img">
                          <span><img src="./images/popular/1tascandle.jpg"></span>
                      </div>
                      <div class="work-cat">
                          <div>드라마</div>    
                          <div>범죄</div>
                          <div>한국</div>
                      </div>
                      <div>
                          <img src="./images/main/starpan.png" class="star-img"/>
                      </div>
                      <div class="work-my">
                          <div><a href="#">찜</a></div>
                          <div><a href="#">리뷰쓰기</a></div>
                      </div>
                  </div>
              </a>
            </div>
            <div class="work-info">
              <a href="#">
                  <img src="./images/popular/doweibi.jpg" class="poster"/>
                  <div class="work-review">
                      <div class="ott-img">
                          <span><img src="./images/ottlogo/Netflix.png"></span>
                      </div>
                      <div class="work-cat">
                          <div>드라마</div>    
                          <div>범죄</div>
                          <div>한국</div>
                      </div>
                      <div>
                          <img src="./images/main/starpan.png" class="star-img"/>
                      </div>
                      <div class="work-my">
                          <div><a href="#">찜</a></div>
                          <div><a href="#">리뷰쓰기</a></div>
                      </div>
                  </div>
              </a>
            </div>
            <div class="work-info">
              <a href="#">
                  <img src="./images/popular/dehangsa.jpg" class="poster"/>
                  <div class="work-review">
                      <div class="ott-img">
                          <span><img src="./images/ottlogo/Netflix.png"></span>
                      </div>
                      <div class="work-cat">
                          <div>드라마</div>    
                          <div>범죄</div>
                          <div>한국</div>
                      </div>
                      <div>
                          <img src="./images/main/starpan.png" class="star-img"/>
                      </div>
                      <div class="work-my">
                          <div><a href="#">찜</a></div>
                          <div><a href="#">리뷰쓰기</a></div>
                      </div>
                  </div>
              </a>
            </div>
            <div class="work-info">
                <a href="#">
                    <img src="./images/popular/theglory.jpg" class="poster"/>
                    <div class="work-review">
                        <div class="ott-img">
                            <span><img src="./images/ottlogo/Netflix.png"></span>
                        </div>
                        <div class="work-cat">
                            <div>드라마</div>    
                            <div>범죄</div>
                            <div>한국</div>
                        </div>
                        <div>
                            <img src="./images/main/starpan.png" class="star-img"/>
                        </div>
                        <div class="work-my">
                            <div><a href="#">찜</a></div>
                            <div><a href="#">리뷰쓰기</a></div>
                        </div>
                    </div>
                </a>
              </div>
              <div class="work-info">
                  <a href="#">
                      <img src="./images/popular/smartphonedropdown.jpg" class="poster"/>
                      <div class="work-review">
                          <div class="ott-img">
                              <span><img src="./images/ottlogo/Netflix.png"></span>
                          </div>
                          <div class="work-cat">
                              <div>드라마</div>    
                              <div>범죄</div>
                              <div>한국</div>
                          </div>
                          <div>
                              <img src="./images/main/starpan.png" class="star-img"/>
                          </div>
                          <div class="work-my">
                              <div><a href="#">찜</a></div>
                              <div><a href="#">리뷰쓰기</a></div>
                          </div>
                      </div>
                  </a>
                </div>
                <div class="work-info">
                  <a href="#">
                      <img src="./images/popular/search.jpg" class="poster"/>
                      <div class="work-review">
                          <div class="ott-img">
                              <span><img src="./images/popular/1tascandle.jpg"></span>
                          </div>
                          <div class="work-cat">
                              <div>드라마</div>    
                              <div>범죄</div>
                              <div>한국</div>
                          </div>
                          <div>
                              <img src="./images/main/starpan.png" class="star-img"/>
                          </div>
                          <div class="work-my">
                              <div><a href="#">찜</a></div>
                              <div><a href="#">리뷰쓰기</a></div>
                          </div>
                    </div>
                </a>
            </div>
            <div class="work-info">
                <a href="#">
                    <img src="./images/popular/doweibi.jpg" class="poster"/>
                    <div class="work-review">
                        <div class="ott-img">
                            <span><img src="./images/ottlogo/Netflix.png"></span>
                        </div>
                        <div class="work-cat">
                            <div>드라마</div>    
                            <div>범죄</div>
                            <div>한국</div>
                        </div>
                        <div>
                            <img src="./images/main/starpan.png" class="star-img"/>
                        </div>
                        <div class="work-my">
                            <div><a href="#">찜</a></div>
                            <div><a href="#">리뷰쓰기</a></div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="work-info">
                <a href="#">
                    <img src="./images/popular/dehangsa.jpg" class="poster"/>
                    <div class="work-review">
                        <div class="ott-img">
                            <span><img src="./images/ottlogo/Netflix.png"></span>
                        </div>
                        <div class="work-cat">
                            <div>드라마</div>    
                            <div>범죄</div>
                            <div>한국</div>
                        </div>
                        <div>
                            <img src="./images/main/starpan.png" class="star-img"/>
                        </div>
                        <div class="work-my">
                            <div><a href="#">찜</a></div>
                            <div><a href="#">리뷰쓰기</a></div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="work-info">
                <a href="#">
                    <img src="./images/popular/doweibi.jpg" class="poster"/>
                    <div class="work-review">
                        <div class="ott-img">
                            <span><img src="./images/ottlogo/Netflix.png"></span>
                        </div>
                        <div class="work-cat">
                            <div>드라마</div>    
                            <div>범죄</div>
                            <div>한국</div>
                        </div>
                        <div>
                            <img src="./images/main/starpan.png" class="star-img"/>
                        </div>
                        <div class="work-my">
                            <div><a href="#">찜</a></div>
                            <div><a href="#">리뷰쓰기</a></div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="work-info">
                <a href="#">
                    <img src="./images/popular/dehangsa.jpg" class="poster"/>
                    <div class="work-review">
                        <div class="ott-img">
                            <span><img src="./images/ottlogo/Netflix.png"></span>
                        </div>
                        <div class="work-cat">
                            <div>드라마</div>    
                            <div>범죄</div>
                            <div>한국</div>
                        </div>
                        <div>
                            <img src="./images/main/starpan.png" class="star-img"/>
                        </div>
                        <div class="work-my">
                            <div><a href="#">찜</a></div>
                            <div><a href="#">리뷰쓰기</a></div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="work-info">
                <a href="#">
                    <img src="./images/popular/doweibi.jpg" class="poster"/>
                    <div class="work-review">
                        <div class="ott-img">
                            <span><img src="./images/ottlogo/Netflix.png"></span>
                        </div>
                        <div class="work-cat">
                            <div>드라마</div>    
                            <div>범죄</div>
                            <div>한국</div>
                        </div>
                        <div>
                            <img src="./images/main/starpan.png" class="star-img"/>
                        </div>
                        <div class="work-my">
                            <div><a href="#">찜</a></div>
                            <div><a href="#">리뷰쓰기</a></div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="work-info">
                <a href="#">
                    <img src="./images/popular/theglory.jpg" class="poster"/>
                    <div class="work-review">
                        <div class="ott-img">
                            <span><img src="./images/ottlogo/Netflix.png"></span>
                        </div>
                        <div class="work-cat">
                            <div>드라마</div>    
                            <div>범죄</div>
                            <div>한국</div>
                        </div>
                        <div>
                            <img src="./images/main/starpan.png" class="star-img"/>
                        </div>
                        <div class="work-my">
                            <div><a href="#">찜</a></div>
                            <div><a href="#">리뷰쓰기</a></div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="work-info">
                <a href="#">
                    <img src="./images/popular/smartphonedropdown.jpg" class="poster"/>
                    <div class="work-review">
                        <div class="ott-img">
                            <span><img src="./images/ottlogo/Netflix.png"></span>
                        </div>
                        <div class="work-cat">
                            <div>드라마</div>    
                            <div>범죄</div>
                            <div>한국</div>
                        </div>
                        <div>
                            <img src="./images/main/starpan.png" class="star-img"/>
                        </div>
                        <div class="work-my">
                            <div><a href="#">찜</a></div>
                            <div><a href="#">리뷰쓰기</a></div>
                        </div>
                    </div>
                </a>
                </div>
                <div class="work-info">
                <a href="#">
                    <img src="./images/popular/search.jpg" class="poster"/>
                    <div class="work-review">
                        <div class="ott-img">
                            <span><img src="./images/popular/1tascandle.jpg"></span>
                        </div>
                        <div class="work-cat">
                            <div>드라마</div>    
                            <div>범죄</div>
                            <div>한국</div>
                        </div>
                        <div>
                            <img src="./images/main/starpan.png" class="star-img"/>
                        </div>
                        <div class="work-my">
                            <div><a href="#">찜</a></div>
                            <div><a href="#">리뷰쓰기</a></div>
                        </div>
                    </div>
                </a>
                </div>
                <div class="work-info">
                <a href="#">
                    <img src="./images/popular/doweibi.jpg" class="poster"/>
                    <div class="work-review">
                        <div class="ott-img">
                            <span><img src="./images/ottlogo/Netflix.png"></span>
                        </div>
                        <div class="work-cat">
                            <div>드라마</div>    
                            <div>범죄</div>
                            <div>한국</div>
                        </div>
                        <div>
                            <img src="./images/main/starpan.png" class="star-img"/>
                        </div>
                        <div class="work-my">
                            <div><a href="#">찜</a></div>
                            <div><a href="#">리뷰쓰기</a></div>
                        </div>
                    </div>
                </a>
                </div>
                <div class="work-info">
                <a href="#">
                    <img src="./images/popular/dehangsa.jpg" class="poster"/>
                    <div class="work-review">
                        <div class="ott-img">
                            <span><img src="./images/ottlogo/Netflix.png"></span>
                        </div>
                        <div class="work-cat">
                            <div>드라마</div>    
                            <div>범죄</div>
                            <div>한국</div>
                        </div>
                        <div>
                            <img src="./images/main/starpan.png" class="star-img"/>
                        </div>
                        <div class="work-my">
                            <div><a href="#">찜</a></div>
                            <div><a href="#">리뷰쓰기</a></div>
                        </div>
                    </div>
                </a>
                </div>
                <div class="work-info">
                <a href="#">
                    <img src="./images/popular/theglory.jpg" class="poster"/>
                    <div class="work-review">
                        <div class="ott-img">
                            <span><img src="./images/ottlogo/Netflix.png"></span>
                        </div>
                        <div class="work-cat">
                            <div>드라마</div>    
                            <div>범죄</div>
                            <div>한국</div>
                        </div>
                        <div>
                            <img src="./images/main/starpan.png" class="star-img"/>
                        </div>
                        <div class="work-my">
                            <div><a href="#">찜</a></div>
                            <div><a href="#">리뷰쓰기</a></div>
                        </div>
                    </div>
                </a>
                </div>
                <div class="work-info">
                    <a href="#">
                        <img src="./images/popular/smartphonedropdown.jpg" class="poster"/>
                        <div class="work-review">
                            <div class="ott-img">
                                <span><img src="./images/ottlogo/Netflix.png"></span>
                            </div>
                            <div class="work-cat">
                                <div>드라마</div>    
                                <div>범죄</div>
                                <div>한국</div>
                            </div>
                            <div>
                                <img src="./images/main/starpan.png" class="star-img"/>
                            </div>
                            <div class="work-my">
                                <div><a href="#">찜</a></div>
                                <div><a href="#">리뷰쓰기</a></div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="work-info">
                    <a href="#">
                        <img src="./images/popular/search.jpg" class="poster"/>
                        <div class="work-review">
                            <div class="ott-img">
                                <span><img src="./images/popular/1tascandle.jpg"></span>
                            </div>
                            <div class="work-cat">
                                <div>드라마</div>    
                                <div>범죄</div>
                                <div>한국</div>
                            </div>
                            <div>
                                <img src="./images/main/starpan.png" class="star-img"/>
                            </div>
                            <div class="work-my">
                                <div><a href="#">찜</a></div>
                                <div><a href="#">리뷰쓰기</a></div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="work-info">
                    <a href="#">
                        <img src="./images/popular/doweibi.jpg" class="poster"/>
                        <div class="work-review">
                            <div class="ott-img">
                                <span><img src="./images/ottlogo/Netflix.png"></span>
                            </div>
                            <div class="work-cat">
                                <div>드라마</div>    
                                <div>범죄</div>
                                <div>한국</div>
                            </div>
                            <div>
                                <img src="./images/main/starpan.png" class="star-img"/>
                            </div>
                            <div class="work-my">
                                <div><a href="#">찜</a></div>
                                <div><a href="#">리뷰쓰기</a></div>
                            </div>
                        </div>
                    </a>
                </div>
    </section>
      <footer></footer>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </form>
  <script>
    const logos = document.querySelectorAll('.ott-logo-img');
    logos.forEach(function(logo) {
      logo.addEventListener('click', function() {
        logo.classList.toggle('active');
      });
    });
    </script>
    <style>
      .ott-logo-img:hover,
      .ott-logo-img.active {
        outline: 3px solid #33ff33;
        border-radius: 10px;
      }
    </style>
  </body>
</html>