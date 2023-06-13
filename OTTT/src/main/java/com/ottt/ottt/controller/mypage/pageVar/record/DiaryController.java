package com.ottt.ottt.controller.mypage.pageVar.record;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class DiaryController {
	
	//mydiary 메인 
	@GetMapping(value = "/mydiary")
	public String mydiary() {
	return "/mypage/myprofile/mydiary";		
	}
	
	//mydiary 클릭 시(작성글 보기)
	@GetMapping(value = "/mydiary/poster")
	public String eidtdiary() {
	return "/mypage/myprofile/eidtdiary";		
	}
	
	//mydiary 글작성
	@GetMapping(value = "/mydiary/create")
	public String diarycreate() {
	return "/mypage/myprofile/diary";		
	}
}
