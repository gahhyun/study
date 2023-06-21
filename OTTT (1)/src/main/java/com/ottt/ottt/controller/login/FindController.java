package com.ottt.ottt.controller.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class FindController {

	//아이디 찾기 
	@GetMapping(value = "/findID")
	public String findID() {
	return "/login/findId";		
	}
	
	@PostMapping(value = "/findID")
	public String findIDPost() {
	return "/login/findId";		
	}
	
	//비밀번호 찾기
	@GetMapping(value = "/findPwd")
	public String findPwd() {
	return "/login/findPwd";		
	}
	
	@PostMapping(value = "/findPwd")
	public String findPwdPost() {
	return "/login/findPwd";		
	}
	
	//아이디 확인
	@GetMapping(value = "/checkID")
	public String checkID() {
	return "/login/idVerify";		
	}
	
	@PostMapping(value = "/checkID")
	public String checkIDPost() {
	return "/login/idVerify";		
	}
	
	//비밀번호 재설정
	@GetMapping(value = "/checkPwd")
	public String checkPwd() {
	return "/login/pwdReset";		
	}
	
	@PostMapping(value = "/checkPwd")
	public String checkPwdPost() {
	return "/login/pwdReset";		
	}
}
