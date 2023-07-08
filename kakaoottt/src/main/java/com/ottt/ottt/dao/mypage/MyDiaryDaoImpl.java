package com.ottt.ottt.dao.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.MyDiaryDTO;

@Repository
public class MyDiaryDaoImpl implements MyDiaryDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace ="com.ottt.ottt.dao.mypage.MyDiaryMapper.";

	@Override
	public List<MyDiaryDTO> myDiaryAll(SearchItem sc) throws Exception {
		return session.selectList(namespace + "myDiaryAll", sc);
	}

	@Override
	public int myDiaryCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace + "myDiaryCnt", sc);
	}

	@Override
	public MyDiaryDTO selectDiary(Integer content_no, Integer user_no) throws Exception {
		Map map = new HashMap();
		map.put("user_no", user_no);
		map.put("content_no", content_no);		
		return session.selectOne(namespace + "selectDiary", map);
	}

	@Override
	public int updateDiary(MyDiaryDTO myDiaryDTO) throws Exception {
		return session.update(namespace + "updateDiary", myDiaryDTO);
	}

	@Override
	public int delete(Integer content_no, Integer user_no) throws Exception {
		Map map = new HashMap();
		map.put("user_no", user_no);
		map.put("content_no", content_no);
		return session.delete(namespace  + "delete" , map);
	}

	@Override
	public int insert(MyDiaryDTO mydiaryDTO) throws Exception {
		return session.insert(namespace + "insert", mydiaryDTO);
	}

	@Override
	public int diaryCnt(Integer content_no, Integer user_no) throws Exception {
		Map map = new HashMap();
		map.put("content_no", content_no);
		map.put("user_no", user_no);
		return session.selectOne(namespace + "diaryCnt", map);
	}

	@Override
	public List<MyDiaryDTO> diaryAll(Integer user_no) throws Exception {
		return session.selectList(namespace + "diaryAll", user_no);
	}

}
