package com.ottt.ottt.controller.mypage.pageVar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class WatchedController {

	//watched 메인 
	@GetMapping(value = "/watched")
	public String watched() {
	return "/mypage/myprofile/watched";		
	}
}
