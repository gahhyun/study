package com.ottt.ottt.dao.content;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;

@Repository
public class ContentDaoImpl implements ContentDao {
	
	@Autowired
	private SqlSession session;
	private String namespace="com.ottt.ottt.controller.ContentMapper.";

	@Override
	public List<ContentDTO> ratingSelect() throws Exception {
		return session.selectList(namespace+"ratingSelect");
	}

	@Override
	public List<ContentOTTDTO> ottNameSelect(Integer content_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"ottNameSelect", content_no);
	}

	@Override
	public List<ContentDTO> movieSelect(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"movieSelect", sc);
	}

	@Override
	public int movieCount(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"movieCount", sc);
	}

	@Override
	public List<ContentDTO> searchSelect(Map<String, Object> map) throws Exception {
		return session.selectList(namespace+"searchSelect", map);
	}

	@Override
	public int searchCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"searchCount", map);
	}
	
}
