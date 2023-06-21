package com.ottt.ottt.dao.community.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ArticleDTO;

@Repository
public class ArticleNoticeDaoImpl implements ArticleNoticeDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.ottt.ottt.dao.community.noticeMapper.";

	@Override
	public List<ArticleDTO> selectPage(SearchItem sc) throws Exception {
		return session.selectList(namespace+"selectList", sc);
	}

	@Override
	public int insert(ArticleDTO articleDTO) {
		return session.insert(namespace+"insert", articleDTO);
	}

	@Override
	public int count(SearchItem sc) throws Exception {
		return session.selectOne(namespace+"count", sc);
	}

	@Override
	public ArticleDTO select(Integer article_no) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"selectOne", article_no);
	}

	@Override
	public int update(ArticleDTO articleDTO) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace+"update", articleDTO);
	}

	@Override
	public int delete(Integer article_no) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespace+"delete", article_no);
	}

}
