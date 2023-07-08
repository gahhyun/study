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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ottt.ottt.domain.PageResolver;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.mypage.WishlistService;
import com.ottt.ottt.service.user.UserService;

@Controller
@RequestMapping("/mypage")
public class WishController {
	
	@Autowired
	UserService us;
	
	@Autowired
	WishlistService ws;
	
	private static final Logger logger = LoggerFactory.getLogger(WishController.class);

		//MyWishlist 메인 
		@GetMapping(value = "/wishlist")
		public String myWishlist(String user, SearchItem sc, HttpSession session, Model m) {
			
			// 본인인지 확인			
			if(user.equals(session.getAttribute("user_nicknm")))
				m.addAttribute("userChk", true);
			
			logger.info("================================== wishlist 진입");

			
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
				
				
				int wishListCnt = ws.myWishlistCnt(sc);
				m.addAttribute("wishListCnt", wishListCnt);
				
				PageResolver pageResolver = new PageResolver(wishListCnt, sc);
				
				m.addAttribute(userDTO);
				m.addAttribute("pr", pageResolver);
				
			} catch (Exception e) {
				e.printStackTrace();
			}

			return "/mypage/myprofile/wishlist";			

		}
		
		
		@PostMapping("/getwishlist")
		@ResponseBody
		public Map<String, Object> getMyWishList(SearchItem sc, Model m) {
			
			
			logger.info("================================== getwishlist 진입");
			
			logger.info("================================== sc.getUser : " + sc.getUser());
			
			logger.info("================================== sc.getUser_no : " + sc.getUser_no());
			
			logger.info("================================== sc.getPage : " + sc.getPage());
			
			logger.info("================================== sc.getPageSize : " + sc.getPageSize());
			
			logger.info("================================== sc.getOffset : " + sc.getOffset());
			
			logger.info("================================== sc.getCategoryNo : " + sc.getCategoryNo());
			
			Map<String, Object> result = new HashMap<String, Object>();
			
			try {
				Integer user_no = us.getUserNoId(sc.getUser());
				sc.setUser_no(user_no);
				
				int wishListCnt = ws.myWishlistCnt(sc);
				
				PageResolver pageResolver = new PageResolver(wishListCnt, sc);
				
				result.put("list", ws.getMyWishlist(sc));
				result.put("wishListCnt", wishListCnt);
				result.put("pr", pageResolver);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
		
}
