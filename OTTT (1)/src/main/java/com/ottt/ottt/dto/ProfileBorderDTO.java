package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * profile_border_no		bigint	generated always as identity primary key
	,profile_border_img		text not null
 */
public class ProfileBorderDTO {

	private Integer profile_border_no;
	private String profile_border_img;
	
	public ProfileBorderDTO() {}

	public Integer getProfile_border_no() {
		return profile_border_no;
	}

	public void setProfile_border_no(Integer profile_border_no) {
		this.profile_border_no = profile_border_no;
	}

	public String getProfile_border_img() {
		return profile_border_img;
	}

	public void setProfile_border_img(String profile_border_img) {
		this.profile_border_img = profile_border_img;
	}

	@Override
	public int hashCode() {
		return Objects.hash(profile_border_img, profile_border_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProfileBorderDTO other = (ProfileBorderDTO) obj;
		return Objects.equals(profile_border_img, other.profile_border_img)
				&& Objects.equals(profile_border_no, other.profile_border_no);
	}

	@Override
	public String toString() {
		return "ProfileBorderDTO [profile_border_no=" + profile_border_no + ", profile_border_img=" + profile_border_img
				+ "]";
	}
	
	
}
