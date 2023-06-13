package com.ottt.ottt.controller.mypage.pageVar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/messagewindow")
public class MessageWindowController {
	
	@GetMapping(value = "/open")
	public String open() {
		return "/mypage/myprofile/messagewindow";
	}
}
