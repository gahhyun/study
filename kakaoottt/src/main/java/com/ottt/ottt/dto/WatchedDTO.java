package com.ottt.ottt.dto;

import java.util.Date;

/*
 * whatched_no		bigint	generated always as identity primary key
 	,user_no		bigint	not null
	,content_no		bigint	not null
 */
public class WatchedDTO {

	private Integer user_no;
	private Integer content_no;
	private Date watched_date;
	private String content_nm;
	private Float  rating;
	private String thumbnail;
	private Integer	category_no;
	
	
	public Integer getUser_no() {
		return user_no;
	}
	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}
	public Integer getContent_no() {
		return content_no;
	}
	public void setContent_no(Integer content_no) {
		this.content_no = content_no;
	}
	public Date getWatched_date() {
		return watched_date;
	}
	public void setWatched_date(Date watched_date) {
		this.watched_date = watched_date;
	}
	public String getContent_nm() {
		return content_nm;
	}
	public void setContent_nm(String content_nm) {
		this.content_nm = content_nm;
	}
	public Float getRating() {
		return rating;
	}
	public void setRating(Float rating) {
		this.rating = rating;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public Integer getCategory_no() {
		return category_no;
	}
	public void setCategory_no(Integer category_no) {
		this.category_no = category_no;
	}
	@Override
	public String toString() {
		return "WhatchedDTO [user_no=" + user_no + ", content_no=" + content_no + ", watched_date=" + watched_date
				+ ", content_nm=" + content_nm + ", rating=" + rating + ", thumbnail=" + thumbnail + ", category_no="
				+ category_no + "]";
	}

}