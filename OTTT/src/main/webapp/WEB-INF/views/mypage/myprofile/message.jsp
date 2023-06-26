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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/resources/css/mypage/message.css" >
    
    
    <style type="text/css">
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
    </style>
    
    
  </head>

  <body>     
	<script type="text/javascript">
	$(document).ready(function() {
		$('button[name="deleteBtn"]').on('click', function(event) {
			// 모달 열기
			$('#confirmModal').modal('show');
		
			// Yes 버튼 클릭 시 삭제 동작 실행
			$('#removeBtn').on('click', function() {
				$('#confirmModal').modal('hide');
				deletemsg(event);
			});
		});
		  
		function deletemsg(event) {
			//버튼 테이블에 있는 메세지 넘버 받아오기
		    var messageNo = $(event.target).closest("tr").find("input[name='message_no']").val();
		    
		    //폼태그 생성하기
		    let form = document.createElement('form');
		    //인풋태그 생성하기
		    let input = document.createElement('input');
		    //인풋 속성
		    input.setAttribute('type', 'hidden');
		    input.setAttribute('name', 'message_no');
		    input.setAttribute('value', messageNo);
		    form.appendChild(input);
		    
		    if($('button[name="deleteBtn"]').attr("class") == 'delrecvBtn')
		    	form.setAttribute("action", '/ottt/mypage/message/remove');
		    if($('button[name="deleteBtn"]').attr("class") == 'delsendBtn')
		    	form.setAttribute("action", '/ottt/mypage/message/send/remove');
		    
		    form.setAttribute("method", "post");
		    
		    document.body.appendChild(form);
		    form.submit();
		  }
		  
		})
		
		function goProfile(user_no, user_nicknm) {
			let form = document.createElement('form');				
			
			let data = {
					user_no : user_no,
					toURL : path
		    };
			
			for (let key in data) {
		        if (data.hasOwnProperty(key)) {
		            let obj = document.createElement('input');
		            obj.setAttribute('type', 'hidden');
		            obj.setAttribute('name', key);
		            obj.setAttribute('value', data[key]);
		            form.appendChild(obj);
		        }
		    }
			
			form.setAttribute('method','post')
			form.setAttribute('action','/ottt/profile?user=' +user_nicknm)
							
			document.body.appendChild(form)
			form.submit()
		}	
		
	</script>
    <div class="warp">
    <%@ include file="../../fix/header.jsp" %>
    
    <!-- 삭제 모달 -->
    <div class="modal fade" id="exampleModa2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered">
       <div class="modal-content">
         <div class="modal-header">
           <h1 class="modal-title fs-5" id="exampleModalLabe2">알림</h1>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">쪽지가 삭제됩니다.</div>
         <div class="modal-footer">
           <button type="button" class="btn btn-primary"  data-toggle="modal" id="removeBtn">Yes</button>
           <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
         </div>
       </div>
     </div>
   </div>

      <%@ include file="../../fix/mnb.jsp" %>
        
      <div class="sec00">

        <button type="button" id="btn-recv">받은 쪽지</button>
        <button type="button" id="btn-send">보낸 쪽지</button>

      </div>

      <div class="sec01">
        
        <div class="sec-left">
        	
        	<div class="left-top">
	            <table>
	                <tr>
	                    <th class="msg-img">프로필</th>
	                    <th class="msg-sort" style="width: 188px; padding-right: 20px;">이름</th>
	                    <th class="msg-content">내용</th>
	                    <th class="msg-time">시간</th>
	                    <th class="msg-del">삭제</th>
	                </tr>
	            </table>
            </div>
            <div class="left-bottom">

		            <table>
						<c:if test="${totalCnt == null || totalCnt == 0}">
							<div style="display: flex; margin-top: 20px; justify-content: center; color: #8f8f8f;">보관된 쪽지가 없습니다.</div>
						</c:if>
			            <c:forEach var="messageDTO" items="${list }">
			            <!-- 폼태그를 사용하면 아이디를 쓰든 클래스를 사용하든 맨 위에 잇는 애만 된다 그러니 버튼 누를 때 폼태그 생성 -->
							<tr class="title-line" style="font-weight: 200">
								<td class="msg-no" style="display: none; ">${messageDTO.message_no}</td>
								<input name="message_no" type="hidden" value="${messageDTO.message_no}" />
								<td class="msg-img">
									<a href="javascript:goProfile('${(messageDTO.send_user_no != sessionScope.user_no) ? messageDTO.send_user_no : messageDTO.receive_user_no}', '${messageDTO.user_nicknm}')">
										<img src="${messageDTO.image }" class="user-image" alt="프로필사진" />
									</a>
								</td>
								<td class="msg-nicknm">${messageDTO.user_nicknm }</td>
								<td class="msg-sort" style="display: none; ">${(messageDTO.send_user_no != sessionScope.user_no) ? messageDTO.send_user_no : messageDTO.receive_user_no}</td>
								<td class="msg-content" style="cursor: pointer;"><c:out value="${messageDTO.content }"></c:out></td>
								<td class="msg-time"><fmt:formatDate value="${messageDTO.send_date}" pattern="yyyy-MM-dd HH:mm" type="date" /></td>
								<td class="msg-del"><button class="delBtn" name="deleteBtn" style="border: none; color: red;" id="del" data-bs-toggle="modal" data-bs-target="#exampleModa2"><i class="fas fa-times"></i></button></td>
							</tr>			            
			            </c:forEach>			           
					</table>
				</div>
			<br />
			<div class="paging-container">
				<div class="paging">
						<c:if test="${totalCnt != null || totalCnt != 0 }">
							<c:if test="${mpr.showPrev }">
								<a class="page" href="<c:url value="${mpr.msc.getQueryString(mpr.beginPage-1) }" />">&lt;</a>
							</c:if>
							<c:forEach var="i" begin="${mpr.beginPage }" end="${mpr.endPage }">
								<a class="page" href="<c:url value="${mpr.msc.getQueryString(i) }" />">${i }</a>
							</c:forEach>
							<c:if test="${mpr.showNext }">
								<a class="page" href="<c:url value="${mpr.msc.getQueryString(mpr.endPage+1) }" />">&gt;</a>
							</c:if>
						</c:if>
				</div>
			</div>
        </div>

        <div class="sec-right">
        	<input name="msgno" type="hidden" value="" />
        	<input name="sendno" type="hidden" value="${messageDTO.send_user_no}" />
            <div class="msg-nick" id="msgNick">${messageDTO.user_nicknm }</div>
	        <div class="msg-view-content" style="white-space: pre-wrap;">${messageDTO.content }</div>
	        <c:if test="${messageDTO.send_user_no != sessionScope.user_no }">
	        	<button type="button" id="msg-write" class="msg-write-btn" >답장</button>
        	</c:if>
        </div>

      </div>
	  
    </div>
  </body>
</html>