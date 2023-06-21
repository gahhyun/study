package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * gr_no 		char(1)		primary key
	,gr_nm 		varchar(10)	not null
 */
public class GradeDTO {

	private Character gr_no;
	private String gr_nm;
	
	public GradeDTO() {}

	public Character getGr_no() {
		return gr_no;
	}

	public void setGr_no(Character gr_no) {
		this.gr_no = gr_no;
	}

	public String getGr_nm() {
		return gr_nm;
	}

	public void setGr_nm(String gr_nm) {
		this.gr_nm = gr_nm;
	}

	@Override
	public int hashCode() {
		return Objects.hash(gr_nm, gr_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GradeDTO other = (GradeDTO) obj;
		return Objects.equals(gr_nm, other.gr_nm) && Objects.equals(gr_no, other.gr_no);
	}

	@Override
	public String toString() {
		return "GradeDTO [gr_no=" + gr_no + ", gr_nm=" + gr_nm + "]";
	}
	
	
}
