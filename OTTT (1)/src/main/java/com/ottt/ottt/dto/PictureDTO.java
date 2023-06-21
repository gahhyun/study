package com.ottt.ottt.dto;

import java.util.Objects;

/*사진
 * 	picture_no	bigint	generated always as identity primary key
	, picture	text	not null		링크
 */

public class PictureDTO {
	
	private Integer	picture_no;
	private String	picture;
	
	
	public PictureDTO() {}


	public Integer getPicture_no() {
		return picture_no;
	}


	public void setPicture_no(Integer picture_no) {
		this.picture_no = picture_no;
	}


	public String getPicture() {
		return picture;
	}


	public void setPicture(String picture) {
		this.picture = picture;
	}


	@Override
	public int hashCode() {
		return Objects.hash(picture_no);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PictureDTO other = (PictureDTO) obj;
		return Objects.equals(picture_no, other.picture_no);
	}


	@Override
	public String toString() {
		return "PictureDTO [picture_no=" + picture_no + ", picture=" + picture + "]";
	}
	
	
	
	
	
	

}
