$(document).ready(function() {

	$('.write textarea').keyup(function(){
	  var content = $(this).val();
	  $('.write .count span').html(content.length);
	  if (content.length > 1000){
		alert("최대 1000자까지 입력 가능합니다.");
	    $(this).val(content.substring(0, 1000));
	    $('.write .count span').html(1000);
	  }
	});

});