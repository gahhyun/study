$(document).ready(function(){

  // 동영상 팝업
  $(".popupback").hide();
  $(".popup-video").hide();
  $(".popup-video li").hide();
  $(".fs_video > div").click(function(){

    var i = $(this).index();

    $(".popupback").fadeIn();
    $(".popup-video").fadeIn();
    $(".popup-video  li").eq(i).show();
  });

  $(".popupback").click(function(){

    $(".popupback").fadeOut();
    $(".popup-video").fadeOut();
    $(".popup-video li").fadeOut();

  });

//   $(document).ready(function(){
    
//     //변수선언 자바스크립트의 const는 상수임 자바의 static느낌?? 상수가 아니라 변수를 사용할 경우는 let,var사용하면댐
//     const reviewButton = document.getElementById('review-button');
//     const reviewPopup = document.getElementById('review-popup');
//     const cancelButton = document.getElementById('cancel-review');
//     const submitButton = document.getElementById('submit-review');
//     const reviewResult = document.getElementById('review-result');
    
    
//     reviewButton.addEventListener('click', () => {
//       reviewPopup.style.display = 'block';
//     });
    
//     submitButton.addEventListener('click', (event) => {
//       event.preventDefault();
//       const reviewText = document.getElementById('review-text').value;
     
//       // 팝업창 닫기
//       reviewPopup.style.display = 'none';
    
//       // 리뷰가 등록된 review-result 요소 업데이트
//       reviewResult.innerText = reviewText;
//     });
    
//     cancelButton.addEventListener('click', () => {
//       reviewPopup.style.display = 'none';
//     });
    


// });

$(document).ready(function() {
  const reviewButton = document.getElementById('review-button');
  const reviewPopup = document.getElementById('review-popup');
  const cancelButton = document.getElementById('cancel-review');
  const submitButton = document.getElementById('submit-review');
  const reviewsContainer = document.getElementById('reviews-container');
  const reviewResult = document.getElementById('review-result');
  
  reviewButton.addEventListener('click', () => {
    reviewPopup.style.display = 'block';
    $(".review-back").fadeIn();
    $(".popup11").fadeIn();
  });

  submitButton.addEventListener('click', (event) => {
    event.preventDefault();
    const reviewText = document.getElementById('review-text').value;

    // 팝업창 닫기
    reviewPopup.style.display = 'none';
    $(".review-back").fadeOut();
    // 새로운 리뷰 결과 요소 만들기
    const newReview = document.createElement('div');
    newReview.classList.add('right-box');
    newReview.innerHTML = `
    <div class="review-box">
      <div class="review-box-header">
        <div class="user-icon">
          <img src="./images/icon/user.png" alt="유저 이미지파일">
        </div>
        <div class="user-name">
          <a href="#">
            유저 닉네임
          </a>
        </div>
            <div class="heart">        
                <div>
                  <div class="heart_img"></div>
                </div>             
            </div>

      </div>
      <div class="review-box-body">
      <p class="review-box-text">${reviewText}</p>
      </div>
      <div class="review-box-footer">
        <div class="f-left">


              <div class="like">
                <img src="./images/icon/좋아요.png" alt="좋아요아이콘">
              </div>
              <div class="like-count">
                <p>
                  0개
                </p>
              </div>


              <div class="footer-comment">
                <img src="./images/icon/댓글.png" alt="댓글아이콘">
              </div>
              <div class="comment-count">
                <p>
                  0개
                </p>
              </div>
        </div>
        <div class="f-right">
              <div class="report">
                  <button><p>수정하기</p></button>
              </div>
        </div>
      </div>
    </div>
    `;

    // 리뷰 결과 요소를 리뷰 컨테이너 맨 위에 추가
    reviewsContainer.insertBefore(newReview, reviewsContainer.firstChild);

    //수정하기 버튼

    //수정하기 버튼누를 시 내가 작성한 팝업창 다시띄우기

    
  });

  cancelButton.addEventListener('click', () => {
    reviewPopup.style.display = 'none';
    $(".review-back").fadeOut();
  });
});
    
  // 슬라이드

  var s = 0;
  function slide01(){

    //next
    $(".button1").click(function(){
      if(s>=1){

      s=0;

    }else{

      s++;

    }
    
    $(".fs_video").stop().animate({left: -197 * s},500);
  });

  };

  

  // setInterval(slide01,2000);
  $(document).ready(function(){
    slide01();
});



// main-p slide


 // 슬라이드
 var p = 0;

 function slide02() {
 
   //next
   $(".button2").click(function() {
     if (p >= 24) {
       p = 0;
     } else {
       p++;
     }
     $(".phozip").stop().animate({left: -401 * p}, 500);
   });
 
   //previous
   $(".button3").click(function() {
     if (p <= 0) {
       p = 24;
     } else {
       p--;
     }
     $(".phozip").stop().animate({left: -400.7 * p}, 500);
   });
 };
 
 $(document).ready(function() {
   slide02();
 });
//블러
$(".review-blur").click(function(){

  $(this).fadeOut();

});


});


var p = 0;
var max = 5;

function slide02() {
  // next 1
  $(".right-button").click(function() {
    if (p < max) {
      p++;
    } else {
      $(".posterzip").css({left: 0});
      p = 1;
    }
    $(".posterzip").stop().animate({left: -164 * p}, 100);
  });

  $(".left-button").click(function() {
    if (p === 0) {
      $(".posterzip").css({left: -164 * max});
      p = max-1;
    } else {
      p--;
    }
    $(".posterzip").stop().animate({left: -164 * p}, 100);
  });
}

$(document).ready(function() {
  slide02();
});

$(document).ready(function(){


  $(".popupback1").hide();
  $(".popup-photo").hide();
  $(".popup-photo li").hide();
  $(".phozip div").click(function(){

    var i = $(this).index();

    $(".popupback1").fadeIn();
    $(".popup-photo").fadeIn();
    $(".popup-photo  li").eq(i).show();
  });

  $(".popupback1").click(function(){

    $(".popupback1").hide();
    $(".popup-photo").hide();
    $(".popup-photo li").hide();

  });
});