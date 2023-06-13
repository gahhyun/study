package com.ottt.ottt.service.community.QnA;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.community.QnA.QnACommentDao;
import com.ottt.ottt.dto.CommentDTO;

@Service
public class QnACommentServiceImpl implements QnACommentService {
	
	@Autowired
	QnACommentDao qnACommentDao;

	@Override
	public List<CommentDTO> getList(Integer article_no) throws Exception {
		// TODO Auto-generated method stub
		return qnACommentDao.selectAll(article_no);
	}

	@Override
	public int remove(Integer cmt_no) throws Exception {
		// TODO Auto-generated method stub
		return qnACommentDao.delete(cmt_no);
	}

	@Override
	public int write(CommentDTO commentDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnACommentDao.insert(commentDTO);
	}

	@Override
	public int modify(CommentDTO commentDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnACommentDao.update(commentDTO);
	}

	@Override
	public int count(Integer article_no) throws Exception {
		// TODO Auto-generated method stub
		return qnACommentDao.count(article_no);
	}

}
