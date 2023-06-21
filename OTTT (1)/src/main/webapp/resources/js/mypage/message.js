$(document).ready(function() {
	//기본: 답장 버튼 숨기기
	$("#msg-write").hide();
	
	// 버튼 색 설정
	const recvButton = $("#btn-recv")
	const sendButton = $("#btn-send")
	const delButton = $('button[name="deleteBtn"]')
	
	recvButton.click(function() {
	  if (!recvButton.hasClass("active")) {
	    $(".sec00 button").removeClass("active")
	    recvButton.addClass("active")
	    delButton.attr("class", "delrecvBtn");
	    localStorage.setItem("selectedButton", "recv") // 선택한 버튼 정보를 로컬 스토리지에 저장
	  }
	})
	
	sendButton.click(function() {
	  if (!sendButton.hasClass("active")) {
	    $(".sec00 button").removeClass("active")
	    sendButton.addClass("active")
	    delButton.attr("class", "delsendBtn");
	    localStorage.setItem("selectedButton", "send") // 선택한 버튼 정보를 로컬 스토리지에 저장
	  }
	})
	
	// 페이지 로딩 시 초기 선택 상태 설정
	const selectedButton = localStorage.getItem("selectedButton")
	if (selectedButton === "recv") {
	  recvButton.addClass("active")
	  delButton.attr("class", "delrecvBtn");
	  
	} else if (selectedButton === "send") {
	  sendButton.addClass("active")
	  	  delButton.attr("class", "delsendBtn");
	}	
	
	//쪽지 리스트 불러오기(받은 / 보낸)
	  $("#btn-recv").click(function() {
	    $.ajax({
	      url: '/ottt/mypage/message',
	      type: 'GET',
	      success: function(data) {
	        console.log("받은 쪽지 목록을 가져옴")
	        
	        $(".left-bottom table").empty()
	        
	        if(!Array.isArray(data) || data.length === 0) {
	        	$(".left-bottom table").append('<div style="display: flex; margin-top: 20px; justify-content: center; color: #8f8f8f;">보관된 쪽지가 없습니다.</div>')
	        } else {
	        	let rows = ''
	        	
	        	$.each(data, function(index, message) {
	        		rows += '<tr class="title-line" style="font-weight: 200">'
	        		rows += '<td class="msg-img">픞</td>'
	        		rows += '<td class="msg-nicknm">'	+ message.user_nicknm	+ '</td>'
	        		rows += '<td class="msg-name">'		+ message.send_user_no	+ '</td>'
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
	        	$(".left-bottom table").append('<div style="display: flex; margin-top: 20px; justify-content: center; color: #8f8f8f;">보관된 쪽지가 없습니다.</div>')
	        } else {
                let rows = ''
                
                $.each(data, function(index, message) {
                    rows += '<tr class="title-line" style="font-weight: 200">'
                    rows += '<td class="msg-img">픞</td>'
                    rows += '<td class="msg-nicknm">'	+ message.user_nicknm	+ '</td>'
                    rows += '<td class="msg-name">'		+ message.receive_user_no	+ '</td>'
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
      
	//해결
	$("li a").click(function() {
	  if ($(this).attr("href") === "/ottt/mypage/message") {
	    $("#btn-recv").addClass("active")
	    $("#btn-send").removeClass("active")
	    localStorage.setItem("selectedButton", "recv")
	  }
	})
	
	
	//쪽지 내용, 상대 닉네임 불러오기, 내용 있을 시 답장 버튼 불러옴
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
	    var sendUserNo = $(this).siblings(".msg-name").text()
	    $('input[name=msgno]').val(msgNo)
	    $('input[name=sendno]').val(sendUserNo)
	    
	    var url = "/ottt/messagewindow/open?message_no=" + encodeURIComponent(msgNo) + "&send_user_no=" + encodeURIComponent(sendUserNo)
	    $("#msg-write").attr("data-url", url) // 답장 버튼에 URL을 저장
	
	    var sendUserNk = $(this).siblings(".msg-nicknm").text()
	    $("#msg-number").text(msgNo)
	    $("#msgNick").text(sendUserNk)
	})


	//답장 새창
	$("#msg-write").click(function() {
	   var url = $(this).attr("data-url")
	   window.open(url, 'SEND-MSG', 'width=520, height=750, scrollbars=no')
	})

})
