package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * skin_list_no			bigint	generated always as identity primary key
	,user_no				bigint	not null
	,mypage_background_no	bigint	not null
	,profile_border_no		bigint	not null
 */
public class SkinListDTO {

	private Integer skin_list_no;
	private int user_no;
	private int mypage_background_no;
	private int profile_border_no;
	
	public SkinListDTO() {}

	public Integer getSkin_list_no() {
		return skin_list_no;
	}

	public void setSkin_list_no(Integer skin_list_no) {
		this.skin_list_no = skin_list_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getMypage_background_no() {
		return mypage_background_no;
	}

	public void setMypage_background_no(int mypage_background_no) {
		this.mypage_background_no = mypage_background_no;
	}

	public int getProfile_border_no() {
		return profile_border_no;
	}

	public void setProfile_border_no(int profile_border_no) {
		this.profile_border_no = profile_border_no;
	}

	@Override
	public int hashCode() {
		return Objects.hash(mypage_background_no, profile_border_no, skin_list_no, user_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SkinListDTO other = (SkinListDTO) obj;
		return mypage_background_no == other.mypage_background_no && profile_border_no == other.profile_border_no
				&& Objects.equals(skin_list_no, other.skin_list_no) && user_no == other.user_no;
	}

	@Override
	public String toString() {
		return "SkinListDTO [skin_list_no=" + skin_list_no + ", user_no=" + user_no + ", mypage_background_no="
				+ mypage_background_no + ", profile_border_no=" + profile_border_no + "]";
	}
	
	
}
