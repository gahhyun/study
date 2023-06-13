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

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    
    <style type="text/css">
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
    </style>

</head>
<body style="background-color: #202020; color: #fff;">
    <div class="wrap"> 
        <div style="background-color: black; text-align: center; height: 850px;">

        	<%-- <div class="user">
                <a href="<c:url value='${loginoutlink}' /> " class="${loginout}">
                    <img src="${path}/resources/images/img/profile.png" class="user-img">
                </a>
            </div> --%>
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
                        <img src="${user_img }" id="profile" class="${loginout}">              	
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
            
        	  $(document).on("click", "#tonojjim", function(event) {
        	    event.preventDefault();
        	    // 버튼을 클릭했을 때 실행되는 코드
        	    let content_no = $(this).closest(".work-info").find("#noInput").val()
    			let user_no = '${sessionScope.no}'
        	    $.ajax({
        	      type: 'DELETE',
        	      url: '/ottt/jjim?content_no=' + content_no + '&user_no=' + user_no,
        	      headers: {"content-type":"application/json"},
        	      data: JSON.stringify({content_no:content_no, user_no:user_no}),
        	      success: function(result){
        	    	  document.location.reload(true)
        	        $(".body").html("찜 해제 되었습니다.")
        	        $('#Modal').modal('show')
        	        /* $('#checkBtn').on('click', function() {
        	        	document.location.reload(true)
					})*/ 	        
        	      },
        	      error: function() {
        	        $(".body").html("찜해제에 실패했습니다. 다시 시도해주세요.")
        	        $('#Modal').modal('show')
        	      }					
        	    })
        	  })
        	  
        	  $(document).on("click", "#tojjim", function(event) {
        	    event.preventDefault();
        	    // 버튼을 클릭했을 때 실행되는 코드
        	    let content_no = $(this).closest(".work-info").find("#noInput").val()
    			let user_no = '${sessionScope.no}'
        	    $.ajax({
        	      type: 'PATCH',
        	      url: '/ottt/jjim?content_no=' + content_no + '&user_no=' + user_no,
        	      headers: {"content-type":"application/json"},
        	      data: JSON.stringify({content_no:content_no, user_no:user_no}),
        	      success: function(result){
        	    	  document.location.reload(true)
        	        $(".body").html("찜 등록 되었습니다.")
        	        $('#Modal').modal('show') 
        	        /* $('#checkBtn').on('click', function() {
        	        	document.location.reload(true)
					}) */ 
        	      },
        	      error: function() {
        	        $(".body").html("찜등록에 실패했습니다. 다시 시도해주세요.")
        	        $('#Modal').modal('show')
        	      }					
        	    });
        	  });

        	  $(document).on("click", "#nojjim", function(event) {
        		event.preventDefault()
        	    $(".body2").html("로그인이 필요합니다.")
        	    $('#Modal2').modal('show')
        	  });
        	  
        })       
        </script>

        <section class="sec_2">
            <div style="font-size: 23px; margin-left: 20px; margin-top: 20px;">별점 높은 작품들</div>
            <div class="main-work">
                <button class="left-button1"><img src="${path}/resources/images/img/왼쪽 화살표.png" /></button>
                <div class="cont01">
                    <div class="posterzip1">
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
                                        <%-- <div id="jjim">
                                        <c:choose>
                                        <c:when test="${sessionScope.id != null}">
                                        	<c:forEach var="wishlistDTO" items="${wishList}"> 
                                        	<c:choose>
                                        		<c:when test="${wishlistDTO.content_no == Integer.parseInt(contentDTO.content_no) && sessionScope.no == wishlistDTO.user_no}">
                                        			<button type="button" id="tonojjim" style="width: 25px; height: 30px; border: 1px solid red;"><img alt="찜" src="${path}/resources/images/img/jjim.png" style="width: 17px; cursor: pointer;" ></button> 
                                        		</c:when>                               		    
                                        	</c:choose>
                                        	</c:forEach> 
                                        	<c:if test="${isWishlistEmpty}">
                                        		<button type="button" id="tojjim" style="width: 25px; height: 30px; border: 1px solid red;"><img alt="찜" src="${path}/resources/images/img/nojjim.png" style="width: 17px; cursor: pointer;" ></button> 
                                        	</c:if>       	 	                 	          	
                                        </c:when>
                                        <c:otherwise>
                                        	<button type="button" id="nojjim" style="width: 25px; height: 30px; border: 1px solid red;"><img alt="찜" src="${path}/resources/images/img/nojjim.png" style="width: 17px; cursor: pointer;" ></button> 
                                        </c:otherwise>                                       
                                        </c:choose>                        
                                        </div> --%>
                                        <div id="jjim">
										    <c:choose>
										        <c:when test="${sessionScope.id != null}">
										            <c:set var="isInWishlist" value="false" />
										            <c:forEach var="wishlistDTO" items="${wishList}">
										                <c:if test="${wishlistDTO.content_no == Integer.parseInt(contentDTO.content_no) && sessionScope.no == wishlistDTO.user_no}">
										                    <c:set var="isInWishlist" value="true" />
										                </c:if>
										            </c:forEach>
										            <c:choose>
										                <c:when test="${isInWishlist}">
										                    <button type="button" id="tonojjim" style="width: 25px; height: 30px;"><img alt="찜" src="${path}/resources/images/img/jjim.png" style="width: 17px; cursor: pointer;"></button>
										                </c:when>
										                <c:otherwise>
										                    <button type="button" id="tojjim" style="width: 25px; height: 30px;"><img alt="찜" src="${path}/resources/images/img/nojjim.png" style="width: 17px; cursor: pointer;"></button>
										                </c:otherwise>
										            </c:choose>
										        </c:when>
										        <c:otherwise>
										            <button type="button" id="nojjim" style="width: 25px; height: 30px;"><img alt="찜" src="${path}/resources/images/img/nojjim.png" style="width: 17px; cursor: pointer;"></button>
										        </c:otherwise>
										    </c:choose>
										</div>                                        
                                    </div>                                    
                                </div>  
                            </a>
                        </div>                                                   
                    </c:forEach>                       
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
	              <div class="modal-footer" id="modal-footer" style="height: 60px;">
	                <!-- <button type="button" id="checkBtn" class="btn btn-secondary" data-bs-dismiss="modal">확인</button> -->
	              </div>
	            </div>
	          </div>
	        </div>
	        
	        <!-- Modal -->
	        <div class="modal fade" id="Modal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	          <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	              <div class="modal-header">
	                <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	              </div>
	              <div class="modal-body body2">
	              </div>
	              <div class="modal-footer" id="modal-footer2">
	                <button type="button" id="checkBtn" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
	              </div>
	            </div>
	          </div>
	        </div>


    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
</body>
</html>