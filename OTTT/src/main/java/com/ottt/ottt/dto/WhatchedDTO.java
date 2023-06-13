package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * whatched_no		bigint	generated always as identity primary key
 	,user_no		bigint	not null
	,content_no		bigint	not null
 */
public class WhatchedDTO {

	private Integer whatched_no;
	private int user_no;
	private int content_no;
	
	public WhatchedDTO() {}

	public Integer getWhatched_no() {
		return whatched_no;
	}

	public void setWhatched_no(Integer whatched_no) {
		this.whatched_no = whatched_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getContent_no() {
		return content_no;
	}

	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}

	@Override
	public int hashCode() {
		return Objects.hash(content_no, user_no, whatched_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		WhatchedDTO other = (WhatchedDTO) obj;
		return content_no == other.content_no && user_no == other.user_no
				&& Objects.equals(whatched_no, other.whatched_no);
	}

	@Override
	public String toString() {
		return "WhatchedDTO [whatched_no=" + whatched_no + ", user_no=" + user_no + ", content_no=" + content_no + "]";
	}
	
	
}
