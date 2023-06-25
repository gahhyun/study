package com.ottt.ottt.dao.community.QnA;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.dao.community.notice.ArticleNoticeDao;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ArticleDTO;

@Repository
public class ArticleQnADao implements ArticleNoticeDao {

	@Autowired
	private SqlSession session;
	private static String namespace = "com.ottt.ottt.dao.community.qnaMapper.";
	
	public List<ArticleDTO> selectPage(SearchItem sc, Integer user_no) throws Exception {	
		Map map = new HashMap();
		map.put("searchItem", sc);
		map.put("user_no", user_no);
		map.put("pageSize", sc.getPageSize());
	    map.put("offset", sc.getOffset());
		return session.selectList(namespace+"selectList", map);
	}
	
	public int count(SearchItem sc, Integer user_no) throws Exception {
		Map map = new HashMap();
		map.put("SearchItem", sc);
		map.put("user_no", user_no);
		return session.selectOne(namespace+"count", map);
	}
	
	public List<ArticleDTO> selectAll(SearchItem sc) throws Exception{
		return session.selectList(namespace+"selectAll", sc);
	}
	
	public int countAll(SearchItem sc) throws Exception {
		return session.selectOne(namespace+"countAll", sc);
	}

	@Override
	public int insert(ArticleDTO articleDTO) {
		return session.insert(namespace+"insert", articleDTO);
	}

	@Override
	public ArticleDTO select(Integer article_no) throws Exception {
		return session.selectOne(namespace+"select", article_no);
	}

	@Override
	public int update(ArticleDTO articleDTO) throws Exception {
		return session.update(namespace+"update", articleDTO);
	}

	@Override
	public int delete(Integer article_no) throws Exception {
		return session.delete(namespace+"delete", article_no);
	}

	@Override
	public List<ArticleDTO> selectPage(SearchItem sc) throws Exception {
		return null;
	}

	@Override
	public int count(SearchItem sc) throws Exception {
		return 0;
	}
}
