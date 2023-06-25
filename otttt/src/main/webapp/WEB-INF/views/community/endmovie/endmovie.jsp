<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>endmovie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script type="text/javascript" src="${path}/resources/js/community/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>  
    <link rel="stylesheet" href="${path}/resources/css/community/endmovie/endmovie.css" >
  </head>

<!--  body  --------------------->
  <body style="background-color: #202020;">
	
     <div class="wrap">
      <header >
        <div class="logo">
          <a href="<c:url value="/" />">
            <img src="${path}/resources/images/logo/OTTT.png" alt="logo">
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
              <a href="<c:url value="/community" />" style="color: #33ff33;">게시판</a>
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
              <a href="<c:url value='/mypage' />">
                <!-- <img src="./images/icon/user01.png" alt="내 정보"> -->
              </a>
            </li>
          </ul>
        </div>
      </header>
      <div id="line-1" >
        <nav class="nav">
          <a class="nav-link1" href="<c:url value='/community' />">자유게시판</a>
          <a class="nav-link1" href="<c:url value='/community/endmovie' />" style="color: #33ff33;">종료예정작</a>
          <a class="nav-link1" href="<c:url value='/community/priceInfoTving' />">가격정보</a>
          <a class="nav-link1" href="<c:url value='/community/QnA' />">Q&A</a>
          <a class="nav-link1" href="<c:url value='/community/notice' />">공지사항</a>
        </nav>
      </div>
      <div id="line-2" >
        <nav class="nav2">
          <button id="ott_1" class="nav-link2"><img class="ott_icon" src="${path}/resources/images/icon/티빙.png" alt="tving"></button>
          <button id="ott_2" class="nav-link2"><img class="ott_icon" src="${path}/resources/images/icon/netplix.png" alt="netflix"></button>
          <button id="ott_3" class="nav-link2"><img class="ott_icon" src="${path}/resources/images/icon/웨이브.png" alt="wavve"></button>
          <button id="ott_4" class="nav-link2"><img class="ott_icon" src="${path}/resources/images/icon/쿠팡플레이.png" alt="coupang"></button>
          <button id="ott_5" class="nav-link2"><img class="ott_icon" src="${path}/resources/images/icon/왓챠.png" alt="watcha"></button>
          <button id="ott_6" class="nav-link2"><img class="ott_icon" src="${path}/resources/images/icon/디즈니플러스.png" alt="disney"></button>
        </nav>
      </div>
	<div class="voucher-inner-wrap">
	<div id="calendar"></div>
	<script type="text/javascript">
	
	var currentDate = new Date();
	var currentMonth = currentDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줌
	var currentMonthInt = parseInt(currentMonth);
	
	const buttons = document.getElementsByClassName("nav-link2")

	let selectedOttNumber = 1

	for (let i=0; i<buttons.length; i++){
		buttons[i].addEventListener("click", function(){
			for(let j=0; j<buttons.length; j++){
				buttons[j].classList.remove("selected")
			}
			this.classList.add("selected")
			const ottNumber = this.id.split("_")[1]; // 버튼의 ID에서 ott 번호 추출
		    selectedOttNumber = ottNumber; // 전역 변수에 선택된 ottNumber 저장
		})
	}

          
	// 월 종료 예정작을 가져오는 API
	async function requestContent(ottNumber, year, month) {
		   const response = await $.ajax({
		   		type: 'POST',
		   		url: '/ottt/community/endmovie/calendar', // endpoint 를 이곳으로
		  		headers: {"Content-Type" : "application/json"},   
		  		data: JSON.stringify({ott_no: ottNumber, year, month}),  
			  })
			return response
	}
	
	// 달력 생성 함수
	function createCalendar(year, month, list = []) {
	    const weekdays = ["일", "월", "화", "수", "목", "금", "토"];
	    const date = new Date(year, month - 1, 1);
	    const firstDay = date.getDay();
	    const lastDate = new Date(year, month, 0).getDate();

	    // HTML 에 만들어둔 CALENDAR 를 가져옴
	    const calendar = document.getElementById("calendar");
	    calendar.innerHTML = "";

	    // 월 선택 드롭다운
	    const selectContainer = document.createElement("div");
	    const selectLabel = document.createElement("label");
	    selectLabel.textContent = "월 선택: ";
	    const selectMonth = document.createElement("select");
	    // 월이 선택되면 CALENDAR 를 그려준다
	    selectMonth.addEventListener("change", async function () {
	      // 서버로부터 종료 예정작을 가져오는 함수를 호출
		console.log(selectedOttNumber, this.value, "hello", typeof selectedOttNumber)
		const result = await requestContent(selectedOttNumber, '2023', this.value)
		console.log(result)
		const contentList = result.resultList
		const selectedMonth = parseInt(this.value)
		createCalendar(year, selectedMonth, contentList)
	      /* 
	      $.ajax({
		    	url: '/endmovie/calendar',
		    	method: 'POST',
		    	data: {
		    		selectedOttNumber: selectedOttNumber,
		    		year: '2023',
		    		month: selectedMonth,
		    		headers: {"content-type" : "application/json"},   // 요청 헤더
		            data: JSON.stringify({day: day, content_nm: content_nm, ott_no: ott_no}),
		    	},
		    	success: function(response){
		    		const result = response;
		    		createCalendar(year, selectedMonth, result)
		    	},
		    	error: function(error) {
		    		console.log(error);
		    	}
		    });
	      */
	    });
	   
	    // 월 선택 option 만들기
	    for (let i = currentMonthInt; i <= currentMonthInt+5; i++) {
	      const option = document.createElement("option");
	      option.value = i;
	      option.textContent = i + "월";
	      if (i === month) {
	        option.selected = true;
	      }
	      selectMonth.appendChild(option);
	    }
	    selectContainer.appendChild(selectLabel);
	    selectContainer.appendChild(selectMonth);
	    calendar.appendChild(selectContainer);

	    // 요일 표시
	    const table = document.createElement("table");
	    const weekdaysRow = document.createElement("tr");
	    for (let i = 0; i < weekdays.length; i++) {
	      const th = document.createElement("th");
	      th.textContent = weekdays[i];
	      weekdaysRow.appendChild(th);
	    }
	    table.appendChild(weekdaysRow);

	    // 날짜 표시
	    let day = 1;
	    for (let i = 0; i < 6; i++) {
	      const row = document.createElement("tr");
	      for (let j = 0; j < 7; j++) {
	        if (i === 0 && j < firstDay) {
	          const emptyCell = document.createElement("td");
	          row.appendChild(emptyCell);
	        } else if (day > lastDate) {
	          break;
	        } else {
	          const cell = document.createElement("td");
	          cell.classList.add("calendar-cell"); // CSS 클래스 추가
	          const cellContent = document.createElement("div");
	          cellContent.textContent = day;
	          cellContent.dataset.date = `${year}-${month}-${day}`; // 날짜 데이터 속성 추가
	          
	          const movieContent = document.createElement("div")
	          const contents = [];
           
	          // content 를 각 월에 추가
			  for (let i = 0; i < list.length; i++) {
			    if (list[i].day === day) {
			      contents.push(list[i].content);
			    }
		  	  }
			 

			  if (contents.length > 0) {
			    for (let j = 0; j < contents.length; j++) {
			      const textNode = document.createTextNode(contents[j]);
			      movieContent.appendChild(textNode);
			    }
			  }
			

	          cell.appendChild(cellContent);
	          cellContent.appendChild(movieContent)
	          row.appendChild(cell);
	          
	          day++;
	        }
	      }
	      
	      table.appendChild(row);
	    }

	    calendar.appendChild(table);
	  }

	  const today = new Date();
	  const year = today.getFullYear();
	  const month = today.getMonth() + 1;
	  createCalendar(year, month, []);
	 
	  
	</script>
 
      </div>
    </div>
  </body>

</html>