package com.ottt.ottt.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
//영상 파일을 지속적으로 올리려면(지속적으로 스트리밍해서 보려면 바이너리)
//우리는 텍스트 보내기만 하면 되니 text

public class ReplyEchoHandler extends TextWebSocketHandler {
	//로그인한 전체
	List<WebSocketSession> sessions = new ArrayList<>();
	//현재 로그인 중인 개별 유저
	Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	
	//클라이언트가 서버에 접속했을 때
	//여기서 session은 웹소켓의 세션이기 때문에 같은 유저로 로그인한 경우에도 웹소켓 연결은 매번 새로운 세션을 생성함
	//따라서 새로고침이나 페이지 이동할 때마다 다른 값이 나옴
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished: " + session);
		
		String sendUserId = getId(session);			//접속한 유저의 http 세션을 조회하여 id를 얻음 오호~
		if(sendUserId != null) {					//로그인 값이 있는 경우만
			consoleLog(sendUserId + "연결 성공");
			userSessions.put(sendUserId, session);	//로그인 중 개별유저 저장
		}
		//sessions.add(session);
		//userSessions.put(sendUserId, session);
	}

	//소켓에 어떤 메세지를 보냈을 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage: " + session + " :: " + message);
		
		String sendUserId = message.getPayload();	//특정 유저에게 보낼 메시지 내용 추출
		
		
		
		
	}
	
	//연결이 닫혔을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("afterConnectionClosed: " + session + " :: " + status);
		
		String sendUserId = getId(session);
		if(sendUserId != null) {					//로그인 값이 있는 경우만 실행
			consoleLog(sendUserId + "연결 종료");
			userSessions.remove(sendUserId);
			userSessions.remove(session);
		}
	}
	
	//로그 메시지
	private void consoleLog(String logMsg) {
		System.out.println(new Date() + " : " + logMsg);	
	}
	
	//웹소켓에 id 가져오기
	//접속한 유저의 http 세션을 조회하여 id를 얻음 아하~ 
	private String getId(WebSocketSession session) {
	    Map<String, Object> httpSession = session.getAttributes();
	    String loginUserId = (String)httpSession.get("id");			//세션에 저장된 loginUserId 기준 조회
	    return loginUserId == null ? null : loginUserId;
	}
}
