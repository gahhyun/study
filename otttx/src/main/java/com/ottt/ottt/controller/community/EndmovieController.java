package com.ottt.ottt.controller.community;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ottt.ottt.dto.EndServiceDTO;
import com.ottt.ottt.service.community.EndmovieService.EndMovieService;

@Controller
@RequestMapping("/community")
public class EndmovieController {
	
	@Autowired
	EndMovieService endMovieService;
	
	@GetMapping(value = "/endmovie")
	public String endmovie() {
		
		    return "/community/endmovie/endmovie";
		}
	
	@PostMapping(value = "/endmovie/calendar", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String,Object>> endservice(@RequestBody Map<String, Object> data) throws Exception {
		String year = (String) data.get("year");
		String month = (String) data.get("month");
		Integer ott_no = Integer.parseInt((String) data.get("ott_no"));
		
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
		dtFormat.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		
		System.out.println(year);
		System.out.println(month);
		System.out.println(ott_no);
		
		String end_date_1_str = year +"-"+ month + "-01";
		String end_date_2_str = year + "-" +  month + "-" +LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), 1).lengthOfMonth();
	
		System.out.println(end_date_1_str);
		System.out.println(end_date_2_str);
				
		//List<EndServiceDTO> endServiceDTO = endMovieService.getEndServiceList();
		//String year = (String)
		//List<EndServiceDTO> lvo = endMovieService.endDateSelect(ott_no, year, month);
		//Integer ott_no = (int) endServiceDTO.get(ott_no);
		// 첫째날 끝날 구하기 구해서 date1, date2 를 스트링으로 만들어내기 
		//String end_date_1_str = lvo.get(0).getYear() + String.format("%02d", lvo.get(1).getMonth()) + "01";
		//String end_date_2_str = (year != null && month != null) ? year + month + LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), 1).lengthOfMonth() : "Default value";

	    List<Map<String, Object>> resultList = new ArrayList<>(); // resultList 초기화

	    try {
	        Date end_date_1 = dtFormat.parse(end_date_1_str);
	        Date end_date_2 = dtFormat.parse(end_date_2_str);
	        
	        System.out.println("end_date_1 : " + end_date_1);
	        System.out.println("end_date_2 : " + end_date_2);
	        
	        List<EndServiceDTO> originalList = endMovieService.dayDateSelect(ott_no, end_date_1, end_date_2);
	        System.out.println("오리지널리스트");
	        System.out.println(originalList);
	        System.out.println("오리지널리스트");

	        // originalList를 resultList로 맵핑하여 변환
	        for (EndServiceDTO originalItem : originalList) {
	            Map<String, Object> resultItem = new HashMap<>();
	            resultItem.put("day", originalItem.getDay());
	            resultItem.put("content", originalItem.getContent_nm());
	            resultList.add(resultItem);
	        }

	        System.out.println("결과리스트");
	        System.out.println(resultList);
	        System.out.println("결과리스트");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    Map<String, Object> response = new HashMap<String, Object>();
	    response.put("resultList", resultList); // 결과 리스트를 response에 추가
	    return ResponseEntity.ok(response);
	}
	
	@GetMapping(value = "/endmovie/{ott_no}")
	public String endmovieCoupang(Integer ott_no) {
		try {
			System.out.println("요청");
			endMovieService.endOttSelect(ott_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/community/endmovie/coupang";
	}
}
