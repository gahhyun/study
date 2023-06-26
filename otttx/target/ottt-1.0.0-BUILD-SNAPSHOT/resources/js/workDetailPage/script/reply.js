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