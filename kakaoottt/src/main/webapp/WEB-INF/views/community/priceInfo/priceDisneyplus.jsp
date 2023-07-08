<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Disneyplus</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/community/priceInfo/priceDisneyplus.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
  </head>

<!--  body  --------------------->
  <body style="background-color: #202020;">
     <div class="wrap">
      	<%@ include file="../../fix/header.jsp" %>
      <div id="line-1" >
        <%@ include file="../../fix/nav.jsp" %>
      </div>
      <div id="line-2" >
        <%@ include file="../../fix/nav2.jsp" %>
      </div>
      <div class="voucher-inner-wrap">
        <section>
          <table class="vouchar-table">
              <tr>
                <th class="ninenine">가격</th>
                  <td class="ninenine" style="color: #33ff33;">월 9,900<br>연 99,000원</td>
                </tr>
              <tr>
                <th>지원되는 기기</th>
                <td>
                <ul>
                  <li>· 웹 브라우저, 모바일 기기, 태블릿, 스트리밍 스틱, 게임 콘솔, 스마트 TV, 셋톱박스에서 디즈니+ 스트리밍</li>
                  <li>· 지원되는 기기의 전체 목록을 보려면 <a href="https://help.disneyplus.com/csp?id=csp_article_content&sys_kb_id=7b0cc54d87682590c747dca83cbb358b">여기를 클릭</a>하세요.</li>
                </ul>
                </td>
              </tr>
              <tr>
                <th>지원되는 나라</th>
                <td>
                <ul>
                  <li>· 디즈니+는 현재 58개 나라에서 제공되고 있습니다.</li>
                </ul>
                </td>
              </tr>
              <tr>
                <th>디즈니+ 제공</th>
                <td>
                  <ul>
                    <li>· 광고 없는 시청</li>
                    <li>· 최대 10대의 기기에 원하는 콘텐츠 마음껏 저장</li>
                    <li>· 300편이 넘는 작품 고화질 4K UHD 및 HDR로 시청</li>
                    <li>· 추가 요금 없이 최대 4대의 기기에서 동시 스트리밍</li>
                    <li>· 디즈니, 픽사, 마블, 스타워즈, 내셔널지오그래픽, Star의 콘텐츠를 모두 즐길 수 있는 곳입니다.</li>
                  </ul>
                  </td>
              </tr>
          </table>
        </section>
      </div>
    </div>
  </body>

</html>
