package com.ottt.ottt.controller.content;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ottt.ottt.controller.mypage.ReviewController;
import com.ottt.ottt.domain.PageResolver;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;
import com.ottt.ottt.dto.WishlistDTO;
import com.ottt.ottt.service.content.ContentService;
import com.ottt.ottt.service.mypage.WishlistService;

@Controller
@RequestMapping("/genre")
public class ContentController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	ContentService contentService;
	@Autowired
	WishlistService wishlistService;

	
	@GetMapping("/content")
	public String movie(Model m, @RequestParam(value = "ott", required = false) List<Integer> ott
							 , @RequestParam(value = "genre", required = false) List<Integer> genre
							 , String category
							 , HttpServletRequest request, HttpSession session, SearchItem sc) {
		
		logger.info("================================== movie 진입");
		
		sc.setPageSize(20);
		sc.setCategory(category);
		sc.setOtt_no(ott);
		sc.setGenre_no(genre);
		
		logger.info("================================== sc.setCategory(category) : " + sc.getCategory());
		
		try {
			Integer totalCnt = contentService.getContentTotalCount(sc);
			
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			
			List<ContentDTO> contentList = contentService.getContentList(sc);
						
			
			Map<Integer, List<ContentOTTDTO>> ottmap = new HashMap<Integer, List<ContentOTTDTO>>();
			for(ContentDTO contentDTO : contentList) {				
				List<ContentOTTDTO> ottList = contentService.getOttImg(contentDTO.getContent_no());
				ottmap.put(contentDTO.getContent_no(), ottList);
			}
			m.addAttribute("ottList", ottmap);
			
			if(session.getAttribute("id") != null) {
				Integer user_no = (Integer) session.getAttribute("user_no");
				List<WishlistDTO> wishList = wishlistService.getWishlist(user_no);
				m.addAttribute("wishList", wishList);
			}
			
			m.addAttribute("totalCnt", totalCnt);
			m.addAttribute("pr", pageResolver);
			m.addAttribute("category", category);
			m.addAttribute("contentList", contentList);

			
			return "/content/content";
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return "redirect:/";
		}	
		
	}
	
	@PatchMapping("/genrejjim")
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
	
	@DeleteMapping("/genrejjim")
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
