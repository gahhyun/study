package com.ottt.ottt.dao.message;

import com.ottt.ottt.dto.MessageDTO;

import java.util.List;

public interface MessageDao {

	//메시지 내용 불러오기
	MessageDTO selectMsg(Integer message_no) throws Exception;
	
	//받은 메시지 리스트 불러오기(받은 쪽지함)
	List<MessageDTO> selectRecv(Integer receive_user_no) throws Exception;
	
	//보낸 메시지 리스트 불러오기(보낸 쪽지함)
	List<MessageDTO> selectSend(Integer send_user_no) throws Exception;
	
	//메시지 추가(보내기)
	int insert(MessageDTO messageDTO) throws Exception;
	
	//작성자 일치 시, 선택한 메세지 삭제하기
	int delete(Integer message_no, String user_no) throws Exception;
	
	//메시지 전체 삭제
	int deleteAll() throws Exception;
	
}