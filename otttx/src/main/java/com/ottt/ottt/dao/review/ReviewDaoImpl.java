package com.ottt.ottt.dao.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.CommentDTO;
import com.ottt.ottt.dto.ReportDTO;
import com.ottt.ottt.dto.ReviewDTO;
import com.ottt.ottt.dto.ReviewLikeDTO;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSession session;
	private static String namespace ="com.ottt.ottt.dao.review.reviewMapper.";
	
	//리뷰 페이지
	@Override
	public int delete(Integer review_no, int user_no) throws Exception {
		Map map = new HashMap();
		map.put("review_no", review_no);
		map.put("user_no", user_no);
		return session.delete(namespace+"delete", map);
	}
	@Override
	public int update(ReviewDTO reviewDTO) throws Exception {
		
		return session.update(namespace+"update", reviewDTO);
	}
	@Override
	public int insert(ReviewDTO dto) throws Exception {
		
		return session.insert(namespace+"insert", dto);
	}
	@Override
	public int count(int content_no) throws Exception {
		
		return session.selectOne(namespace+"count",content_no);
	}
	@Override
	public int reviewReport(ReportDTO reportDTO) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespace + "reviewReport", reportDTO);
	}
	@Override
	public List<ReviewDTO> selectAll(int content_no) throws Exception {
		
		return session.selectList(namespace+"selectAll",content_no);
	}
	@Override
	public ReviewDTO selectReview(Integer content_no, Integer user_no) throws Exception {
		Map map = new HashMap();
		map.put("user_no", user_no);
		map.put("content_no", content_no );
		return session.selectOne(namespace + "selectReview", map);
	}
	@Override
	public double ratingAvg(Integer content_no) throws Exception {
		Double average = session.selectOne(namespace + "ratingAvg", content_no);
		return (average != null) ? average : 0.0;
	}
	
	@Override
	public int updateCommentCnt(Integer review_no, int cnt) throws Exception {
		Map map = new HashMap();
		map.put("review_no", review_no);
		map.put("cnt", cnt);		
		return session.update(namespace + "updateCommentCnt", map);
	}
	
	@Override
	public int deleteCommentCnt(Integer review_no, int cnt) throws Exception {
		Map map = new HashMap();
		map.put("review_no", review_no);
		map.put("cnt", cnt);
		return session.update(namespace + "deleteCommentCnt", map);
	}
	
	
	//리플 페이지
	@Override
	public CommentDTO selectReply(Integer cmt_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "selectReply", cmt_no);
	}
	
	@Override
	public ReviewDTO replyReview(Integer content_no,  Integer review_no) {
		Map map = new HashMap();
		map.put("content_no", content_no );
		map.put("review_no", review_no);
		return session.selectOne(namespace + "replyReview", map);
	}
	
	@Override
	public List<CommentDTO> allreply(Integer review_no) throws Exception {
		
		return session.selectList(namespace+"allreply", review_no);
	}
	
	@Override
	public int replyCount(Integer review_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "replyCount", review_no);
	}
	
	@Override
	public int insertReply(CommentDTO commentDTO) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespace + "insertReply", commentDTO);
	}
	
	@Override
	public int deleteReply(Integer cmt_no, int user_no) throws Exception {
		Map map = new HashMap();
		map.put("cmt_no", cmt_no);
		map.put("user_no", user_no);
		return session.insert(namespace + "deleteReply", map);
	}
	@Override
	public List<ReviewDTO> myReviewAll(SearchItem sc) throws Exception {
		return session.selectList(namespace + "myReviewAll", sc);
	}
	@Override
	public int myReviewCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace + "myReviewCnt", sc);
	}
	@Override
	public int reviewDuplication(Integer content_no, int user_no) throws Exception {
		Map map = new HashMap();
		map.put("content_no", content_no);
		map.put("user_no", user_no);
		return session.selectOne(namespace + "reviewDuplication", map);
	}
	@Override
	public int selectLikeCount(ReviewLikeDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"selectLikeCount", dto);
	}
	@Override
	public int insertLike(ReviewLikeDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespace+"insertLike", dto);
	}
	@Override
	public int deleteLike(ReviewLikeDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespace+"deleteLike", dto);
	}
	@Override
	public int deleteReplyReview(Integer review_no, int user_no) throws Exception {
		Map map = new HashMap();
		map.put("review_no", review_no);
		map.put("user_no", user_no);		
		return session.delete(namespace+"deleteReplyReview", map);
	}
	@Override
	public int updateReplyReview(ReviewDTO reviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace + "updateReplyReview", reviewDTO);
	}
	@Override
	public int updateReply(CommentDTO CommentDTO) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace + "updateReply", CommentDTO);
	}
	@Override
	public int replyReport(ReportDTO reportDTO) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespace + "replyReport", reportDTO);
	}

}
