package com.now.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.now.service.ILoginService;
import com.now.vo.EmployeeVO;

@Controller
public class LoginController {
	
	@Autowired
	private ILoginService loginService;
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String loginCheck(HttpServletRequest req, EmployeeVO employee) throws Exception {
		String view = "main";
		System.out.println(employee.getEmp_no());
		HttpSession session = req.getSession();
		EmployeeVO vo = loginService.loginCheck(employee);
		session.setAttribute("sessionEmp", vo);
		if(vo == null) {
			view = "forward:/";
			employee.setMessage("아이디나 비밀번호가 일치하지 않습니다.");
			req.setAttribute("resultMessage", employee);
		}
		return view;
	}

}
