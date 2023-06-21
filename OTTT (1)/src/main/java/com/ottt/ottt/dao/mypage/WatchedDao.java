package com.ottt.ottt.dao.mypage;

import java.util.List;
import java.util.Map;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.WishlistDTO;

public interface WatchedDao {
	
	int watchedInsert(Integer user_no, Integer content_no) throws Exception;
	int watchedDelete(Integer user_no, Integer content_no) throws Exception;
	List<WishlistDTO> watchedListSelect(SearchItem sc) throws Exception;
	int watchedListCnt(SearchItem sc) throws Exception;

}
