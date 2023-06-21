package com.ottt.ottt.dao.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.dto.UserDTO;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.ottt.ottt.dao.user.UserMapper.";

	@Override
	public int insert(UserDTO userDTO) throws Exception {
		
		return session.insert(namespace+"insert", userDTO);
	}

	@Override
	public UserDTO select(String user_id) throws Exception {
		
		return session.selectOne(namespace + "select", user_id);
	}

	@Override
	public int update(UserDTO userDTO) throws Exception {
		
		return session.update(namespace+"update", userDTO);
	}

	@Override
	public int delete(Integer user_no, String user_id) throws Exception {
		Map map = new HashMap();
		map.put("user_no", user_no);
		map.put("user_id", user_id);
			
		return session.delete(namespace+"delete", map);
	}

	@Override
	public List<UserDTO> selectAll() throws Exception {

		return session.selectList(namespace + "selectAll");
	}

	@Override
	public int up_nicknm(UserDTO userDTO) throws Exception {
		
		return session.update(namespace +"up_nicknm" ,userDTO);
	}

	@Override
	public int selectUserNo(String user_id) throws Exception {
		
		return session.selectOne(namespace + "selectUserNo", user_id);
	}

	@Override
	public int selectNicknmCnt(String user_nicknm) throws Exception {
		
		return session.selectOne(namespace + "selectNicknmCnt" ,user_nicknm);
	}

	@Override
	public int up_pwd(UserDTO userDTO) throws Exception {
		
		return session.update(namespace +"up_pwd" ,userDTO);
	}
	
	@Override
	public int up_profile(UserDTO userDTO) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace +"up_profile" , userDTO);
	}

	@Override
	public UserDTO select(Integer user_no) throws Exception {
		return session.selectOne(namespace + "selectNo", user_no);
	}

	@Override
	public int selectNoId(String user_nicknm) throws Exception {
		return session.selectOne(namespace+ "selectNoId", user_nicknm);
	}

}
