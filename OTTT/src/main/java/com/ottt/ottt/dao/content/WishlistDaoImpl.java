package com.ottt.ottt.dao.content;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.dto.WishlistDTO;

@Repository
public class WishlistDaoImpl implements WishlistDao {
	
	@Autowired
	SqlSession session;
	private String namespace = "com.ottt.ottt.dao.home.WishlistMapper.";

	@Override
	public List<WishlistDTO> wishSelect(Integer user_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"wishSelect", user_no);
	}

	@Override
	public int wishInsert(Integer user_no, Integer content_no) throws Exception {
		Map map = new HashMap();
		
		map.put("user_no", user_no);
		map.put("content_no", content_no);
		return session.insert(namespace+"wishInsert", map);
	}

	@Override
	public int wishDelete(Map map) throws Exception {

		return session.delete(namespace+"wishDelete", map);
	}
	
	

}
