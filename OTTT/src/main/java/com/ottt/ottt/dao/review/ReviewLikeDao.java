package com.ottt.ottt.dao.review;

import com.ottt.ottt.dto.ReviewLikeDTO;

public interface ReviewLikeDao {
	int reviewLikeYN(Integer review_no, Integer user_no);
	int likeCount(Integer review_no);
	
	int addLike(Integer review_no, Integer user_no);
	
	int removeLike(Integer review_no, Integer user_no);
	
}
