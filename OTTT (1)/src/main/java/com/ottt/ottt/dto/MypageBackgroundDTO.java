package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * mypage_background_no	bigint	generated always as identity primary key
	,mypage_background_img	text not null
 */
public class MypageBackgroundDTO {

	private Integer mypage_background_no;
	private String mypage_background_img;
	
	public MypageBackgroundDTO() {}

	public Integer getMypage_background_no() {
		return mypage_background_no;
	}

	public void setMypage_background_no(Integer mypage_background_no) {
		this.mypage_background_no = mypage_background_no;
	}

	public String getMypage_background_img() {
		return mypage_background_img;
	}

	public void setMypage_background_img(String mypage_background_img) {
		this.mypage_background_img = mypage_background_img;
	}

	@Override
	public int hashCode() {
		return Objects.hash(mypage_background_img, mypage_background_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MypageBackgroundDTO other = (MypageBackgroundDTO) obj;
		return Objects.equals(mypage_background_img, other.mypage_background_img)
				&& Objects.equals(mypage_background_no, other.mypage_background_no);
	}

	@Override
	public String toString() {
		return "MypageBackgroundDTO [mypage_background_no=" + mypage_background_no + ", mypage_background_img="
				+ mypage_background_img + "]";
	}
	
	
}
