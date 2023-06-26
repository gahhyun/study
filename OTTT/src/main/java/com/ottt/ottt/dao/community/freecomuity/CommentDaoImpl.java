package com.ottt.ottt.dao.community.freecomuity;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.dto.ArticleLikeDTO;
import com.ottt.ottt.dto.CommentDTO;

@Repository
public class CommentDaoImpl implements CommentDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.ottt.ottt.dao.CommentMapper.";

	/**
	 * 페이징용 목록
	 */
	@Override
	public List<CommentDTO> getCommentList(CommentDTO dto) throws Exception {
		return session.selectList(namespace + "getCommentList", dto);
	}
	
	/**
	 * 댓글 저장
	 */
	@Override
	public int insertComment(CommentDTO dto) throws Exception {
		return session.insert(namespace + "insertComment", dto);
	}
	
	/**
	 * 댓글 삭제 
	 */
	@Override
	public int deleteComment(Integer cmt_no) throws Exception {
		return session.delete(namespace + "deleteComment", cmt_no);
	}
	
	/**
	 * 댓글 수정
	 */
	@Override
	public int updateComment(CommentDTO dto) throws Exception {
		return session.insert(namespace + "updateComment", dto);
	}

}
