package com.ottt.ottt.dto;

import java.util.Objects;

/*알림
 * 	not_no				bigint	generated always as identity primary key
	, user_no			bigint	not null
	, target_user_no	bigint	not null
	, message_no		bigint	not null
	, article_no		bigint	not null
	, cmt_no			bigint	not null
	, review_like_no	bigint	not null
	, article_like_no	bigint	not null
	, comment_like_no	bigint	not null
	, not_check			char(1)	not null
	, not_url			text	not null
	, not_message		varchar	not null
 */

public class NotificationDTO {
	
	private	Integer	not_no;
	private int		user_no;
	private int		target_user_no;
	private int		message_no;
	private int		article_no;
	private int		cmt_no;
	private int		review_like_no;
	private int		article_like_no;
	private int		cmt_like_no;
	private char	not_check;
	private String	not_url;
	private String	not_message;
	
	
	public NotificationDTO() {}


	public Integer getNot_no() {
		return not_no;
	}


	public void setNot_no(Integer not_no) {
		this.not_no = not_no;
	}


	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public int getTarget_user_no() {
		return target_user_no;
	}


	public void setTarget_user_no(int target_user_no) {
		this.target_user_no = target_user_no;
	}


	public int getMessage_no() {
		return message_no;
	}


	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}


	public int getArticle_no() {
		return article_no;
	}


	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}


	public int getCmt_no() {
		return cmt_no;
	}


	public void setCmt_no(int cmt_no) {
		this.cmt_no = cmt_no;
	}


	public int getReview_like_no() {
		return review_like_no;
	}


	public void setReview_like_no(int review_like_no) {
		this.review_like_no = review_like_no;
	}


	public int getArticle_like_no() {
		return article_like_no;
	}


	public void setArticle_like_no(int article_like_no) {
		this.article_like_no = article_like_no;
	}


	public int getCmt_like_no() {
		return cmt_like_no;
	}


	public void setCmt_like_no(int cmt_like_no) {
		this.cmt_like_no = cmt_like_no;
	}


	public char getNot_check() {
		return not_check;
	}


	public void setNot_check(char not_check) {
		this.not_check = not_check;
	}


	public String getNot_url() {
		return not_url;
	}


	public void setNot_url(String not_url) {
		this.not_url = not_url;
	}


	public String getNot_message() {
		return not_message;
	}


	public void setNot_message(String not_message) {
		this.not_message = not_message;
	}


	@Override
	public int hashCode() {
		return Objects.hash(article_like_no, article_no, cmt_like_no, cmt_no, message_no, not_check, not_message,
				not_no, not_url, review_like_no, target_user_no, user_no);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		NotificationDTO other = (NotificationDTO) obj;
		return article_like_no == other.article_like_no && article_no == other.article_no
				&& cmt_like_no == other.cmt_like_no && cmt_no == other.cmt_no && message_no == other.message_no
				&& not_check == other.not_check && Objects.equals(not_message, other.not_message)
				&& Objects.equals(not_no, other.not_no) && Objects.equals(not_url, other.not_url)
				&& review_like_no == other.review_like_no && target_user_no == other.target_user_no
				&& user_no == other.user_no;
	}


	@Override
	public String toString() {
		return "NotificationDTO [not_no=" + not_no + ", user_no=" + user_no + ", target_user_no=" + target_user_no
				+ ", message_no=" + message_no + ", article_no=" + article_no + ", cmt_no=" + cmt_no
				+ ", review_like_no=" + review_like_no + ", article_like_no=" + article_like_no + ", cmt_like_no="
				+ cmt_like_no + ", not_check=" + not_check + ", not_url=" + not_url + ", not_message=" + not_message
				+ "]";
	}
	
	
	
	
	

}
