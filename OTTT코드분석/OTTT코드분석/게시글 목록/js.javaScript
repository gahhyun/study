
// *	신고하기
// *	@param article_no 
// *	@param target_user_no
// *	@param report_type  

function fnInsertReport(article_no,  target_user_no, report_type){

 if(LOGIN_YN == null || LOGIN_YN == ""){
     swal("로그인 후 이용가능합니다.","로그인을 해주세요.", "warning")
     .then(function(){
         location.href="/ottt/login";                   
     });
     return;					
 }
    
    let data = {
        "article_no" : article_no
        , "target_user_no" : target_user_no
        , "report_type" : report_type
    }
    
    $.post(
        //PATH는? /otttt 임
        PATH+"/community/ajax/insertReport"
        , data 
        , function(response){
         console.log("신고저장 ajax 통신결과");
            console.log(response);		
            if(response.result > 0){
                $(".body").html(response.message);
                   $("#postMainModal").modal("show");
            }else {
                $(".body").html(response.message)
                   $("#postMainModal").modal("show");					
            }								
        }
    );		
    
}