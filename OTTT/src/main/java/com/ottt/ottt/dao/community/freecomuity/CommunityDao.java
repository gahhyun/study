package com.ottt.ottt.dao.community.freecomuity;

import java.util.List;

import com.ottt.ottt.dto.ArticleDTO;
import com.ottt.ottt.dto.ArticleLikeDTO;
import com.ottt.ottt.dto.ArticleSearchDTO;
import com.ottt.ottt.dto.ReportDTO;

public interface CommunityDao {
	
	//게시글 전체 목록
	List<ArticleDTO> getArticleList(ArticleSearchDTO dto) throws Exception;
	
	//게시글 클릭시 하나만 선택
	ArticleDTO select(ArticleDTO dto) throws Exception;
	
	//게시글 저장
	int insert(ArticleDTO dto) throws Exception;
	
	//게시글 삭제
	int delete(Integer article_no) throws Exception;
	
	//게시글 수정
	int update(ArticleDTO articleDTO) throws Exception;

	//게시글 전체 개수??
	int getArticleTotalCount(ArticleSearchDTO dto) throws Exception;
	
	//좋아요 선택 여부확인
	int selectLikeCount(ArticleLikeDTO dto) throws Exception;
	
	//좋아요 저장
	int insertLike(ArticleLikeDTO dto) throws Exception;

	//좋아요 삭제
	int deleteLike(ArticleLikeDTO dto) throws Exception;

	//신고하기 저장
	int insertReport(ReportDTO dto) throws Exception;
	
}
