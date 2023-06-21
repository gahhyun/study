package com.ottt.ottt.service.community.freecomuity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.community.freecomuity.CommunityDao;
import com.ottt.ottt.dto.ArticleDTO;
import com.ottt.ottt.dto.ArticleLikeDTO;
import com.ottt.ottt.dto.ArticleSearchDTO;
import com.ottt.ottt.dto.ReportDTO;

@Service
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	CommunityDao communityDao;
	
	/**
	 * 페이징용 목록
	 */
	//게시글 전체 목록
	@Override
	public List<ArticleDTO> getArticleList(ArticleSearchDTO dto) throws Exception {
		return communityDao.getArticleList(dto);
	}

	
	//게시글 클릭시 하나만 선택
	@Override
	public ArticleDTO select(ArticleDTO article_no) throws Exception {
		ArticleDTO articleDTO = communityDao.select(article_no);
		return articleDTO;
	}

	/**
	 * 게시글 삭제
	 */
	@Override
	public int delete(Integer article_no) throws Exception {
		int result = communityDao.delete(article_no);
		
		if(result>0) {
	        ArticleLikeDTO likeDTO = new ArticleLikeDTO();
	        likeDTO.setArticle_no(article_no);
	        communityDao.deleteLike(likeDTO);
	        
//			communityDao.deleteComment(article_no);
		}
		
		return result;
	}

	/**
	 * 게시글 저장
	 */
	@Override
	public int insert(ArticleDTO articleDTO) throws Exception {
		return communityDao.insert(articleDTO);
	}

	/**
	 * 게시글 수정
	 */
	@Override
	public int modify(ArticleDTO articleDTO) throws Exception {
		return communityDao.update(articleDTO);
	}


	/**
	 * 총 개수
	 */
	@Override
	public int getArticleTotalCount(ArticleSearchDTO dto) throws Exception {
		return communityDao.getArticleTotalCount(dto);
	}
	
	/**
	 * 좋아요를 눌렀는지 개수 카운팅
	 */
	@Override
	public int selectLikeCount(ArticleLikeDTO articleDTO) throws Exception {
		return communityDao.selectLikeCount(articleDTO);
	}

	/**
	 * 좋아요 저장
	 */
	@Override
	public int insertLike(ArticleLikeDTO articleDTO) throws Exception {
		return communityDao.insertLike(articleDTO);
	}
	
	/**
	 * 좋아요 삭제
	 */
	@Override
	public int deleteLike(ArticleLikeDTO articleDTO) throws Exception {
		return communityDao.deleteLike(articleDTO);
	}
	
	/**
	 * 신고하기 저장
	 */
	public int insertReport(ReportDTO dto) throws Exception {
		return communityDao.insertReport(dto);
	}

}
