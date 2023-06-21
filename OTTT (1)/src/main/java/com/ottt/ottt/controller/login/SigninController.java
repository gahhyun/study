package com.ottt.ottt.controller.login;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ottt.ottt.dao.login.LoginUserDao;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.dto.UserOTTDTO;
import com.ottt.ottt.service.login.LoginUserOTTService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/signin")
public class SigninController {
	
	@Autowired
	LoginUserDao userDao;
	@Autowired
	LoginUserOTTService loginUserOTTService;

	//약간동의 페이지 
	@GetMapping(value = "/term")
	public String term() {
	return "/login/term";		
	}
	
	@PostMapping(value = "/term")
	public String termPost() {
	return "/login/term";		
	}
	
	//회원가입 페이지
	@GetMapping(value = "/register")
	public String register() {
	return "/login/register";		
	}
	
	@PostMapping(value = "/register")
	public String registerPost(UserDTO user, BindingResult result, Model m) {
		if(!result.hasErrors()) {
			int rowCnt = userDao.insert(user);
			if(rowCnt != 0) return "redirect:/signin/addInfo";
		}
		
	return "/login/register";		
	}
	
	//필수정보 입력
	@GetMapping(value = "/reqInfo")
	public String reqInfo() {
	return "/login/reqInfo";		
	}
	
	@PostMapping(value = "/reqInfo")
	public String reqInfoPost() {
	return "/login/reqInfo";		
	}
	
	//추가정보 입력
	@GetMapping(value = "/addInfo")
	public String addInfo() {
	return "/login/addInfo";		
	}
	
	@PostMapping(value = "/addInfo", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	@ResponseBody
	public String addInfoPost(@Valid @RequestBody MultiValueMap<String, String> formData, HttpServletRequest request) {
	    Integer ott_no = Integer.parseInt(formData.getFirst("ott_no"));
	  HttpSession session = request.getSession();
	  UserDTO userDTO = userDao.select((String) session.getAttribute("id"));
	  UserOTTDTO userOTTDTO = new UserOTTDTO();
	  userOTTDTO.setUser_no(userDTO.getUser_no());
	  userOTTDTO.setOtt_no(ott_no);
	  loginUserOTTService.addOTT(userOTTDTO);
	  return "/";
	}
	
	//가입성공 페이지
	@GetMapping(value = "/complete")
	public String signinComplete() {
	return "/login/registerComple";		
	}
	
	@PostMapping(value = "/complete")
	public String signinCompletePost(String id, String pwd,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		//1. id와 pw를 확인
		if(!loginCheck(id, pwd)) {
		//2-1. 일치하지 않으면, loginForm으로 이동
		String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다", "utf-8");
		return "redirect:/signin/complete?msg="+msg;
		}
		
		//2-2. 일치하면 쿠키 생성
		Cookie cookie = new Cookie("id", id);
		response.addCookie(cookie);
					
		//3. 세션
		//	세션 객체 얻어오기
		HttpSession session = request.getSession();
		//	세션 객체에 id를 저장
		session.setAttribute("id", id);
		return "redirect:/";		
	}
	
	//DB꺼 가져와서 CHECK해야함
	private boolean loginCheck(String id, String pwd) {
		UserDTO user = userDao.select(id);
		if(user == null) return false;
		return user.getUser_pwd().equals(pwd);
	}
}
