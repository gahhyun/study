package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * ott_no		smallint	primary key
	,ott_nm		varchar(50)	not null
 */
public class OttDTO {

	private Integer ott_no;
	private String ott_nm;
	
	public OttDTO() {}

	public Integer getOtt_no() {
		return ott_no;
	}

	public void setOtt_no(Integer ott_no) {
		this.ott_no = ott_no;
	}

	public String getOtt_nm() {
		return ott_nm;
	}

	public void setOtt_nm(String ott_nm) {
		this.ott_nm = ott_nm;
	}

	@Override
	public int hashCode() {
		return Objects.hash(ott_nm, ott_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OttDTO other = (OttDTO) obj;
		return Objects.equals(ott_nm, other.ott_nm) && Objects.equals(ott_no, other.ott_no);
	}

	@Override
	public String toString() {
		return "OttDTO [ott_no=" + ott_no + ", ott_nm=" + ott_nm + "]";
	}
	
	
}
