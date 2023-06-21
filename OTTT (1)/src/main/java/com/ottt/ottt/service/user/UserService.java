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
}
