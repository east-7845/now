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
	
	@RequestMapping(value = "/now", method = RequestMethod.POST)
	public String loginCheck(HttpServletRequest req, EmployeeVO employee) throws Exception {
		System.out.println("loginController");
		String view = "forward:/main";
		
		EmployeeVO vo = loginService.selectEmp(employee);
		if(vo == null) {
			view = "forward:/";
			employee.setMessage("아이디나 비밀번호가 일치하지 않습니다.");
			req.setAttribute("resultMessage", employee);
		}
		return view;
	}
<<<<<<< HEAD
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String session(HttpServletRequest req, EmployeeVO employee) throws Exception {
		String view = "main";
		System.out.println("session");
		HttpSession session = req.getSession();
		EmployeeVO vo = loginService.session(employee.getEmp_no());
		
		session.setAttribute("sessionEmp", vo);
=======
	
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String session(HttpServletRequest req, EmployeeVO employee) throws Exception {
		String view = "main";
		System.out.println("session");
		HttpSession session = req.getSession();
		EmployeeVO vo = loginService.session(employee.getEmp_no());
		
		session.setAttribute("sessionEmp", vo);

		return view;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req, EmployeeVO employee) throws Exception {
		String view = "forward:/";
		System.out.println("logout");
		
		HttpSession session = req.getSession();
		session.invalidate();
>>>>>>> refs/remotes/origin/shinHome

		return view;
	}

}
