package com.ottt.ottt.controller.mypage.pageVar;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ottt.ottt.domain.PageResolver;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.mypage.WatchedService;
import com.ottt.ottt.service.user.UserService;

@Controller
@RequestMapping("/mypage")
public class WatchedController {
	
	@Autowired
	UserService us;
	
	@Autowired
	WatchedService ws;
	
	private static final Logger logger = LoggerFactory.getLogger(WishController.class);

	//watched 메인 
	@GetMapping(value = "/watched")
	public String watched(String user, SearchItem sc, HttpSession session, Model m) {
		
		try {
			Integer user_no = us.getUserNoId(user);
			UserDTO userDTO = us.getUser(user_no);
			
			sc.setPageSize(12);
			sc.setUser(user);
			sc.setUser_no(user_no);
			
			logger.info("================================== 설정 후 ");
			
			logger.info("================================== sc.getUser : " + sc.getUser());
			
			logger.info("================================== sc.getUser_no : " + sc.getUser_no());
			
			logger.info("================================== sc.getPage : " + sc.getPage());
			
			logger.info("================================== sc.getPageSize : " + sc.getPageSize());
			
			logger.info("================================== sc.getOffset : " + sc.getOffset());
			
			
			int watchedCnt = ws.watchedCnt(sc);
			m.addAttribute("watchedCnt", watchedCnt);
			
			PageResolver pageResolver = new PageResolver(watchedCnt, sc);
			
			m.addAttribute(userDTO);
			m.addAttribute("pr", pageResolver);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return "/mypage/myprofile/watched";		
	}
	
	@PostMapping("/getwatchedlist")
	@ResponseBody
	public Map<String, Object> getWishList(SearchItem sc, Model m) {
		
		
		logger.info("================================== getwatchedlist 진입");
		
		logger.info("================================== sc.getUser : " + sc.getUser());
		
		logger.info("================================== sc.getUser_no : " + sc.getUser_no());
		
		logger.info("================================== sc.getPage : " + sc.getPage());
		
		logger.info("================================== sc.getPageSize : " + sc.getPageSize());
		
		logger.info("================================== sc.getOffset : " + sc.getOffset());
		
		logger.info("================================== sc.getCategory_no : " + sc.getCategoryNo());			
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			Integer user_no = us.getUserNoId(sc.getUser());
			sc.setUser_no(user_no);
			
			int watchedCnt = ws.watchedCnt(sc);
			
			PageResolver pageResolver = new PageResolver(watchedCnt, sc);
			
			result.put("list", ws.getWatchedlist(sc));
			result.put("watchedCnt", watchedCnt);
			result.put("pr", pageResolver);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
		
	
}
