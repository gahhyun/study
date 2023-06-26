package com.ottt.ottt.dto;

import java.util.Date;
import java.util.Objects;
/*
 * --리뷰번호
	review_no			bigint 			generated always as identity primary key
	--영상번호 FK
	,content_no			BIGINT			not null
	--작성자(프로필번호) FK
	,user_no			BIGINT			not null
	--별점
	,rating			 	float			not null
	--내용
	,review_content		varchar(65535)	not null
	--등록날짜
	
 */
public class ReviewDTO {

	private Integer review_no;
	private Integer content_no;			//이건 작품 번호임
	private double rating;
	private Integer user_no;
	private String review_content;
	private Date review_create_dt;
	private Date review_mod_dt;
	private Integer comment_cnt;
	
	private String user_nicknm;
	private String content_nm;
	private String thumbnail;
	
	private int check_like_count;
	private Integer like_count;
	
	private String image;
	private boolean spoiler;

	public boolean isSpoiler() {
		return spoiler;
	}
	public void setSpoiler(boolean spoiler) {
		this.spoiler = spoiler;
	}	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getComment_cnt() {
		return comment_cnt;
	}
	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}
	private UserDTO userDTO;
	public Integer getReview_no() {
		return review_no;
	}
	public void setReview_no(Integer review_no) {
		this.review_no = review_no;
	}
	public int getContent_no() {
		return content_no;
	}
	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public Integer getUser_no() {
		return user_no;
	}
	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_create_dt() {
		return review_create_dt;
	}
	public void setReview_create_dt(Date review_create_dt) {
		this.review_create_dt = review_create_dt;
	}
	public String getUser_nicknm() {
		return user_nicknm;
	}
	public void setUser_nicknm(String user_nicknm) {
		this.user_nicknm = user_nicknm;
	}
	public UserDTO getUserDTO() {
		return userDTO;
	}
	public void setUserDTO(UserDTO userDTO) {
		this.userDTO = userDTO;
	}
	public Date getReview_mod_dt() {
		return review_mod_dt;
	}
	public void setReview_mod_dt(Date review_mod_dt) {
		this.review_mod_dt = review_mod_dt;
	}
		
	public String getContent_nm() {
		return content_nm;
	}
	public void setContent_nm(String content_nm) {
		this.content_nm = content_nm;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public void setContent_no(Integer content_no) {
		this.content_no = content_no;
	}
	public void setComment_cnt(Integer comment_cnt) {
		this.comment_cnt = comment_cnt;
	}
	
	public int getCheck_like_count() {
		return check_like_count;
	}
	public void setCheck_like_count(int check_like_count) {
		this.check_like_count = check_like_count;
	}
	public Integer getLike_count() {
		return like_count;
	}
	public void setLike_count(Integer like_count) {
		this.like_count = like_count;
	}

	@Override
	public String toString() {
		return "ReviewDTO [review_no=" + review_no + ", content_no=" + content_no + ", rating=" + rating + ", user_no="
				+ user_no + ", review_content=" + review_content + ", review_create_dt=" + review_create_dt
				+ ", review_mod_dt=" + review_mod_dt + ", comment_cnt=" + comment_cnt + ", user_nicknm=" + user_nicknm
				+ ", content_nm=" + content_nm + ", thumbnail=" + thumbnail + ", check_like_count=" + check_like_count
				+ ", like_count=" + like_count + ", image=" + image + ", spoiler=" + spoiler + ", userDTO=" + userDTO
				+ "]";
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(content_no, review_no, user_no);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewDTO other = (ReviewDTO) obj;
		return Objects.equals(content_no, other.content_no) && Objects.equals(review_no, other.review_no)
				&& Objects.equals(user_no, other.user_no);
	}
	
}