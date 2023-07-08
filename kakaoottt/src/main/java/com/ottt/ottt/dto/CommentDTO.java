package com.ottt.ottt.dto;

import java.util.Date;
import java.util.Objects;

/* 댓글
 * 	cmt_no				bigint			generated always as identity primary key
	, user_no			bigint			not null	
	, article_no		bigint
	, review_no			bigint
	, cmt_content		varchar(3000)	not null
	, cmt_writer		varchar(50)		not null
	, cmt_dt			timestamptz		not null
	, cmt_mod_dt		timestamptz		not null
	, cmt_like_count	int				not null
 */

public class CommentDTO {
	
	private	Integer	cmt_no;
	private Integer	user_no;
	private Integer	article_no;
	private Integer review_no;
	private String	cmt_content;
	private String	cmt_writer;
	private Date	cmt_dt;
	private Date	cmt_mod_dt;
	private Integer	cmt_like_count;
	
	private String user_nicknm;
	private String image;
	private String writer_chk;
	public Integer getCmt_no() {
		return cmt_no;
	}
	public void setCmt_no(Integer cmt_no) {
		this.cmt_no = cmt_no;
	}
	public Integer getUser_no() {
		return user_no;
	}
	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}
	public Integer getArticle_no() {
		return article_no;
	}
	public void setArticle_no(Integer article_no) {
		this.article_no = article_no;
	}
	public Integer getReview_no() {
		return review_no;
	}
	public void setReview_no(Integer review_no) {
		this.review_no = review_no;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public String getCmt_writer() {
		return cmt_writer;
	}
	public void setCmt_writer(String cmt_writer) {
		this.cmt_writer = cmt_writer;
	}
	public Date getCmt_dt() {
		return cmt_dt;
	}
	public void setCmt_dt(Date cmt_dt) {
		this.cmt_dt = cmt_dt;
	}
	public Date getCmt_mod_dt() {
		return cmt_mod_dt;
	}
	public void setCmt_mod_dt(Date cmt_mod_dt) {
		this.cmt_mod_dt = cmt_mod_dt;
	}
	public Integer getCmt_like_count() {
		return cmt_like_count;
	}
	public void setCmt_like_count(Integer cmt_like_count) {
		this.cmt_like_count = cmt_like_count;
	}
	public String getUser_nicknm() {
		return user_nicknm;
	}
	public void setUser_nicknm(String user_nicknm) {
		this.user_nicknm = user_nicknm;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getWriter_chk() {
		return writer_chk;
	}
	public void setWriter_chk(String writer_chk) {
		this.writer_chk = writer_chk;
	}
	
	@Override
	public String toString() {
		return "CommentDTO [cmt_no=" + cmt_no + ", user_no=" + user_no + ", article_no=" + article_no + ", review_no="
				+ review_no + ", cmt_content=" + cmt_content + ", cmt_writer=" + cmt_writer + ", cmt_dt=" + cmt_dt
				+ ", cmt_mod_dt=" + cmt_mod_dt + ", cmt_like_count=" + cmt_like_count + ", user_nicknm=" + user_nicknm
				+ ", image=" + image + ", writer_chk=" + writer_chk + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(cmt_no, user_no);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommentDTO other = (CommentDTO) obj;
		return Objects.equals(cmt_no, other.cmt_no) && Objects.equals(user_no, other.user_no);
	}

}
