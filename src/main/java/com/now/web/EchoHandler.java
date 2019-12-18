package com.now.web;

import java.io.FileReader;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.now.vo.EmployeeVO;

public class EchoHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	// 저장할 json 데이터 형식
	JSONObject resultObj = new JSONObject();
	// json 배열형식
	JSONArray jsonArray = new JSONArray();
	// 배열안에 데이터
	JSONObject userObj = new JSONObject();
	// 메세지
	Map<String, String> value = new HashMap<String, String>();
	
	FileWriter file;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		Map<String, Object> map2 = session.getAttributes();
		EmployeeVO no = (EmployeeVO) map2.get("userId");
		System.out.println(" --"+ session.getAttributes()); // {}
		System.out.println(" --"+ session.getId()); // 현재 만들어진 websocket의 아이디
		System.out.println(" --"+ session.getTextMessageSizeLimit()); // 8192
		System.out.println(" --"+ session.toString()); // WebSocketServerSockJsSession[id=srzxme3a]
		System.out.println(" --"+ session.getRemoteAddress()); // 0:0:0:0:0:0:0:1:57615
		System.out.println(" --"+ session.getUri()); // ws://localhost:8080/chat/echo/095/srzxme3a/websocket
		System.out.println("memsize()--" + map2.size());

		//FileWriter file = new FileWriter("E:\\test.json");
		//FileWriter file = new FileWriter("/home/pc31//test.json");
		
		JSONParser parser = new JSONParser();
		FileReader reader = new FileReader("test.json");
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String time1 = format1.format(date);
		System.out.println("현재날짜" + time1);
		
		if(reader == null) {
			System.out.println("json 데이터 생성");
			// 기본 셋팅
			file = new FileWriter("test.json");
			
			// 처음 방 
			userObj.put("room", "NO_1");	// 방번호
			userObj.put("id", session.getId());	// 방개설한 사용자 사원번호
			userObj.put("member", "");	// 참여중인 참여자(배열)
			userObj.put("deleteYN", "N");	// 방삭제여부
			userObj.put("data", "");	// 방데이터(배열)
			userObj.put("webSocSession", session.getId());
			userObj.put("userSession", no.getEmp_no());
			jsonArray.add(userObj);
			resultObj.put("chatRoom", jsonArray);
			String result = resultObj.toString().replaceAll("\"\\[" ,"\\[").replaceAll("\\]\"" ,"\\]").replaceAll("\\\\" ,"");
			
			file.write(resultObj.toJSONString()); 
			file.flush();
			file.close();
		}else {
			// 채팅 USER 체크
			Object obj = parser.parse(reader);
			
			System.out.println("리더값"+obj);
			// 데이터가 있을 경우.
			JSONObject jsonObject = (JSONObject) obj;
			JSONArray msg = (JSONArray) jsonObject.get("result");
			//JSONObject jsonObject2 = (JSONObject)msg;
			
			for(int i = 0; i < msg.size(); i++) {
				JSONObject imsi = (JSONObject) msg.get(i);
				System.out.println("jsondata ---"+imsi.get("id"));
				String val = imsi.toString().replaceAll("\"\\[" ,"\\[").replaceAll("\\]\"" ,"\\]").replaceAll("\\\\" ,"");
				//System.out.println(imsi);
				//System.out.println(val);
			}
		}
		
//		for (Object object : msg) {
//			JSONObject obj2 = (JSONObject)object;
//			//obj2.get("id");
//			System.out.println(obj2.get("id"));
//		}

		sessionList.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage");
		for(WebSocketSession sess: sessionList) {
			sess.sendMessage(new TextMessage(session.getId()+": "+message.getPayload()));
			// 메세지가 10개 이상 들어가면 저장한다.
			value.put(session.getId(), message.getPayload());
			if(value.size() >= 10) {
				// json 데이터에 입력
				
				// 배열 초기화
				value.clear();
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed");
		sessionList.remove(session);
	}
}