package com.ottt.ottt.controller.login;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ottt.ottt.dao.login.LoginUserDao;
import com.ottt.ottt.dto.UserDTO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class LoginController {
	
	@Autowired
	LoginUserDao userDao;

	//로그인 페이지
	@GetMapping(value = "/login")
	public String login(String toURL) {
		System.out.println("==========login=============== toURL : " + toURL);
		
	return "/login/loginForm";		
	}
	
	@PostMapping("/login")
	public String login(String user_id, String user_pwd, String toURL, boolean rememberId,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		if(!loginCheck(user_id, user_pwd)) {
		String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다", "utf-8");
		return "redirect:/login?msg="+msg;
		}

		if(rememberId) {
		Cookie cookie = new Cookie("id", user_id);
		response.addCookie(cookie);
		}
		else {
		Cookie cookie = new Cookie("id", user_id);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		}

		UserDTO userDTO = userDao.select(user_id);		
		HttpSession session = request.getSession();
		session.setAttribute("id", user_id);
		session.setAttribute("admin", userDTO.getAdmin());
		session.setAttribute("user_no", userDTO.getUser_no());
		session.setAttribute("user_nicknm", userDTO.getUser_nicknm());
		session.setAttribute("user_img", userDTO.getImage());
		
		System.out.println("==========login post=============== toURL : " + toURL);

		toURL = (toURL == null || toURL.equals("") || toURL.equals("null")) ? "/" : toURL;
				
		String encodedURL = URLEncoder.encode(toURL, "UTF-8")
				.replace("%2F", "/")
				.replace("%3A", ":")
				.replace("%3F", "?")
		        .replace("%3D", "=");
		
		System.out.println("==========encode=============== toURL : " + toURL);
		return "redirect:" + encodedURL;
	}
	
	private boolean loginCheck(String id, String pwd) {
		UserDTO user = userDao.select(id);
		if(user == null) return false;
		return user.getUser_pwd().equals(pwd);
	}
	
	//로그아웃 +(카카오 로그아웃 추가)
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		String access_token  = (String) session.getAttribute("kakaoToken");
		
		if(!"".equals(access_token) && access_token != "" && access_token != null) {
			
			log.info("=== logout > access_token : {}",access_token);
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("Authorization", "Bearer "+ access_token);
	
		    String reqURL = "https://kapi.kakao.com/v1/user/logout";

		    try {
		    	
		    	URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        conn.setRequestProperty("Authorization", "Bearer " + access_token);
		        
		        int responseCode = conn.getResponseCode();
		        
		        log.info("카카오 로그아웃 리턴코드 : " + responseCode);
		        
		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String result = "";
		        String line = "";

		        while ((line = br.readLine()) != null) {
		            result += line;
		        }
		        log.info("카카오 로그아웃 결과 : " + result);
		    } catch (IOException e) {
		    	e.printStackTrace();
		    }
		 }
		//로그인으로 생성한 세션을 다 지운다.
		session.invalidate();
		return "redirect:/";
	}
	
	//카카오 로그인 후 콜백 요청URL
	@GetMapping("/kakao_callback")
	//3.
	public String redirectkakao(@RequestParam String code, HttpServletResponse response,  HttpSession session)  throws Exception{
		
		log.info("============================ KakaoController ========================");
        log.info("code :: {}",code);

        // 접속토큰 get
        String kakaoToken = getKakaoReturnAccessToken(code);

        // 접속자 정보 get
        Map<String, Object> result = getKakaoUserInfo(kakaoToken);

        log.info("result :: {}", result);

        String kakaNo = (String) result.get("id");
        String userName = (String) result.get("nickname");
        String email = (String) result.get("email");
        String profileImage = (String) result.get("profileImage");
        String userpw = kakaNo;
        
        // 분기
        UserDTO userDto = new UserDTO();
        
        System.out.println(userDao.selectKakao(kakaNo));

        // kakaNo로 회원정보 조회시 없으면 회원가입
        if (userDao.selectKakao(kakaNo) == null) {

        	log.info("카카오로 회원가입");
        	userDto.setUser_id(email);
        	userDto.setUser_pwd(userpw);
        	userDto.setUser_nm(userName);
            userDto.setUser_nicknm(userName);
            userDto.setUser_email(email);

            userDto.setImage(profileImage);
            userDto.setKakao_no(kakaNo);

            userDto.setUser_gen(0);	//임시

            log.info("===================== insert 전 userDto의 값 == > "+userDto.toString());

            userDao.insert(userDto);
        }

        //kakaNo로 회원정보 조회시 있으면 로그인 처리
        log.info("카카오로 로그인");
        UserDTO userInfo = userDao.selectKakao(kakaNo);
		
		session.setAttribute("id", userInfo.getUser_id());
		session.setAttribute("admin", userInfo.getAdmin());
		session.setAttribute("user_no", userInfo.getUser_no());
		session.setAttribute("user_nicknm", userInfo.getUser_nicknm());
		session.setAttribute("user_img", userInfo.getImage());
		/* 로그아웃 처리 시, 사용할 토큰 값 */
		session.setAttribute("kakaoToken", kakaoToken);
		
		log.info("====================== kakaoToken : "+kakaoToken);
		log.info("member:: " + userInfo.toString());

		return "redirect:/";

    }

	//4.
	//카카오 회원정보 요청을 위한 access_token키 발급
	private String getKakaoReturnAccessToken(String code) {
	    String access_token = "";
	    String reqURL = "https://kauth.kakao.com/oauth/token";

	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	        // HttpURLConnection 설정 값 셋팅
	        conn.setRequestMethod("POST");
	        conn.setDoOutput(true);

	        // POST 파라미터 설정	rest key 입력
	        String clientId = "edf32697ba157c14f56289b28f1bf6c3";
	        String redirectUri = "http://localhost:8080/ottt/kakao_callback";
	        String parameters = String.format("grant_type=authorization_code&client_id="+clientId+"&redirect_uri="+redirectUri+"&code=%s", code);

	        // 요청 전송
	        conn.getOutputStream().write(parameters.getBytes());
	        conn.getOutputStream().flush();
	        conn.getOutputStream().close();

	        // 응답 받기
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String result = br.lines().collect(Collectors.joining());
	        br.close();

	        // 토큰 값 저장 및 리턴
	        JsonElement element = JsonParser.parseString(result);
	        access_token = element.getAsJsonObject().get("access_token").getAsString();
	        
	        log.info(" ■■■kakao■■■ access_token : {}",access_token);

	        conn.disconnect();
	    } catch (IOException e) {
	    	e.printStackTrace();
	    }

	    return access_token;
	}

	//5.
	//access_token키로 회원정보 요청
	private Map<String, Object> getKakaoUserInfo(String access_token) {
	    Map<String, Object> resultMap = new HashMap<>();

	    String reqURL = "https://kapi.kakao.com/v2/user/me";

	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");

	        // 요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_token);

	        int responseCode = conn.getResponseCode();
	        log.info(" ■■■kakao■■■ responseCode : {} ", responseCode);

	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

	        String result = br.lines().collect(Collectors.joining());
	        log.info("response : {}",result);

	        JsonElement element = JsonParser.parseString(result);
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	        String id = element.getAsJsonObject().get("id").getAsString();
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String email = kakao_account.getAsJsonObject().get("email").getAsString();
	        String profileImageUrl = properties.getAsJsonObject().get("profile_image").getAsString();
	        
	        log.info(" ■■■kakao■■■ id : {}", id);
	        log.info(" ■■■kakao■■■ email : {}",	email);
	        log.info(" ■■■kakao■■■ nickname : {}",	nickname);
	        log.info(" ■■■kakao■■■ profileImageUrl : {}", profileImageUrl);
	        
	        resultMap.put("id", id);
	        resultMap.put("email", email);
	        resultMap.put("nickname", nickname);
	        resultMap.put("profileImage", profileImageUrl);
	        
	        conn.disconnect();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return resultMap;
	}
	
}







