package com.ottt.ottt.controller.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class EndmovieController {

	@GetMapping(value = "/endmovie")
	public String endmovie() {
			return "/community/endmovie/endmovie";		
	}
	
	@GetMapping(value = "/endmovie/coupang")
	public String endmovieCoupang() {
			return "/community/endmovie/coupang";		
	}
	
	@GetMapping(value = "/endmovie/disney")
	public String endmovieDisney() {
			return "/community/endmovie/disney";		
	}
	
	@GetMapping(value = "/endmovie/netflix")
	public String endmovieNetflix() {
			return "/community/endmovie/netflix";		
	}
	
	@GetMapping(value = "/endmovie/tving")
	public String endmovieTving() {
			return "/community/endmovie/tving";		
	}
	
	@GetMapping(value = "/endmovie/watcha")
	public String endmovieWatcha() {
			return "/community/endmovie/watcha";		
	}
	
	@GetMapping(value = "/endmovie/wavve")
	public String endmovieWavve() {
			return "/community/endmovie/wavve";		
	}

	//더보기
	@GetMapping(value = "/endmovie/more")
	public String endmovieMore() {
			return "/community/endmovie/month";		
	}
}
