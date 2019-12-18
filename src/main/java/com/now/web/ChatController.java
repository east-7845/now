package com.now.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import oracle.sql.ARRAY;

@Controller
public class ChatController {

	// 저장할 json 데이터 형식
	JSONObject resultObj = new JSONObject();
	// json 배열형식
	JSONArray jsonArray = new JSONArray();
	// 배열안에 데이터
	JSONObject userObj = new JSONObject();
	// 메세지
	Map<String, String> value = new HashMap<String, String>();
	
	@RequestMapping(value = "chatView")
	@ResponseBody
	public String chatView() {
		
		
		return "chat/chatView";
	}
	
	@RequestMapping(value = "/chat/chatList")
	public String chatList(HttpServletRequest req,ModelMap model) throws Exception {
		
		JSONParser parser = new JSONParser();
		FileReader reader = new FileReader("test.json");
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String time1 = format1.format(date);
		System.out.println("현재날짜" + time1);
		
		Object obj = parser.parse(reader);
		
		System.out.println("리더값"+obj);
		// 데이터가 있을 경우.
		JSONObject jsonObject = (JSONObject) obj;
		JSONArray msg = (JSONArray) jsonObject.get("result");
		//JSONObject jsonObject2 = (JSONObject)msg;
		
		List<Object> list = new ArrayList<Object>();
		/* list.add(map); */
		
		// 선생님 써보라고 하신 UTIL
		// ObjectMapper mapper = new ObjectMapper();
		// ChatController controller = mapper.readValue(reader, ChatController.class);
		// System.out.println(controller);
		
		for(int i = 0; i < msg.size(); i++) {
			JSONObject imsi = (JSONObject) msg.get(i);
			//String val = imsi.toString().replaceAll("\"\\[" ,"\\[").replaceAll("\\]\"" ,"\\]").replaceAll("\\\\" ,"");
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("room", imsi.get("room"));
			map.put("id", imsi.get("id"));
			map.put("member", imsi.get("member"));
			map.put("data", imsi.get("data"));
			map.put("webSocSession", imsi.get("webSocSession"));
			map.put("userSession", imsi.get("userSession"));
			map.put("date", imsi.get("date"));
			map.put("deleteYN", imsi.get("deleteYN"));
			
			list.add(map);
		}
		

		req.setAttribute("chatListVO", list);
		
		return "chat/chatList";
	}
	
	@RequestMapping(value = "/chat/chatRoom")
	public String chatRoom() {
		
		
		return "chat/chatRoom";
	}
	

}
