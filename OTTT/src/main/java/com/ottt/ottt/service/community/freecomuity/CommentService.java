package com.ottt.ottt.service.community.freecomuity;

import java.util.List;

import com.ottt.ottt.dto.ArticleDTO;
import com.ottt.ottt.dto.ArticleLikeDTO;
import com.ottt.ottt.dto.ArticleSearchDTO;
import com.ottt.ottt.dto.CommentDTO;

public interface CommentService {
	
	/**
	 * 댓글 목록조회
	 */
	List<CommentDTO> getCommentList(CommentDTO dto) throws Exception;
	
	/**
	 * 댓글 저장
	 */
	int insertComment(CommentDTO dto) throws Exception;
	
	/**
	 * 댓글 삭제
	 */
	int deleteComment(Integer cmt_no) throws Exception;

	
	/**
	 * 댓글 수정
	 */
	int updateComment(CommentDTO dto) throws Exception;
}

