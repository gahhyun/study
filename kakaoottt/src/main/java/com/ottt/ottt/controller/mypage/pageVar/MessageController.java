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
			
			MessagePageResolver msgPageResolver = new MessagePageResolver(totalCnt, msc);
			
			//리스트 불러오기
			List<MessageDTO> listAll = messageService.loadRecvListAll(msc);
			//빈배열 생성
			List<MessageDTO> msgList = new ArrayList<>();			
			
			//삭제 안 한 애들만 넣기
			for(MessageDTO messageDTO : listAll) {
				if(!messageDTO.isDelete_by_receiver()) {
					msgList.add(messageDTO);
				}
			}
			
			int startIndex = ((msc.getPage() - 1) * msc.getPageSize()) < 0 ? 0 : (msc.getPage() - 1) * msc.getPageSize();
	        int endIndex = Math.min(startIndex + msc.getPageSize(), msgList.size());
	        List<MessageDTO> list = msgList.subList(startIndex, endIndex);
			
	        System.out.println("-------------list.size()--------------" +list.size());	        
	        
			m.addAttribute("list", list);
			m.addAttribute("mpr", msgPageResolver);
			m.addAttribute("totalCnt", list.size());

		} catch (Exception e) {e.printStackTrace();}
		return "/mypage/myprofile/message";
	}
	
	@GetMapping(value = "/message/send")
	public String sendMessage(MessageSearchItem msc, Model m, HttpSession session, Integer page) {
		try {
			UserDTO userDTO = loginUserDao.select((String)session.getAttribute("id"));
			m.addAttribute("userDTO", userDTO);
			msc.setUser_no(userDTO.getUser_no());
			
			int totalCnt = messageService.getSendResultCnt(msc);
			
			m.addAttribute("totalCnt", totalCnt);
			MessagePageResolver msgPageResolver = new MessagePageResolver(totalCnt, msc);
			//먼저 불러오고
			List<MessageDTO> listAll = messageService.loadSendListAll(msc);
			//빈배열 생성
			List<MessageDTO> msgList = new ArrayList<>();			
			
			//삭제 안 한 애들만 넣기
			//거짓이어야 트루
			for(MessageDTO messageDTO : listAll) {
				if(!messageDTO.isDelete_by_sender()) {
					msgList.add(messageDTO);
				}
			}
			
			int startIndex = ((msc.getPage() - 1) * msc.getPageSize()) < 0 ? 0 : (msc.getPage() - 1) * msc.getPageSize();
	        int endIndex = Math.min(startIndex + msc.getPageSize(), msgList.size());
	        List<MessageDTO> list = msgList.subList(startIndex, endIndex);       
	        
			m.addAttribute("list", list);
			m.addAttribute("mpr", msgPageResolver);
			m.addAttribute("totalCnt", list.size());
			
		} catch (Exception e) {e.printStackTrace();}
		return "/mypage/myprofile/message";
	}
	
	
	
	
	//원래 가진 값이 거짓이었으니 참으로 바꾸면 목록에서 삭제됨
	//받은 쪽지 삭제(해당 쪽지)
	@PostMapping("/message/remove")
	public String removeMsgRecv(HttpSession session, Integer message_no, MessageSearchItem msc) {		
		//현재 내 유저번호
		Integer user_no = (Integer)session.getAttribute("user_no");		
		
		try {
			MessageDTO messageDTO = messageService.pickOneRecv(message_no);			
			
			//맞다면
			if(user_no.equals(messageDTO.getReceive_user_no())) { 
				//디비에 저장하고
				messageService.removeByReceiver(messageDTO);
				//현재 값을 변경 - 일시적이라 컨틀로러에서만 돼서 디비에 저장 안 되니 위에랑 같이쓰기
				//messageService로 이동햇ㄷ음
				//messageDTO.setDelete_by_receiver(true);
					if(messageDTO.isDelete()) {
						messageService.removeMsg(messageDTO.getMessage_no());
					}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mypage/message?page=" + msc.getPage();
	}
	
	
	
	//보낸 쪽지 삭제(해당 쪽지)
	@PostMapping("/message/send/remove")
	public String removeMsgSend(HttpSession session, Integer message_no, MessageSearchItem msc) {
		//현재 내 유저번호
		Integer user_no = (Integer)session.getAttribute("user_no");		
		
		try {
			MessageDTO messageDTO = messageService.pickOneSend(message_no);		
			
			//맞다면
			if(user_no.equals(messageDTO.getSend_user_no())) {
				
				//여기도 바꿔
				messageService.removeBySender(messageDTO);
				messageDTO.setDelete_by_sender(true);
				
				if(messageDTO.isDelete()) {
					messageService.removeMsg(messageDTO.getMessage_no());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mypage/message/send?page=" + msc.getPage();
	}

	//쪽지함 환경설정
	@GetMapping(value = "/messagesetting")
	public String messagesetting() {
		return "/mypage/myprofile/message_set";
	}
	
}