package com.ottt.ottt.controller.workDetailPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ottt.ottt.dao.login.LoginUserDao;
import com.ottt.ottt.dao.review.ReviewDao;
import com.ottt.ottt.dto.CommentDTO;
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
public class DetailReplyController {
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	LoginUserDao loginUserDao;
	
	@Autowired
	ReviewDao reviewDao;
	
	@Autowired
	ContentService contentService;
	
	@Autowired
	WatchedService watchedService;
	
	@Autowired
	WishlistService wishlistService;
	
	@GetMapping(value = "/detailPage/reply")
	public String reviewReply(Model m, HttpServletRequest request, HttpSession session,
			@RequestParam("content_no") int content_no, @RequestParam("review_no") int review_no) {
		UserDTO userDTO = loginUserDao.select((String)session.getAttribute("id"));
		m.addAttribute("content_no", content_no);
		try {
			ReviewDTO Review = reviewService.getReplyReview(content_no, review_no);
			List<CommentDTO> list = reviewService.getallreply(review_no);
			int count = reviewService.getReplyCount(review_no);
			System.out.println(review_no);
			System.out.println(content_no);
			 Double rating = reviewService.getRatingAvg(content_no);
				ContentDTO contentDTO = contentService.getContent(content_no);
				List<GenreDTO> genreDTO = contentService.getGenrenm(content_no);
				List<ContentOTTDTO> contentOTTlist = contentService.getOTT(content_no);
				m.addAttribute("contentOTTlist", contentOTTlist);
				m.addAttribute("genrenmlist", genreDTO);
				m.addAttribute("contentDTO", contentDTO);
			m.addAttribute("rating", rating);
			m.addAttribute("Review", Review);
			m.addAttribute("list", list);
			m.addAttribute("count", count);
			m.addAttribute(userDTO);
			request.setAttribute("rating", rating);
		} catch (Exception e) {
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
	         attr.addFlashAttribute("msg", "ok");
	         return "redirect:/detailPage/reply?content_no=" + reviewDTO.getContent_no() + "&review_no=" + commentDTO.getReview_no();
	      } catch (Exception e) {
	         e.printStackTrace();
	         m.addAttribute("msg", "fail");
	         return "redirect:/detailPage/reply?content_no="+ reviewDTO.getContent_no() + "&review_no=" + commentDTO.getReview_no();
	      }	   
	   }
	   
	   @PostMapping("/detailPage/reply/reviewremove")
	   public String replyreviewremove(RedirectAttributes rattr, HttpSession session, Model m,ReviewDTO reviewDTO,
			   @RequestParam("content_no") int content_no, @RequestParam("review_no") int review_no) {
	      Integer user_no = (Integer) session.getAttribute("user_no");
	      
	      String msg = "DEL_OK";
	      
	      try {
	    	
	         if(reviewService.removeReplyReview(review_no, user_no) !=1)
	         throw new Exception("Delete failed.");
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         msg = "DEL_ERR";
	      }

	      rattr.addFlashAttribute("msg", msg);
	      
	      
	      
	      return "redirect:/detailPage/review?content_no=" + content_no;
	   }
	   
	   @PostMapping("/detailPage/reply/replyremove")
	   public String replyremove(RedirectAttributes rattr, HttpSession session, Model m,ReviewDTO reviewDTO,
			   @RequestParam("content_no") int content_no, @RequestParam("review_no") int review_no, @RequestParam("cmt_no") Integer cmt_no) {
	      Integer user_no = (Integer) session.getAttribute("user_no");
	      
	      String msg = "REPLYDEL_OK";
	      System.out.println("컨트롤러 진입");
	      
	      try {
	    	
	         if(reviewService.removeReply(cmt_no, user_no) !=1) {
	        	 System.out.println("service문 실행");
	        	 System.out.println("cmt_no + " + cmt_no + "===================================================================================");
	        	 System.out.println("user_no + " + user_no + "===================================================================================");
	        	 throw new Exception("Delete failed.");
	         }
	         
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         msg = "REPLYDEL_ERR";
	      }

	      rattr.addFlashAttribute("msg", msg);
	      
	      
	      
	      return "redirect:/detailPage/reply?content_no="+ reviewDTO.getContent_no() + "&review_no=" + review_no;
	   }
	   
