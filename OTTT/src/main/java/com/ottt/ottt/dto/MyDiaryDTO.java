package com.ottt.ottt.dto;

import java.util.Date;
import java.util.Objects;

/*
 * mydiary_no				bigint			generated always as identity primary key
	,user_no				bigint			not null
	,content_no				bigint			not null
	,public_yn_cd			char(1)			not null
	,mydiary_title			varchar(255)	not null
	,mydiary_content 		varchar(65535)	not null
	,mydiary_create_dt		timestamptz		not null
	,ydiary_create_user		varchar(50)		not null
	,mydiary_mod_dt			timestamptz		null
 */
public class MyDiaryDTO {

	private Integer mydiary_no;
	private int user_no;
	private int content_no;
	private char public_yn_cd;
	private String mydiary_title;
	private String mydiary_content;
	private Date mydiary_create_dt;
	private String ydiary_create_user;
	private Date mydiary_mod_dt;
	
	public MyDiaryDTO() {}

	public Integer getMydiary_no() {
		return mydiary_no;
	}

	public void setMydiary_no(Integer mydiary_no) {
		this.mydiary_no = mydiary_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getContent_no() {
		return content_no;
	}

	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}

	public char getPublic_yn_cd() {
		return public_yn_cd;
	}

	public void setPublic_yn_cd(char public_yn_cd) {
		this.public_yn_cd = public_yn_cd;
	}

	public String getMydiary_title() {
		return mydiary_title;
	}

	public void setMydiary_title(String mydiary_title) {
		this.mydiary_title = mydiary_title;
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

	public String getYdiary_create_user() {
		return ydiary_create_user;
	}

	public void setYdiary_create_user(String ydiary_create_user) {
		this.ydiary_create_user = ydiary_create_user;
	}

	public Date getMydiary_mod_dt() {
		return mydiary_mod_dt;
	}

	public void setMydiary_mod_dt(Date mydiary_mod_dt) {
		this.mydiary_mod_dt = mydiary_mod_dt;
	}

	@Override
	public int hashCode() {
		return Objects.hash(content_no, mydiary_create_dt, mydiary_no, mydiary_title, public_yn_cd, user_no);
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
		return content_no == other.content_no && Objects.equals(mydiary_create_dt, other.mydiary_create_dt)
				&& Objects.equals(mydiary_no, other.mydiary_no) && Objects.equals(mydiary_title, other.mydiary_title)
				&& public_yn_cd == other.public_yn_cd && user_no == other.user_no;
	}

	@Override
	public String toString() {
		return "MyDiaryDTO [mydiary_no=" + mydiary_no + ", user_no=" + user_no + ", content_no=" + content_no
				+ ", public_yn_cd=" + public_yn_cd + ", mydiary_title=" + mydiary_title + ", mydiary_content="
				+ mydiary_content + ", mydiary_create_dt=" + mydiary_create_dt + ", ydiary_create_user="
				+ ydiary_create_user + ", mydiary_mod_dt=" + mydiary_mod_dt + "]";
	}
	
	
}
