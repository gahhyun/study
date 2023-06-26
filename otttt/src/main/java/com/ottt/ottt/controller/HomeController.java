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

import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;
import com.ottt.ottt.dto.WishlistDTO;
import com.ottt.ottt.service.content.ContentServiceImpl;
import com.ottt.ottt.service.mypage.WishlistService;
import com.ottt.ottt.service.user.UserService;



@Controller
public class HomeController {

	@Autowired 
	ContentServiceImpl contentServiceImpl;
	@Autowired
	WishlistService wishlistService;
	@Autowired
	UserService userService;

	@GetMapping(value = "/")
	public String home(Model m, HttpSession session) {	
		
		try {
			
			// 별점 높은 순 작품 불러오기
			List<ContentDTO> ratingContentList = contentServiceImpl.getRating();
			m.addAttribute("ratingContentList", ratingContentList);
			// 별점 높은 순 작품들 ottList
			Map<Integer, List<ContentOTTDTO>> ottmap = new HashMap<Integer, List<ContentOTTDTO>>();
			for(ContentDTO contentDTO : ratingContentList) {				
				List<ContentOTTDTO> ottList = contentServiceImpl.getOttImg(contentDTO.getContent_no());
				ottmap.put(contentDTO.getContent_no(), ottList);
			}
			m.addAttribute("ottList", ottmap);
			
			// 찜 많은 순 작품 불러오기
			List<ContentDTO> jjimContentList = contentServiceImpl.getJjim();
			m.addAttribute("jjimContentList", jjimContentList);
			// 찜 많은 순 작품들 ottList
			Map<Integer, List<ContentOTTDTO>> jjimmap = new HashMap<Integer, List<ContentOTTDTO>>();
			for(ContentDTO contentDTO : jjimContentList) {				
				List<ContentOTTDTO> jjimList = contentServiceImpl.getOttImg(contentDTO.getContent_no());
				jjimmap.put(contentDTO.getContent_no(), jjimList);
			}
			m.addAttribute("jjimList", jjimmap);
			
			if(session.getAttribute("id") != null) {
				Integer user_no = (Integer) session.getAttribute("user_no");
				List<WishlistDTO> wishList = wishlistService.getWishlist(user_no);
				m.addAttribute("wishList", wishList);
				
				// login되어 있을 때 추가정보 이용해서 추천작 가져오기
				List<ContentDTO> recomContentList = contentServiceImpl.getrecomSelect((Integer)session.getAttribute("user_no"));
				m.addAttribute("recomContentList", recomContentList);
				// 추천작 ottList				
				Map<Integer, List<ContentOTTDTO>> recommap = new HashMap<Integer, List<ContentOTTDTO>>();
				for(ContentDTO contentDTO : recomContentList) {				
					List<ContentOTTDTO> recomList = contentServiceImpl.getOttImg(contentDTO.getContent_no());
					recommap.put(contentDTO.getContent_no(), recomList);
				}
				m.addAttribute("recomList", recommap);
			}else {
				// 봤어요 많은순 가져오기(login이 안되어있을 때 추천작품에 띄울거)
				List<ContentDTO> watchedContentList = contentServiceImpl.getWatchedSelect();
				m.addAttribute("watchedContentList", watchedContentList);
				//봤어요 많은순 작품들 ottList
				Map<Integer, List<ContentOTTDTO>> watchedmap = new HashMap<Integer, List<ContentOTTDTO>>();
				for(ContentDTO contentDTO : watchedContentList) {				
					List<ContentOTTDTO> watchedList = contentServiceImpl.getOttImg(contentDTO.getContent_no());
					watchedmap.put(contentDTO.getContent_no(), watchedList);
				}
				m.addAttribute("watchedList", watchedmap);
			}	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	return "home";
	}
	
	@GetMapping("/inserInfo")
	public String toHome(@RequestParam(value="ott_no", required = false) List<Integer> ott_no,
			 @RequestParam(value="genre_no", required = false) List<Integer> genre_no, HttpSession session) {
		Map<String, Object> ottMap = new HashMap<String, Object>();
		ottMap.put("ott_no", ott_no);
		ottMap.put("user_no", session.getAttribute("user_no"));
		Map<String, Object> genreMap = new HashMap<String, Object>();
		genreMap.put("genre_no", genre_no);
		genreMap.put("user_no", session.getAttribute("user_no"));

		try {
			userService.putUserOTT(ottMap);
			userService.putUserGenre(genreMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return "redirect:/";		
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