package com.ottt.ottt.dao.content;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.dto.SearchWordDTO;

@Repository
public class SearchWordDaoImpl implements SearchWordDao {
	
	@Autowired
	SqlSession session;
	private String namespace="com.ottt.ottt.dao.content.searchWordMapper.";
	

	@Override
	public int searchWordInsert(Integer user_no, String content_nm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_no", user_no);
		map.put("content_nm", content_nm);
		return session.insert(namespace+"searchWordInsert", map);
	}

	@Override
	public List<SearchWordDTO> searchWorldSelect(Integer user_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"searchWorldSelect", user_no);
	}

	@Override
	public int searchWordDelete(Integer search_word_no) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespace+"searchWordDelete", search_word_no);
	}

	@Override
	public SearchWordDTO searchWorldOneSelect(Integer search_word_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"searchWorldOneSelect", search_word_no);
	}

}
