$(document).ready(function() {

	const recvButton = $("#btn-recv")
	const sendButton = $("#btn-send")
	const delButton = $('button[name="deleteBtn"]')

	// 기본: 답장 버튼 숨기기
	$("#msg-write").hide();
	
	// 페이지를 불러올 때 세션에 있는 현재 버튼에 따라 삭제 버튼에 서로 다른 클래스 주기
	const selectedButton = sessionStorage.getItem("selectedButton")
	if (selectedButton === "recv") {
	  recvButton.addClass("active")
	  delButton.attr("class", "delrecvBtn");
	} else if (selectedButton === "send") {
	  sendButton.addClass("active")
	  delButton.attr("class", "delsendBtn");
	}	
	
	// 보낸 쪽지 / 받은 쪽지 버튼을 눌렀을 때 삭제 버튼에 서로 다른 클래스 주기
	recvButton.click(function() {
	  if (!recvButton.hasClass("active")) {
	    $(".sec00 button").removeClass("active")
	    recvButton.addClass("active")
	    delButton.attr("class", "delrecvBtn");
	    sessionStorage.setItem("selectedButton", "recv") // 선택한 버튼 정보를 세션 스토리지에 저장
	  }
	})
	sendButton.click(function() {
	  if (!sendButton.hasClass("active")) {
	    $(".sec00 button").removeClass("active")
	    sendButton.addClass("active")
	    delButton.attr("class", "delsendBtn");
	    sessionStorage.setItem("selectedButton", "send") // 선택한 버튼 정보를 세션 스토리지에 저장
	  }
	})
	
	// 쪽지 리스트 불러오기(받은 / 보낸)
	  $("#btn-recv").click(function() {
	    $.ajax({
	      url: '/ottt/mypage/message',
	      type: 'GET',
	      success: function(data) {
	        console.log("받은 쪽지 목록을 가져옴")
	        
	        $(".left-bottom table").empty()
	        
	        if(!Array.isArray(data) || data.length === 0) {
	        	$(".left-bottom table").append('<div></div>')
	        } else {
	        	let rows = ''
	        	
	        	$.each(data, function(index, message) {
	        		rows += '<tr class="title-line" style="font-weight: 200">'
	        		rows += '<td class="msg-img">'		+ message.image			+ '</td>'
	        		rows += '<td class="msg-nicknm">'	+ message.user_nicknm	+ '</td>'
	        		rows += '<td class="msg-sort">'		+ message.send_user_no	+ '</td>'
	        		rows += '<td class="msg-content">'	+ message.content		+ '</td>'
	        		rows += '<td class="msg-time">'		+ message.send_date		+ '</td>'
	        		rows += '<td class="msg-del"><button class="delBtn" style="border: none; color: red;"><i class="fas fa-times"></i></button></td>'
	        		rows += '</tr>'
	        	})
	        	$(".left-bottom table").append(rows)
	        }
	        location.href="/ottt/mypage/message"
	      },
	      error: function() {
	        alert("error")
	        sendButton.click();
	      }
	    })
	  })
	  
    $("#btn-send").click(function() {
        $.ajax({
          url: '/ottt/mypage/message/send',
          type: 'GET',
          success: function(data) {
            console.log("보낸 쪽지 목록을 가져옴")
            
            $(".left-bottom table").empty()

            if(!Array.isArray(data) || data.length === 0) {
	        	$(".left-bottom table").append('<div></div>')
	        } else {
                let rows = ''
                
                $.each(data, function(index, message) {
                    rows += '<tr class="title-line" style="font-weight: 200">'
                    rows += '<td class="msg-img">'		+ message.image			+ '</td>'
                    rows += '<td class="msg-nicknm">'	+ message.user_nicknm	+ '</td>'
                    rows += '<td class="msg-sort">'		+ message.receive_user_no	+ '</td>'
                    rows += '<td class="msg-content">'	+ message.content		+ '</td>'
                    rows += '<td class="msg-time">'		+ message.send_date		+ '</td>'
                    rows += '<td class="msg-del"><button class="delBtn" style="border: none; color: red;"><i class="fas fa-times"></i></button></td>'
                    rows += '</tr>'
                })
                $(".left-bottom table").append(rows)
            }
            location.href="/ottt/mypage/message/send"
		    },
          error: function() {
            alert("error")
            recvButton.click();
          }
        })
      })
      	
	
	// 쪽지 내용, 상대 닉네임 불러오기, 내용 있을 시 답장 버튼 불러옴
	$(".msg-content").click(function() {
	    var content = $(this).text()
	    $(".msg-view-content").text(content)
	
	    if ((content !== "") && recvButton.hasClass("active")) {
	        $(".msg-write-btn").show()
	    } else {
	        $(".msg-write-btn").hide()
	    }
		
		//선택한 쪽지의 번호와 보낸 유저의 번호를 답장 창 url로 넘기기
	    var msgNo = $(this).siblings(".msg-no").text()
	    var sendUserNo = $(this).siblings(".msg-sort").text()
	    $('input[name=msgno]').val(msgNo)
	    $('input[name=sendno]').val(sendUserNo)
	    
	    var url = "/ottt/messagewindow/open?send_user_no=" + encodeURIComponent(sendUserNo) + "&message_no=" + encodeURIComponent(msgNo)
	    $("#msg-write").attr("data-url", url) // 답장 버튼에 URL을 저장
	
	    var sendUserNk = $(this).siblings(".msg-nicknm").text()
	    $("#msg-number").text(msgNo)
	    $("#msgNick").text(sendUserNk)
	})

	// 답장 새창
	$("#msg-write").click(function() {
	   var url = $(this).attr("data-url")
	   window.open(url, 'SEND-MSG', 'width=520, height=750, scrollbars=no')
	})
	
	// 경로마다 해당되는 버튼에 active 클래스 주기
	const currentPath = window.location.pathname;
	if (currentPath === '/ottt/mypage/message') {
	  recvButton.addClass('active');
	  sendButton.removeClass('active');
	} else if (currentPath === '/ottt/mypage/message/send') {
	  recvButton.removeClass('active');
	  sendButton.addClass('active');
	}
	
})
