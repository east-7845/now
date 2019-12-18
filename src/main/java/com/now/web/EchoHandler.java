package com.now.web;

import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
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
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//System.out.println("afterConnectionEstablished");
		
		//logger.debug("채팅방 연결 성공" + new Date());
		ServletWebRequest servletContainer = (ServletWebRequest)RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = servletContainer.getRequest();
		//HttpServletRequest session2 = new HttpServletRequest();
		// EmployeeVO sessionVO = (EmployeeVO)request.getAttribute("sessionEmp");
		//  System.out.println("세션아이디."+sessionVO.getEmp_name());
		 
		System.out.println(" --"+ session.getAttributes()); // {}
		System.out.println(" --"+ session.getId()); // 현재 만들어진 websocket의 아이디
		System.out.println(" --"+ session.getTextMessageSizeLimit()); // 8192
		System.out.println(" --"+ session.toString()); // WebSocketServerSockJsSession[id=srzxme3a]
		System.out.println(" --"+ session.getRemoteAddress()); // 0:0:0:0:0:0:0:1:57615
		System.out.println(" --"+ session.getUri()); // ws://localhost:8080/chat/echo/095/srzxme3a/websocket
		
		Map<String, Object> map = session.getAttributes();
		System.out.println("나오나요??");
		JSONParser parser = new JSONParser();
		
		//if()
		userObj.put("id", session.getId());
		userObj.put("message", session.getId());
		
		
		jsonArray.add(userObj);
		resultObj.put("result", jsonArray);
		String result = resultObj.toString().replaceAll("\"\\[" ,"\\[").replaceAll("\\]\"" ,"\\]").replaceAll("\\\\" ,"");
		
		System.out.println(result);
		//FileWriter file = new FileWriter("E:\\test.json");
		//FileWriter file = new FileWriter("/home/pc31//test.json");
		FileWriter file = new FileWriter("test.json");
		file.write(resultObj.toJSONString());
		file.flush();
		file.close();

		

		//Object obj = parser.parse(new FileReader("E:\\test.json"));
		//Object obj = parser.parse(new FileReader("/home/pc31//test.json"));
		Object obj = parser.parse(new FileReader("test.json"));
		
		JSONObject jsonObject = (JSONObject) obj;
		System.out.println(jsonObject);
		//String name = (String) jsonObject.get("result");
		JSONArray msg = (JSONArray) jsonObject.get("result");
		//JSONObject jsonObject2 = (JSONObject)msg;
		
		for(int i = 0; i < msg.size(); i++) {
			JSONObject imsi = (JSONObject) msg.get(i);
			System.out.println(imsi.get("id"));
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
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed");
		sessionList.remove(session);
	}
}