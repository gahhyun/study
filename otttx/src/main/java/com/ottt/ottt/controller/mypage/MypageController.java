package com.ottt.ottt.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.user.UserService;

@Controller
public class MypageController {
	
	@Autowired
	UserService us;

	//마이페이지 메인
	@GetMapping(value = "/mypage")
	public String mypage(Model m, HttpServletRequest request, String toURL) {
		System.out.println("==========GET=============== toURL : " + toURL);
		
		if(!loginCheck(request))
			return "redirect:/login?toURL="+toURL;
		
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("id");
		
		try {
			UserDTO userDTO = us.getUser(user_id);
			m.addAttribute(userDTO);
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		return "/mypage/myprofile/mypage";
	}
	
	
	@GetMapping("/profile")
	public String profile (String user, HttpSession session, Model m, RedirectAttributes rattr) {
		
		Integer my_no = session.getAttribute("user_no") != null ?
				(Integer) session.getAttribute("user_no") : -1;
		
		try {
			if(us.selectNicknmCnt(user) == 0)
				throw new Exception("No Uesr");
			Integer user_no = us.getUserNoId(user);
			
			if(my_no.equals(user_no)) {
				UserDTO userDTO = us.getUser(my_no);
				m.addAttribute(userDTO);
				return "redirect:/mypage";			
			}
			
			UserDTO userDTO = us.getUser(user_no);
			m.addAttribute(userDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
			rattr.addFlashAttribute("msg", "NO_USER");
			return "redirect:/";
		}
		
		return "/mypage/profile/profile";
	}

	@PostMapping("/profile")
	public String profile (Integer user_no, HttpSession session, HttpServletRequest request
							, Model m, String toURL, SearchItem sc) {
		
		Integer my_no = (Integer) session.getAttribute("user_no");

		System.out.println("=================================== my_no : " + session.getAttribute("user_no"));
		
		System.out.println("=================================== user_no : " + user_no);
		
		System.out.println("=================================== my_no != null : " + (my_no != null));
		
		System.out.println("=================================== toURL : " + toURL);
					
		
		// 내 프로필인지 아닌지 확인
		if((my_no != null)) {
			if((my_no.equals(user_no))) {
				UserDTO userDTO;
				try {
					userDTO = us.getUser(my_no);
					m.addAttribute(userDTO);
					return "redirect:/mypage";
					
				} catch (Exception e) { e.printStackTrace(); }
			}
		}
		
		UserDTO userDTO;
		try {
			userDTO = us.getUser(user_no);
			m.addAttribute(userDTO);
			
			return "/mypage/profile/profile";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:"+toURL;			
		}
	}
	
	private boolean loginCheck(HttpServletRequest request) {
		// 1. 세션을 얻어 (false는 session이 없어도 새로 생성하지 않음, 반환값은 null)
		HttpSession session = request.getSession(false);
		// 2. 세션에 id가 있는지 확인, 있으면 true를 반환 
		return session != null && session.getAttribute("id")!=null;
	}

}
