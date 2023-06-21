package com.ottt.ottt.service.community.freecomuity;

import java.util.List;

import com.ottt.ottt.dto.ArticleDTO;
import com.ottt.ottt.dto.ArticleLikeDTO;
import com.ottt.ottt.dto.ArticleSearchDTO;
import com.ottt.ottt.dto.ReportDTO;

public interface CommunityService {
	
	//service는 메서드의 이름을 dao와 dto와는 다른느낌
	
	/**
	 * 페이징용 목록
	 */
	List<ArticleDTO> getArticleList(ArticleSearchDTO dto) throws Exception;
	
	/**
	 * 상세조회
	 */
	ArticleDTO select(ArticleDTO article_no) throws Exception;
	
	/**
	 * 삭제
	 */
	int delete(Integer article_no) throws Exception;
	
	/**
	 * 등록
	 */
	int insert(ArticleDTO articleDTO) throws Exception;
	
	/**
	 * 수정
	 */
	int modify(ArticleDTO articleDTO) throws Exception;
	

	/**
	 * 총 건수
	 */
	int getArticleTotalCount(ArticleSearchDTO dto) throws Exception;

	/**
	 * 좋아요를 눌렀는지 개수 카운팅
	 */
	int selectLikeCount(ArticleLikeDTO dto) throws Exception;
	

	/**
	 * 좋아요를 저장
	 */
	int insertLike(ArticleLikeDTO dto) throws Exception;
	
	/**
	 * 좋아요를 삭제
	 */
	int deleteLike(ArticleLikeDTO dto) throws Exception;
	
	/**
	 * 신고하기 저장
	 */
	int insertReport(ReportDTO dto) throws Exception;

}

