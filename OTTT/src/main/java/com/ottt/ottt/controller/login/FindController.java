package com.ottt.ottt.controller.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.user.UserService;

@Controller
@RequestMapping("/login")
public class FindController {
	
	@Autowired
	UserService userService;

	//아이디 찾기 
	@GetMapping(value = "/findID")
	public String findID() {
	return "/login/findId";		
	}
	
	//비밀번호 찾기
	@GetMapping(value = "/findPwd")
	public String findPwd() {
	return "/login/findPwd";		
	}

	//아이디 확인
	@GetMapping(value = "/checkID")
	public String checkID(String user_email, Model m) {
		System.out.println("user_email : "+ user_email);
		
		try {
			UserDTO userDTO = userService.getUserEmail(user_email);
			if(userDTO == null) {
				m.addAttribute("msg", "NotFoundEmail");
				return "redirect:/login/findId";
			}
			m.addAttribute("userDTO", userDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	return "/login/idVerify";		
	}
	
	//비밀번호 재설정
	@GetMapping(value = "/checkPwd")
	public String checkPwd(String user_id, Model m) {
		m.addAttribute("user_id", user_id);
	return "/login/pwdReset";		
	}
	
	
	@PostMapping(value = "/checkPwd")
	public String checkPwdPost(String user_id, String user_pwd, Model m, RedirectAttributes rattr) {
		
		try {	
			if(userService.resetPwd(user_id, user_pwd) != 1) {
				throw new Exception("Modify failed");				
			}
		} catch (Exception e) {
			e.printStackTrace();
			rattr.addAttribute("pwdMsg", "ERR_PWD");
			return "redirect:/login/checkPwd?user_id="+user_id;
		}
		
		rattr.addAttribute("pwdMsg", "MOD_PWD");
		
		
		return "redirect:/login";	
	}
	
	//id&email 유저 유무 확인
	@PostMapping("/findUser")
	@ResponseBody
	public String findUser(String user_email, String user_id) {
//		System.out.println("=====================user_email"+ user_email);
//		System.out.println("=====================user_id"+user_id);
		try {
			UserDTO user = userService.getFindPwd(user_email, user_id);
			if(user != null) {
				return "success";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
}
