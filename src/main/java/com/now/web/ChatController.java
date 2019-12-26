package com.now.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.now.service.IMyPageService;
import com.now.vo.EmployeeVO;

@Controller
public class ChatController {

	// 회원리스트
	@Autowired
	private IMyPageService myPageService;
	
	// 저장할 json 데이터 형식
	JSONObject resultObj = new JSONObject();
	// json 배열형식
	JSONArray jsonArray = new JSONArray();
	// 배열안에 데이터
	JSONObject userObj = new JSONObject();
	// 메세지
	Map<String, String> value = new HashMap<String, String>();
	
	JSONParser parser;
	FileReader reader;
	Date date;
	
	@RequestMapping(value = "/chat/chatView")
	public String chatView(HttpServletRequest req,Model model, @RequestParam("data") String[] no, String mini) throws Exception {
		
		// 내 방 정보가져오기.
		List<Object> list = chatDataList(no);
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("room", no[0]);
		map.put("id", no[1]);
		map.put("member", no[2]);
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		HttpSession session = req.getSession();
		//EmployeeVO userId = (EmployeeVO)session.getAttribute("userId");
		session.setAttribute("roomData", no);
		model.addAttribute("chatList", list);
		model.addAttribute("mapRoom", map);
		model.addAttribute("userId", no[1]);
		
		System.out.println("채팅 view --- " + mini);
		if(mini == null) {
			return "chat/chatView";
		}else {
			return "chat/chatMiniView";
		}
		
	}
	
