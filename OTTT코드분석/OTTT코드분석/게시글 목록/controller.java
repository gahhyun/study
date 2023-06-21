	//메인 new 목록 *************************************************************************************************
	@PostMapping("/ajax/getArticleList")
	@ResponseBody
	public Map<String,Object> getArticleList(ArticleSearchDTO dto, HttpSession session) throws Exception {
                                            //ArticleSearchDTO에는 offset,user_no,schText,category
                                            // getArticleList에 필요한 매개변수는 offset,user_no,schText 
                                            
		logger.info(">>>>>>>>>>>>>>>>>>>>> @PostMapping /ajax/getArticleList getArticleList 진입 ");
		logger.info(">>>>>>>>>>>>>>>>>>>>> ArticleSearchDTO >>>> "+dto.toString());

		Map<String, Object> result = new HashMap<String,Object>();
		
		UserDTO userDTO = loginUserDao.select((String)session.getAttribute("id"));
		if(userDTO != null) {
			dto.setUser_no(userDTO.getUser_no());
		}
		result.put("message", "success");
		result.put("list", communityService.getArticleList(dto));
		result.put("totalCount", communityService.getArticleTotalCount(dto));
		
		return result;

	}