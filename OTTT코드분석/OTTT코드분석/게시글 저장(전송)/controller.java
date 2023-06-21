@Controller
@RequestMapping(value = "/community")
public class CommunityController {

	@Autowired
	CommunityService communityService;
	@Autowired
	LoginUserDao loginUserDao;		//로그인(회원)

    private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	//로깅은 애플리케이션에서 발생하는 이벤트, 상태, 오류 등의 정보를 기록하는 과정을 말합니다


	//게시글 community 저장
	@PostMapping("/freecommunity")
	public String freecommunity_post(ArticleDTO articleDTO, HttpServletRequest request) {
		
		logger.info(">>>>>>>>>>>>>>>>>>>>> @PostMapping /freecommunity freecommunityPost 진입 ");
		
		try {

			HttpSession session = request.getSession();
			//로그인 부분에서 sesstion에
			//session.setAttribute("id", user_id); 							회원 아이디
			//session.setAttribute("admin", userDTO.getAdmin());  			관리자여부
			//session.setAttribute("user_nicknm", userDTO.getUser_nicknm()); 닉네임
			//session.setAttribute("user_no", userDTO.getUser_no());		회원번호
			//session.setAttribute("user_img", userDTO.getImage());			프로필사진

			UserDTO userDTO = loginUserDao.select((String)session.getAttribute("id"));
			//현재 세션에 저장된 "id" 속성을 가져와서 해당하는 사용자 정보를 데이터베이스에서 조회
			
        	if (userDTO == null) {	   
        		logger.info("!!!! 로그인이 필요합니다. !!!!");
        		return "redirect:/login";
        	}

        	articleDTO.setUser_no(userDTO.getUser_no());
			//userDTO에서 회원번호를 얻어와서 articleDTO에 저장
        	
        	if (!articleDTO.getUpFile().isEmpty()) {
        		Base64.Encoder encoder = Base64.getEncoder();
        		byte[] photoEncode = encoder.encode(articleDTO.getUpFile().getBytes());        		
        		articleDTO.setArticle_image( new String(photoEncode, "UTF8") );
        		logger.info(">>>>>> 업로드 파일 이름은? "+articleDTO.getUpFile().getOriginalFilename());
        		articleDTO.setArticle_image_name(articleDTO.getUpFile().getOriginalFilename());
				//업로드된 파일이 존재하는지 확인하는 조건문입니다. 업로드된 파일이 있을 경우, 
				//파일을 처리하고 articleDTO 객체에 이미지와 이미지 이름을 설정합니다.
        	}
        	
        	communityService.insert(articleDTO);	        
			//communityService를 통해 articleDTO를 저장하는 메서드를 호출합니다. 
			//게시글을 데이터베이스에 저장하기 위한 비즈니스 로직을 수행합니다.		

		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return "redirect:/community/freecommunity";
		//처리가 완료된 후, /community/freecommunity 경로로 리다이렉트합니다
	}



}

*freecommunity_post 메서드의 매개변수로 Model m이 있었는데 필요없는 것이였다
이유는 Model 객체는 스프링 MVC에서 사용되는 데이터 전달을 위한 모델 객체이며, 
주로 뷰로 데이터를 전달하는 용도로 사용하는데 위의 코드에서 return 을 하는 부분에서
jsp를 반환하는게 아니라 리턴할 url를 지정하고 있다
