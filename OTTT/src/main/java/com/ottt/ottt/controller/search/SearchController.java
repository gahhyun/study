package com.ottt.ottt.controller.search;

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
import com.ottt.ottt.domain.PageResolver;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.dto.WishlistDTO;
import com.ottt.ottt.service.content.ContentService;
import com.ottt.ottt.service.content.WishlistService;

@Controller
public class SearchController {
	
	@Autowired
	ContentService contentService;
	@Autowired
	WishlistService wishlistService;
	@Autowired
	LoginUserDao loginUserDao;

	@GetMapping("/search")
	public String search(Model m, HttpSession session) {
		
		return "/search/search";
	}
	
	@GetMapping("/searchList")
	public String searthList(@RequestParam(value="content_nm", required = false) String content_nm,
							 @RequestParam(value="ott_no", required = false) List<Integer> ott_no,
							 @RequestParam(value="gerne_no", required = false) List<Integer> gerne_no,
							 @RequestParam(value="category_no", required = false) List<Integer> category_no,
							 Model m, SearchItem sc, HttpSession session) {	
		
		sc.setPageSize(24);
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("content_nm", content_nm);
		searchMap.put("ott_no", ott_no);
		searchMap.put("gerne_no", gerne_no);
		searchMap.put("category_no", category_no);
		searchMap.put("SearchItem", sc);
				

		try {
			
			List<ContentDTO> searchList = contentService.getSearchSelect(searchMap);
			    
			int totalCount = contentService.getSearchTotalCount(searchMap);
			PageResolver pageResolver = new PageResolver(totalCount, sc);
			m.addAttribute("searchList", searchList);
			m.addAttribute("pr", pageResolver);
			
			Map<Integer, List<ContentOTTDTO>> map = new HashMap<Integer, List<ContentOTTDTO>>();
			for(ContentDTO contentDTO : searchList) {				
				List<ContentOTTDTO> ottList = contentService.getOttImg(contentDTO.getContent_no());
				map.put(contentDTO.getContent_no(), ottList);
			}
			m.addAttribute("ottList", map);
			
			if(session.getAttribute("no") != null) {
				Integer user_no = (Integer) session.getAttribute("no");
				List<WishlistDTO> wishList = wishlistService.getWishlist(user_no);
				m.addAttribute("wishList", wishList);
			}
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/genre/index";
	}
	
	@PatchMapping("/searchjjim")
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
	
	@DeleteMapping("/searchjjim")
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
