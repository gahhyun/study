package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * director_no		bigint	not null
   content_no	bigint	not null
 */

public class ContentDirectorDTO {

	private Integer director_no;
	private Integer content_no;
	
	public ContentDirectorDTO() {}

	public Integer getDirector_no() {
		return director_no;
	}

	public void setDirector_no(Integer director_no) {
		this.director_no = director_no;
	}

	public Integer getContent_no() {
		return content_no;
	}

	public void setContent_no(Integer content_no) {
		this.content_no = content_no;
	}

	@Override
	public int hashCode() {
		return Objects.hash(content_no, director_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ContentDirectorDTO other = (ContentDirectorDTO) obj;
		return Objects.equals(content_no, other.content_no) && Objects.equals(director_no, other.director_no);
	}

	@Override
	public String toString() {
		return "ContentDirectorDTO [director_no=" + director_no + ", content_no=" + content_no + "]";
	}
	
	
}
