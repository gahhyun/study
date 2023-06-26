package com.ottt.ottt.dto;

import java.util.Objects;

/*선호 장르
 * 	user_no		bigint	not null
	,genre_no		bigint	not null
 */

public class UserGenreDTO {
	
	private Integer user_no;
	private int 	genre_no;
	
	
	public UserGenreDTO() {}


	public Integer getUser_no() {
		return user_no;
	}


	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}


	public int getGenre_no() {
		return genre_no;
	}


	public void setGenre_no(int genre_no) {
		this.genre_no = genre_no;
	}


	@Override
	public int hashCode() {
		return Objects.hash(user_no);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserGenreDTO other = (UserGenreDTO) obj;
		return Objects.equals(user_no, other.user_no);
	}


	@Override
	public String toString() {
		return "UserGenreDTO [user_no=" + user_no + ", genre_no=" + genre_no + "]";
	}
	


}
