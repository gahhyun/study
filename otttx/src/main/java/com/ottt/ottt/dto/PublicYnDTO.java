package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * public_yn_cd	char(1)		primary key
	,public_yn		varchar(5)	not null
 */
public class PublicYnDTO {

	private Character public_yn_cd;
	private String public_yn;
	
	public PublicYnDTO() {}

	public Character getPublic_yn_cd() {
		return public_yn_cd;
	}

	public void setPublic_yn_cd(Character public_yn_cd) {
		this.public_yn_cd = public_yn_cd;
	}

	public String getPublic_yn() {
		return public_yn;
	}

	public void setPublic_yn(String public_yn) {
		this.public_yn = public_yn;
	}

	@Override
	public int hashCode() {
		return Objects.hash(public_yn, public_yn_cd);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PublicYnDTO other = (PublicYnDTO) obj;
		return Objects.equals(public_yn, other.public_yn) && Objects.equals(public_yn_cd, other.public_yn_cd);
	}

	@Override
	public String toString() {
		return "PublicYnDTO [public_yn_cd=" + public_yn_cd + ", public_yn=" + public_yn + "]";
	}
	
	
}
