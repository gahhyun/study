package com.ottt.ottt.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class FollowController {

	//팔로우 
	@GetMapping(value = "/follower")
	public String follower() {
	return "/mypage/myprofile/followlist";		
	}
	
	//팔로잉
	@GetMapping(value = "/following")
	public String following() {
	return "";		
	}
}
