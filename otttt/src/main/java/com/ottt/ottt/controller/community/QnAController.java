package com.ottt.ottt.controller.community;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ottt.ottt.dto.CommentDTO;
import com.ottt.ottt.dao.login.LoginUserDao;
import com.ottt.ottt.domain.PageResolver;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ArticleDTO;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.community.QnA.QnACommentService;
import com.ottt.ottt.service.community.QnA.QnAServiceImpl;

@Controller
@RequestMapping("/community")
public class QnAController {
	
	@Autowired
	QnAServiceImpl serviceImpl;
	@Autowired
	LoginUserDao loginUserDao;
	@Autowired
	QnACommentService qnACommentService;
	
	//QnA
		@GetMapping(value = "/QnA")
		public String QnA(SearchItem sc, Model m, HttpServletRequest request, HttpSession session) {
			
			try {
				UserDTO userDTO = loginUserDao.select((String) session.getAttribute("id"));
				char admin = (char) session.getAttribute("admin");
				if(admin=='Y') {
					int totalCnt = serviceImpl.getAllCount(sc);
					m.addAttribute("totalCnt", totalCnt);
					List<ArticleDTO> list = serviceImpl.getAllPage(sc);
					PageResolver pageResolver = new PageResolver(totalCnt, sc);
					m.addAttribute("list", list);
					m.addAttribute("pr", pageResolver);
				}else {
					int totalCnt = serviceImpl.getCount(sc, userDTO.getUser_no());
					m.addAttribute("totalCnt", totalCnt);
					List<ArticleDTO> list = serviceImpl.getPage(sc, userDTO.getUser_no());
					PageResolver pageResolver = new PageResolver(totalCnt, sc);
					m.addAttribute("list", list);
					m.addAttribute("pr", pageResolver);
				}	
			} catch (Exception e) {e.printStackTrace();}
			return "/community/QnA/QnA";		
		}
		
		@GetMapping("/QnA/read")
		public String read(Integer article_no, SearchItem sc, Model m, HttpSession session) {
			try {
				ArticleDTO articleDTO = serviceImpl.getArticle(article_no);
				m.addAttribute("articleDTO", articleDTO);
				
				if(session.getAttribute("id") != null) {
					UserDTO userDTO = loginUserDao.select((String) session.getAttribute("id"));
					m.addAttribute("userDTO", userDTO);			
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "redirect:/community/QnA";
			}
			return "/community/QnA/QnA board";
		}
		
		@PostMapping("/QnA/modify")
		public String modify(ArticleDTO articleDTO, RedirectAttributes rattr, Model m
			, HttpSession session, Integer page, Integer pageSize) {
			try {
				int a = serviceImpl.modify(articleDTO);
				if(a != 1) {
					throw new Exception("Modify failed");
				}
				rattr.addAttribute("page", page);
				rattr.addAttribute("pageSize", pageSize);
				rattr.addFlashAttribute("msg", "MOD_OK");
				return "redirect:/community/QnA/read?page="+page+"&pageSize="+pageSize+"&article_no="+articleDTO.getArticle_no();
			} catch (Exception e) {
				e.printStackTrace();
				m.addAttribute(articleDTO);
				m.addAttribute("page", page);
				m.addAttribute("pageSize", pageSize);
				m.addAttribute("msg", "MOD_ERR");		
				return "/community/QnA/QnA board";
			}
		}
		
		@PostMapping("/QnA/remove")
		public String remove(Integer article_no, Integer page, Integer pageSize, RedirectAttributes rattr) {
			String msg = "DEL_OK";
			try {
				if(serviceImpl.remove(article_no) != 1) {
					throw new Exception("Delete failed");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				msg = "DEL_ERR";
			}
			
			rattr.addAttribute("page", page);
			rattr.addAttribute("pageSize", pageSize);
			rattr.addFlashAttribute("msg", msg);
			
			return "redirect:/community/QnA";
		}
		
		@GetMapping("/QnA/write")
		public String write(Model m) {
			m.addAttribute("mode", "new");
			return "/community/QnA/QnA board";
		}
		
		@PostMapping("/QnA/write")
		public String writePost(ArticleDTO articleDTO, RedirectAttributes rattr, Model m, HttpSession session) {
			String writer = (String)session.getAttribute("id");
			UserDTO userDTO = loginUserDao.select(writer);
			articleDTO.setUser_no(userDTO.getUser_no());
			try {
				if(serviceImpl.write(articleDTO) != 1) {
					throw new Exception("Write failed");
				}
				rattr.addFlashAttribute("msg", "WRT_OK");
				return "redirect:/community/QnA";
			} catch (Exception e) {
				e.printStackTrace();
				m.addAttribute("mode", "new");			//글쓰기 모드
				m.addAttribute("articleDTO", articleDTO);	//등록하려던 내용을 보여줘야함
				m.addAttribute("msg", "WRT_ERR");
				return "/community/QnA/QnA board";
			}
		}
		
		@GetMapping("/QnA/QnAcomments")
		@ResponseBody
		public ResponseEntity<List<CommentDTO>> list(Integer article_no, HttpSession session, Model m){
			List<CommentDTO> list = null;
			
			try {
				list = qnACommentService.getList(article_no);
				String user_id = (String) session.getAttribute("id");
				UserDTO userDTO = loginUserDao.select(user_id);
				m.addAttribute("userDTO", userDTO);
				return new ResponseEntity<List<CommentDTO>>(list, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				return new ResponseEntity<List<CommentDTO>>(HttpStatus.BAD_REQUEST);
			}
			//return list;
		}
		
		@DeleteMapping("/QnA/QnAcomments/{cmt_no}")
		public ResponseEntity<String> remove(@PathVariable Integer cmt_no, Integer article_no){
			System.out.println(cmt_no+ article_no);
			
			try {
				int rowCnt = qnACommentService.remove(cmt_no);
				
				if(rowCnt != 1)
					throw new Exception("Delete Failed");
				
				return new ResponseEntity<>("삭제되었습니다.", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				return new ResponseEntity<String>("삭제되지 않았습니다. 다시 시도해주세요.", HttpStatus.BAD_REQUEST);
			}
		}
		
		@PostMapping("/QnA/QnAcomments")
		public ResponseEntity<String> write(@RequestBody CommentDTO commentDTO, Integer article_no, HttpSession session){
			String user_id = (String) session.getAttribute("id");
			UserDTO userDTO = loginUserDao.select(user_id);
			
			commentDTO.setUser_no(userDTO.getUser_no());
			commentDTO.setCmt_writer(userDTO.getUser_nicknm());
			commentDTO.setArticle_no(article_no);
			
			try {
				if(qnACommentService.write(commentDTO) != 1) {
					throw new Exception("Comment_wrtie Failed");
				}
				return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
			}
		}
		
		@PatchMapping("/QnA/QnAcomments/{cmt_no}")
		public ResponseEntity<String> modify(@PathVariable Integer cmt_no, @RequestBody CommentDTO commentDTO, HttpSession session){
			commentDTO.setCmt_no(cmt_no);
			try {
				if(qnACommentService.modify(commentDTO) != 1) {
					throw new Exception("Update Failed");
				}
				return new ResponseEntity<String>("MOD_OK", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
			}
			
		}
		
}





























