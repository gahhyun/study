package com.ottt.ottt.dao.community.endmovie;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.dto.EndServiceDTO;

@Repository
public class EndMovieDaoImpl implements EndMovieDao {

	
	@Autowired
	private SqlSession session;
	private static String namespace ="com.ottt.ottt.dao.community.endmovieMapper.";
	
	@Override
	public List<EndServiceDTO> endOttSelect(Integer ott_no) throws Exception {
		return session.selectList(namespace + "endOttSelect", ott_no);
	}

	@Override
	public List<EndServiceDTO> dayDateSelect(Integer ott_no, Date end_date_1, Date end_date_2) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ott_no", ott_no);
		map.put("end_date_1", end_date_1);
		map.put("end_date_2", end_date_2);
		return session.selectList(namespace + "dayDateSelect", map);
	}

	@Override
	public List<EndServiceDTO> getEndServiceList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "dayDateSelect");
	}

	@Override
	public List<EndServiceDTO> endDateSelect(Integer ott_no, String year, String month) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "endDateSelect");
	}

}
