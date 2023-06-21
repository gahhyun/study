package com.ottt.ottt.service.community.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.community.notice.ArticleNoticeDaoImpl;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ArticleDTO;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	ArticleNoticeDaoImpl articleNoticeDao;

	@Override
	public List<ArticleDTO> getPage(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return articleNoticeDao.selectPage(sc);
	}

	@Override
	public int write(ArticleDTO articleDTO) throws Exception {
		// TODO Auto-generated method stub
		return articleNoticeDao.insert(articleDTO);
	}

	@Override
	public int getCount(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return articleNoticeDao.count(sc);
	}

	@Override
	public ArticleDTO getArticle(Integer article_no) throws Exception {
		ArticleDTO articleDTO = articleNoticeDao.select(article_no);
		return articleDTO;
	}

	@Override
	public int modify(ArticleDTO articleDTO) throws Exception {
		// TODO Auto-generated method stub
		return articleNoticeDao.update(articleDTO);
	}

	@Override
	public int remove(Integer article_no) throws Exception {
		// TODO Auto-generated method stub
		return articleNoticeDao.delete(article_no);
	}
	
	
}
