package com.ottt.ottt.service.content;

import java.util.List;

import com.ottt.ottt.dto.SearchWordDTO;

public interface SearchWordService {

	List<SearchWordDTO> getSearchWordList(Integer user_no) throws Exception;
	int putSearchWord(Integer user_no, String content_nm) throws Exception;
	int removeSearchWord(Integer search_word_no) throws Exception;
	SearchWordDTO getOneSearchWord(Integer search_word_no) throws Exception;
}
