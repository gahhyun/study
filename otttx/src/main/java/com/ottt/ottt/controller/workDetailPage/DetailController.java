package com.ottt.ottt.controller.workDetailPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ottt.ottt.dao.login.LoginUserDao;
import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;
import com.ottt.ottt.dto.GenreDTO;
import com.ottt.ottt.dto.ReportDTO;
import com.ottt.ottt.dto.ReviewDTO;
import com.ottt.ottt.dto.ReviewLikeDTO;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.content.ContentService;

import com.ottt.ottt.service.mypage.WatchedService;
import com.ottt.ottt.service.mypage.WishlistService;
import com.ottt.ottt.service.review.ReviewService;

@Controller
public class DetailController {
	@Autowired
	private ReviewService reviewService;

	@Autowired
	WishlistService wishlistService;
	
	@Autowired
	LoginUserDao loginUserDao;
	@Autowired
	ContentService contentService;
	
	@Autowired
	WatchedService watchedService;
	
	
	@GetMapping(value = "/detailPage")
	public String workDetailPage(Model m, HttpServletRequest request, HttpSession session, @RequestParam("content_no") int content_no) {         //, Integer content_no) 
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		m.addAttribute("content_no", content_no);
		
		if(session.getAttribute("id") != null) {
			UserDTO userDTO = loginUserDao.select((String) session.getAttribute("id"));
			m.addAttribute(userDTO);
		}
			
		try {
			List<ReviewDTO> list = reviewService.getReview(content_no);
			
			int count = reviewService.getCount(content_no);
			 double rating = reviewService.getRatingAvg(content_no);
			
			 m.addAttribute("rating", rating);
	       
	        
			ReviewDTO myReview = reviewService.getReviewNo(content_no, user_no);
			
			
			ContentDTO contentDTO = contentService.getContent(content_no);
			List<GenreDTO> genreDTO = contentService.getGenrenm(content_no);
			List<ContentOTTDTO> contentOTTlist = contentService.getOTT(content_no);
			m.addAttribute("contentOTTlist", contentOTTlist);
			m.addAttribute("genrenmlist", genreDTO);
			m.addAttribute("contentDTO", contentDTO);
			m.addAttribute("list", list);
			m.addAttribute("count", count);
			m.addAttribute("myReview", myReview);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		return "/workDetailPage/workdetailpage";
	}
	
//	@GetMapping(value = "/detailPage/review")
//	public String workReview() {
//			return "/workDetailPage/review";		
//	}
//	

	@PostMapping(value = "/write")
	public String write(ReviewDTO reviewDTO, Model m, RedirectAttributes attr, HttpSession session) {
		
		try {
			boolean spoiler = reviewDTO.isSpoiler(); 
			reviewDTO.setSpoiler(spoiler);
			int duplication = reviewService.getDuplication(reviewDTO.getContent_no(), reviewDTO.getUser_no());
			if(duplication == 0) {
			if(reviewService.writeReview(reviewDTO)!=1) {
				throw new Exception("Write failed");
			}
			attr.addFlashAttribute("msg", "success");
			} else {
				attr.addFlashAttribute("msg", "fail");
				
				
			}
			
			return "redirect:/detailPage?content_no="+ reviewDTO.getContent_no(); 
			
		} catch (Exception e) {
			e.printStackTrace();
		
			
			
			return "redirect:/detailPage?content_no="+ reviewDTO.getContent_no(); 
			
			
		}
		
		
		
	}
	
	
	@PostMapping("/remove")
	public String remove(Integer review_no,RedirectAttributes rattr, HttpSession session, Model m,ReviewDTO reviewDTO) {
		int user_no = (int) session.getAttribute("user_no");
		
		
		String msg = "DEL_OK";
		
		try {
			if(reviewService.removeReview(review_no, user_no) !=1)
			throw new Exception("Delete failed.");
		} catch (Exception e) {
			e.printStackTrace();
			msg = "DEL_ERR";
		}

		rattr.addFlashAttribute("msg", msg);
		
		
		
		return "redirect:/detailPage?content_no="+reviewDTO.getContent_no();
	}
	
	
	@PostMapping("/modify")
	   public String modifyReview(ReviewDTO reviewDTO, RedirectAttributes rattr, Model m, HttpSession session) {
	      Integer user_no = (Integer) session.getAttribute("user_no");
	      
	      
	      
	      
	      try {
				boolean spoiler = reviewDTO.isSpoiler(); 
				reviewDTO.setSpoiler(spoiler);
	         Integer review_no = reviewDTO.getReview_no();
	               //reviewService.getReviewNo(reviewDTO);
	         //Integer review_no = reviewno.getReview_no();
	         m.addAttribute("review_no", review_no);
	         m.addAttribute("user_no",user_no);
	         if(reviewService.modifyReview(reviewDTO) != 1)
	            throw new Exception("Modify failed");
	         
	         
	         rattr.addFlashAttribute("msg", "MOD_OK");
	         return "redirect:/detailPage?content_no="+reviewDTO.getContent_no();
	      } catch (Exception e) {
	         e.printStackTrace();
	         m.addAttribute("reviewDTO", reviewDTO);
	         m.addAttribute("msg", "MOD_ERR");
	         return "redirect:/detailPage?content_no=" + reviewDTO.getContent_no();
	      }
	   }
	

	//좋아요 시작
	@PostMapping("/selectLikeCount")
	@ResponseBody
	public Map<String, Object> selectLikeCount(ReviewLikeDTO dto, HttpSession session) throws Exception {
	    Map<String, Object> result = new HashMap<String, Object>();

	    UserDTO userDTO = loginUserDao.select((String) session.getAttribute("id"));
	    if (userDTO == null) {
	        userDTO = new UserDTO();
	        userDTO.setUser_no(0); // 로그인하지 않은 상태의 user_no를 0으로 설정
	    }

	    dto.setUser_no(userDTO.getUser_no());

	    result.put("message", "success");
	    result.put("result", reviewService.selectLikeCount(dto));

	    return result;
	}
	
	
	
	
	
		@PostMapping("/insertLike")
		@ResponseBody
		public Map<String,Object> insertLike(ReviewLikeDTO dto, HttpSession session) throws Exception {
			
			

			Map<String, Object> result = new HashMap<String,Object>();
			
			UserDTO userDTO = loginUserDao.select((String)session.getAttribute("id"));
	    	if (userDTO == null) {	   
	    		result.put("message", "로그인이 필요합니다.");
	    		return result;
	        }
			dto.setUser_no(userDTO.getUser_no());

			result.put("message", "success");
			result.put("success", reviewService.insertLike(dto));
			
			
			return result;

		}
		
	//좋아요 삭제
		@PostMapping("/deleteLike")
		@ResponseBody
		public Map<String,Object> deleteLike(ReviewLikeDTO dto, HttpSession session) throws Exception {

			Map<String, Object> result = new HashMap<String,Object>();
			
			UserDTO userDTO = loginUserDao.select((String)session.getAttribute("id"));
	    	if (userDTO == null) {	   
	    		result.put("message", "로그인이 필요합니다.");
	    		return result;
	        }
			dto.setUser_no(userDTO.getUser_no());

			result.put("message", "success");
			result.put("success", reviewService.deleteLike(dto));
			
			return result;

		}

	
		 @PostMapping("/addWish")
		    @ResponseBody
		    public String addToWish(HttpSession session, @RequestParam("content_no") int content_no) {
		        Integer user_no = (Integer) session.getAttribute("user_no");
		        try {
		            wishlistService.wishCheck(user_no, content_no);
		            return "success";
		        } catch (Exception e) {
		            e.printStackTrace();
		            return "failure";
		        }
		    }

		    @PostMapping("/removeWish")
		    @ResponseBody
		    public String removeFromWish(HttpSession session, @RequestParam("content_no") int content_no) {
		        Integer user_no = (Integer) session.getAttribute("user_no");
		        try {
		            wishlistService.wishCancel(user_no, content_no);
		            return "success";
		        } catch (Exception e) {
		            e.printStackTrace();
		            return "failure";
		        }
		    }
		
		    @RequestMapping(value = "/getWishStatus")
		    @ResponseBody
		    public boolean getWishStatus(@RequestParam(value = "user_no", required = false) Integer user_no, @RequestParam("content_no") int content_no) {
		        if (user_no == null) {
		            return false;
		        }
		        
		        try {
		            return wishlistService.wishSelectOne(user_no, content_no);
		        } catch (Exception e) {
		            e.printStackTrace();
		            return false;
		        }
		    }
		    
		    
		    
			 @PostMapping("/addWatched")
			    @ResponseBody
			    public String addToWatched(HttpSession session, @RequestParam("content_no") int content_no) {
			        Integer user_no = (Integer) session.getAttribute("user_no");
			        try {
			            watchedService.watchedCheck(user_no, content_no);
			            return "success";
			        } catch (Exception e) {
			            e.printStackTrace();
			            return "failure";
			        }
			    }

			    @PostMapping("/removeWatched")
			    @ResponseBody
			    public String removeFromWatched(HttpSession session, @RequestParam("content_no") int content_no) {
			        Integer user_no = (Integer) session.getAttribute("user_no");
			        try {
			            watchedService.watchedCancel(user_no, content_no);
			            return "success";
			        } catch (Exception e) {
			            e.printStackTrace();
			            return "failure";
			        }
			    }
			
			    @RequestMapping(value = "/getWatchedStatus")
			    @ResponseBody
			    public boolean getWatchedStatus(@RequestParam(value = "user_no", required = false) Integer user_no, @RequestParam("content_no") int content_no) {
			        if (user_no == null) {
			            return false;
			        }
			        
			        try {
			            return watchedService.watchedSelectOne(user_no, content_no);
			        } catch (Exception e) {
			            e.printStackTrace();
			            return false;
			        }
			    }
			    
			 // 신고하기
				@PostMapping("/detailPage/report")
					public String ReviewReport(ReviewDTO reviewDTO, ReportDTO reportDTO, RedirectAttributes attr, 
							HttpSession session, @RequestParam("content_no") int content_no) {
						try {					
							 if (reviewService.reviewReport(reportDTO) != 1) {
					                throw new Exception("Write failed");
					            }
							 attr.addFlashAttribute("msg", "success");
							 return "redirect:/detailPage?content_no=" + content_no;
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
							attr.addFlashAttribute("msg", "fail");
							return "redirect:/detailPage?content_no=" + content_no;
						}				
					}
			    
	
}
