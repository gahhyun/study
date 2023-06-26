$(document).ready(function() {
	//글자수제한
	$(".write textarea").keyup(function(){
	  var content = $(this).val()
	  $(".write .count span").html(content.length)
	  if (content.length > 500){
		alert("최대 500자까지 입력 가능합니다.")
	    $(this).val(content.substring(0, 500))
	    $(".write .count span").html(500)
	  }
	})
	
	//이름 넘기기
	var sendUserNo = getParameterByName("user_nicknm") + " 님"
	$(".nickname").text(sendUserNo)
	
	//쪽지 전송하기

})

//이름 가져오기
function getParameterByName(name) {
  name = name.replace(/[\[\]]/g, "\\$&")
  var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)")
  var results = regex.exec(window.location.href)
  if (!results) return null
  if (!results[2]) return ''
  return decodeURIComponent(results[2].replace(/\+/g, " "))
}