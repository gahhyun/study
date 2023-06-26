package com.ottt.ottt.dao.community.QnA;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.dto.CommentDTO;

@Repository
public class QnACommentDaoImpl implements QnACommentDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace="com.ottt.ottt.dao.community.notice.commentMapper.";

	@Override
	public int delete(Integer cmt_no) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespace+"delete", cmt_no);
	}

	@Override
	public List<CommentDTO> selectAll(Integer article_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"selectList", article_no);
	}

	@Override
	public int insert(CommentDTO commentDTO) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespace+"insert", commentDTO);
	}

	@Override
	public int update(CommentDTO commentDTO) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace+"update", commentDTO);
	}

	@Override
	public int count(Integer article_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"count", article_no);
	}

}
