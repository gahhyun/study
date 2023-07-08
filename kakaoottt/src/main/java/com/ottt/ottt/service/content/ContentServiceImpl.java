package com.ottt.ottt.service.content;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.content.ContentDaoImpl;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;
import com.ottt.ottt.dto.GenreDTO;

@Service
public class ContentServiceImpl implements ContentService {

	@Autowired
	ContentDaoImpl contentDao;
	
	@Override
	public List<ContentDTO> getRating() throws Exception {
		return contentDao.ratingSelect();
	}

	@Override
	public List<ContentOTTDTO> getOttImg(Integer content_no) throws Exception {
		return contentDao.ottNameSelect(content_no);
	}

	@Override
	public List<ContentDTO> getContentList(SearchItem sc) throws Exception {
		return contentDao.contentSelect(sc);
	}

	@Override
	public int getContentTotalCount(SearchItem sc) throws Exception {
		return contentDao.contentCount(sc);
	}

	@Override
	public List<ContentDTO> getSearchSelect(Map<String, Object> map) throws Exception {
		return contentDao.searchSelect(map);
	}

	@Override
	public int getSearchTotalCount(Map<String, Object> map) throws Exception {
		return contentDao.searchCount(map);
	}

	@Override
	public List<ContentDTO> getSelectWord(String content_nm) throws Exception {
		return contentDao.selectSearchWord(content_nm);
	}

	@Override
	public ContentDTO getContent(Integer content_no) throws Exception {
		return contentDao.select(content_no);
	}

	@Override
	public List<GenreDTO> getGenrenm(Integer content_no) throws Exception {
		return contentDao.selectGenrenm(content_no);
	}

	@Override
	public List<ContentOTTDTO> getOTT(Integer content_no) throws Exception {
		return contentDao.selectOTT(content_no);
	}

	@Override
	public List<ContentDTO> getJjim() throws Exception {
		return contentDao.jjimSelect();
	}

	@Override
	public List<ContentDTO> getWatchedSelect() throws Exception {
		return contentDao.watchedSelect();
	}

	@Override
	public List<ContentDTO> getrecomSelect(Integer user_no) throws Exception {
		return contentDao.recomSelect(user_no);
	}
	
}
