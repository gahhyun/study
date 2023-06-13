package com.ottt.ottt.controller.mypage.pageVar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.ottt.ottt.dao.login.LoginUserDao;
import com.ottt.ottt.dto.UserDTO;

@Controller
@RequestMapping("/mypage")
public class MessageController {
	
	@Autowired
	LoginUserDao userDao;
	
	//쪽지함 메인 
	@GetMapping(value = "/message")
	public String message() {
		
	UserDTO userDto1 = userDao.select("id");
	UserDTO userDto2 = userDao.select("id");	
		return "/mypage/myprofile/message";
	}
	
	//쪽지함 셋팅
	@GetMapping(value = "/messagesetting")
	public String messagesetting() {
		return "/mypage/myprofile/message_set";
	}
	
}
