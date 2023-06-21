package com.ottt.ottt.service.login;

import com.ottt.ottt.dto.UserOTTDTO;

public interface LoginUserOTTService {
	
	int addOTT(UserOTTDTO userOTTTDto);
	UserOTTDTO getUserOTT(Integer user_no);

}
