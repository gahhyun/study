package com.ottt.ottt.service.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public boolean watchedSelectOne(int user_no, int content_no) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("user_no", user_no);
        map.put("content_no", content_no);
        int count = watchedDao.watchedSelectOneByUser(map);
        return count > 0;
	}

}
