package com.ottt.ottt.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ottt.ottt.dao.login.LoginUserDao;
import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.dto.WishlistDTO;
import com.ottt.ottt.service.content.ContentServiceImpl;
import com.ottt.ottt.service.content.WishlistService;



@Controller
public class HomeController {

	@Autowired 
	ContentServiceImpl contentServiceImpl;
	@Autowired
	WishlistService wishlistService;
	@Autowired
	LoginUserDao loginUserDao;

	@GetMapping(value = "/")
	public String home(Model m, HttpSession session) {
		
		try {
			List<ContentDTO> contentList = contentServiceImpl.getRating();
			m.addAttribute("contentList", contentList);
			
			Map<Integer, List<ContentOTTDTO>> map = new HashMap<Integer, List<ContentOTTDTO>>();
			for(ContentDTO contentDTO : contentList) {				
				List<ContentOTTDTO> ottList = contentServiceImpl.getOttImg(contentDTO.getContent_no());
				map.put(contentDTO.getContent_no(), ottList);
			}
			m.addAttribute("ottList", map);
			
			if(session.getAttribute("no") != null) {
				Integer user_no = (Integer) session.getAttribute("user_no");
				List<WishlistDTO> wishList = wishlistService.getWishlist(user_no);
				m.addAttribute("wishList", wishList);
			}			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	return "home";
	}
	
	@PatchMapping("/jjim")
	@ResponseBody
	public ResponseEntity<String> insertJjim(@RequestParam Integer content_no, @RequestParam Integer user_no) {
		
		try {
			if(wishlistService.wishCheck(user_no, content_no) != 1) {
				throw new Exception("찜 등록 실패");
			}
			return new ResponseEntity<String>("찜 등록 성공", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("찜 등록 실패 에러", HttpStatus.BAD_REQUEST);
		}
		
	}
	
	@DeleteMapping("/jjim")
	public ResponseEntity<String> deleteJjim(@RequestParam Integer content_no, @RequestParam Integer user_no) {
		try {
			if(wishlistService.wishCancel(user_no, content_no) != 1) {
				throw new Exception("찜 해제 실패");
			}
			return new ResponseEntity<String>("찜 해제 성공", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("찜 헤제 실패 에러", HttpStatus.BAD_REQUEST);
		}
		
	}
}