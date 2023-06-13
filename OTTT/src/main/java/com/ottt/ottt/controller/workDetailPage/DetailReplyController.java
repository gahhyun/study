package com.ottt.ottt.controller.workDetailPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ottt.ottt.dao.login.LoginUserDao;
import com.ottt.ottt.dto.CommentDTO;
import com.ottt.ottt.dto.ReviewDTO;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.review.ReviewService;

@Controller
public class DetailReplyController {
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	LoginUserDao loginUserDao;
	
	@GetMapping(value = "/detailPage/reply")
	public String reviewReply(Model m, HttpServletRequest request, HttpSession session,
			@RequestParam("content_no") int content_no, @RequestParam("review_no") int review_no) {
		UserDTO userDTO = loginUserDao.select((String)session.getAttribute("id"));
		
		try {
			ReviewDTO Review = reviewService.getReplyReview(content_no, review_no);
			List<CommentDTO> list = reviewService.getreply(review_no);
			int count = reviewService.getReplyCount(review_no);
			System.out.println(review_no);
			System.out.println(content_no);
			 Double rating = reviewService.getRatingAvg();
			m.addAttribute("rating", rating);
			m.addAttribute("Review", Review);
			m.addAttribute("list", list);
			m.addAttribute("count", count);
			m.addAttribute(userDTO);
			request.setAttribute("rating", rating);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return "/workDetailPage/reply";		
	}
	
	   @PostMapping("/detailPage/reply/write")
	   public String writeReply(CommentDTO commentDTO, RedirectAttributes attr,
	                     Model m, HttpSession session, ReviewDTO reviewDTO) {
		   
	      try {
	         if(reviewService.writeReply(commentDTO) != 1) {
	            throw new Exception("Write failed");
	            
	         }
	         attr.addFlashAttribute("msg", "fail");
	         return "redirect:/detailPage/reply?content_no=" + reviewDTO.getContent_no() + "&review_no=" + commentDTO.getReview_no();
	      } catch (Exception e) {
	         e.printStackTrace();
	         m.addAttribute("msg", "ok");
	         return "redirect:/detailPage/reply?content_no="+ reviewDTO.getContent_no() + "&review_no=" + commentDTO.getReview_no();
	      }	   
	   }
	   
	   @PostMapping("/detailPage/reply/remove")
	   public String remove(Integer review_no, RedirectAttributes rattr, HttpSession session, Model m, 
			   				@ModelAttribute("commentDTO") CommentDTO commentDTO, ReviewDTO reviewDTO) {
	      Integer user_no = (Integer) session.getAttribute("user_no");
	      Integer cmt_no = commentDTO.getCmt_no();
	      System.out.println(cmt_no);
	      
	      String msg = "DEL_OK";
	      
	      try {
	         if(reviewService.removeReply(cmt_no, user_no) !=1)
	         throw new Exception("Delete failed.");
	      } catch (Exception e) {
	         e.printStackTrace();
	         msg = "DEL_ERR";
	      }

	      rattr.addFlashAttribute("msg", msg);
	      
	      
	      
	      return "redirect:/detailPage/reply?content_no=" + 1 + "&review_no=" + 1;
	   }
	   
}
