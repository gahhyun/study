package com.ottt.ottt.service.mypage;

import java.util.List;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.WishlistDTO;

public interface WishlistService {

	List<WishlistDTO> getWishlist(Integer user_no) throws Exception;
	int wishCheck(Integer user_no, Integer content_no) throws Exception;
	int wishCancel(Integer user_no, Integer content_no) throws Exception;
	List<WishlistDTO> getMyWishlist(SearchItem sc) throws Exception;
	int myWishlistCnt(SearchItem sc) throws Exception;
}
