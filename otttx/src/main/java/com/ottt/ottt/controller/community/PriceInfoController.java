package com.ottt.ottt.controller.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class PriceInfoController {
	//price_info
		@GetMapping(value = "/priceInfoTving")
		public String priceInfoTving() {
				return "/community/priceInfo/priceTving";		
		}
		
		@GetMapping(value = "/priceInfoCoupang")
		public String priceInfoCoupang() {
				return "/community/priceInfo/priceCoupang";		
		}
		
		@GetMapping(value = "/priceInfoDisney")
		public String priceInfoDisney() {
				return "/community/priceInfo/priceDisneyplus";		
		}
		
		@GetMapping(value = "/priceInfoNetflix")
		public String priceInfoNetflix() {
				return "/community/priceInfo/priceNetflix";		
		}
		
		@GetMapping(value = "/priceInfoWatcha")
		public String priceInfoWatcha() {
				return "/community/priceInfo/priceWatcha";		
		}
		
		@GetMapping(value = "/priceInfoWavve")
		public String priceInfoWavve() {
				return "/community/priceInfo/priceWavve";		
		}
		
}
