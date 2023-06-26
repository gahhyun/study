package com.ottt.ottt.dao.community.QnA;

import java.util.List;

import com.ottt.ottt.dto.CommentDTO;

public interface QnACommentDao {

	int delete(Integer cmt_no) throws Exception;
	List<CommentDTO> selectAll(Integer article_no) throws Exception;
	int insert(CommentDTO commentDTO) throws Exception;
	int update(CommentDTO commentDTO) throws Exception;
	int count(Integer article_no) throws Exception;
}
