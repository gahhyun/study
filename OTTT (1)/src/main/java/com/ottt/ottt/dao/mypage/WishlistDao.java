package com.ottt.ottt.dao.mypage;

import java.util.List;
import java.util.Map;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.WishlistDTO;

public interface WishlistDao {

	List<WishlistDTO> wishSelect(Integer user_no) throws Exception;
	int wishInsert(Integer user_no, Integer content_no) throws Exception;
	int wishDelete(Integer user_no, Integer content_no) throws Exception;
	List<WishlistDTO> myWishListSelect(SearchItem sc) throws Exception;
	int myWishListCnt(SearchItem sc) throws Exception;
}
