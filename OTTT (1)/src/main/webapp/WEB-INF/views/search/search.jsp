<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginout" value="${sessionScope.id == null ? 'logout' : 'login'}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search</title>
    <link rel="stylesheet" href="${path}/resources/css/search/home_search.css" > 
	<script src="${path}/resources/js/home/jquery-3.6.1.min.js"></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
</head>
<body style="background-color: #202020; color: #ffffff;">

    <%@ include file="../fix/header.jsp" %>
    
	<script type="text/javascript">
	  /* 검색 form 체크 */
	  function frmCheck(frm) {
	    let msg = '';
	    const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
	    
	    if (frm.content_nm.value.length == 0 && checkboxes.length === 0) {
	      $(".body").html("검색어를 입력하거나,<br>최소한 하나의 옵션을 선택해주세요.");
	      $('#Modal').modal('show');
	      return false;
	    }
	    return true;
	  }
	
	  /* 검색 자동완성 */
	  $(document).ready(function() {
	
		  let showList = function(content_nm) {
			    if (content_nm !== "") {
			      $.ajax({
			        type: "GET",
			        url: "/ottt/search/auto?content_nm=" + encodeURIComponent(content_nm),
			        success: function(result) {
			          $(".autocomplete").html(toHtml(result));
			        },
			        error: function() {
			          alert("error");
			        }
			      });
			    } else {
			      $(".autocomplete").html(""); // 입력값이 없을 때 자동완성 리스트를 비움
			    }
			  };
	
	    let toHtml = function(searchList) {
	      let html = ""; // 생성한 HTML을 저장할 변수
	
	      searchList.forEach(function(search) {
	    	  let tmp = '<div><a href="<c:url value="/searchList?content_nm=' + search.content_nm + '"/>">' + search.content_nm + '</a></div>';
	        html += tmp; // 생성한 HTML을 변수에 추가
	      });
	
	      return html; // 생성한 HTML 반환
	    };
	
	    const $search = $("#search"); // 검색 입력 요소
	    const $autocomplete = $(".autocomplete"); // 자동완성 리스트 요소
	
	    $search.on("input", function() {
	      const content_nm = $search.val().trim();
	      showList(content_nm);
	    });	
	  });
	
	</script>

    <form action='<c:url value='/searchList' />' id="searchForm" method="get" onsubmit="return frmCheck(this)">
    <section class="sec_3">
        <div class="search">        
            <span><input type="text" name="content_nm" id="search" placeholder="제목을 입력해주세요." /></span>           
            <span><button style="width: 70px; height: 70px; cursor: pointer; background-color: rgb(0,0,0,0); border: none"></button>
              <!-- <img src="./image/icon/search02.png" /> -->
            </span>
        </div>
        <div class="autocomplete" style="border: 2px solie red;">     	
        </div>
        <div class="search01">
	        <div style="width: 400px;">
	        	<div style="width: 350px;">최근검색어</div>	
	        	<c:if test="${sessionScope.id != 'null' }">
					<c:forEach var="SearchWorldDTO" items="${searchWordList }">
		        		<div style="margin-top: 10px; margin-left: 10px; margin-right:20px; font-weight: normal;"><a href='<c:url value="/searchList?content_nm=${SearchWorldDTO.search_content}" />' style="color: #fff; text-decoration: none; width: 100%">${SearchWorldDTO.search_content}</a></div>
		        	</c:forEach> 	        	
	        	</c:if>       		        	
	        </div>
          
          <div class="search-box">
            <div >검색가이드</div>
    
              <div class="search-style search-mid">OTT</div>
              
              <div class="search-style">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="ott_no" value="2">
                  <label class="form-check-label" for="inlineCheckbox1">넷플릭스</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" name="ott_no" value="5">
                  <label class="form-check-label" for="inlineCheckbox2">왓챠플레이</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" name="ott_no" value="1">
                  <label class="form-check-label" for="inlineCheckbox3">티빙</label>
                </div> 
              </div>
    
              <div class="search-style">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox4" name="ott_no" value="6">
                  <label class="form-check-label" for="inlineCheckbox4">디즈니+</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox5" name="ott_no" value="4">
                  <label class="form-check-label" for="inlineCheckbox5">쿠팡플레이</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox6" name="ott_no" value="3">
                  <label class="form-check-label" for="inlineCheckbox6">웨이브</label>
                </div> 
              </div>
                
              <div class="search-style search-mid">카테고리</div>
              <div class="search-style">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox7" name="category_no" value="1">
                  <label class="form-check-label" for="inlineCheckbox7">영화</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox8" name="category_no" value="2">
                  <label class="form-check-label" for="inlineCheckbox8">드라마</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox9" name="category_no" value="3">
                  <label class="form-check-label" for="inlineCheckbox9">예능</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox10" name="category_no" value="4">
                  <label class="form-check-label" for="inlineCheckbox10">애니</label>
                </div> 
              </div>

              <div class="search-style search-mid">장르</div>
              <div class="search-style">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox11" name="genre_no" value="1">
                  <label class="form-check-label" for="inlineCheckbox11">액션</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox12" name="genre_no" value="2">
                  <label class="form-check-label" for="inlineCheckbox12">어드벤처</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox13" name="genre_no" value="3">
                  <label class="form-check-label" for="inlineCheckbox13">SF</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox14" name="genre_no" value="4">
                  <label class="form-check-label" for="inlineCheckbox14">판타지</label>
                </div> 
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox15" name="genre_no" value="5">
                  <label class="form-check-label" for="inlineCheckbox15">드라마</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox16" name="genre_no" value="6">
                  <label class="form-check-label" for="inlineCheckbox16">코미디</label>
                </div>
              </div>
    
                <div class="search-style">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox17" name="genre_no" value="7">
                  <label class="form-check-label" for="inlineCheckbox17">시대극</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox18" name="genre_no" value="8">
                  <label class="form-check-label" for="inlineCheckbox18">로맨스/멜로</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox19" name="genre_no" value="9">
                  <label class="form-check-label" for="inlineCheckbox19">공포/스릴러</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox20" name="genre_no" value="10">
                  <label class="form-check-label" for="inlineCheckbox20">미스터리</label>
                </div> 
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox21" name="genre_no" value="11">
                  <label class="form-check-label" for="inlineCheckbox21">범죄</label>
                </div>
              </div>
    
              <div class="search-style">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox22" name="genre_no" value="12">
                  <label class="form-check-label" for="inlineCheckbox22">음악/뮤지컬</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox23" name="genre_no" value="13">
                  <label class="form-check-label" for="inlineCheckbox23">스포츠</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox24" name="genre_no" value="14">
                  <label class="form-check-label" for="inlineCheckbox24">다큐멘터리</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox25" name="genre_no" value="15">
                  <label class="form-check-label" for="inlineCheckbox25">가족</label>
              </div> 
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="inlineCheckbox26" name="genre_no" value="16">
                <label class="form-check-label" for="inlineCheckbox26">역사</label>
              </div>
            </div>
            
          </div>
          
        </div>
    
    </section>
    </form>
    
    
    
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
	              <div class="modal-footer" id="modal-footer">
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

        <style>
      .ott-logo-img:hover,
      .ott-logo-img.active {
        outline: 3px solid #33ff33;
        border-radius: 10px;
      }
      
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

.page-link {
    color: #ffffff; 
    background-color: #202020;
    border-color: #ffffff;
  }
    
  .page-link:focus, .page-link:hover {
    color: #33ff33;
    background-color: #202020; 
    border-color: #33ff33;
  }
  
    </style>
</body>
</html>