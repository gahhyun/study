package com.ottt.ottt.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	//myreview 메인 
	@GetMapping(value = "/myreview")
	public String myreview(SearchItem sc, Model m, String user
							, HttpSession session, HttpServletRequest request) {
		
		// 로그인 했는지 확인하면서 본인 다이어리 눌렀는지 확인 
		if((session.getAttribute("user_nicknm") != null
				&& session.getAttribute("user_nicknm").equals(user))
					|| (session.getAttribute("user_nicknm") != null 
							&& user == null)) {
			
			m.addAttribute("userChk", true);
			
			Integer user_no = (Integer) session.getAttribute("user_no");
			
			try {
				UserDTO userDTO = us.getUser(user_no);
				
				sc.setPageSize(3);
				sc.setUser(userDTO.getUser_nicknm());
				sc.setUser_no(user_no);
				
				int myReviewCnt = rs.myReviewCnt(sc);
				m.addAttribute("myReviewCnt", myReviewCnt);
				
				PageResolver pageResolver = new PageResolver(myReviewCnt,sc);
				
				List<ReviewDTO> list = rs.getMyReview(sc);
				m.addAttribute("list", list);
				m.addAttribute("pr", pageResolver);			
				m.addAttribute(userDTO);
				
			} catch (Exception e) { e.printStackTrace(); }
			
			
		}
		
		try {
			Integer user_no = (Integer) us.getUserNoId(user);
			UserDTO userDTO = us.getUser(user_no);
			
			sc.setPageSize(3);
			sc.setUser(userDTO.getUser_nicknm());
			sc.setUser_no(user_no);
			
			int myReviewCnt = rs.myReviewCnt(sc);
			m.addAttribute("myReviewCnt", myReviewCnt);
			
			PageResolver pageResolver = new PageResolver(myReviewCnt,sc);
			
			List<ReviewDTO> list = rs.getMyReview(sc);
			m.addAttribute("list", list);
			m.addAttribute("pr", pageResolver);			
			m.addAttribute(userDTO);
			
		} catch (Exception e) { e.printStackTrace(); }		
		
		
	return "/mypage/myprofile/myreview";
	
	}

}
