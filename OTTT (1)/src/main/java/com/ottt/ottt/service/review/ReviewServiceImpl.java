package com.ottt.ottt.service.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.review.ReviewDao;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.CommentDTO;
import com.ottt.ottt.dto.ReviewDTO;
import com.ottt.ottt.dto.ReviewLikeDTO;

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
	public int getCount(int content_no) throws Exception {
		
		return reviewDao.count(content_no);
	}

	@Override
	public List<ReviewDTO> getReview(int content_no) throws Exception {
		
		return reviewDao.selectAll(content_no);
	}

	@Override
	public ReviewDTO getReviewNo(Integer content_no, Integer user_no) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.selectReview(content_no, user_no);
	}

	@Override
	public double getRatingAvg(Integer content_no) throws Exception {
		
		return reviewDao.ratingAvg(content_no);
	}
	
	
	//리플페이지
	@Override
	public ReviewDTO getReplyReview(Integer content_no, Integer review_no) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.replyReview(content_no, review_no);
	}

	@Override
	public List<CommentDTO> getallreply(Integer review_no) throws Exception {
		
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

	@Override
	public List<ReviewDTO> getMyReview(SearchItem sc) throws Exception {
		return reviewDao.myReviewAll(sc);
	}

	@Override
	public int myReviewCnt(SearchItem sc) throws Exception {
		return reviewDao.myReviewCnt(sc);
	}

	@Override
	public int getDuplication(Integer content_no, int user_no) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.reviewDuplication(content_no, user_no);
	}

	@Override
	public int selectLikeCount(ReviewLikeDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.selectLikeCount(dto);
	}

	@Override
	public int insertLike(ReviewLikeDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.insertLike(dto);
	}

	@Override
	public int deleteLike(ReviewLikeDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.deleteLike(dto);
	}

	@Override
	public int removeReplyReview(Integer review_no, Integer user_no) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.deleteReplyReview(review_no, user_no);
	}

	@Override
	public int modifyReplyReview(ReviewDTO reviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.updateReplyReview(reviewDTO);
	}

	@Override
	public int modifyReply(CommentDTO CommentDTO) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.updateReply(CommentDTO);
	}
 

}
