package com.now.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AppController {
	
	@Autowired
	
	
	@RequestMapping(value = "/approval/approvalList", method = RequestMethod.POST)
	public String loginCheck(HttpServletRequest req) throws Exception {
		System.out.println("appController");
		String view = "approval/approvalList";
		
		return view;
	}

}
