package com.ottt.ottt.dto;

import java.util.Date;
import java.util.Objects;

/*
	--회원번호
	user_no			bigint			generated always as identity primary key	
	--등급
	,gr_no 			char(1)			default '0'	
	--아이디
	,user_id		varchar(20)		not null	
	--비밀번호
	,user_pwd		varchar(30)		not null	
	--이름
	,user_nm		varchar(15)		not null	
	--닉네임
	,user_nicknm	varchar(20)		not null	
	--성별
	,user_gen		int				not null	
	--이메일
	,user_email		varchar(150)	not null	
	--가입일
	,reg_date		timestamptz		default now()
	--관리자 여부
	,admin			char(1)			default 'N'	
	--프로필 이미지
	,image 			text			default null	
	--팔로잉
	,following		bigint			default 0	
	--팔로워
	,followers 		bigint			default 0	
	--신고개수
	,report_cnt		int				default 0
 */
public class UserDTO {

	private Integer user_no;
	private char 	gr_no;
	private String user_id;
	private String user_pwd;
	private String user_nm;
	private String user_nicknm;
	private Integer user_gen;
	private String user_email;
	private Date 	reg_date;
	private char 	admin;
	private String 	image;
	private Integer following;
	private Integer followers;
	private Integer report_cnt;
	
	public UserDTO() {}
	
	

	public UserDTO(String user_id, String user_pwd, String user_nm, String user_nicknm, int user_gen,
			String user_email) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_nm = user_nm;
		this.user_nicknm = user_nicknm;
		this.user_gen = user_gen;
		this.user_email = user_email;
	}



	public Integer getUser_no() {
		return user_no;
	}

	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}

	public char getGr_no() {
		return gr_no;
	}

	public void setGr_no(char gr_no) {
		this.gr_no = gr_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_nm() {
		return user_nm;
	}

	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}

	public String getUser_nicknm() {
		return user_nicknm;
	}

	public void setUser_nicknm(String user_nicknm) {
		this.user_nicknm = user_nicknm;
	}

	public int getUser_gen() {
		return user_gen;
	}

	public void setUser_gen(int user_gen) {
		this.user_gen = user_gen;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public char getAdmin() {
		return admin;
	}

	public void setAdmin(char admin) {
		this.admin = admin;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getFollowing() {
		return following;
	}

	public void setFollowing(int following) {
		this.following = following;
	}

	public int getFollowers() {
		return followers;
	}

	public void setFollowers(int followers) {
		this.followers = followers;
	}

	public int getReport_cnt() {
		return report_cnt;
	}

	public void setReport_cnt(int report_cnt) {
		this.report_cnt = report_cnt;
	}

	@Override
	public int hashCode() {
		return Objects.hash(user_email, user_gen, user_id, user_nicknm, user_nm, user_no, user_pwd);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserDTO other = (UserDTO) obj;
		return Objects.equals(user_email, other.user_email) && user_gen == other.user_gen
				&& Objects.equals(user_id, other.user_id) && Objects.equals(user_nicknm, other.user_nicknm)
				&& Objects.equals(user_nm, other.user_nm) && Objects.equals(user_no, other.user_no)
				&& Objects.equals(user_pwd, other.user_pwd);
	}

	@Override
	public String toString() {
		return "UserDTO [user_no=" + user_no + ", gr_no=" + gr_no + ", user_id=" + user_id + ", user_pwd=" + user_pwd
				+ ", user_nm=" + user_nm + ", user_nicknm=" + user_nicknm + ", user_gen=" + user_gen + ", user_email="
				+ user_email + ", admin=" + admin + ", image=" + image + ", following=" + following + ", followers="
				+ followers + ", report_cnt=" + report_cnt + "]";
	}
	
	
}
