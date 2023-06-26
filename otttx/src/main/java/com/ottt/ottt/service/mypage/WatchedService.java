package com.ottt.ottt.service.mypage;

import java.util.List;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.WishlistDTO;

public interface WatchedService {
	
	int watchedCheck(Integer user_no, Integer content_no) throws Exception;
	int watchedCancel(Integer user_no, Integer content_no) throws Exception;
	boolean watchedSelectOne(int user_no, int content_no) throws Exception;
	
	List<WishlistDTO> getWatchedlist(SearchItem sc) throws Exception;
	int watchedCnt(SearchItem sc) throws Exception;

}
