package com.ottt.ottt.service.community.EndmovieService;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dto.EndServiceDTO;

@Service
public interface EndMovieService {
	
	List<EndServiceDTO> endOttSelect(Integer ott_no) throws Exception;
	List<EndServiceDTO> endDateSelect(Integer ott_no, String year, String month) throws Exception;
	List<EndServiceDTO> getEndServiceList() throws Exception;
	List<EndServiceDTO> dayDateSelect(int ott_no, Date end_date_1, Date end_date_2) throws Exception;
}
