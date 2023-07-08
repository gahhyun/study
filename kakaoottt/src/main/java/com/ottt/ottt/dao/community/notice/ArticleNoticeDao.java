package com.ottt.ottt.dao.community.notice;

import java.util.List;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ArticleDTO;

public interface ArticleNoticeDao {

	List<ArticleDTO> selectPage(SearchItem sc) throws Exception;
	int insert(ArticleDTO articleDTO);
	int count(SearchItem sc) throws Exception;
	ArticleDTO select(Integer article_no) throws Exception;
	int update(ArticleDTO articleDTO) throws Exception;
	int delete(Integer article_no) throws Exception;
}
