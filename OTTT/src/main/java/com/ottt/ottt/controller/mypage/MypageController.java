package com.ottt.ottt.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.user.UserService;

@Controller
public class MypageController {
	
	@Autowired
	UserService us;

	//마이페이지 메인
	@GetMapping(value = "/mypage")
	public String mypage(Model m, HttpServletRequest request) {

		
		if(!loginCheck(request))
			return "redirect:/login";
		
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
	
	private boolean loginCheck(HttpServletRequest request) {
		// 1. 세션을 얻어 (false는 session이 없어도 새로 생성하지 않음, 반환값은 null)
		HttpSession session = request.getSession(false);
		// 2. 세션에 id가 있는지 확인, 있으면 true를 반환 
		return session != null && session.getAttribute("id")!=null;
	}

}
