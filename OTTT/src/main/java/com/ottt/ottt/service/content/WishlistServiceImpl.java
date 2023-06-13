package com.ottt.ottt.service.content;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.content.WishlistDao;
import com.ottt.ottt.dto.WishlistDTO;

@Service
public class WishlistServiceImpl implements WishlistService {
	
	@Autowired
	WishlistDao wishlistDao;

	@Override
	public List<WishlistDTO> getWishlist(Integer user_no) throws Exception {
		// TODO Auto-generated method stub
		return wishlistDao.wishSelect(user_no);
	}

	@Override
	public int wishCheck(Integer user_no, Integer content_no) throws Exception {
		// TODO Auto-generated method stub
		return wishlistDao.wishInsert(user_no, content_no);
	}

	@Override
	public int wishCancel(Integer user_no, Integer content_no) throws Exception {
		Map map = new HashMap();
		map.put("user_no", user_no);
		map.put("content_no", content_no);
		return wishlistDao.wishDelete(map);
	}

}
