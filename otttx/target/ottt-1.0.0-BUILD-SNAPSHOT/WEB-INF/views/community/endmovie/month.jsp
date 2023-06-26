<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>month</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script type="text/javascript" src="${path}/resources/js/community/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/resources/css/community/endmovie/month4.css" >
  </head>
 
<!-------------------  body  --------------------->
  <body>
    <form>
     <div class="wrap">
      <header>
        <div class="logo">
          <a href="<c:url value="/" />">
            <img src="${path}/resources/images/logo/OTTT.png" alt="logo">
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
              <a href="<c:url value="/community" />" style="color: #33ff33;">게시판</a>
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
      <div id="line-1" >
        <nav class="nav">
          <a class="nav-link1" href="<c:url value='/community' />">자유게시판</a>
          <a class="nav-link1" href="<c:url value='/community/endmovie' />" style="color: #33ff33;">종료예정작</a>
          <a class="nav-link1" href="<c:url value='/community/priceInfoTving' />">가격정보</a>
          <a class="nav-link1" href="<c:url value='/community/QnA' />">Q&A</a>
          <a class="nav-link1" href="<c:url value='/community/notice' />">공지사항</a>
        </nav>
      </div>
      <div id="line-2" >
    </div>
      <br/>
    <section class="sec00">
      <main>
        <div class="endmovie-box">
          <ul><br/>
            <li class="endmovie-month"><h1>Tving 4월 종료 예정작</h1></li>
            <br/>
            <li class="endmovie-list">
            <li><a href="#"><h5>2023.04.01<쿵푸팬더 2></h5></a></li>
            <li><a href="#"><h5>2023.04.09<나홀로집에></h5></a></li>
            <li><a href="#"><h5>2023.04.13<라라랜드> </h5></a></li>
            <li><a href="#"><h5>2023.04.20<태극기휘날리며> </h5></a></li>
            <li><a href="#"><h5>2023.04.20<황비홍2> </h5></a></li>
            <li><a href="#"><h5>2023.04.01<쿵푸팬더 2> </h5></a></li>
            <li><a href="#"><h5>2023.04.09<나홀로집에> </h5></a></li>
            <li><a href="#"><h5>2023.04.13<라라랜드> </h5></a></li>
            <li><a href="#"><h5>2023.04.20<태극기휘날리며> </h5></a></li>
            <li><a href="#"><h5>2023.04.20<황비홍2> </h5></a></li>
            <li><a href="#"><h5>2023.04.13<라라랜드> </h5></a></li>
            <li><a href="#"><h5>2023.04.20<태극기휘날리며> </h5></a></li>
            <li><a href="#"><h5>2023.04.20<황비홍2> </h5></a></li>
          </ul>
        </div>
      </main>
    </section>
  </form>
  </body>

</html>