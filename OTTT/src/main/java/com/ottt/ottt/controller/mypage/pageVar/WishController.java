package com.ottt.ottt.controller.mypage.pageVar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class WishController {

		//wishlist 메인 
		@GetMapping(value = "/wishlist")
		public String wishlist() {
		return "/mypage/myprofile/wishlist";		
		}
}
