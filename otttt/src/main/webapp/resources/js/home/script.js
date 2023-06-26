var p = 0;
var max = 7;

function slide02() {
  // next 1
  $(".right-button1").click(function() {
    if (p < max) {
      p++;
    } else {
      $(".posterzip1").css({left: 0});
      p = 0;
    }
    $(".posterzip1").stop().animate({left: -164 * p}, 100);
  });

  $(".left-button1").click(function() {
    if (p === 0) {
      $(".posterzip1").css({left: -164 * max});
      p = max;
    } else {
      p--;
    }
    $(".posterzip1").stop().animate({left: -164 * p}, 100);
  });
  
  // 마지막 이미지까지 갔을 때, 첫번째 이미지가 다음으로 나오도록 수정
  if (p === max) {
    $(".posterzip1").css({left: -164 * (max-1)});
  }


  // next 2
  $(".right-button2").click(function() {
    if (p < max) {
      p++;
    } else {
      $(".posterzip2").css({left: 0});
      p = 0;
    }
    $(".posterzip2").stop().animate({left: -164 * p}, 100);
  });

  $(".left-button2").click(function() {
    if (p === 0) {
      $(".posterzip2").css({left: -164 * max});
      p = max;
    } else {
      p--;
    }
    $(".posterzip2").stop().animate({left: -164 * p}, 100);
  });
  
  // 마지막 이미지까지 갔을 때, 첫번째 이미지가 다음으로 나오도록 수정
  if (p === max) {
    $(".posterzip2").css({left: -164 * (max-1)});
  }

  // next 3
  $(".right-button3").click(function() {
    if (p < max) {
      p++;
    } else {
      $(".posterzip3").css({left: 0});
      p = 0;
    }
    $(".posterzip3").stop().animate({left: -164 * p}, 100);
  });

  $(".left-button3").click(function() {
    if (p === 0) {
      $(".posterzip3").css({left: -164 * max});
      p = max;
    } else {
      p--;
    }
    $(".posterzip3").stop().animate({left: -164 * p}, 100);
  });
  
  // 마지막 이미지까지 갔을 때, 첫번째 이미지가 다음으로 나오도록 수정
  if (p === max) {
    $(".posterzip3").css({left: -164 * (max-1)});
  }
}

$(document).ready(function() {
  slide02();
});
