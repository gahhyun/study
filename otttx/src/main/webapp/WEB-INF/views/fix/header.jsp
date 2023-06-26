<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginout" value="${sessionScope.id == null ? 'logout' : 'login'}" />
<c:set var="loginoutlink" value="${sessionScope.id==null ? '/login' : '/mypage'}" />
<c:set var="user_img" value="${sessionScope.user_img}" />



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/fix/header.css" >
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <title>Document</title>
</head>
<body>
	<script type="text/javascript">
		let path = window.location.href;
	
		function goLogin() {
		    let toURL = '';

		    if ('${sessionScope.id}' === '') {
		        toURL = encodeURIComponent(path);
		        location.href = "/ottt/mypage?toURL=" + toURL;
		    } else {
		        console.log(toURL);
		        location.href = "/ottt/mypage";
		    }
		}
			
	</script>
   <header>
      <div class="logo">
         <a href="<c:url value="/" />">
            <img src="${path}/resources/images/logo/OTTT.png" alt="로고">
         </a>
      </div>
      <nav class="gnb">
         <ul>
               <li>
                  <a class="movie" href="<c:url value="/genre/movie" />">영화</a>
               </li>
               <li>
                    <a class="drama" href="<c:url value="/genre/drama" />">드라마</a>
               </li>
               <li>
                    <a class="inter" href="<c:url value="/genre/interest" />">예능</a>
               </li>
               <li>
                    <a class="ani" href="<c:url value="/genre/animation" />">애니</a>
               </li>
               <li>
                    <a class="community" href="<c:url value="/community/freecommunity" />">게시판</a>
               </li>
            </ul>
        </nav>
           <div class="h-icon">
              <ul>
                 <li>
                    <a href="<c:url value='/search' />" class="searchnav"></a>
                  </li>                  
               <li>
                  <a href="javascript:goLogin()" class="${loginout}" >
                     <c:if test="${sessionScope.id != null}">
                        <img src="${user_img }" id="profile" class="${loginout}">
                     </c:if>
                  </a>
               </li>
            </ul>
         </div>
      </header>
      
      <script type="text/javascript">
		var socket = null;
		connect();
		
		function connect() {
			console.log("*************")
			var ws = new WebSocket("ws://localhost:/ottt/replyEcho");	//포트 번호 확인
			socket = ws;
			
			ws.onopen = function () {
				console.log('Info: connection opened.');
			};
			ws.onmessage = function (event) {
				console.log("받은 메시지: " + event.data + '\n');
			};
	
			ws.onclose = function (event) {
				console.log('Info: connection closed.');
				//setTimeout( function(){ connect(); }, 1000); // retry connection!!
			};
			
			ws.onerror = function (err) { console.log('Info: connection error.', err); };		
		}
	</script>
      
</body>
</html>