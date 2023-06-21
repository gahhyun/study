package com.ottt.ottt.dto;

import java.util.Date;
import java.util.Objects;

/*
 * message_no 			bigint 		  generated always as identity primary key
	,send_user_no		bigint 		  not null
	,receive_user_no	bigint 		  not null
	,content 			varchar(2000) not null
	,send_date			timestamptz	  not null
	,read_yn			char(1)		  default '0'		--추가
	,delete_by_sender		boolean		default false
	,delete_by_receiver		boolean		default false
 */
public class MessageDTO {

	private Integer message_no;
	private Integer send_user_no;
	private Integer receive_user_no;
	private String content;
	private Date send_date;
	private char read_yn;
	private String user_nicknm;
	
	//데이터베이스에 직접 집어넣는 게 아니므로 데이터베이스 컬럼엔 추가하지 않고 여기서만 만들어 놓음
	//보낸 메시지 지우기
	private boolean delete_by_sender;
	//받은 메시지 지우기
	private boolean delete_by_receiver;
	
	public MessageDTO () {}
	
	public MessageDTO(Integer send_user_no, Integer receive_user_no, String content) {
		super();
		this.send_user_no = send_user_no;
		this.receive_user_no = receive_user_no;
		this.content = content;
	}
	public Integer getMessage_no() {
		return message_no;
	}
	public void setMessage_no(Integer message_no) {
		this.message_no = message_no;
	}
	public Integer getSend_user_no() {
		return send_user_no;
	}
	public void setSend_user_no(Integer send_user_no) {
		this.send_user_no = send_user_no;
	}
	public Integer getReceive_user_no() {
		return receive_user_no;
	}
	public void setReceive_user_no(Integer receive_user_no) {
		this.receive_user_no = receive_user_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSend_date() {
		return send_date;
	}
	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}
	public char getRead_yn() {
		return read_yn;
	}
	public void setRead_yn(char read_yn) {
		this.read_yn = read_yn;
	}
	
	
	public String getUser_nicknm() {
		return user_nicknm;
	}

	public void setUser_nicknm(String user_nicknm) {
		this.user_nicknm = user_nicknm;
	}
	
	public boolean isDelete_by_sender() {
		return delete_by_sender;
	}

	public void setDelete_by_sender(boolean delete_by_sender) {
		this.delete_by_sender = delete_by_sender;
	}

	public boolean isDelete_by_receiver() {
		return delete_by_receiver;
	}

	public void setDelete_by_receiver(boolean delete_by_receiver) {
		this.delete_by_receiver = delete_by_receiver;
	}

	@Override
	public int hashCode() {
		return Objects.hash(message_no);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MessageDTO other = (MessageDTO) obj;
		return Objects.equals(message_no, other.message_no);
	}

	@Override
	public String toString() {
		return "MessageDTO [message_no=" + message_no + ", send_user_no=" + send_user_no + ", receive_user_no="
				+ receive_user_no + ", content=" + content + ", send_date=" + send_date + ", read_yn=" + read_yn
				+ ", user_nicknm=" + user_nicknm + ", delete_by_sender=" + delete_by_sender + ", delete_by_receiver="
				+ delete_by_receiver + "]";
	}
	//보낸 메시지 지우기
	public void deleteBySender() {
		this.setDelete_by_sender(true);
	}
	
	//받은 메시지 지우기
	public void deleteByReceiver() {
		this.setDelete_by_receiver(true);
	}
	
	public boolean isDelete() {
		return this.isDelete_by_receiver() && this.isDelete_by_sender();
	}
	
}
