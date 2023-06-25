<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Coupang</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/community/priceInfo/priceCoupang.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
  </head>

<!--  body  --------------------->
  <body style="background-color: #202020;">
     <div class="wrap">
      <header >
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
              <a href="<c:url value="/community/freecommunity" />" style="color: #33ff33;">게시판</a>
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
          <a class="nav-link1" href="<c:url value='/community/freecommunity' />">자유게시판</a>
          <a class="nav-link1" href="<c:url value='/community/endmovie/tving' />">종료예정작</a>
          <a class="nav-link1" href="<c:url value='/community/priceInfoTving' />" style="color: #33ff33;">가격정보</a>
          <a class="nav-link1" href="<c:url value='/community/QnA' />">Q&A</a>
          <a class="nav-link1" href="<c:url value='/community/notice' />">공지사항</a>
        </nav>
      </div>
      <div id="line-2" >
        <nav class="nav2">
          <a class="nav-link2" href="<c:url value='/community/priceInfoTving' />"><img class="ott_icon" src="${path}/resources/images/icon/티빙.png" alt="tving"></a>
          <a class="nav-link2" href="<c:url value='/community/priceInfoNetflix' />"><img class="ott_icon" src="${path}/resources/images/icon/netplix.png" alt="netflix"></a>
          <a class="nav-link2" href="<c:url value='/community//priceInfoWavve' />"><img class="ott_icon" src="${path}/resources/images/icon/웨이브.png" alt="wavve"></a>
          <a class="nav-link2" href="<c:url value='/community/priceInfoCoupang' />"><img class="ott_icon" src="${path}/resources/images/icon/쿠팡플레이.png" alt="coupang" style="border: 3px solid #33ff33;border-radius: 15px;"></a>
          <a class="nav-link2" href="<c:url value='/community/priceInfoWatcha' />"><img class="ott_icon" src="${path}/resources/images/icon/왓챠.png" alt="watcha" ></a>
          <a class="nav-link2" href="<c:url value='/community/priceInfoDisney' />"><img class="ott_icon" src="${path}/resources/images/icon/디즈니플러스.png" alt="disney"></a>
        </nav>
      </div>
      <div class="voucher-inner-wrap">
        <section>
          <table class="vouchar-table">
              <tr>
                <th class="forunine">가격</th>
                  <td class="forunine" style="color: #33ff33;">월 4,900원</td>
                </tr>
              <tr>
                <th>이용 조건</th>
                <td>
                <ul class="Info">
                  <li>• 쿠팡 로켓와우 멤버십 회원이라면 누구나 무료 로켓배송, 무료 반품, 특가상품 혜택과 더불어 무료로 이용할 수 있습니다.</li>
                  <li> &nbsp;(일부 유료 콘텐츠 제외)</li>
                  <li>• 단, 쿠팡플레이는 로켓와우 개인 멤버십 회원에 한해 제공되고 있으며 </li>
                  <li>• 쿠팡 비즈 회원 계정으로 가입한 회원은 이용이 제한됨을 참고 부탁드립니다.</li>
                </ul>
                </td>
              </tr>
              <tr>
                <th>지원되는 기기</th>
                <td>
                <ul class="Info">
                  <li>• 계정 당 최대 5대의 기기를 등록할 수 있으며, 최대 2대의 기기에서 동시 시청이 가능합니다.</li>
                  <li>• 모바일/태블릿 기기: Android 와 iOS 기반의 모든 모바일 기기</li>
                  <li>PC : <a href="<c:url value='www.coupangplay.com' />" >www.coupangplay.com</a>(지원 브라우저: Edge, Chrome, Safari, Whale)</li>
                  <li>스마트 TV<br>
                      - 삼성 스마트TV: Tizen 3.0 (제조년월 2017년도 이후 모델)버전 이상<br>
                      - LG 스마트TV: 웹 OS 3.5 (2017년 모델) ~ 6.0 (2021년 모델)<br>
                      - 안드로이드 TV: Android 6.0 버전 이상
                  </li>
                </ul>
                </td>
              </tr>

          </table>
        </section>
      </div>
    </div>
  </body>

</html>
