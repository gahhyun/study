<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search</title>
    <link rel="stylesheet" href="${path}/resources/css/search/home_search.css" > 

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
</head>
<body style="background-color: #202020; color: #ffffff;">

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
              <a href="<c:url value="/community" />">게시판</a>
            </li>
          </ul>
        </nav>
        <div class="h-icon">
        <ul>
            <li>
            <a href="<c:url value='/mypage' />">
                <!-- <img src="./image/icon/user01.png" alt="내 정보"> -->
            </a>
            </li>
        </ul>
        </div>
    </header>
    
    <section class="sec_3">
        <div class="search">
            <span><input type="text" /></span>
            <span><a href="">
              <!-- <img src="./image/icon/search02.png" /> -->
            </a></span>
        </div>
        <div class="search01">
          <div style="position: relative; left: 200px;">최근검색어</div>
          <div class="search-box" style="position: relative; left: 500px; top: -30px;">
            <div >검색가이드</div>
    
              <div class="search-style search-mid">OTT</div>
              <div class="search-style">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                  <label class="form-check-label" for="inlineCheckbox1">넷플릭스</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                  <label class="form-check-label" for="inlineCheckbox2">왓챠플레이</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                  <label class="form-check-label" for="inlineCheckbox3">티빙</label>
                </div> 
              </div>
    
              <div class="search-style">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="option4">
                  <label class="form-check-label" for="inlineCheckbox4">디즈니+</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="option5">
                  <label class="form-check-label" for="inlineCheckbox5">쿠팡플레이</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="option6">
                  <label class="form-check-label" for="inlineCheckbox6">웨이브</label>
                </div> 
              </div>
                
              <div class="search-style search-mid">카테고리</div>
              <div class="search-style">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="option7">
                  <label class="form-check-label" for="inlineCheckbox7">영화</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox8" value="option8">
                  <label class="form-check-label" for="inlineCheckbox8">드라마</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox9" value="option9">
                  <label class="form-check-label" for="inlineCheckbox9">예능</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox10" value="option10">
                  <label class="form-check-label" for="inlineCheckbox10">애니</label>
                </div> 
              </div>
    
              <div class="search-style search-mid">장르</div>
              <div class="search-style">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox11" value="option11">
                  <label class="form-check-label" for="inlineCheckbox11">액션</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox12" value="option12">
                  <label class="form-check-label" for="inlineCheckbox12">어드벤처</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox13" value="option13">
                  <label class="form-check-label" for="inlineCheckbox13">SF</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox14" value="option14">
                  <label class="form-check-label" for="inlineCheckbox14">판타지</label>
                </div> 
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox15" value="option15">
                  <label class="form-check-label" for="inlineCheckbox15">드라마</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox16" value="option16">
                  <label class="form-check-label" for="inlineCheckbox16">코미디</label>
                </div>
              </div>
    
                <div class="search-style">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox17" value="option17">
                  <label class="form-check-label" for="inlineCheckbox17">시대극</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox18" value="option18">
                  <label class="form-check-label" for="inlineCheckbox18">로맨스/멜로</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox19" value="option19">
                  <label class="form-check-label" for="inlineCheckbox19">공포/스릴러</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox20" value="option20">
                  <label class="form-check-label" for="inlineCheckbox20">미스터리</label>
                </div> 
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox21" value="option21">
                  <label class="form-check-label" for="inlineCheckbox21">범죄</label>
                </div>
              </div>
    
              <div class="search-style">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox22" value="option22">
                  <label class="form-check-label" for="inlineCheckbox22">음악/뮤지컬</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox23" value="option23">
                  <label class="form-check-label" for="inlineCheckbox23">스포츠</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox24" value="option24">
                  <label class="form-check-label" for="inlineCheckbox24">다큐멘터리</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox25" value="option25">
                  <label class="form-check-label" for="inlineCheckbox25">가족</label>
              </div> 
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="inlineCheckbox26" value="option26">
                <label class="form-check-label" for="inlineCheckbox26">역사</label>
              </div>
            </div>
          </div>
          
        </div>
    </section>
    
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>

    
</body>
</html>