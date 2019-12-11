package com.now.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping(value = "/myPage")
	public String loginCheck(HttpServletRequest req) throws Exception {
		String view = "myPage/myPage";
		System.out.println("myPageController");
		return view;
	}

}
