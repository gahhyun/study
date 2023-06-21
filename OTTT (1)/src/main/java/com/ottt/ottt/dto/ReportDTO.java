package com.ottt.ottt.dto;

import java.util.Date;
import java.util.Objects;

/*	신고
 * 	report_no		bigint primary key
	, user_no		bigint not null	
	, target_user_no	bigint not null	
	, article_no	bigint not null	
	, cmt_no		bigint not null	
	, report_type	char(1) not null
	, report_date	date not null
 */

public class ReportDTO {
	
	private Integer report_no;
	private Integer user_no;
	private Integer	target_user_no;
	private Integer	article_no;
	private Integer	review_no;
	private Integer	cmt_no;
	private char	report_type;
	private Date	report_date;
	

	public ReportDTO() {}


	public Integer getReport_no() {
		return report_no;
	}


	public void setReport_no(Integer report_no) {
		this.report_no = report_no;
	}


	public Integer getUser_no() {
		return user_no;
	}


	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}


	public Integer getTarget_user_no() {
		return target_user_no;
	}


	public void setTarget_user_no(Integer target_user_no) {
		this.target_user_no = target_user_no;
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


	public Integer getCmt_no() {
		return cmt_no;
	}


	public void setCmt_no(Integer cmt_no) {
		this.cmt_no = cmt_no;
	}


	public char getReport_type() {
		return report_type;
	}


	public void setReport_type(char report_type) {
		this.report_type = report_type;
	}


	public Date getReport_date() {
		return report_date;
	}


	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}


	@Override
	public String toString() {
		return "ReportDTO [report_no=" + report_no + ", user_no=" + user_no + ", target_user_no=" + target_user_no
				+ ", article_no=" + article_no + ", review_no=" + review_no + ", cmt_no=" + cmt_no + ", report_type="
				+ report_type + ", report_date=" + report_date + "]";
	}


	@Override
	public int hashCode() {
		return Objects.hash(article_no, user_no);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReportDTO other = (ReportDTO) obj;
		return Objects.equals(article_no, other.article_no) && Objects.equals(user_no, other.user_no);
	}	
	
}