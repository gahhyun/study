package com.ottt.ottt.dto;

import java.util.Objects;

/*카테고리
 * 	category_no		smallint	primary key
	, category_nm	varchar(20) not null
 */

public class CategoryDTO {
	
	private Integer	category_no;
	private String	category_nm;
	
	
	public CategoryDTO() {}


	public Integer getCategory_no() {
		return category_no;
	}


	public void setCategory_no(Integer category_no) {
		this.category_no = category_no;
	}


	public String getCategory_nm() {
		return category_nm;
	}


	public void setCategory_nm(String category_nm) {
		this.category_nm = category_nm;
	}


	@Override
	public int hashCode() {
		return Objects.hash(category_nm, category_no);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CategoryDTO other = (CategoryDTO) obj;
		return Objects.equals(category_nm, other.category_nm) && Objects.equals(category_no, other.category_no);
	}


	@Override
	public String toString() {
		return "CategoryDTO [category_no=" + category_no + ", category_nm=" + category_nm + "]";
	}
	
	
	
	

}
