package com.now.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.now.service.ILoginService;
import com.now.service.IMyPageService;
import com.now.vo.EmployeeVO;

@Controller
public class MyPageController {
	
	@Autowired
	private ILoginService loginService;
	
	@Autowired
	IMyPageService myPageService;
	
	@RequestMapping(value = "/myPage/myPage")
	public String loginCheck(HttpServletRequest req) throws Exception {
		String view = "myPage/myPage";
		System.out.println("/myPage/myPage : myPageConttroller");
		
		HttpSession session = req.getSession();
		EmployeeVO sessionVO = (EmployeeVO) session.getAttribute("sessionEmp");
		System.out.println("세션확인!! : " + sessionVO.getEmp_no());
		
		if(sessionVO.getEmp_no().equals("NOW0000001")) return "forward:/myPage/myPageAdmin";
		
		EmployeeVO employeeVO = loginService.selectEmp(sessionVO);
		req.setAttribute("employee", employeeVO);
		
		if(employeeVO.getEmp_id() == null) return "forward:/myPage/myPageEdit";
		
		return view;
	}
	
	@RequestMapping(value = "/myPage/myPageEdit")
	public String myPageEdit(HttpServletRequest req, EmployeeVO employeeVO) throws Exception {
		String view = "myPage/myPageEdit";
		System.out.println("/myPage/myPageEdit : myPageConttroller");
		
		if(employeeVO.getEmp_no() == null) {
			EmployeeVO employee = (EmployeeVO) req.getAttribute("employee");
			req.setAttribute("employee", employee);
			return view;
		}
		
		req.setAttribute("employee", employeeVO);
		return view;
	}
	
	@RequestMapping(value = "/myPage/myPageModify")
	public String myPageModify(HttpServletRequest req, EmployeeVO employeeVO) throws Exception {
		String view = "myPage/myPageEdit";
		System.out.println("/myPage/myPageModify : myPageConttroller");
		System.out.println(employeeVO.getEmp_id());
		int updateEmployee = myPageService.updateMyPage(employeeVO);
		
		if(updateEmployee == 1) view = "forward:/myPage/myPage";
		
		return view;
	}
	
	@RequestMapping(value = "/myPage/myPageAdmin")
	public String myPageAdmin(HttpServletRequest req, EmployeeVO employeeVO) throws Exception {
		String view = "myPage/myPageAdmin";
		System.out.println("/myPage/myPageAdmin : myPageConttroller");
		
		
		return view;
	}

}
