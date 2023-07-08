<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>나의 리뷰</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/mypage/myreview.css" >
    <script src="${path}/resources/js/mypage/review.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<div class="wrap">
		<%@ include file="../../fix/header.jsp" %>

		<section class="sec01">
			<c:choose>
				<c:when test="${userChk eq true }"><%@ include file="../../fix/mnb.jsp" %></c:when>
				<c:otherwise><%@ include file="../../fix/mnb2.jsp" %></c:otherwise>
			</c:choose>
		</section>

		<section class="sec02">
			<%@ include file="../../fix/Lmenu.jsp" %>
		
			<div class="main">
				<div class="show"></div>
						  	
			  	<div class=paging-container>
		    		<div class="paging"></div>	    	
	    		</div>			
			</div>
		</section>
	</div>
	
	<script type="text/javascript">
		let CATEGORY =  "${category}" != "" ? "${category}" : 0;
		let CATENM =  "";
		let USER = '${userDTO.user_nicknm}'
		let PAGE = '${pr.sc.page}'
		let PAGESIZE = '${pr.sc.pageSize}'
		
		let reviewCnt = ${reviewCnt}
		
		$(document).ready(function() {
					
			fnGetReviewList({
				"user" : USER
				, "categoryNo" : CATEGORY
				, "page" : PAGE
				, "pageSize" : PAGESIZE
			})
			
			fnLmenuColor(CATEGORY)
			
		})
		
		function fnLmenuColor(category) {
			if (category == 1) {
				$('.Lmenu a').css("color", "#fff")
			    $('.Lmenu ul li:nth-child(3) a').css("color", "#33ff33");
				CATENM = "좋아요 한"
			}
			
			if (category == 2) {
				$('.Lmenu a').css("color", "#fff")
			    $('.Lmenu ul li:nth-child(4) a').css("color", "#33ff33");
				CATENM = "댓글 작성"
			}			
		}
		
		function fnGetReviewList(param) {
	
			$.post(
					"/ottt/mypage/getreviewlist"
				    ,param
				    ,fnCreatReviewList
				)
				
				console.log("param")
				console.log(param)
			
		}
				
		function fnCreatReviewList(response) {
			
			console.log("ajax 통신결과");
			console.log(response);
			
			let createHtml = "";
			
			let list = response.list;
			let reviewCnt = response.reviewCnt
			let pr = response.pr
			
			list.forEach(function(v) {
				createHtml += '<a href="<c:url value="/detailPage/reply?content_no='+v.content_no+'&review_no='+v.review_no+'" />" class="review">'
				createHtml += '<div class="post">'
				createHtml += '<div class="Lside">'
				createHtml += '<img class="poster" src="'+v.thumbnail+'"></div>'
				createHtml += '<div class="Rside">'
				createHtml += '<div class="rv-head">'
				createHtml += '<span class="title">'+v.content_nm+'</span>'
				createHtml += '<div class="starating">'
				createHtml += '<img class="star" src="${path}/resources/images/img/starone.png">'
				createHtml += '<span class="point">'+v.rating+'</span>'
				createHtml += '</div></div>'
				createHtml += '<div class="rv-main">'
				createHtml += '<span>'+v.review_content+'</span>'
				createHtml += '</div>'
				createHtml += '</div></div></a>'
			})

			
			$('.show').append(createHtml)
			
			let createPage = "";
			
			 if (response.reviewCnt == null || response.reviewCnt === 0) {
			        createPage += '<div class="title-line" style="text-align: center;">'+CATENM+' 리뷰가 없습니다</div>';
			    } else {
			        createPage += '<div class="page-num" style="margin-top: 10px;">';
			        createPage += '<nav aria-label="Page navigation example" class="d-flex flex-row justify-content-center">';
			        createPage += '<ul class="pagination">';
			        if (response.pr.showPrev) {
			            createPage += '<li class="page-item">';
			            createPage += '<a class="page-link" onclick="javascript:fnPage('+ (response.pr.beginPage-1) +','+response.pr.sc.categoryNo+ ')">&lt;</a></li>';
			        }
			        for (let i = response.pr.beginPage; i <= response.pr.endPage; i++) {
			        	  createPage += '<li class="page-item">';
			        	  if (i === response.pr.sc.page) {
			        	    createPage += '<a class="page-link selpage" onclick="javascript:fnPage('+i+','+response.pr.sc.categoryNo+ ')">' + i + '</a>';
			        	  } else {
			        	    createPage += '<a class="page-link" onclick="javascript:fnPage('+i+','+response.pr.sc.categoryNo+ ')">' + i + '</a>';
			        	  }
			        	  createPage += '</li>';
			        	}
			        if (response.pr.showNext) {
			            createPage += '<li class="page-item">';
			            createPage += '<a class="page-link" onclick="javascript:fnPage('+(response.pr.endPage+1)+','+response.pr.sc.categoryNo+ ')">&gt;</a></li>';
			        }
			        createPage += '</ul></nav></div>';
			    }
				
			$('.paging').append(createPage)
		}
				
		function fnPage(page, category) {
			$(".show").html("");
			$('.paging').html("");
			
			fnGetReviewList({
				"user" : USER
				, "categoryNo" : category
				, "page" : page
				, "pageSize" : PAGESIZE
			});
			
		}		
				
	</script>

</body>
</html>