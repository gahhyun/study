package com.ottt.ottt.dto;

//게시판 검색어 관련 DTO
public class ArticleSearchDTO {
	
	private	Integer	offset;	//페이징 구간
	private Integer user_no;	//회원번호
	private String schText;		//검색어
	private String category;	//탭 구분 (내가쓴 게시물, 좋아요누른 게시물, 댓글단 게시물)

	public Integer getOffset() {
		return offset;
	}
	public void setOffset(Integer offset) {
		this.offset = offset;
	}
	public Integer getUser_no() {
		return user_no;
	}
	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}
	public String getSchText() {
		return schText;
	}
	public void setSchText(String schText) {
		this.schText = schText;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "ArticleSearchDTO [offset=" + offset + ", user_no=" + user_no + ", schText=" + schText + ", category="
				+ category + "]";
	}
	
	
}