	   @PostMapping("/detailPage/reply/reviewmodify")
	   public String modifyReview(ReviewDTO reviewDTO, RedirectAttributes rattr, Model m, HttpSession session,
			   						@RequestParam("content_no") int content_no) {
	      Integer user_no = (Integer) session.getAttribute("user_no");
	      
	      
	      
	      
	      try {
	         Integer review_no = reviewDTO.getReview_no();
	               //reviewService.getReviewNo(reviewDTO);
	         //Integer review_no = reviewno.getReview_no();
	         m.addAttribute("review_no", review_no);
	         m.addAttribute("user_no",user_no);
	         if(reviewService.modifyReplyReview(reviewDTO) != 1)
	            throw new Exception("Modify failed");
	         
	         
	         rattr.addFlashAttribute("msg", "MOD_OK");
	         return "redirect:/detailPage/reply?content_no=" + content_no+ "&review_no=" + reviewDTO.getReview_no();
	      } catch (Exception e) {
	         e.printStackTrace();
	         m.addAttribute("reviewDTO", reviewDTO);
	         m.addAttribute("msg", "MOD_ERR");
	         return "redirect:/detailPage/reply?content_no=" + content_no+ "&review_no=" + reviewDTO.getReview_no();
	      }
	   }
	   
	   
	   @PostMapping("/detailPage/reply/replymodify")
	   @ResponseBody
	   public ResponseEntity<Map<String, Object>> modifyReply(CommentDTO commentDTO, RedirectAttributes rattr, Model m, HttpSession session,
	                                                           @RequestParam("content_no") int content_no, @RequestParam("review_no") int review_no) {
	       Integer user_no = (Integer) session.getAttribute("user_no");
	       Map<String, Object> response = new HashMap<>();

	       try {
	           CommentDTO cmt_no = reviewService.getReply(commentDTO.getCmt_no());
	           m.addAttribute("cmt_no", cmt_no);
	           m.addAttribute("user_no", user_no);
	           if (reviewService.modifyReply(commentDTO) != 1)
	               throw new Exception("Modify failed");

	           response.put("success", true);
	           response.put("message", "수정이 정상적으로 완료되었습니다.");
	           rattr.addFlashAttribute("msg", "REPLYMOD_OK");
	       } catch (Exception e) {
	           e.printStackTrace();
	           m.addAttribute("commentDTO", commentDTO);
	           response.put("success", false);
	           response.put("message", "수정 중 오류가 발생했습니다.");
	           rattr.addFlashAttribute("msg", "REPLYMOD_ERR");
	       }

	       return ResponseEntity.ok(response);
	   }
	   
	   

		//좋아요 시작
		@PostMapping("/reply/selectLikeCount")
		@ResponseBody
		public Map<String,Object> selectLikeCount(ReviewLikeDTO dto, HttpSession session) throws Exception {
				
		
				Map<String, Object> result = new HashMap<String,Object>();
				
				UserDTO userDTO = loginUserDao.select((String)session.getAttribute("id"));
		    	if (userDTO == null) {	   
		    		result.put("message", "로그인이 필요합니다.");
		    		return result;
		        }
		
		    	dto.setUser_no(userDTO.getUser_no());
		
				result.put("message", "success");
				result.put("result", reviewService.selectLikeCount(dto));
				
				return result;
		
			}
		
		
		
		
		
			@PostMapping("/reply/insertLike")
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
			@PostMapping("/reply/deleteLike")
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
			 @PostMapping("/reply/addWish")
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

			    @PostMapping("/reply/removeWish")
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
			
			    @RequestMapping(value = "/reply/getWishStatus")
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
			    
			    
			    
				 @PostMapping("/reply/addWatched")
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

				    @PostMapping("/reply/removeWatched")
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
				
				    @RequestMapping(value = "/reply/getWatchedStatus")
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
			@PostMapping("/detailPage/reply/report")
				public String ReplyReport(ReviewDTO reviewDTO, ReportDTO reportDTO, RedirectAttributes attr, 
						HttpSession session, @RequestParam("content_no") int content_no, @RequestParam("review_no") int review_no) {
					try {					
						 if (reviewService.replyReport(reportDTO) != 1) {
				                throw new Exception("Write failed");
				            }
						 attr.addFlashAttribute("msg", "success");
						 return "redirect:/detailPage/reply?content_no=" + content_no+ "&review_no=" + review_no;
					} catch (Exception e) {
						e.printStackTrace();
						attr.addFlashAttribute("msg", "fail");
						return "redirect:/detailPage/reply?content_no=" + content_no+ "&review_no=" + review_no;
					}				
				}
	   
	   
}
