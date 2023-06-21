package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * --장르번호
	genre_no		smallint		primary key
	--장르이름
	,genre_nm		varchar(25)		not null
 */
public class GenreDTO {

	private Integer genre_no;
	private String genre_nm;
	
	public GenreDTO() {}

	public Integer getGenre_no() {
		return genre_no;
	}

	public void setGenre_no(Integer genre_no) {
		this.genre_no = genre_no;
	}

	public String getGenre_nm() {
		return genre_nm;
	}

	public void setGenre_nm(String genre_nm) {
		this.genre_nm = genre_nm;
	}

	@Override
	public int hashCode() {
		return Objects.hash(genre_nm, genre_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GenreDTO other = (GenreDTO) obj;
		return Objects.equals(genre_nm, other.genre_nm) && Objects.equals(genre_no, other.genre_no);
	}

	@Override
	public String toString() {
		return "GenreDTO [genre_no=" + genre_no + ", genre_nm=" + genre_nm + "]";
	}
	
	
}
