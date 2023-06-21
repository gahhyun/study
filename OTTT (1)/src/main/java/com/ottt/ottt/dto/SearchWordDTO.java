package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * search_word_no	bigint 		 generated always as identity primary key
	,user_no	  	bigint		 not null
	,search_content varchar(50)  not null
 */
public class SearchWordDTO {

	private Integer search_word_no;
	private int user_no;
	private String search_content;
	
	public SearchWordDTO() {}

	public Integer getSearch_word_no() {
		return search_word_no;
	}

	public void setSearch_word_no(Integer search_word_no) {
		this.search_word_no = search_word_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getSearch_content() {
		return search_content;
	}

	public void setSearch_content(String search_content) {
		this.search_content = search_content;
	}

	@Override
	public int hashCode() {
		return Objects.hash(search_content, search_word_no, user_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SearchWordDTO other = (SearchWordDTO) obj;
		return Objects.equals(search_content, other.search_content)
				&& Objects.equals(search_word_no, other.search_word_no) && user_no == other.user_no;
	}

	@Override
	public String toString() {
		return "SearchWordDTO [search_word_no=" + search_word_no + ", user_no=" + user_no + ", search_content="
				+ search_content + "]";
	}
	
	
}
