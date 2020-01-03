package com.now.web;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.now.service.ILoginService;
import com.now.service.IMyPageService;
import com.now.vo.CommonVO;
import com.now.vo.EmployeeVO;

@Controller
public class MyPageController {
	
	@Autowired
	private ILoginService loginService;
	
	@Autowired
	private IMyPageService myPageService;
	
	@RequestMapping(value = "/myPage/myPage")
	public String loginCheck(HttpServletRequest req) throws Exception {
		String view = "myPage/myPage";
		System.out.println("/myPage/myPage : myPageConttroller");
		
		HttpSession session = req.getSession();
		EmployeeVO sessionVO = (EmployeeVO) session.getAttribute("sessionEmp");
		System.out.println("세션확인!! : " + sessionVO.getEmp_no());
		
		if(sessionVO.getEmp_no().equals("NOW0000001")) return "forward:/myPage/myPageEmpList";
		
		EmployeeVO employeeVO = myPageService.selectMyPage(sessionVO);
		req.setAttribute("employee", employeeVO);
		
		if(employeeVO.getEmp_id() == null) return "forward:/myPage/myPageEdit";
		
		return view;
	}
	
	@RequestMapping(value = "/myPage/myPageEdit")
	public String myPageEdit(HttpServletRequest req, EmployeeVO employeeVO) throws Exception {
		String view = "myPage/myPageEdit";
		System.out.println("/myPage/myPageEdit : myPageConttroller");
		

		List<CommonVO> commonRank = myPageService.selectEmpCom("RANK000000");
		List<CommonVO> commonDept = myPageService.selectEmpCom("DEPT000000");
		
		req.setAttribute("rank", commonRank);
		req.setAttribute("dept", commonDept);
		if(employeeVO.getEmp_no() == null) {
			EmployeeVO employee = (EmployeeVO) req.getAttribute("employee");
			req.setAttribute("employee", employee);
			return view;
		}
		
		req.setAttribute("employee", employeeVO);
		return view;
	}
	
	@RequestMapping(value = "/myPage/myPageModify")
	public String myPageModify(EmployeeVO employeeVO) throws Exception {
		String view = "myPage/myPageEdit";
		System.out.println("/myPage/myPageModify : myPageConttroller");
		System.out.println(employeeVO.getEmp_id());
		System.out.println(employeeVO.getEmp_no());
		System.out.println(employeeVO.getEmp_yn());
		int updateEmployee = myPageService.updateMyPage(employeeVO);
		
		if(updateEmployee == 1) view = "forward:/myPage/myPage";
		
		return view;
	}
	
	@RequestMapping(value = "/myPage/myPageEmpList")
	public String myPageAdmin(HttpServletRequest req) throws Exception {
		String view = "myPage/myPageEmpList";
		System.out.println("/myPage/myPageEmpList : myPageConttroller");
		
		List<EmployeeVO> employeeList = myPageService.selectEmp();
		
		req.setAttribute("employee", employeeList);
		
		return view;
	}
	
	@RequestMapping(value = "/myPage/myPageEmpInsert")
	public String myPageEmpInsert(HttpServletRequest req) throws Exception {
		String view = "myPage/myPageEmpInsert";
		System.out.println("/myPage/myPageEmpInsert : myPageConttroller");
		
		List<CommonVO> commonRank = myPageService.selectEmpCom("RANK000000");
		List<CommonVO> commonDept = myPageService.selectEmpCom("DEPT000000");
		
		req.setAttribute("rank", commonRank);
		req.setAttribute("dept", commonDept);
		
		return view;
	}
	
	@RequestMapping(value = "/myPage/myPageEmpSelectNo")
	@ResponseBody
	public String myPageEmpSelectNO() throws Exception {
		System.out.println("/myPage/myPageEmpSelectNo : myPageConttroller");
		String empNo = myPageService.selectEmpNo();
		return empNo;
	}
	
	@RequestMapping(value = "/myPage/myPageInsert")
	public String myPageInsert(EmployeeVO employeeVO) throws Exception {
		String view = "myPage/myPageEmpInsert";
		System.out.println("/myPage/myPageInsert : myPageConttroller");
		
		int insert = myPageService.insertEmp(employeeVO);
		System.out.println(insert);
		if(insert == 1) view = "forward:/myPage/myPageEmpList";
		return view;
	}
	
	@RequestMapping(value = "/myPage/myPageEmpInfo")
	public String myPageEmpInfo(HttpServletRequest req, EmployeeVO employeeVO) throws Exception {
		String view = "myPage/myPageEmpInfo";
		System.out.println("/myPage/myPageEmpInfo : myPageConttroller");
		System.out.println(employeeVO.getEmp_no());
		
		EmployeeVO employee = myPageService.selectEmployee(employeeVO);
		
		req.setAttribute("employee", employee);

		
		return view;
	}

}
