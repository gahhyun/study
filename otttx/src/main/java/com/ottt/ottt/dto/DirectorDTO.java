package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * director_no		bigint		generated always as identity primary key
   director_nm	varchar(15) not null
 */
public class DirectorDTO {

	private Integer director_no;
	private String director_nm;
	
	public DirectorDTO() {}

	public Integer getDirector_no() {
		return director_no;
	}

	public void setDirector_no(Integer director_no) {
		this.director_no = director_no;
	}

	public String getDirector_nm() {
		return director_nm;
	}

	public void setDirector_nm(String director_nm) {
		this.director_nm = director_nm;
	}

	@Override
	public int hashCode() {
		return Objects.hash(director_nm, director_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DirectorDTO other = (DirectorDTO) obj;
		return Objects.equals(director_nm, other.director_nm) && Objects.equals(director_no, other.director_no);
	}

	@Override
	public String toString() {
		return "DirectorDTO [director_no=" + director_no + ", director_nm=" + director_nm + "]";
	}
	
	
}
