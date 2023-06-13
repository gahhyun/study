package com.ottt.ottt.dto;
import java.util.Date;
import java.util.Objects;

import org.springframework.web.multipart.MultipartFile;

public class ArticleDTO {
	
	private	Integer	article_no;
	private Integer	user_no;
	private char	article_index_no;
	private String	article_content;
	private String	article_image;
	private String	article_title;
	private Date	article_create_dt;
	private Date	article_mod_dt;
	private Integer	like_count;
	private Integer	comment_count;
	private Integer	report_cnt;
	private String  user_nicknm;
	private Integer	check_like_count;
	private MultipartFile upFile;
	private String article_image_name;
	private String image;
	private String	writer_chk;
	
	public String getWriter_chk() {
		return writer_chk;
	}

	public void setWriter_chk(String writer_chk) {
		this.writer_chk = writer_chk;
	}

	public String getUser_nicknm() {
		return user_nicknm;
	}

	public void setUser_nicknm(String user_nicknm) {
		this.user_nicknm = user_nicknm;
	}

	private UserDTO userDTO;
	
	public UserDTO getUserDTO() {
		return userDTO;
	}

	public void setUserDTO(UserDTO userDTO) {
		this.userDTO = userDTO;
	}

	public ArticleDTO() {}
	
	public ArticleDTO(String article_content, int user_no) {
		this.article_content = article_content;
		this.user_no = user_no;
	}

	public Integer getArticle_no() {
		return article_no;
	}

	public void setArticle_no(Integer article_no) {
		this.article_no = article_no;
	}

	public Integer getUser_no() {
		return user_no;
	}

	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}

	public char getArticle_index_no() {
		return article_index_no;
	}

	public void setArticle_index_no(char article_index_no) {
		this.article_index_no = article_index_no;
	}

	public String getArticle_content() {
		return article_content;
	}

	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}

	public String getArticle_image() {
		return article_image;
	}

	public void setArticle_image(String article_image) {
		this.article_image = article_image;
	}

	public String getArticle_title() {
		return article_title;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public Date getArticle_create_dt() {
		return article_create_dt;
	}

	public void setArticle_create_dt(Date article_create_dt) {
		this.article_create_dt = article_create_dt;
	}

	public Date getArticle_mod_dt() {
		return article_mod_dt;
	}

	public void setArticle_mod_dt(Date article_mod_dt) {
		this.article_mod_dt = article_mod_dt;
	}

	public Integer getLike_count() {
		return like_count;
	}

	public void setLike_count(Integer like_count) {
		this.like_count = like_count;
	}

	public Integer getComment_count() {
		return comment_count;
	}

	public void setComment_count(Integer comment_count) {
		this.comment_count = comment_count;
	}

	public Integer getReport_cnt() {
		return report_cnt;
	}

	public void setReport_cnt(Integer report_cnt) {
		this.report_cnt = report_cnt;
	}

	public Integer getCheck_like_count() {
		return check_like_count;
	}

	public void setCheck_like_count(Integer check_like_count) {
		this.check_like_count = check_like_count;
	}

	public MultipartFile getUpFile() {
		return upFile;
	}

	public void setUpFile(MultipartFile upFile) {
		this.upFile = upFile;
	}

	public String getArticle_image_name() {
		return article_image_name;
	}

	public void setArticle_image_name(String article_image_name) {
		this.article_image_name = article_image_name;
	}
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}



	@Override
	public String toString() {
		return "ArticleDTO [article_no=" + article_no + ", user_no=" + user_no + ", article_index_no="
				+ article_index_no + ", article_content=" + article_content + ", article_image=" + article_image
				+ ", article_title=" + article_title + ", article_create_dt=" + article_create_dt + ", article_mod_dt="
				+ article_mod_dt + ", like_count=" + like_count + ", comment_count=" + comment_count + ", report_cnt="
				+ report_cnt + ", user_nicknm=" + user_nicknm + ", check_like_count=" + check_like_count + ", upFile="
				+ upFile + ", article_image_name=" + article_image_name + ", image=" + image + ", writer_chk="
				+ writer_chk + ", userDTO=" + userDTO + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(article_index_no, article_no, user_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ArticleDTO other = (ArticleDTO) obj;
		return article_index_no == other.article_index_no && Objects.equals(article_no, other.article_no)
				&& Objects.equals(user_no, other.user_no);
	}
	
}
