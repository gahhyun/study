package com.ottt.ottt.dao.user;

import java.util.List;

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
}
