package com.ottt.ottt.dto;

import java.util.Objects;

/*댓글 좋아요
 * 	comment_like_no	bigint	generated always as identity primary key
	, cmt_no		bigint	not null
 */

public class CommentLikeDTO {
	
	private Integer cmt_like_no;
	private int 	cmt_no;
	
	
	public CommentLikeDTO() {}


	public Integer getCmt_like_no() {
		return cmt_like_no;
	}


	public void setCmt_like_no(Integer cmt_like_no) {
		this.cmt_like_no = cmt_like_no;
	}


	public int getCmt_no() {
		return cmt_no;
	}


	public void setCmt_no(int cmt_no) {
		this.cmt_no = cmt_no;
	}


	@Override
	public int hashCode() {
		return Objects.hash(cmt_like_no, cmt_no);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommentLikeDTO other = (CommentLikeDTO) obj;
		return Objects.equals(cmt_like_no, other.cmt_like_no) && cmt_no == other.cmt_no;
	}


	
	
	@Override
	public String toString() {
		return "CommentLikeDTO [cmt_like_no=" + cmt_like_no + ", cmt_no=" + cmt_no + "]";
	}
	


}
