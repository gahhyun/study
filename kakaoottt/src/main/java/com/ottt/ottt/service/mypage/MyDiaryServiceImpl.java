package com.ottt.ottt.service.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.mypage.MyDiaryDao;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.MyDiaryDTO;

@Service
public class MyDiaryServiceImpl implements MyDiaryService {
	
	@Autowired
	MyDiaryDao myDiaryDao;

	@Override
	public List<MyDiaryDTO> getMyDiary(SearchItem sc) throws Exception {
		return myDiaryDao.myDiaryAll(sc);
	}

	@Override
	public int myDiaryCnt(SearchItem sc) throws Exception {
		return myDiaryDao.myDiaryCnt(sc);
	}

	@Override
	public MyDiaryDTO getDiary(Integer content_no, Integer user_no) throws Exception {
		return myDiaryDao.selectDiary(content_no, user_no);
	}

	@Override
	public int modDiary(MyDiaryDTO myDiaryDTO) throws Exception {
		return myDiaryDao.updateDiary(myDiaryDTO);
	}

	@Override
	public int remove(Integer content_no, Integer user_no) throws Exception {
		return myDiaryDao.delete(content_no, user_no);
	}

	@Override
	public int write(MyDiaryDTO myDiaryDTO) throws Exception {
		return myDiaryDao.insert(myDiaryDTO);
	}

	@Override
	public int diaryCnt(Integer content_no, Integer user_no) throws Exception {
		return myDiaryDao.diaryCnt(content_no, user_no);
	}

	@Override
	public List<MyDiaryDTO> getDiaryList(Integer user_no) throws Exception {
		return myDiaryDao.diaryAll(user_no);
	}

}
