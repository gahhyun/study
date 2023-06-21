//게시판 검색어 관련 DTO
public class ArticleSearchDTO {
	
	private	Integer	offset;		//페이징 구간
	private Integer user_no;	//회원번호
	private String  schText;	//검색어
	private String  category;	//탭 구분 (내가쓴 게시물, 좋아요누른 게시물, 댓글단 게시물)

}