package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * entertainer_no		bigint	not null
	, content_no		bigint	not null
 */
public class ContentEntertainerDTO {

	private Integer entertainer_no;
	private Integer content_no;
	
	public ContentEntertainerDTO() {}

	public Integer getEntertainer_no() {
		return entertainer_no;
	}

	public void setEntertainer_no(Integer entertainer_no) {
		this.entertainer_no = entertainer_no;
	}

	public Integer getContent_no() {
		return content_no;
	}

	public void setContent_no(Integer content_no) {
		this.content_no = content_no;
	}

	@Override
	public int hashCode() {
		return Objects.hash(content_no, entertainer_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ContentEntertainerDTO other = (ContentEntertainerDTO) obj;
		return Objects.equals(content_no, other.content_no) && Objects.equals(entertainer_no, other.entertainer_no);
	}

	@Override
	public String toString() {
		return "ContentEntertainerDTO [entertainer_no=" + entertainer_no + ", content_no=" + content_no + "]";
	}
	
	
}
