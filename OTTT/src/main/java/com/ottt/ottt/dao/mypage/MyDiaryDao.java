package com.ottt.ottt.dao.mypage;

import java.util.List;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.MyDiaryDTO;

public interface MyDiaryDao {
	
	//나의 다이어리
	List<MyDiaryDTO> myDiaryAll(SearchItem sc) throws Exception;
	int myDiaryCnt(SearchItem sc) throws Exception;
	MyDiaryDTO selectDiary(Integer content_no, Integer user_no) throws Exception;
	int updateDiary(MyDiaryDTO myDiaryDTO) throws Exception;
	int delete(Integer content_no, Integer user_no) throws Exception;
	int insert(MyDiaryDTO mydiaryDTO) throws Exception;
	int diaryCnt(Integer content_no, Integer user_no) throws Exception;
}
