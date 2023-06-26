package com.ottt.ottt.controller.community;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ottt.ottt.dao.login.LoginUserDao;
import com.ottt.ottt.domain.PageResolver;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ArticleDTO;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.community.notice.ArticleService;
import com.ottt.ottt.service.community.notice.ArticleServiceImpl;


@Controller
@RequestMapping("/community")
public class NoticeController {
	
	@Autowired
	ArticleServiceImpl articleService;
	@Autowired
	LoginUserDao loginUserDao;
	
	//notice
	@GetMapping(value = "/notice")
	public String notice(HttpSession session, SearchItem sc, Model m) {
		
		try {
			int totalCnt = articleService.getCount(sc);
			m.addAttribute("totalCnt", totalCnt);
			
			PageResolver pageResolver =  new PageResolver(totalCnt, sc);
			
			List<ArticleDTO> list = articleService.getPage(sc);
			m.addAttribute("list", list);
			m.addAttribute("pr", pageResolver);
			
			if(session.getAttribute("id") != null) {
				UserDTO userDTO = loginUserDao.select((String) session.getAttribute("id"));
				m.addAttribute("userDTO", userDTO);
//				if(userDTO.getAdmin()=='Y') {
//					m.addAttribute("mode", 'Y');
//				}
				
			}
		} catch (Exception e) {e.printStackTrace();}
		
			return "/community/notice/notice";		
	}
	
	@GetMapping("/notice/read")
	public String read(Integer article_no, SearchItem sc, Model m, HttpSession session) {

		try {
			ArticleDTO articleDTO = articleService.getArticle(article_no);
			m.addAttribute("articleDTO", articleDTO);
			
			if(session.getAttribute("id") != null) {
				UserDTO userDTO = loginUserDao.select((String) session.getAttribute("id"));
				m.addAttribute("userDTO", userDTO);
//				if(userDTO.getAdmin()=='Y') {
//					m.addAttribute("mode", 'Y');
//				}
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "redirect:/community/notice";
		}
		return "/community/notice/noticeboard";
	}
	
	@PostMapping("/notice/modify")
	public String modify(ArticleDTO articleDTO, RedirectAttributes rattr, Model m
			, HttpSession session, Integer page, Integer pageSize) {
		try {
			int a = articleService.modify(articleDTO);
			if(a != 1) {
				throw new Exception("Modify failed");
			}
			rattr.addAttribute("page", page);
			rattr.addAttribute("pageSize", pageSize);
			rattr.addFlashAttribute("msg", "MOD_OK");
			return "redirect:/community/notice/read?page="+page+"&pageSize="+pageSize+"&article_no="+articleDTO.getArticle_no();
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute(articleDTO);
			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);
			m.addAttribute("msg", "MOD_ERR");		
			return "/community/notice/noticeboard";
		}
	}
	
	@PostMapping("/notice/remove")
	public String remove(Integer article_no, Integer page, Integer pageSize, RedirectAttributes rattr) {	
		String msg = "DEL_OK";
		try {
			if(articleService.remove(article_no) != 1) {
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
		
		return "redirect:/community/notice";
	}
	
	@GetMapping("/notice/write")
	public String write(Model m) {
		m.addAttribute("mode", "new");
		return "/community/notice/noticeboard";
	}
	
	@PostMapping("/notice/write")
	public String writePost(ArticleDTO articleDTO, RedirectAttributes rattr, Model m, HttpSession session) {
		String writer = (String)session.getAttribute("id");
		UserDTO userDTO = loginUserDao.select(writer);
		articleDTO.setUser_no(userDTO.getUser_no());
		try {
			if(articleService.write(articleDTO) != 1) {
				throw new Exception("Write failed");
			}
			rattr.addFlashAttribute("msg", "WRT_OK");
			return "redirect:/community/notice";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("mode", "new");			//글쓰기 모드
			m.addAttribute("articleDTO", articleDTO);	//등록하려던 내용을 보여줘야함
			m.addAttribute("msg", "WRT_ERR");
			return "/community/notice/noticeboard";
		}
	}
		
}


















