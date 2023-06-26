package com.ottt.ottt.service.community.notice;

import java.util.List;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ArticleDTO;

public interface ArticleService {

	List<ArticleDTO> getPage(SearchItem sc) throws Exception;
	int write(ArticleDTO articleDTO) throws Exception;
	int getCount(SearchItem sc) throws Exception;
	ArticleDTO getArticle(Integer article_no) throws Exception;
	int modify(ArticleDTO articleDTO) throws Exception;
	int remove(Integer article_no) throws Exception;
}