	@RequestMapping(value = "/chat/chatList")
	public String chatList(HttpServletRequest req,ModelMap model, String mini) throws Exception {
		
		File file = new File("test.json");
		// 파일 존재여부.
		
		boolean isExists = file.exists();
		
		if(isExists) {	// 존재한다면.
			
			long len = file.length();
			System.out.println("파일 크기 " + len);
			if(len == 0) {
				System.out.println("리스트 - 데이터가 없습니다.");
			} else {
				// 데이터가 존재한다면.
				parser = new JSONParser();
				reader = new FileReader(file);
				date = new Date();
				SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
				String time1 = format1.format(date);
				
				Object obj = parser.parse(reader);
				
				System.out.println("리더값"+obj);
				// 데이터가 있을 경우.
				JSONObject jsonObject = (JSONObject) obj;
				JSONArray msg = (JSONArray) jsonObject.get("result");
				//JSONObject jsonObject2 = (JSONObject)msg;
				
				List<Object> list = new ArrayList<Object>();
				
				EmployeeVO attribute = (EmployeeVO)req.getSession().getAttribute("sessionEmp");
				/* list.add(map); */
				
				// 선생님 써보라고 하신 UTIL
				// ObjectMapper mapper = new ObjectMapper();
				// ChatController controller = mapper.readValue(reader, ChatController.class);
				// System.out.println(controller);
				
				for(int i = 0; i < msg.size(); i++) {
					JSONObject imsi = (JSONObject) msg.get(i);
					//String val = imsi.toString().replaceAll("\"\\[" ,"\\[").replaceAll("\\]\"" ,"\\]").replaceAll("\\\\" ,"");
					Map<String, Object> map = new HashMap<String, Object>();
					String member = (String) imsi.get("member");
					boolean contains = member.contains(attribute.getEmp_no());
					System.out.println(contains);
					if( imsi.get("id").equals(attribute.getEmp_no()) || member.contains(attribute.getEmp_no())   ) {
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
				}
				
				req.setAttribute("chatListVO", list);
			}
		} else {
			System.out.println("리스트 - 파일이 없습니다 새로생성.");
			file.createNewFile();
		}
		
		// 회원리스트
		List<EmployeeVO> employeeList = myPageService.selectEmp();
		req.setAttribute("employee", employeeList);
		
		System.out.println("리스트 mini " + mini);
		if(mini == null) {
			return "chat/chatList";
		}else {
			return "chat/chatMini";
		}
		
	}
	
	@RequestMapping(value = "/chat/chatRoom")
	@ResponseBody
<<<<<<< HEAD
	public Map<String, Object> chatRoom(HttpServletRequest req, @RequestParam("emp[]") String[] empNo, String mini) throws Exception {
=======
	public Map<String, Object> chatRoom(HttpServletRequest req,@RequestParam("empUser[]") String[] empUser, @RequestParam("emp[]") String[] empNo, String mini) throws Exception {
>>>>>>> refs/heads/shin
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		
		String memNmAll = "";
		EmployeeVO attribute = (EmployeeVO)req.getSession().getAttribute("sessionEmp");
		
		String memAll = attribute.getEmp_name() + ".";
		// 데이터 값을 한 문자열에 연결
		for(int i = 0 ; i<=(empNo.length-1); i++) {
			if(i < (empNo.length-1)) {
				memNmAll += empUser[i] + ".";
				memAll += empNo[i] + ".";
			} else {
				memNmAll += empUser[i] + ".";
				memAll += empNo[i];
			}
		}
<<<<<<< HEAD
		EmployeeVO attribute = (EmployeeVO)req.getSession().getAttribute("sessionEmp");
=======
		
>>>>>>> refs/heads/shin
        
        /*String userId = req.getParameter("userid");
        System.out.println("param, id:"+userId);
        attributes.put("userId", userId);*/
  
        // HttpSession 에 저장된 이용자의 아이디를 추출하는 경우
		File file = new File("test.json");
		
		// 기본 입출력 
		parser = new JSONParser();
		reader = new FileReader("test.json");
		date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String time1 = format1.format(date);
		int roomNum = 1;
		// 파일 존재여부.
		boolean isExists = file.exists();
		JSONArray msg = null;
		if(isExists) {
			long len = file.length();
			if(len > 0) {
				System.out.println("reader 사이즈 ==" + reader);
				Object obj = parser.parse(reader);	//	 데이터가져옴
				JSONObject jsonObject = (JSONObject) obj;	// json 형태로 가져옴
				msg = (JSONArray) jsonObject.get("result");	// json안에 배열로 가져옴.
				roomNum =  msg.size()+1;
			}
			
			// 방데이터 입력
			//userObj.put("room", "NO_"+ (msg.size()+1));	// 방번호
			userObj.put("room", "NO_"+ roomNum);	// 방번호
			userObj.put("id", attribute.getEmp_no());	// 방개설한 사용자 사원번호
			userObj.put("member", memAll);	// 참여중인 참여자(배열)
			userObj.put("data", "");	// 방데이터(배열)
			userObj.put("title", "채팅어려워요");	// 방데이터(배열)
			userObj.put("memberName", memNmAll);
			userObj.put("userSession", "");
			userObj.put("date", time1);
			userObj.put("deleteYN", "N");
			
			//msg.add(userObj);
			if(len == 0) {
				jsonArray.add(userObj);
				resultObj.put("result", jsonArray);
			}else {
				msg.add(userObj);
				resultObj.put("result", msg);
			}
			FileWriter fileWriter = new FileWriter("test.json");
			
			fileWriter.write(resultObj.toJSONString()); 
			fileWriter.flush();
			fileWriter.close();
			
			map.put("memberNm", memNmAll);
			map.put("member", memAll);
			map.put("room", "NO_"+ 1);
			map.put("date", time1);
			map.put("id", "NOW0000005");
		}else {
			
		}
		//JSONObject jsonObject2 = (JSONObject)msg;
		if(mini == null) {
			return map;
		}else {
			return map;
		}
	}
	
	// 파일 데이터 입력
	public void chatDataInput() {
		
	}

	// 파일 존재여부 없으면 파일 생성
	// 파일 데이터 리스트
	public List<Object> chatDataList(String[] search) throws Exception {
		File file = new File("test.json");
		// 파일 존재여부.
		boolean isExists = file.exists();
		
		if(isExists) {	// 존재한다면.
			
			long len = file.length();
			System.out.println("파일 크기 " + len);
			if(len == 0) {
				System.out.println("리스트 - 데이터가 없습니다.");
			} else {
				// 데이터가 존재한다면.
				parser = new JSONParser();
				reader = new FileReader(file);
				date = new Date();
				SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
				String time1 = format1.format(date);
				
				Object obj = parser.parse(reader);
				
				System.out.println("리더값"+obj);
				// 데이터가 있을 경우.
				JSONObject jsonObject = (JSONObject) obj;
				JSONArray msg = (JSONArray) jsonObject.get("result");
				//JSONObject jsonObject2 = (JSONObject)msg;
				
				List<Object> list = new ArrayList<Object>();
				List<Object> list2 = new ArrayList<Object>();
				/* list.add(map); */
				
				// 선생님 써보라고 하신 UTIL
				// ObjectMapper mapper = new ObjectMapper();
				// ChatController controller = mapper.readValue(reader, ChatController.class);
				// System.out.println(controller);
				
				for(int i = 0; i < msg.size(); i++) {
					JSONObject imsi = (JSONObject) msg.get(i);
					//String val = imsi.toString().replaceAll("\"\\[" ,"\\[").replaceAll("\\]\"" ,"\\]").replaceAll("\\\\" ,"");
					Map<String, Object> map = new HashMap<String, Object>();
					if(search.length != 0) {
						//if( imsi.get("room") == search[0] && search[1].equals(imsi.get("id"))) {
						if( imsi.get("room").equals(search[0]) && imsi.get("id").equals(search[1]) ) {
							map.put("room", imsi.get("room"));
							map.put("id", imsi.get("id"));
							map.put("member", imsi.get("member"));
							map.put("data", imsi.get("data"));
							map.put("webSocSession", imsi.get("webSocSession"));
							map.put("userSession", imsi.get("userSession"));
							map.put("date", imsi.get("date"));
							map.put("deleteYN", imsi.get("deleteYN"));
							list2.add(map);
							return list2;
						}
						
					}else {
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
					
					
				}
				
				//req.setAttribute("chatListVO", list);
				return list;
			}
		} else {
			System.out.println("리스트 - 파일이 없습니다 새로생성.");
			file.createNewFile();
			return null;
		}
		return null;
	}
	
	// 파일 기본
	// 파일 존재 여부 
	public void chatBase() {
		
		
	}
	
	@RequestMapping(value = "/chat/chatMain")
	public String chatMain(HttpServletRequest req) throws Exception {
		
		return "chat/main";
	}
	

}
