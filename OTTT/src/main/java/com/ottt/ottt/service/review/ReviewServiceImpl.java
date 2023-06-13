package com.ottt.ottt.service.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.review.ReviewDao;
import com.ottt.ottt.dto.CommentDTO;
import com.ottt.ottt.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
    ReviewDao reviewDao;
	
	//리뷰 페이지
	@Override
	public int removeReview(Integer review_no, Integer user_no) throws Exception {
		
		return reviewDao.delete(review_no, user_no);
	}

	@Override
	public int modifyReview(ReviewDTO reviewDTO) throws Exception {
		
		return reviewDao.update(reviewDTO);
	}

	@Override
	public int writeReview(ReviewDTO dto) throws Exception {
		
		return reviewDao.insert(dto);
	}

	@Override
	public int getCount() throws Exception {
		
		return reviewDao.count();
	}

	@Override
	public List<ReviewDTO> getReview() throws Exception {
		
		return reviewDao.selectAll();
	}

	@Override
	public ReviewDTO getReviewNo(Integer content_no, Integer user_no) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.selectReview(content_no, user_no);
	}

	@Override
	public double getRatingAvg() throws Exception {
		
		return reviewDao.ratingAvg();
	}
	
	
	//리플페이지
	@Override
	public ReviewDTO getReplyReview(Integer content_no, Integer review_no) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.replyReview(content_no, review_no);
	}

	@Override
	public List<CommentDTO> getreply(Integer review_no) throws Exception {
		
		return reviewDao.allreply(review_no);
	}

	@Override
	public int getReplyCount(Integer review_no) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.replyCount(review_no);
	}

	@Override
	public int writeReply(CommentDTO commentDTO) throws Exception {
		reviewDao.updateCommentCnt(commentDTO.getReview_no(), 1);	//댓글 insert시 review테이블의 comment_cnt 1 증가
		return reviewDao.insertReply(commentDTO);
	}

	@Override
	public int removeReply(Integer cmt_no, Integer user_no) throws Exception {
		
		return reviewDao.deleteReply(cmt_no, user_no);
	}

	@Override
	public CommentDTO getReply(Integer cmt_no) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.selectReply(cmt_no);
	}

	

	
    

}
