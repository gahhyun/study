package com.ottt.ottt.service.mypage;

import java.util.List;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.MyDiaryDTO;

public interface MyDiaryService {
	
	//나의 다이어리
    List<MyDiaryDTO> getMyDiary(SearchItem sc) throws Exception;
    int myDiaryCnt(SearchItem sc) throws Exception;
    MyDiaryDTO getDiary(Integer content_no, Integer user_no) throws Exception;
    int modDiary(MyDiaryDTO myDiaryDTO) throws Exception;
    int remove(Integer content_no, Integer user_no) throws Exception;
    int write(MyDiaryDTO myDiaryDTO) throws Exception;
}
