package com.ottt.ottt.dao.message;

import com.ottt.ottt.domain.MessageSearchItem;
import com.ottt.ottt.dto.MessageDTO;

import java.util.List;
import java.util.Map;

public interface MessageDao {

	//메시지 내용 불러오기
	MessageDTO selectMsg(Integer message_no) throws Exception;
	
	//받은 메시지 리스트 불러오기(받은 쪽지함)
	List<MessageDTO> selectRecv(MessageSearchItem msc) throws Exception;
	
	//보낸 메시지 리스트 불러오기(보낸 쪽지함)
	List<MessageDTO> selectSend(MessageSearchItem msc) throws Exception;
	
	//메시지 추가(보내기)
	int insert(MessageDTO messageDTO) throws Exception;
	
	//작성자 일치 시, 선택한 메세지 삭제하기
	int delete(Integer message_no) throws Exception;
	
	//메시지 전체 삭제
//	int deleteAll() throws Exception;
	
	//페이지별 게시글 목록 불러오기
	List<MessageDTO> selectPage(Map map) throws Exception;
	
	//받은 메시지 수 불러오기
	int recvCount() throws Exception;
	
	//보낸 메시지 수 불러오기
	int sendCount() throws Exception;
	
	//조건에 해당하는 게시글 수 불러오기(네비게이션 바 사용하기 위해) - 보낸 메시지
	int recvResultCnt(MessageSearchItem msc) throws Exception;
	
	//조건에 해당하는 게시글 수 불러오기(네비게이션 바 사용하기 위해) - 받은 메시지
	int sendResultCnt(MessageSearchItem msc) throws Exception;
	
	//조건에 해당하는 페이지별 게시글 목록 불러오기
	List<MessageDTO> selectPage(MessageSearchItem msc) throws Exception;
	
	//받은 메시지 중 삭제할 메시지 하나 고르기
	MessageDTO selectOneRecv(Integer message_no) throws Exception;
	
	MessageDTO selectOneSend(Integer message_no) throws Exception;
	
	int deleteByReceiver(MessageDTO messageDTO) throws Exception;
	
	int deleteBySender(MessageDTO messageDTO) throws Exception;
	
	
}