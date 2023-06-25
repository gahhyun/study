 package com.ottt.ottt.dao.login;

import com.ottt.ottt.dto.UserDTO;

public interface LoginUserDao {
	
	public UserDTO select(String id);
	public int insert(UserDTO user);
	public UserDTO selectNickname(String user_nicknm);
	public UserDTO selectNo(Integer user_no);
	
}
