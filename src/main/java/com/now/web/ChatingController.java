package com.now.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatingController {

	@RequestMapping(value = "/chat/chatView")
	public String chatingView() {
		
		return "chat/chating";
	}
}
