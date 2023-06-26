package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * --내용번호
	article_content_no	bigint			generated always as identity primary key	
	--사진번호 FK
	,picture_no			bigint			null	
	--내용
	,article_content	varchar(65535)	not null
 */
public class ArticleContentDTO {

	private Integer article_content_no;
	private int picture_no;
	private String article_content;
	
	public ArticleContentDTO() {}

	public Integer getArticle_content_no() {
		return article_content_no;
	}

	public void setArticle_content_no(Integer article_content_no) {
		this.article_content_no = article_content_no;
	}

	public int getPicture_no() {
		return picture_no;
	}

	public void setPicture_no(int picture_no) {
		this.picture_no = picture_no;
	}

	public String getArticle_content() {
		return article_content;
	}

	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}

	@Override
	public int hashCode() {
		return Objects.hash(article_content, article_content_no, picture_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ArticleContentDTO other = (ArticleContentDTO) obj;
		return Objects.equals(article_content, other.article_content)
				&& Objects.equals(article_content_no, other.article_content_no) && picture_no == other.picture_no;
	}

	@Override
	public String toString() {
		return "ArticleContentDTO [article_content_no=" + article_content_no + ", picture_no=" + picture_no
				+ ", article_content=" + article_content + "]";
	}
	
	
}
