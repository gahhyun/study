package com.ottt.ottt.service.community.QnA;

import java.util.List;

import com.ottt.ottt.dto.CommentDTO;

public interface QnACommentService {

	List<CommentDTO> getList(Integer article_no) throws Exception;
	int remove(Integer cmt_no) throws Exception;
	int write(CommentDTO commentDTO) throws Exception;
	int modify(CommentDTO commentDTO) throws Exception;
	int count(Integer article_no) throws Exception;
}
