package com.ottt.ottt.controller.mypage.pageVar;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ottt.ottt.dao.login.LoginUserDao;
import com.ottt.ottt.dao.user.UserDao;
import com.ottt.ottt.domain.MessagePageResolver;
import com.ottt.ottt.domain.MessageSearchItem;
import com.ottt.ottt.dto.MessageDTO;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.message.MessageService;

@Controller
@RequestMapping("/mypage")
public class MessageController {
	
	@Autowired
	MessageService messageService;
	@Autowired
	LoginUserDao loginUserDao;
	
	@GetMapping(value = "/message")
	public String message(MessageSearchItem msc, Model m, HttpSession session) {
		try {
			
			UserDTO userDTO = loginUserDao.select((String) session.getAttribute("id"));
			m.addAttribute("userDTO", userDTO);
			msc.setUser_no(userDTO.getUser_no());
			
			int totalCnt = messageService.getRecvResultCnt(msc);
			
			m.addAttribute("totalCnt", totalCnt);
			MessagePageResolver msgPageResolver = new MessagePageResolver(totalCnt, msc);
			
			//리스트 불러오기
			List<MessageDTO> list = messageService.loadRecvList(msc);
			//빈배열 생성
			List<MessageDTO> msgList = new ArrayList<>();			
			
			//삭제 안 한 애들만 넣기
			for(MessageDTO messageDTO : list) {
				if(!messageDTO.isDelete_by_receiver()) {
					msgList.add(messageDTO);
				}
			}
			
			m.addAttribute("list", msgList);
			m.addAttribute("mpr", msgPageResolver);

		} catch (Exception e) {e.printStackTrace();}
		return "/mypage/myprofile/message";
	}

	
	
	@GetMapping(value = "/message/send")
	public String sendMessage(MessageSearchItem msc, Model m, HttpSession session) {
		try {
			UserDTO userDTO = loginUserDao.select((String)session.getAttribute("id"));
			m.addAttribute("userDTO", userDTO);
			msc.setUser_no(userDTO.getUser_no());
			
			int totalCnt = messageService.getSendResultCnt(msc);
			
			m.addAttribute("totalCnt", totalCnt);
			MessagePageResolver msgPageResolver = new MessagePageResolver(totalCnt, msc);
			//먼저 불러오고
			List<MessageDTO> list = messageService.loadSendList(msc);
			//빈배열 생성
			List<MessageDTO> msgList = new ArrayList<>();			
			
			//삭제 안 한 애들만 넣기
			//거짓이어야 트루
			for(MessageDTO messageDTO : list) {
				if(!messageDTO.isDelete_by_sender()) {
					msgList.add(messageDTO);
				}
			}			
			
			m.addAttribute("list", msgList);
			m.addAttribute("mpr", msgPageResolver);
			
		} catch (Exception e) {e.printStackTrace();}
		return "/mypage/myprofile/message";
	}
	
	
	
	
	//원래 가진 값이 거짓이었으니 참으로 바꾸면 목록에서 삭제됨
	//쪽지 삭제(해당 쪽지)
	@PostMapping("/message/remove")
	public String removeMsgRecv(HttpSession session, Integer message_no) {		
		//현재 내 유저번호
		Integer user_no = (Integer)session.getAttribute("user_no");
		System.out.println("===============1111111111111===================== message_no : " +message_no);
		
		
		try {
			MessageDTO messageDTO = messageService.pickOneRecv(message_no);
			System.out.println("=================333333333333333333333=================== user_no : " +user_no);
			System.out.println("=================44444444444444444444444=================== messageDTO.getReceive_user_no() : " +messageDTO.getReceive_user_no());
			
			
			//맞다면
			if(user_no.equals(messageDTO.getReceive_user_no())) {
				System.out.println("-====================================55555555555555555555555555======messageDTO.isDelete_by_sender(): "+messageDTO.isDelete_by_receiver());  
				//디비에 저장하고
				messageService.removeByReceiver(messageDTO);
				//현재 값을 변경 - 일시적이라 컨틀로러에서만 돼서 디비에 저장 안 되니 위에랑 같이쓰기
				//messageService로 이동햇ㄷ음
				//messageDTO.setDelete_by_receiver(true);

				System.out.println("-======================================6666666666666666=======messageDTO.isDelete_by_receiver(): "+messageDTO.isDelete_by_receiver()); 
				System.out.println("==================77777777777777777================== messageDTO.isDelete_by_sender() : " +messageDTO.isDelete_by_sender());
					if(messageDTO.isDelete()) {
						System.out.println("==================8888888888888888888888================= messageDTO.getMessage_no() : " +messageDTO.getMessage_no());
						messageService.removeMsg(messageDTO.getMessage_no());
					}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mypage/message";
	}
	
	
	
	//쪽지 삭제(해당 쪽지)
	@PostMapping("/message/send/remove")
	public String removeMsgSend(HttpSession session, Integer message_no) {
		//현재 내 유저번호
		Integer user_no = (Integer)session.getAttribute("user_no");
		System.out.println("===============1111111111111===================== message_no : " +message_no);
		
		
		try {
			MessageDTO messageDTO = messageService.pickOneSend(message_no);
			//System.out.println("=================2222222222=================== messageDTO.isDelete_by_sender() : " +messageDTO.isDelete_by_sender());
			System.out.println("=================333333333333333333333=================== user_no : " +user_no);
			System.out.println("=================44444444444444444444444=================== messageDTO.getSend_user_no() : " +messageDTO.getSend_user_no());
			
			
			//맞다면
			if(user_no.equals(messageDTO.getSend_user_no())) {
				System.out.println("-====================================55555555555555555555555555======messageDTO.isDelete_by_sender(): "+messageDTO.isDelete_by_sender()); 
				
				//여기도 바꿔
				messageService.removeBySender(messageDTO);
				messageDTO.setDelete_by_sender(true);
				
				System.out.println("-======================================6666666666666666=======messageDTO.isDelete_by_sender(): "+messageDTO.isDelete_by_sender()); 
				System.out.println("==================77777777777777777================== messageDTO.isDelete_by_receiver() : " +messageDTO.isDelete_by_receiver());
					if(messageDTO.isDelete()) {
						System.out.println("==================8888888888888888888888================= messageDTO.getMessage_no() : " +messageDTO.getMessage_no());
						messageService.removeMsg(messageDTO.getMessage_no());
					}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mypage/message/send";
	}
	
	//유저 프로필 선택 시 그 사람 마이페이지로 넘어가게 하는 ?? 기능??

	//쪽지함 환경설정
	@GetMapping(value = "/messagesetting")
	public String messagesetting() {
		return "/mypage/myprofile/message_set";
	}
	
}
