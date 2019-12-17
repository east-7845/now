package com.now.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChatController {

	@RequestMapping(value = "chatData")
	@ResponseBody
	public String chatView() {
		
		
		return "";
	}
	
	@RequestMapping(value = "/chat/chatList")
	public String chatList() {
		
		
		return "chat/chatList";
	}
	
	@RequestMapping(value = "/chat/chatRoom")
	public String chatRoom() {
		
		
		return "chat/chatRoom";
	}
}