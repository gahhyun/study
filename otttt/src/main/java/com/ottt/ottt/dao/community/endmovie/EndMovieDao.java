package com.ottt.ottt.dao.community.endmovie;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ottt.ottt.dto.EndServiceDTO;

public interface EndMovieDao {

	List<EndServiceDTO> endOttSelect(Integer ott_no) throws Exception;
	List<EndServiceDTO> dayDateSelect(Integer ott_no, Date end_date_1, Date end_date_2) throws Exception;
	List<EndServiceDTO> getEndServiceList() throws Exception;
	List<EndServiceDTO> endDateSelect(Integer ott_no, String year, String month);
	
	
	
	
}
