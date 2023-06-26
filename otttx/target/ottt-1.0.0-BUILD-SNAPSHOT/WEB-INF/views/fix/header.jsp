<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
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
	<header>
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
</body>
</html>