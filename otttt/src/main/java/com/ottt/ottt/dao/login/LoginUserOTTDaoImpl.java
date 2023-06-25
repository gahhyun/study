package com.ottt.ottt.dao.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.dto.UserOTTDTO;

@Repository
public class LoginUserOTTDaoImpl implements LoginUserOTTDao {
	
	@Autowired
	SqlSession session;
	public static String namespace="com.ottt.ottt.dao.login.addInfoMapper.";

	@Override
	public int insert(UserOTTDTO userOTTTDto) {
		// TODO Auto-generated method stub
		return session.insert(namespace+"insert", userOTTTDto);
	}

	@Override
	public UserOTTDTO select(Integer user_no) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"select", user_no);
	}

}
