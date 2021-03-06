package com.now.web;

import java.io.FileReader;
import java.io.FileWriter;
import java.text.Format;
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

import com.fasterxml.jackson.databind.deser.std.FromStringDeserializer;
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
		
//		JSONParser parser = new JSONParser();
//		FileReader reader = new FileReader("test.json");
//		Date date = new Date();
//		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
//		String time1 = format1.format(date);
//		System.out.println("현재날짜" + time1);
//		
//		if(reader == null) {
//			System.out.println("json 데이터 생성");
//			// 기본 셋팅
//			file = new FileWriter("test.json");
//			
//			// 처음 방 
//			userObj.put("room", "NO_1");	// 방번호
//			userObj.put("id", session.getId());	// 방개설한 사용자 사원번호
//			userObj.put("member", "");	// 참여중인 참여자(배열)
//			userObj.put("deleteYN", "N");	// 방삭제여부
//			userObj.put("data", "");	// 방데이터(배열)
//			userObj.put("webSocSession", session.getId());
//			userObj.put("userSession", no.getEmp_no());
//			jsonArray.add(userObj);
//			resultObj.put("result", jsonArray);
//			String result = resultObj.toString().replaceAll("\"\\[" ,"\\[").replaceAll("\\]\"" ,"\\]").replaceAll("\\\\" ,"");

//			file.write(resultObj.toJSONString()); 
//			file.flush();
//			file.close();
//		}else {
//			// 채팅 USER 체크
//			Object obj = parser.parse(reader);
//			
//			System.out.println("리더값"+obj);
//			// 데이터가 있을 경우.
//			JSONObject jsonObject = (JSONObject) obj;
//			JSONArray msg = (JSONArray) jsonObject.get("result");
//			//JSONObject jsonObject2 = (JSONObject)msg;
//			
//			for(int i = 0; i < msg.size(); i++) {
//				JSONObject imsi = (JSONObject) msg.get(i);
//				System.out.println("jsondata ---"+imsi.get("id"));
//				String val = imsi.toString().replaceAll("\"\\[" ,"\\[").replaceAll("\\]\"" ,"\\]").replaceAll("\\\\" ,"");
//				//System.out.println(imsi);
//				//System.out.println(val);
//			}
//		}
		
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
			//sess.sendMessage(new TextMessage(session.getId()+": "+message.getPayload()));
			
			//sess.sendMessage(new TextMessage(session.getId() + ": " + message.getPayload()));
			// 메세지가 10개 이상 들어가면 저장한다.
			value.put(session.getId(), message.getPayload());
			Map<String, Object> map = session.getAttributes();
			EmployeeVO userNO = (EmployeeVO) map.get("userId");
			String[] roomNO = (String[]) map.get("roomData");
			
			String userMsg = message.getPayload();
			String[] split = userMsg.split("-.-"); // 0 : 방번호, 1 : 계정이름, 2 : 계정아이디 , 3 : 데이터
			
			Date date = new Date();
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time1 = format1.format(date);
			
			sess.sendMessage(new TextMessage(split[0] + "-.-" + userNO.getEmp_name() + "-.-" + message.getPayload()));
			StringBuffer buffer = new StringBuffer();
			//buffer.append( "[start]"+ message.getPayload() + "[date]" + time1 + "[end]");
			buffer.append(message.getPayload() + "(" + time1 + ")"+ "\n");
			
			if(buffer.length()  >= 10) {
				// 데이터 가져오기 ..
				JSONParser parser = new JSONParser();
				FileReader reader = new FileReader("test.json");
				Object obj = parser.parse(reader);
				JSONObject jsonObject = (JSONObject) obj;
				JSONArray msg = (JSONArray) jsonObject.get("result");
				FileWriter fileWriter = new FileWriter("test.json");
				jsonArray.clear();
				for(int i = 0; i < msg.size(); i++) {
					JSONObject imsi = (JSONObject) msg.get(i);
					if( split[0].equals(imsi.get("room")) ){
						imsi.put("data", imsi.get("data").toString() + buffer);
					}
					jsonArray.add(imsi);
				}
				resultObj.put("result", jsonArray);
				fileWriter.write(resultObj.toJSONString()); 
				fileWriter.flush();
				fileWriter.close();
				
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed");
		sessionList.remove(session);
	}
	
}

