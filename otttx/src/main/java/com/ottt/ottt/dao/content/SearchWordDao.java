package com.ottt.ottt.dao.content;

import java.util.List;

import com.ottt.ottt.dto.SearchWordDTO;

public interface SearchWordDao {

	int searchWordInsert(Integer user_no, String content_nm) throws Exception;
	List<SearchWordDTO> searchWorldSelect(Integer user_no) throws Exception;
	int searchWordDelete(Integer search_word_no) throws Exception;
	SearchWordDTO searchWorldOneSelect(Integer search_word_no) throws Exception;
}
