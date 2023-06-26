package com.ottt.ottt.service.content;

import java.util.List;
import java.util.Map;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;
import com.ottt.ottt.dto.GenreDTO;

public interface ContentService {
	
	List<ContentDTO> getRating() throws Exception;
	List<ContentOTTDTO> getOttImg(Integer content_no) throws Exception;
	List<ContentDTO> getMovieList(SearchItem sc) throws Exception;
	int getMovieTotalCount(SearchItem sc) throws Exception;
	List<ContentDTO> getSearchSelect(Map<String, Object> map) throws Exception;
	int getSearchTotalCount(Map<String, Object> map) throws Exception;
	List<ContentDTO> getSelectWord(String content_nm) throws Exception;
	ContentDTO getContent(Integer content_no) throws Exception;
	List<GenreDTO> getGenrenm(Integer content_no) throws Exception;
	List<ContentOTTDTO> getOTT(Integer content_no) throws Exception;
	List<ContentDTO> getJjim() throws Exception;
	List<ContentDTO> getWatchedSelect() throws Exception;
	List<ContentDTO> getrecomSelect(Integer user_no) throws Exception;
}
