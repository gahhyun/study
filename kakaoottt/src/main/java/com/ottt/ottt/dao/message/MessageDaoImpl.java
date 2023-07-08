package com.ottt.ottt.dao.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.domain.MessageSearchItem;
import com.ottt.ottt.dto.MessageDTO;


@Repository
public class MessageDaoImpl implements MessageDao {
	
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.ottt.ottt.dao.message.MessageMapper.";

	//메세지 내용 불러오기
	@Override
	public MessageDTO selectMsg(Integer message_no) throws Exception {
		return session.selectOne(namespace + "selectMsg", message_no);
	}

	//메세지 보내기(메세지 생성)
	@Override
	public int insert(MessageDTO messageDTO) throws Exception {
		return session.insert(namespace + "insertMsg", messageDTO);
	}

	//메세지 지우기(해당된 메세지)
	@Override
	public int delete(Integer message_no) throws Exception {
		return session.delete(namespace + "delete", message_no);
	}

	//sql id 맞춰서 수정 
	@Override
	public List<MessageDTO> selectPage(Map map) throws Exception {
		return session.selectList(namespace + "selectPage", map);
	}

	
	@Override
	public int recvCount() throws Exception {
		return session.selectOne(namespace + "recvCount");
	}

	@Override
	public int sendCount() throws Exception {
		return session.selectOne(namespace + "sendCount");
	}

	@Override
	public int recvResultCnt(MessageSearchItem msc) throws Exception {
		return session.selectOne(namespace + "recvResultCnt", msc);
	}
	
	@Override
	public int sendResultCnt(MessageSearchItem msc) throws Exception {
		return session.selectOne(namespace + "sendResultCnt", msc);
	}

	@Override
	public List<MessageDTO> selectPage(MessageSearchItem msc) throws Exception {
		return session.selectList(namespace + "selectPage", msc);
	}
	
	@Override
	public MessageDTO selectOneRecv(Integer message_no) throws Exception {
		return session.selectOne(namespace + "selectOneRecv", message_no);
	}
	
	@Override
	public MessageDTO selectOneSend(Integer message_no) throws Exception {
		return session.selectOne(namespace + "selectOneSend", message_no);
	}
	
	@Override
	public int deleteByReceiver(MessageDTO messageDTO) throws Exception {
		return session.update(namespace + "deleteByReceiver", messageDTO);
	}
	
	@Override
	public int deleteBySender(MessageDTO messageDTO) throws Exception {
		return session.update(namespace + "deleteBySender", messageDTO);
	}


	@Override
	public List<MessageDTO> selectRecvAll(MessageSearchItem msc) throws Exception {
		return session.selectList(namespace + "selectRecvAll", msc);
	}


	@Override
	public List<MessageDTO> selectSendAll(MessageSearchItem msc) throws Exception {
		return session.selectList(namespace + "selectSendAll", msc);
	}


}