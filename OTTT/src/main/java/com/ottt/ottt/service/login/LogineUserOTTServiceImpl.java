package com.ottt.ottt.service.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.login.LoginUserOTTDao;
import com.ottt.ottt.dto.UserOTTDTO;

@Service
public class LogineUserOTTServiceImpl implements LoginUserOTTService {

	@Autowired
	LoginUserOTTDao loginUserOTTDao; 
	
	@Override
	public int addOTT(UserOTTDTO userOTTTDto) {
		return loginUserOTTDao.insert(userOTTTDto);
	}

	@Override
	public UserOTTDTO getUserOTT(Integer user_no) {
		return loginUserOTTDao.select(user_no);
	}

}
