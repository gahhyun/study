package com.ottt.ottt.dto;

import java.util.Objects;

/*회원 OTT
 * 	user_no		bigint	not null
	,ott_no			bigint	not null
	,constraint user_ott primary key (user_no, ott_no)  ???
 */

public class UserOTTDTO {
	
	private Integer user_no;
	private int     ott_no;
	
	
	
	public UserOTTDTO() {}



	public Integer getUser_no() {
		return user_no;
	}



	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}



	public int getOtt_no() {
		return ott_no;
	}



	public void setOtt_no(int ott_no) {
		this.ott_no = ott_no;
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
		UserOTTDTO other = (UserOTTDTO) obj;
		return Objects.equals(user_no, other.user_no);
	}



	@Override
	public String toString() {
		return "UserOTTDTO [user_no=" + user_no + ", ott_no=" + ott_no + "]";
	}
	
	
	
	
	
	
	
}
