package com.ottt.ottt.dao.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.dto.UserDTO;

@Repository
public class LoginUserDaoImpl implements LoginUserDao {

	@Autowired
	private SqlSession session;
	private static String namespace = "com.ottt.ottt.dao.login.LoginMapper.";
	
	@Override
	public UserDTO select(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"select", id);
	}

	@Override
	public int insert(UserDTO user) {
		// TODO Auto-generated method stub
		return session.insert(namespace+"insert", user);
	}
	
	@Override
	public UserDTO selectNickname(String user_nicknm) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"selectNickname", user_nicknm);
	}

   @Override
   public UserDTO selectNo(Integer user_no) {
      // TODO Auto-generated method stub
      return session.selectOne(namespace + "selectNo", user_no);
   }
}
