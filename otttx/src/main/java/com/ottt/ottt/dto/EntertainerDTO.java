package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * 	entertainer_no		bigint		generated always as identity primary key
	, entertainer_nm	varchar(15) not null
 */

public class EntertainerDTO {
	
	private Integer	entertainer_no;
	private String 	entertainer_nm;
	
	public EntertainerDTO() {}

	public Integer getEntertainer_no() {
		return entertainer_no;
	}

	public void setEntertainer_no(Integer entertainer_no) {
		this.entertainer_no = entertainer_no;
	}

	public String getEntertainer_nm() {
		return entertainer_nm;
	}

	public void setEntertainer_nm(String entertainer_nm) {
		this.entertainer_nm = entertainer_nm;
	}

	@Override
	public int hashCode() {
		return Objects.hash(entertainer_nm, entertainer_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EntertainerDTO other = (EntertainerDTO) obj;
		return Objects.equals(entertainer_nm, other.entertainer_nm)
				&& Objects.equals(entertainer_no, other.entertainer_no);
	}

	@Override
	public String toString() {
		return "EntertainerDTO [entertainer_no=" + entertainer_no + ", entertainer_nm=" + entertainer_nm + "]";
	}


}
