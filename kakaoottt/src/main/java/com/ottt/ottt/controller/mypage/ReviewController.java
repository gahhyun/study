package com.ottt.ottt.controller.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.ottt.ottt.dto.ReviewDTO;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.review.ReviewService;
import com.ottt.ottt.service.user.UserService;

@Controller
@RequestMapping("/mypage")
public class ReviewController {
	
	@Autowired
	UserService us;
	
	@Autowired
	ReviewService rs;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	
	//myreview 메인 
	@GetMapping(value = "/myreview")
	public String myreview(SearchItem sc, Model m, String user, String category
							, HttpSession session, HttpServletRequest request) {
		
		logger.info("================================== myreview 진입");
		
		// 로그인 했는지 확인하면서 본인 리뷰 눌렀는지 확인
		if((session.getAttribute("user_nicknm") != null
				&& session.getAttribute("user_nicknm").equals(user)))			
			m.addAttribute("userChk", true);

		
		try {
			Integer user_no = (Integer) us.getUserNoId(user);
			UserDTO userDTO = us.getUser(user_no);
			
			sc.setPageSize(3);
			sc.setUser(userDTO.getUser_nicknm());
			sc.setUser_no(user_no);
			
			logger.info("================================== sc.getUser : " + sc.getUser());
			
			logger.info("================================== sc.getUser_no : " + sc.getUser_no());
			
			logger.info("================================== sc.getPage : " + sc.getPage());
			
			logger.info("================================== sc.getPageSize : " + sc.getPageSize());
			
			logger.info("================================== sc.getOffset : " + sc.getOffset());
			
			int reviewCnt = rs.myReviewCnt(sc);
			m.addAttribute("reviewCnt", reviewCnt);
			
			PageResolver pageResolver = new PageResolver(reviewCnt,sc);
			
			m.addAttribute("pr", pageResolver);
			m.addAttribute("category", category);
			m.addAttribute(userDTO);
			
		} catch (Exception e) { e.printStackTrace(); }		
		
		return "/mypage/myprofile/myreview";	
	}
	
	
	@PostMapping("/getreviewlist")
	@ResponseBody
	public Map<String, Object> getReviewList(SearchItem sc, Model m) {
		
		logger.info("================================== getreviewlist 진입");
		
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
			
			int reviewCnt;
			PageResolver pageResolver;
			List<ReviewDTO> list;
			
			switch (sc.getCategoryNo()) {
				case 1:
					reviewCnt = rs.likeReviewCnt(sc);					
					pageResolver = new PageResolver(reviewCnt, sc);
					list = rs.getLikeReview(sc);
					break;
					
				case 2:
					reviewCnt = rs.cmtReviewCnt(sc);					
					pageResolver = new PageResolver(reviewCnt, sc);
					list = rs.getCmtReview(sc);
					break;
					
				default:
					sc.setCategoryNo(0);
					reviewCnt = rs.myReviewCnt(sc);					
					pageResolver = new PageResolver(reviewCnt, sc);
					list = rs.getMyReview(sc);
					break;
			}			
			
			result.put("list", list);
			result.put("reviewCnt", reviewCnt);
			result.put("pr", pageResolver);


		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return result;
	}

}
