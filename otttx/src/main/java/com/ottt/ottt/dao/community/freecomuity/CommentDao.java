package com.ottt.ottt.dao.community.freecomuity;

import java.util.List;

import com.ottt.ottt.dto.CommentDTO;

public interface CommentDao {

	List<CommentDTO> getCommentList(CommentDTO dto) throws Exception;
	
	int insertComment(CommentDTO dto) throws Exception;

	int deleteComment(Integer cmt_no) throws Exception;

	int updateComment(CommentDTO dto) throws Exception;
}
