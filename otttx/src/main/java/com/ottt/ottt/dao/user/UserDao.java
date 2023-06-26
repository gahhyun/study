package com.ottt.ottt.dao.user;

import java.util.List;
import java.util.Map;

import com.ottt.ottt.dto.UserDTO;


public interface UserDao {
	int insert(UserDTO userDTO) throws Exception;
	UserDTO select(String user_id) throws Exception;
	int update(UserDTO userDTO) throws Exception;
	int delete(Integer user_no, String user_id) throws Exception;
	List<UserDTO> selectAll() throws Exception;
	int up_nicknm(UserDTO userDTO) throws Exception;
	int selectUserNo(String user_id) throws Exception;
	int selectNicknmCnt(String user_nicknm) throws Exception;
	int up_pwd(UserDTO userDTO) throws Exception;
	int up_profile(UserDTO userDTO) throws Exception;
	UserDTO select(Integer user_no) throws Exception;
	int selectNoId(String user_nicknm) throws Exception;
	int insertUserOTT(Map map) throws Exception; 
	int insertUserGenre(Map map) throws Exception; 
	
	// 아이디찾기
	UserDTO selectEmail(String user_email) throws Exception;
	//비밀번호찾기
	UserDTO selectPwd(String user_email, String user_id) throws Exception;
	//비밀번호 재설정
	int resetPwd(String user_id, String user_pwd) throws Exception;
}
