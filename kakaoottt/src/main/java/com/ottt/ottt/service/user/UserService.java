package com.ottt.ottt.service.user;

import java.util.List;
import java.util.Map;

import com.ottt.ottt.dto.UserDTO;

public interface UserService {
	UserDTO getUser(String user_id) throws Exception;
	List<UserDTO> getAllUser() throws Exception;
	int bye(Integer user_no, String user_id) throws Exception;
	int modify(UserDTO userDTO) throws Exception;
	int mod_nick(UserDTO userDTO) throws Exception;
	int getUserNo(String user_id) throws Exception;
	int selectNicknmCnt(String user_nicknm) throws Exception;
	int mod_pwd(UserDTO userDTO) throws Exception;
	int mod_img(UserDTO userDTO) throws Exception;
	UserDTO getUser(Integer user_no) throws Exception;
	int getUserNoId(String user_nicknm) throws Exception;

	int putUserOTT(Map map) throws Exception; 
	int putUserGenre(Map map) throws Exception;
	
	//유저 OTT 추가정보 DELETE
	int removeUserOTT(Integer user_no) throws Exception;
	//유저 genre 추가정보 DELETE
	int removeUserGenre(Integer user_no) throws Exception;
		
	//아이디 찾기
	UserDTO getUserEmail(String user_email) throws Exception;
	//비밀번호찾기
	UserDTO getFindPwd(String user_email, String user_id) throws Exception;
	//비밀번호 재설정
	int resetPwd(String user_id, String user_pwd) throws Exception;
}
