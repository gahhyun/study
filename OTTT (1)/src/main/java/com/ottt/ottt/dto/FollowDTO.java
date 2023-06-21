package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * follow_no 		bigint	generated always as identity primary key
	,followers_no 	bigint	not null
	,following_no 	bigint	not null
	,status 		char(1)	not null
 */
public class FollowDTO {

	private Integer follow_no;
	private int followers_no;
	private int following_no;
	private char status;
	
	public FollowDTO() {}

	public Integer getFollow_no() {
		return follow_no;
	}

	public void setFollow_no(Integer follow_no) {
		this.follow_no = follow_no;
	}

	public int getFollowers_no() {
		return followers_no;
	}

	public void setFollowers_no(int followers_no) {
		this.followers_no = followers_no;
	}

	public int getFollowing_no() {
		return following_no;
	}

	public void setFollowing_no(int following_no) {
		this.following_no = following_no;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	@Override
	public int hashCode() {
		return Objects.hash(follow_no, followers_no, following_no, status);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FollowDTO other = (FollowDTO) obj;
		return Objects.equals(follow_no, other.follow_no) && followers_no == other.followers_no
				&& following_no == other.following_no && status == other.status;
	}

	@Override
	public String toString() {
		return "FollowDTO [follow_no=" + follow_no + ", followers_no=" + followers_no + ", following_no=" + following_no
				+ ", status=" + status + "]";
	}
	
	
}
