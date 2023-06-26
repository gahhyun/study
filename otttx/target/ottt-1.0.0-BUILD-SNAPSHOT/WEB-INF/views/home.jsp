<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<c:set var="loginout" value="${sessionScope.id == null ? 'logout' : 'login'}" />
<c:set var="loginoutlink" value="${sessionScope.id==null ? '/login' : '/mypage'}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTTT</title>

    <link rel="stylesheet" href="${path}/resources/css/search/home_search.css" > 
    <script src="${path}/resources/js/home/jquery-3.6.1.min.js"></script>
    <script src="${path}/resources/js/home/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />

</head>
<body style="background-color: #202020; color: #fff;">
    <div class="wrap"> 
        <div style="background-color: black; text-align: center; height: 850px;">

            <img src="${path}/resources/images/logo/메인이미지.png" style="width: 1200px; background-position: center; margin-top: 150px;"/>
            
            <div>
                <img src="${path}/resources/images/logo/메인 OTTT.png" style="position: relative; top: -600px; width: 700px;"/>
            </div>
            <br/>
            <span class="main-search">
                <a href="<c:url value='/search' />"><input type="text"/></a>
                <a href="<c:url value='/search' />" class="search-img">
                    <!-- <img src="/image/icon/search02.png"/> -->
                </a>
            </span>

            <span class="main-cat">
                <a href="<c:url value="/genre/movie" />"><div>영화</div></a>
                <a href="<c:url value="/genre/drama" />"><div>드라마</div></a>
                <a href="<c:url value="/genre/interest" />"><div>예능</div></a>
                <a href="<c:url value="/genre/animation" />"><div>애니</div></a>
            </span>
 

        </div>

        <div style="height: 230px; background: linear-gradient(to top, #202020, black);"></div>

        <header class="header" style="position: sticky; top: 0;">
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
              <a href="<c:url value="/community/freecommunity" />">게시판</a>
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
              <a href="<c:url value='/mypage' /> " class="${loginout}" >
              	<c:if test="${sessionScope.id != null}">
              		<img src="" id="profile" class="${loginout}" alt="내정보">              	
              	</c:if>              	
              </a>
            </li>
          </ul>
            </div>
        </header>
        
        <script type="text/javascript">
        	$(document).ready(function() {

        		let img = function() {
        			if ('${userDTO.user_id}' != '') {
        				$('#profile').attr("src", '${userDTO.image}')
        			}     				
        			return true
				}
        		
        		img()
				
			})
    	</script>
        
        <script type="text/javascript">
        	let msg = "${msg}"
			if(msg == "byebye") alert("또 봐ㅜㅜ")        
        </script>
			


        <section class="sec_2">
            <div style="font-size: 23px; margin-left: 20px; margin-top: 20px;">별점 높은 작품들</div>
            <div class="main-work">
                <button class="left-button1"><img src="${path}/resources/images/img/왼쪽 화살표.png" /></button>
                <div class="cont01">
                    <div class="posterzip1">
                        <div class="work-info">
                            <a href="<c:url value="/detailPage" />">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                
                <button class="right-button1"><img src="resources/images/img/오른쪽화살표.png"/></button>
            </div>
            <br />
            <div style="font-size: 23px; margin-left: 20px;">지금 HOT한 작품들</div>
            <div class="main-work">
                <button class="left-button2"><img src="${path}/resources/images/img/왼쪽 화살표.png" /></button>
                <div class="cont01">
                    <div class="posterzip2">
                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                
                <button class="right-button2"><img src="resources/images/img/오른쪽화살표.png"/></button>
            </div>
            <br/>
            <div style="font-size: 23px; margin-left: 20px;">추천 작품들</div>
            <div class="main-work">
                <button class="left-button3"><img src="${path}/resources/images/img/왼쪽 화살표.png" /></button>
                <div class="cont01">
                    <div class="posterzip3">
                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="work-info">
                            <a href="../채경철/index.html">
                                <img src="${path}/resources/images/poster/subu.jpg" class="poster"/>
                                <div class="work-review">
                                    <div class="ott-img">
                                        <span><img src="${path}/resources/images/icon/netplix.png"></span>
                                    </div>
                                    
                                    <div class="work-cat">
                                        <div>영화</div>    
                                        <div>전쟁</div>
                                        <div>독일</div>
                                    </div>
                                    <div>
                                        <img src="${path}/resources/images/img/3star.png" class="star-img"/>
                                    </div>                           
                                    <div class="work-my">
                                        <div><a href="#">찜</a></div>
                                        <div><a href="../OTTT_review_page유찬희/review.html">리뷰쓰기</a></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                
                <button class="right-button3"><img src="resources/images/img/오른쪽화살표.png"/></button>
            </div>
        </section>





    </div>




    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
</body>
</html>