package com.ottt.ottt.service.community.EndmovieService;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.community.endmovie.EndMovieDao;
import com.ottt.ottt.dto.EndServiceDTO;

@Service
public class EndMovieServiceImpl implements EndMovieService {

	@Autowired
	EndMovieDao endMovieDao;
	
	@Override
	public List<EndServiceDTO> endOttSelect(Integer ott_no) throws Exception {
		return endMovieDao.endOttSelect(ott_no);
	}

	@Override
	public List<EndServiceDTO> getEndServiceList() throws Exception {
		// TODO Auto-generated method stub
		return endMovieDao.getEndServiceList();
	}

	@Override
	public List<EndServiceDTO> endDateSelect(Integer ott_no, String year, String month) throws Exception {
		// TODO Auto-generated method stub
		return endMovieDao.endDateSelect(ott_no, year, month);
	}

	@Override
	public List<EndServiceDTO> dayDateSelect(int ott_no, Date end_date_1, Date end_date_2) throws Exception {
		// TODO Auto-generated method stub
		return endMovieDao.dayDateSelect(ott_no, end_date_1, end_date_2);
	}

}
