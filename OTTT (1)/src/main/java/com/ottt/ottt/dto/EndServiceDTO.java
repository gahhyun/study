package com.ottt.ottt.dto;

import java.util.Date;
import java.util.Objects;

/*
 * end_service_no	bigint		generated always as identity primary key
	,ott_no			smallint	not null
	,content_no		bigint		not null
	,end_date		date		not null
 */
public class EndServiceDTO {

	private Integer end_service_no;
	private int ott_no;
	private int content_no;
	private Date end_date;
	
	public EndServiceDTO() {}

	public Integer getEnd_service_no() {
		return end_service_no;
	}

	public void setEnd_service_no(Integer end_service_no) {
		this.end_service_no = end_service_no;
	}

	public int getOtt_no() {
		return ott_no;
	}

	public void setOtt_no(int ott_no) {
		this.ott_no = ott_no;
	}

	public int getContent_no() {
		return content_no;
	}

	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	@Override
	public int hashCode() {
		return Objects.hash(content_no, end_date, end_service_no, ott_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EndServiceDTO other = (EndServiceDTO) obj;
		return content_no == other.content_no && Objects.equals(end_date, other.end_date)
				&& Objects.equals(end_service_no, other.end_service_no) && ott_no == other.ott_no;
	}

	@Override
	public String toString() {
		return "EndServiceDTO [end_service_no=" + end_service_no + ", ott_no=" + ott_no + ", content_no=" + content_no
				+ ", end_date=" + end_date + "]";
	}
	
	
}
