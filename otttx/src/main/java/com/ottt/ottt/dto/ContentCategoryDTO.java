package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * content_no		bigint		not null
	,category_no	smallint	not null
	,constraint content_category_pk primary key (content_no, category_no)
 */
public class ContentCategoryDTO {

	private Integer content_no;
	private Integer category_no;
	
	public ContentCategoryDTO() {}

	public Integer getContent_no() {
		return content_no;
	}

	public void setContent_no(Integer content_no) {
		this.content_no = content_no;
	}

	public Integer getCategory_no() {
		return category_no;
	}

	public void setCategory_no(Integer category_no) {
		this.category_no = category_no;
	}

	@Override
	public int hashCode() {
		return Objects.hash(category_no, content_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ContentCategoryDTO other = (ContentCategoryDTO) obj;
		return Objects.equals(category_no, other.category_no) && Objects.equals(content_no, other.content_no);
	}

	@Override
	public String toString() {
		return "ContentCategoryDTO [content_no=" + content_no + ", category_no=" + category_no + "]";
	}
	
	
}
