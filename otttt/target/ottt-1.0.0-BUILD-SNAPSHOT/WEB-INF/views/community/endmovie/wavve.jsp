<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>wavve</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script type="text/javascript" src="${path}/resources/js/community/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/resources/css/community/endmovie/endmovie.css" >
  </head>
 
<!--  body  --------------------->
  <body style="background-color: #202020;">
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
        <nav class="nav2">
        
          <a class="nav-link2" href="<c:url value='/community/endmovie/tving' />"><img class="ott_icon" src="${path}/resources/images/icon/티빙.png" alt="tving"></a>
          <a class="nav-link2" href="<c:url value='/community/endmovie/netflix' />"><img class="ott_icon" src="${path}/resources/images/icon/netplix.png" alt="netflix"></a>
          <a class="nav-link2" href="<c:url value='/community/endmovie/wavve' />"><img class="ott_icon" src="${path}/resources/images/icon/웨이브.png" alt="wavve" style="border: 3px solid #33ff33; border-radius: 15px;"></a>
          <a class="nav-link2" href="<c:url value='/community/endmovie/coupang' />"><img class="ott_icon" src="${path}/resources/images/icon/쿠팡플레이.png" alt="coupang"></a>
          <a class="nav-link2" href="<c:url value='/community/endmovie/watcha' />"><img class="ott_icon" src="${path}/resources/images/icon/왓챠.png" alt="watcha"></a>
          <a class="nav-link2" href="<c:url value='/community/endmovie/disney' />"><img class="ott_icon" src="${path}/resources/images/icon/디즈니플러스.png" alt="disney"></a>
        </nav>
      </div>
      <div class="voucher-inner-wrap">
        <section class="sec00-1">
          <div class="dropdown-filter">
            <ul>
              <li>
                <select name="month" id="month">
                  <option value="날짜">2023-04</option>
                  <option value="날짜">2023-05</option>
                  <option value="날짜">2023-06</option>
                  <option value="날짜">2023-07</option>
                  <option value="날짜">2023-08</option>
                  <option value="날짜">2023-09</option>
              </li>
            </select>
            </ul>
          </div>
        </section>
        <main class="calendar">
        <table>
          <tr>
            <th>일</th>
            <th>월</th>
            <th>화</th>
            <th>수</th>
            <th>목</th>
            <th>금</th>
            <th>토</th>
          </tr>
          <tr class="movie-sub">
            <td></td>
            <td></td>
            <td></td>
            <td>1<a href="#" class="movie-sub1" id="movieid"><h6>· 쿵푸팬더2</h6></a></td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
          </tr>
          <tr class="movie-sub">
            <td>5</td>
            <td>6</td>
            <td>7</td>
            <td>8</td>
            <td>9<a href="#" class="movie-sub1" id="movieid"><h6>· 나홀로집에</h6></a></td>
            <td>10</td>
            <td>11</td>
          </tr>
          <tr class="movie-sub">
            <td>12</td>
            <td>13<a href="#" class="movie-sub1" id="movieid"><h6>· 라라랜드</h6></a></td>
            <td>14</td>
            <td>15</td>
            <td>16</td>
            <td>17</td>
            <td>18</td>
          </tr>
          <tr class="movie-sub">
            <td>19</td>
            <td>20<a href="#" class="movie-sub1" id="movieid"><h6>· 태극기휘날리며</h6></a>
            <a href="#" class="movie-sub1" id="movieid"><h6>· 황비홍2</h6></a>
            <button class="thebogi"><a href="<c:url value='/community/endmovie/more' />"><h6>더 보기</h6></a></button></td>
            <td>21</td>
            <td>22</td>
            <td>23</td>
            <td>24</td>
            <td>25</td>
          </tr>
          <tr class="movie-sub">
            <td>26</td>
            <td>27</td>
            <td>28</td>
            <td>29</td>
            <td>30<a href="#" class="movie-sub1" id="movieid"><h6>· 황비홍2</h6></a></td>
            <td>31</td>
            <td></td>
          </tr>
        </table>
      </main>
      <footer></footer>
      </form>
      </div>
    </div>
  </body>

</html>