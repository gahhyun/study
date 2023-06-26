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
	private String content_nm;
	private String ott_nm;
    private String content;
    private Integer year;
	private Integer month;
	private Integer day;
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getContent_nm() {
		return content_nm;
	}

	public void setContent_nm(String content_nm) {
		this.content_nm = content_nm;
	}

	public String getOtt_nm() {
		return ott_nm;
	}

	public void setOtt_nm(String ott_nm) {
		this.ott_nm = ott_nm;
	}

	public EndServiceDTO(int day, String content_nm) {
        this.day = day;
        this.content_nm = content_nm;
    }

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
	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Integer getDay() {
		return day;
	}

	public void setDay(Integer day) {
		this.day = day;
	}

	@Override
	public int hashCode() {
		return Objects.hash(content_no, end_date, end_service_no, ott_no, content_nm, ott_nm);
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
		return content_nm == other.content_nm && content_no == other.content_no && Objects.equals(end_date, other.end_date)
				&& Objects.equals(end_service_no, other.end_service_no) && ott_no == other.ott_no && ott_nm == other.ott_nm && day == other.day 
				&& content == other.content;
	}

	@Override
	public String toString() {
		return "EndServiceDTO [end_service_no=" + end_service_no + ", ott_no=" + ott_no + ", content_no=" + content_no
				+ ", end_date=" + end_date + ", content_nm=" + content_nm + ", ott_nm=" + ott_nm + ", year=" + year
				+ ", month=" + month + ", day=" + day + ", content=" + content +"]";
	}

}
