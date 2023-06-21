@Controller
@RequestMapping(value = "/community")
public class CommunityController {

	@Autowired
	CommunityService communityService;
	@Autowired
	LoginUserDao loginUserDao;		//로그인(회원)

    private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	//로깅은 애플리케이션에서 발생하는 이벤트, 상태, 오류 등의 정보를 기록하는 과정을 말합니다


	// freecommunity 메인호출 
	@GetMapping("/freecommunity")
	public String freecommunity(@RequestParam(value = "schText", required = false) String schText
								,@RequestParam(value = "category", required = false) String category,
								 HttpServletRequest request, HttpSession session, String toURL) throws Exception {
		
		logger.info(">>>>>>>>>>>>>>>>>>>>> @GetMapping /freecommunity freecommunity 진입 ");
		logger.info(">>>>>>>>>>>>>>>>>>>>> category 선택한 카테고리 : "+category);
		
		UserDTO userDTO = loginUserDao.select((String)session.getAttribute("id"));
				
		if(userDTO != null) {
			logger.info(">>>>>>>>>>>>>>> 로그인 아이디 정보 >>>>>>>>>>>>>>>>>>>> "+userDTO.getUser_id());
		}else {
			logger.info(">>>>>>>>>>>>>>> 로그인상태가 아닙니다. ");
		}

		logger.info(">>>>>>>>>>>>>>>>>>>>> schText 검색어 : "+schText);

		return "/community/freecommunity/communityMain";		

	}



}
