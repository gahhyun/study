package com.ottt.ottt.service.content;

import java.util.List;

import com.ottt.ottt.dto.WishlistDTO;

public interface WishlistService {

	List<WishlistDTO> getWishlist(Integer user_no) throws Exception;
	int wishCheck(Integer user_no, Integer content_no) throws Exception;
	int wishCancel(Integer user_no, Integer content_no) throws Exception;
}
