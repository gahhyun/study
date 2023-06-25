package com.ottt.ottt.controller.mypage.pageVar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class AlarmController {

	//알림함 메인 
	@GetMapping(value = "/alarm")
	public String alarm() {
	return "/mypage/myprofile/message_alarm";		
	}
}
