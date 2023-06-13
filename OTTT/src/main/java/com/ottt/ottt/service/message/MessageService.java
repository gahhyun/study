package com.ottt.ottt.service.message;

import java.util.List;

import com.ottt.ottt.dto.MessageDTO;

/*
	read 				메세지 내용 읽기
	loadRecvList		받은 메세지 목록 불러오기	
	loadSendList		보낸 메세지 목록 불러오기
	writeMsg			메세지 작성
	removeMsg			메세지 삭제
	removeMsgAll		메세지 전체 삭제
 */

public interface MessageService {

	MessageDTO read(Integer message_no) throws Exception;
	
	List<MessageDTO> loadRecvList(Integer receive_user_no) throws Exception;
	
	List<MessageDTO> loadSendList(Integer send_user_no) throws Exception;
	
	int writeMsg(MessageDTO messageDTO) throws Exception;
	
	int removeMsg(Integer message_no, String user_no) throws Exception;
	
	int removeMsgAll(String user_no) throws Exception;

}
