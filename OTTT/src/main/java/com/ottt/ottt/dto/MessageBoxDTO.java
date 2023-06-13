package com.ottt.ottt.dto;

import java.util.Objects;

/*
 * message_box_no		bigint		generated always as identity primary key
	,user_no			bigint		not null
	,message_no			bigint		not null
 */
public class MessageBoxDTO {

	private Integer message_box_no;
	private int user_no;
	private int message_no;
	
	public MessageBoxDTO() {}

	public Integer getMessage_box_no() {
		return message_box_no;
	}

	public void setMessage_box_no(Integer message_box_no) {
		this.message_box_no = message_box_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	@Override
	public int hashCode() {
		return Objects.hash(message_box_no, message_no, user_no);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MessageBoxDTO other = (MessageBoxDTO) obj;
		return Objects.equals(message_box_no, other.message_box_no) && message_no == other.message_no
				&& user_no == other.user_no;
	}

	@Override
	public String toString() {
		return "MessageBoxDTO [message_box_no=" + message_box_no + ", user_no=" + user_no + ", message_no=" + message_no
				+ "]";
	}
	
	
}
