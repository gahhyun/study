package com.ottt.ottt.service.message;

import java.util.List;

import com.ottt.ottt.domain.MessageSearchItem;
import com.ottt.ottt.dto.MessageDTO;

/*
	read 				메세지 내용 읽기
	loadRecvList		받은 메세지 목록 불러오기	
	loadSendList		보낸 메세지 목록 불러오기
	writeMsg			메세지 작성
	removeMsg			메세지 삭제
 */

public interface MessageService {

	MessageDTO read(Integer message_no) throws Exception;
	
	List<MessageDTO> loadRecvListAll(MessageSearchItem msc) throws Exception;
	
	List<MessageDTO> loadSendListAll(MessageSearchItem msc) throws Exception;	

	int writeMsg(MessageDTO messageDTO) throws Exception;
	
	int removeMsg(Integer message_no) throws Exception;
	
	int getSendResultCnt(MessageSearchItem msc) throws Exception;
	
	int getRecvResultCnt(MessageSearchItem msc) throws Exception;
	
	List<MessageDTO> getSelectPage(MessageSearchItem msc) throws Exception;
	
	MessageDTO pickOneRecv(Integer message_no) throws Exception;
	
	MessageDTO pickOneSend(Integer message_no) throws Exception;
	
	int removeByReceiver(MessageDTO messageDTO) throws Exception;
	
	int removeBySender(MessageDTO messageDTO) throws Exception;

}
