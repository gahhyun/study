package com.ottt.ottt.service.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.message.MessageDao;
import com.ottt.ottt.domain.MessageSearchItem;
import com.ottt.ottt.dto.MessageDTO;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	MessageDao messageDao;
	
	@Override
	public MessageDTO read(Integer message_no) throws Exception {
		return messageDao.selectMsg(message_no);
	}

	@Override
	public List<MessageDTO> loadRecvList(MessageSearchItem msc) throws Exception {
		return messageDao.selectRecv(msc);
	}

	@Override
	public List<MessageDTO> loadSendList(MessageSearchItem msc) throws Exception {
		return messageDao.selectSend(msc);
	}

	//쪽지 생성할때 데이터 베이스에 추가하지는 않는데 DTO에 변수값을 false로 줫음
	//sysout하면 보임
	//보낸 메시지 지울 때 값을 트루로 바꿔주고 받은 메시지 지울 때도 나머지 하나 트루로 바꾸면 데이터베이스 삭제(메서드만들기)
	@Override
	public int writeMsg(MessageDTO messageDTO) throws Exception {
		return messageDao.insert(messageDTO);
	}

	@Override
	public int removeMsg(Integer message_no) throws Exception {
		return messageDao.delete(message_no);
	}

//	@Override
//	public int removeMsgAll(String user_no) throws Exception {
//		return 0;
//	}

	@Override
	public int getSendResultCnt(MessageSearchItem msc) throws Exception {
		return messageDao.sendResultCnt(msc);
	}
	
	@Override
	public int getRecvResultCnt(MessageSearchItem msc) throws Exception {
		return messageDao.recvResultCnt(msc);
	}

	@Override
	public List<MessageDTO> getSelectPage(MessageSearchItem msc) throws Exception {
		return messageDao.selectPage(msc);
	}
	
	@Override
	public MessageDTO pickOneRecv(Integer message_no) throws Exception {
		return messageDao.selectOneRecv(message_no);
	}
	
	@Override
	public MessageDTO pickOneSend(Integer message_no) throws Exception {
		return messageDao.selectOneSend(message_no);
	}

	@Override
	public int removeByReceiver(MessageDTO messageDTO) throws Exception {
		messageDTO.setDelete_by_receiver(true);
		return messageDao.deleteByReceiver(messageDTO);
	}
	
	@Override
	public int removeBySender(MessageDTO messageDTO) throws Exception {
		return messageDao.deleteBySender(messageDTO);
	}

}
