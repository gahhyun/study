package com.ottt.ottt;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ottt.ottt.dao.user.UserDao;
import com.ottt.ottt.dto.UserDTO;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class UserDaoTest {
	
	@Autowired
	private UserDao userDao;
	
	//String user_id, String user_pwd, String user_nm, String user_nicknm, int user_gen,String user_email
	//@Test
	public void inserTest() throws Exception {
		UserDTO userDTO = new UserDTO("test123", "1234", "피카츄", "피카", 0, "piak@gmail.com");
		assertTrue(userDao.insert(userDTO)==1);

	}
	
	//@Test
	public void selectTest() throws Exception {
		assertTrue(userDao != null);
		System.out.println("userDao = " + userDao);
		
		UserDTO userDTO = userDao.select("test");
		System.out.println("userDTO = " + userDTO);
		assertTrue(userDTO.getUser_no().equals(2));				
	}
	
	//@Test
	public void deleteTest() throws Exception {
		UserDTO userDTO = new UserDTO("test123", "1234", "피카츄", "피카", 0, "piak@gmail.com");
		Integer user_no = userDao.selectAll().get(2).getUser_no();
		assertTrue(userDao.delete(user_no, userDTO.getUser_id())==1);
	}
	
	@Test
		public void updateTest() throws Exception {
			UserDTO userDTO = new UserDTO("test123", "1234", "피카츄", "피카", 0, "piak@gmail.com");
			assertTrue(userDao.insert(userDTO) == 1);
			
			Integer user_no = userDao.selectAll().get(1).getUser_no();
			System.out.println("user_no = " + user_no);
			userDTO.setUser_no(user_no);
			userDTO.setUser_nicknm("츄츄");
			assertTrue(userDao.update(userDTO)==1);
			
		}

}
