package com.ottt.ottt.service.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.mypage.WatchedDao;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.WishlistDTO;

@Service
public class WatchedServiceImpl implements WatchedService {
	
	@Autowired
	WatchedDao watchedDao;

	@Override
	public int watchedCheck(Integer user_no, Integer content_no) throws Exception {
		return watchedDao.watchedInsert(user_no, content_no);
	}

	@Override
	public int watchedCancel(Integer user_no, Integer content_no) throws Exception {
		return watchedDao.watchedDelete(user_no, content_no);
	}

	@Override
	public List<WishlistDTO> getWatchedlist(SearchItem sc) throws Exception {
		return watchedDao.watchedListSelect(sc);
	}

	@Override
	public int watchedCnt(SearchItem sc) throws Exception {
		return watchedDao.watchedListCnt(sc);
	}

}
