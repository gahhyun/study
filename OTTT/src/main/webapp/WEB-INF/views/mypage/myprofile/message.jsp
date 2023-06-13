<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>쪽지알림</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script src="${path}/resources/js/mypage/message.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/resources/css/mypage/message.css" >
    
  </head>

  <body>
     
    <div class="warp">
        <header >
        <div class="logo">
			<a href="<c:url value="/" />">
				  <img src="${path}/resources/images/logo/OTTT.png" alt="로고">
				</a>
		</div>
		<nav class="gnb">
			<ul>
                <li><a href="<c:url value="/genre/movie" />">영화</a></li>
                <li><a href="<c:url value="/genre/drama" />">드라마</a></li>
                <li><a href="<c:url value="/genre/interest" />">예능</a></li>
                <li><a href="<c:url value="/genre/animation" />">애니</a></li>
                <li><a href="<c:url value="/community/freecommunity" />">게시판</a></li>
          </ul>
        </nav>
        <div class="h-icon">
          <ul>
            <li><a href="<c:url value='/search' />"></a></li>
            <li><a href="<c:url value='/mypage' />"></a></li>
          </ul>
        </div>
      </header>

      <nav class="mnb">
        <ul>
          <li><a href="<c:url value="/mypage/myreview" />" class="mreview">기록</a></li>
          <li><a href="<c:url value="/mypage/wishlist" />">찜목록</a></li>
          <li><a href="<c:url value="/mypage/watched" />">봤어요</a></li>
          <li><a href="<c:url value="/mypage/alarm" />">알림함</a></li>
          <li><a href="<c:url value="/mypage/message" />" style="color: #33ff33">쪽지함</a></li>
        </ul>
      </nav>
        
      <div class="sec00">

        <button type="button" id="btn-recv">받은 쪽지</button>
        <button type="button" id="btn-send">보낸 쪽지</button>

      </div>

      <div class="sec01">
        
        <div class="sec-left">
            <table>
                <tr>
                    <th class="msg-img">프로필</th>
                    <th class="msg-name">이름</th>
                    <th class="msg-time">시간</th>
                    <th class="msg-del">삭제</th>
                </tr>
                
<%-- 	            <c:forEach var="messageDTO"> --%>
<!-- 	              <tr> -->
<!-- 	                <td class="msg-img">픞</td> -->
<!-- 	                <td class="msg-name">이름</td> -->
<%-- 	                <td class="msg-time"><fmt:formatDate value="${messageDTO.send_date}" pattern="yyyy-MM-dd HH24:MI" type="date" /></td> --%>
<!-- 	                <td class="msg-del">X</td> -->
<!-- 	              </tr> -->
<%-- 	            </c:forEach> --%>
            
            </table>
        </div>

        <div class="sec-right">
            <div class="msg-nick">닉네임</div>
	        <div class="msg-view-content">
	        	의사가 환자를 직접 만나지 않고 전화나 화상을 통해 상담하고 약을 처방하는 비대면진료는 코로나19 확산이 시작된 지난 2020년부터 의료기관 내 감염 방지를 위해 한시 허용됐다. 4월 말까지 3년여 간 1천419만 명 대상으로 3천786건의 비대면진료가 이뤄졌다.<br /><br />

				6월 1일부터 코로나19 위기단계가 '심각'에서 '경계'로 하향되면 비대면진료 한시 허용도 종료되기 때문에 정부는 제도화까지의 입법 공백을 메우기 위해 시범사업을 진행하기로 했다.<br /><br />
				
				내달부터 시행되는 비대면진료 시범사업은 지난 3년여 간의 한시 허용 비대면진료와 달리 대상 환자가 제한적이다.<br /><br />
				
				지금까진 초진·재진 구분 없이 비대면진료를 이용할 수 있었으나 다음달부터는 해당 의료기관에서 해당 질환에 대해 1회 이상 대면 진료한 경험이 있는 경우로 한정된다.<br /><br />
				
				고혈압, 당뇨병 등 만성질환자의 경우 1년 이내, 기타 질환자는 30일 이내에 진료를 받은 경험이 있어야 한다.
	        
	        </div>
	        <button type="button" id="msg-write" class="msg-write-btn" >답장</button>
        </div>

      </div>
	  
    </div>
  </body>
</html>