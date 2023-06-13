package com.ottt.ottt.dao.review;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.dto.ReviewLikeDTO;

@Repository
public class ReviewLikeDaoImpl implements ReviewLikeDao {
	@Autowired
	private SqlSession session;
	private static String namespace="com.ottt.ottt.dao.review.reviewLikeMapper.";
	
	@Override
	public int reviewLikeYN(Integer review_no, Integer user_no) {
		Map map = new HashMap();
		map.put(user_no, map);
		map.put(review_no, map);
	 return session.selectOne(namespace+"findLike", map);
	}

	@Override
	public int likeCount(Integer review_no) {
		
        
        return session.selectOne(namespace + "getLike", review_no);
	}

	@Override
	public int addLike(Integer review_no, Integer user_no) {
		Map map = new HashMap();
		map.put(user_no, map);
		map.put(review_no, map);
		return session.insert(namespace+ "likeUp", map);
	}

	@Override
	public int removeLike(Integer review_no, Integer user_no) {
		Map map = new HashMap();
		map.put(user_no, map);
		map.put(review_no, map);
		return session.delete(namespace+ "likeDown", map);
	}

}
