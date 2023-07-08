package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * --영상번호 FK
	content_no		bigint		not null
	--장르번호 FK
	,genre_no		smallint	not null
 */
public class ContentGenreDTO {

	private Integer content_no;
	private Integer genre_no;
	
	public ContentGenreDTO() {}

	public Integer getContent_no() {
		return content_no;
	}

	public void setContent_no(Integer content_no) {
		this.content_no = content_no;
	}

	public Integer getGenre_no() {
		return genre_no;
	}

	public void setGenre_no(Integer genre_no) {
		this.genre_no = genre_no;
	}

	@Override
	public int hashCode() {
		return Objects.hash(content_no, genre_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ContentGenreDTO other = (ContentGenreDTO) obj;
		return Objects.equals(content_no, other.content_no) && Objects.equals(genre_no, other.genre_no);
	}

	@Override
	public String toString() {
		return "ContentGenreDTO [content_no=" + content_no + ", genre_no=" + genre_no + "]";
	}
	
	
}
