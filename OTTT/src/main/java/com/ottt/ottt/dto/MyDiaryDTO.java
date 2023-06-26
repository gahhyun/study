package com.ottt.ottt.dto;

import java.util.Date;
import java.util.Objects;

/* user_no					bigint			not null
	,content_no				bigint			not null
	,public_yn_cd			char(1)			default '0'
	,mydiary_title			varchar(255)	not null
	,mydiary_content 		varchar(65535)	not null
	,mydiary_create_dt		timestamptz		default now()
	,mydiary_mod_dt			timestamptz		default null
	,constraint my_diary primary key (user_no, content_no)
 */
public class MyDiaryDTO {

	private Integer user_no;
	private Integer content_no;
	private char public_yn_cd;
	private String mydiary_content;
	private Date mydiary_create_dt;
	private Date mydiary_mod_dt;
	
	private String content_nm;
	private String thumbnail;
	private String user_nicknm;
	
	
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
	public char getPublic_yn_cd() {
		return public_yn_cd;
	}
	public void setPublic_yn_cd(char public_yn_cd) {
		this.public_yn_cd = public_yn_cd;
	}
	public String getMydiary_content() {
		return mydiary_content;
	}
	public void setMydiary_content(String mydiary_content) {
		this.mydiary_content = mydiary_content;
	}
	public Date getMydiary_create_dt() {
		return mydiary_create_dt;
	}
	public void setMydiary_create_dt(Date mydiary_create_dt) {
		this.mydiary_create_dt = mydiary_create_dt;
	}
	public Date getMydiary_mod_dt() {
		return mydiary_mod_dt;
	}
	public void setMydiary_mod_dt(Date mydiary_mod_dt) {
		this.mydiary_mod_dt = mydiary_mod_dt;
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
	public String getUser_nicknm() {
		return user_nicknm;
	}
	public void setUser_nicknm(String user_nicknm) {
		this.user_nicknm = user_nicknm;
	}
	@Override
	public String toString() {
		return "MyDiaryDTO [user_no=" + user_no + ", content_no=" + content_no + ", public_yn_cd=" + public_yn_cd
				+ ", mydiary_content=" + mydiary_content + ", mydiary_create_dt=" + mydiary_create_dt
				+ ", mydiary_mod_dt=" + mydiary_mod_dt + ", content_nm=" + content_nm + ", thumbnail=" + thumbnail
				+ ", user_nicknm=" + user_nicknm + "]";
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(content_no, user_no);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MyDiaryDTO other = (MyDiaryDTO) obj;
		return Objects.equals(content_no, other.content_no) && Objects.equals(user_no, other.user_no);
	}
		
}
