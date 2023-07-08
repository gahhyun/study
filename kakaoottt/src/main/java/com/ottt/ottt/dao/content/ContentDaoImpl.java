package com.ottt.ottt.dao.content;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;
import com.ottt.ottt.dto.GenreDTO;

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
		return session.selectList(namespace+"ottNameSelect", content_no);
	}

	@Override
	public List<ContentDTO> contentSelect(SearchItem sc) throws Exception {
		return session.selectList(namespace+"contentSelect", sc);
	}

	@Override
	public int contentCount(SearchItem sc) throws Exception {
		return session.selectOne(namespace+"contentCount", sc);
	}

	@Override
	public List<ContentDTO> searchSelect(Map<String, Object> map) throws Exception {
		return session.selectList(namespace+"searchSelect", map);
	}

	@Override
	public int searchCount(Map<String, Object> map) throws Exception {
		return session.selectOne(namespace+"searchCount", map);
	}

	@Override
	public List<ContentDTO> selectSearchWord(String content_nm) throws Exception {
		return session.selectList(namespace+"selectSearchWord", content_nm);
	}

	@Override
	public ContentDTO select(Integer content_no) throws Exception {
		return session.selectOne(namespace + "select", content_no);
	}

	@Override
	public ContentDTO selectContent(Integer content_no) throws Exception {
		return session.selectOne(namespace+"selectContent", content_no);
	}

	@Override
	public List<GenreDTO> selectGenrenm(Integer content_no) throws Exception {
		return session.selectList(namespace+"selectGenrenm", content_no);
	}

	@Override
	public List<ContentOTTDTO> selectOTT(Integer content_no) throws Exception {
		return session.selectList(namespace+"selectOTT", content_no);
	}

	@Override
	public List<ContentDTO> jjimSelect() throws Exception {
		return session.selectList(namespace+"jjimSelect");
	}

	@Override
	public List<ContentDTO> watchedSelect() throws Exception {
		return session.selectList(namespace+"watchedSelect");
	}

	@Override
	public List<ContentDTO> recomSelect(Integer user_no) throws Exception {
		return session.selectList(namespace+"recomSelect", user_no);
	}
	
}
