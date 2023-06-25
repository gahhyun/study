package com.ottt.ottt.dao.login;

import com.ottt.ottt.dto.UserOTTDTO;

public interface LoginUserOTTDao {
	
	 int insert(UserOTTDTO userOTTTDto);
	 UserOTTDTO select(Integer user_no);

}
