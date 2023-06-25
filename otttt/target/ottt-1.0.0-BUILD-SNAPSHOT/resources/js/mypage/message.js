$(document).ready(function() {



//버튼 색, 기본 버튼 받은 쪽지함 설정
  let currentButton = null; // 선택한 버튼을 저장하는 변수
  const recvButton = document.getElementById('btn-recv'); // 받은 쪽지 버튼 요소
  const sendButton = document.getElementById('btn-send'); // 보낸 쪽지 버튼 요소

  // recvButton을 초기 선택 상태로 설정
  recvButton.style.backgroundColor = '#33FF33';
  recvButton.style.color = 'black';
  recvButton.style.fontWeight = '600';
  currentButton = recvButton;

  recvButton.addEventListener('click', () => {
    if (currentButton !== recvButton) { // 이전에 선택한 버튼이 받은 쪽지 버튼이 아닐 경우
      if (currentButton) { // 이전에 선택한 버튼이 존재
        currentButton.style.backgroundColor = ''; // 이전에 선택한 버튼의 색상 원래대로
        currentButton.style.color = '';
        currentButton.style.fontWeight = '';
      }
      recvButton.style.backgroundColor = '#33FF33'; // 현재 선택한 버튼의 색상을 변경
      recvButton.style.color = 'black'; 
      recvButton.style.fontWeight = '600';
      currentButton = recvButton; // 현재 선택한 버튼 저장
    }
  });

  sendButton.addEventListener('click', () => {
    if (currentButton !== sendButton) { // 이전에 선택한 버튼이 보낸 쪽지 버튼이 아닐 경우
      if (currentButton) { // 이전에 선택한 버튼이 존재
        currentButton.style.backgroundColor = '';// 이전에 선택한 버튼의 색상 원래대로
        currentButton.style.color = '';
        currentButton.style.fontWeight = '';
      }
      sendButton.style.backgroundColor = '#33FF33'; // 현재 선택한 버튼의 색상을 변경.
      sendButton.style.color = 'black';
      sendButton.style.fontWeight = '600';
      currentButton = sendButton; // 현재 선택한 버튼 저장
    }
  });
  
//쪽지 리스트 불러오기(받은 / 보낸)
  
  
  
//답장 팝업창
  $('#msg-write').click(function() {
  	var url = "../messagewindow/open";
	window.open(url, 'SEND-MSG', 'width=520, height=750, scrollbars=no');
  });
  
  
  

  
  
  

});