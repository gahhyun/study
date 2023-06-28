var isScrolling = false;  // 스크롤 이벤트 발생 여부를 저장하는 변수

function resize(obj) {
  obj.style.height = '1px';
  obj.style.height = (12 + obj.scrollHeight) + 'px';

  if (!isScrolling) {
    const scrollPos = window.scrollY || document.documentElement.scrollTop || document.body.scrollTop;
    window.scrollTo(0, scrollPos);
    isScrolling = true;
    setTimeout(function() {
      isScrolling = false;
    }, 100);  // 0.1초 후에 스크롤 이벤트 허용
  }
}

// textarea의 input 이벤트에 이벤트 리스너 추가
document.getElementById('article_content').addEventListener('input', function() {
  if (!isScrolling) {
    const scrollPos = window.scrollY || document.documentElement.scrollTop || document.body.scrollTop;
    window.scrollTo(0, scrollPos);
    isScrolling = true;
    setTimeout(function() {
      isScrolling = false;
    }, 100);  // 0.1초 후에 스크롤 이벤트 허용
  }
});