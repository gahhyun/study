package com.ottt.ottt.dao.content;

import java.util.List;
import java.util.Map;

import com.ottt.ottt.dto.WishlistDTO;

public interface WishlistDao {

	List<WishlistDTO> wishSelect(Integer user_no) throws Exception;
	int wishInsert(Integer user_no, Integer content_no) throws Exception;
	int wishDelete(Map map) throws Exception;
}
