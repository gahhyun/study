package com.ottt.ottt.dao.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.WishlistDTO;

@Repository
public class WatchedDaoImpl implements WatchedDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace ="com.ottt.ottt.dao.mypage.WatchedMapper.";
	
	@Override
	public int watchedInsert(Integer user_no, Integer content_no) throws Exception {
		Map map = new HashMap();		
		map.put("user_no", user_no);
		map.put("content_no", content_no);
		return session.insert(namespace+"watchedInsert", map);
	}
	
	@Override
	public int watchedDelete(Integer user_no, Integer content_no) throws Exception {
		Map map = new HashMap();		
		map.put("user_no", user_no);
		map.put("content_no", content_no);
		return session.delete(namespace+"watchedDelete", map);
	}
	
	@Override
	public List<WishlistDTO> watchedListSelect(SearchItem sc) throws Exception {
		return session.selectList(namespace+ "watchedListSelect", sc);
	}
	
	@Override
	public int watchedListCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace+ "watchedListCnt", sc);
	}

}
