package com.ottt.ottt.controller.login;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ottt.ottt.dao.login.LoginUserDao;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.user.UserService;

@Controller
@RequestMapping("/signin")
public class SigninController {
	
	@Autowired
	LoginUserDao userDao;
	@Autowired
	UserService userService;
	@Autowired
	private JavaMailSender mailSender;

	//약간동의 페이지 
	@GetMapping(value = "/term")
	public String term() {
	return "/login/term";		
	}
	
	@PostMapping(value = "/term")
	public String termPost() {
	return "/login/term";		
	}
	
	//회원가입 페이지
	@GetMapping(value = "/register")
	public String register() {
	return "/login/register";		
	}
	
	@PostMapping(value = "/register")
	public String registerPost(UserDTO user, BindingResult result, Model m) {
		if(!result.hasErrors()) {
			int rowCnt;
			try {
				rowCnt = userDao.insert(user);
				if(rowCnt != 0) return "redirect:/signin/complete";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	return "/login/register";		
	}
	
	//필수정보 입력
	@GetMapping(value = "/reqInfo")
	public String reqInfo() {
	return "/login/reqInfo";		
	}
	
	@PostMapping(value = "/reqInfo")
	public String reqInfoPost() {
	return "/login/reqInfo";		
	}
	
	//추가정보 입력
	@GetMapping(value = "/addInfo")
	public String addInfo() {
		return "/login/addInfo";		
	}
	

	//가입성공 페이지
	@GetMapping(value = "/complete")
	public String signinComplete() {
		
		return "/login/registerComple";				
	}
	
	@PostMapping(value = "/complete")
	public String signinCompletePost(String user_id, String user_pwd,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		//1. id와 pw를 확인
		if(!loginCheck(user_id, user_pwd)) {
		//2-1. 일치하지 않으면, loginForm으로 이동
		String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다", "utf-8");
		return "redirect:/signin/complete?msg="+msg;
		}
					
		UserDTO userDTO = userDao.select(user_id);		
		HttpSession session = request.getSession();
		session.setAttribute("id", user_id);
		session.setAttribute("admin", userDTO.getAdmin());
		session.setAttribute("user_no", userDTO.getUser_no());
		session.setAttribute("user_nicknm", userDTO.getUser_nicknm());
		session.setAttribute("user_img", userDTO.getImage());
		return "redirect:/signin/addInfo";		
	}
	
	// 이메일 중복검사
	@RequestMapping(value = "/emailChk", method = RequestMethod.POST)
	@ResponseBody
	public String emailChk(String user_email) {
		
		try {
			
			UserDTO user = userService.getUserEmail(user_email);
			
			if(user == null)
				throw new Exception("user null");
			/*
			 * System.out.println("=======================user "+user);
			 * System.out.println("=========================user_email "+ user_email);
			 * System.out.println("============================user_getEmail "+user.
			 * getUser_email());
			 */
			
			if((user != null) && (user.getUser_email().equals(user_email))) {
				return "success";	
			} 	
			
		} catch (Exception e) {
			System.out.println("=====user null=====");
			return "fail";
		}	
		
		return "fail";		
	}
	
	//닉네임 중복검사
	@RequestMapping(value = "/nnameIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String nnameIdChk(String user_nicknm) {
		try {
			UserDTO user = userDao.selectNickname(user_nicknm);
			if(user != null && user.getUser_nicknm().equals(user_nicknm)) return "success";		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		return "fail";		
	}
	
	//아이디 중복검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChk(String user_id) {
		UserDTO user;
		try {
			user = userDao.select(user_id);
			if(user != null && user.getUser_id().equals(user_id)) return "success";		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return "fail";	
			
	}
	
	//DB꺼 가져와서 CHECK해야함
	private boolean loginCheck(String id, String pwd) {
		UserDTO user = userDao.select(id);
		if(user == null) return false;
		return user.getUser_pwd().equals(pwd);
	}
	
	/* 이메일 인증 */
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) throws Exception{
		
		/* 뷰(View)로부터 넘어온 데이터 확인 */
		System.out.println("이메일 전송 확인");
		System.out.println("인증번호 : "+email);
		
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		/* System.out.println("인증번호 "+ checkNum); */
		
		/* 이메일 보내기 */
		String setForm = "otttmailcheck@gmail.com";		// root-context.xml에 삽입한 자신의 이메일 계정의 이메일 주소
		String toMail = email;							// 수신받을 이메일(뷰로부터 받은 이메일 주소)
		String title = "OTTT 회원가입 인증 이메일 입니다.";	// 자신이 보낼 이메일 제목
		String content = 								// 자신이 보낼 이메일 내용
				"OTTT 홈페이지를 방문해주셔서 감사합니다."+
				"<br><br>" +
				"인증 번호는 "+checkNum+"입니다."+
				"<br>"+
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
		/* 이메일 전송을 위한 코드 */
		try {
			MimeMessage massage = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(massage, true, "utf-8");
			helper.setFrom(setForm);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(massage);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String num = Integer.toString(checkNum);
		
		return num;
	}
}
