package com.ottt.ottt.service.community.freecomuity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.community.freecomuity.CommentDao;
import com.ottt.ottt.dto.ArticleLikeDTO;
import com.ottt.ottt.dto.CommentDTO;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	CommentDao commentDao;

	/**
	 * 코멘트 목록
	 */
	@Override
	public List<CommentDTO> getCommentList(CommentDTO dto) throws Exception {
		return commentDao.getCommentList(dto);
	}
	
	/**
	 * 댓글 저장
	 */
	@Override
	public int insertComment(CommentDTO dto) throws Exception {
		return commentDao.insertComment(dto);
	}
	
	/**
	 * 댓글 삭제
	 */
	@Override
	public int deleteComment(Integer cmt_no) throws Exception {
		return commentDao.deleteComment(cmt_no);
	}
	
	/**
	 * 댓글 수정
	 */
	@Override
	public int updateComment(CommentDTO dto) throws Exception {
		return commentDao.updateComment(dto);
	}

}
