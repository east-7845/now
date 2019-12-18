package com.now.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.now.service.IApprovalService;
import com.now.vo.CommonVO;
import com.now.vo.DraftVO;
import com.now.vo.EmployeeVO;

@Controller
public class AppController {
	
	@Autowired
	private IApprovalService approvalService;
	
	@RequestMapping(value = "/approval/approvalList")
	public String approvalList(HttpServletRequest req) throws Exception {
		System.out.println("approvalList");
		String view = "approval/approvalList";
		
		List<DraftVO> draftVO = approvalService.selectDraft();
		
		req.setAttribute("draft", draftVO);
		return view;
	}
	
	@RequestMapping(value = "/approval/draftFormInsert")
	public String draftFormInsert(HttpServletRequest req) throws Exception {
		System.out.println("draftFormInsert");
		String view = "approval/draftFormInsert";
		
		return view;
	}
	
	@RequestMapping(value = "/approval/draftInsert")
	public String draftInsert(HttpServletRequest req, DraftVO draftVO) throws Exception {
		System.out.println("draftInsert");
		String view = "approval/approvalList";
		
		System.out.println(draftVO.getDraft_content());
		System.out.println(draftVO.getDraft_name());
		
		
		
		int draft = approvalService.insertDraft(draftVO);
		
		if(draft == 1) view = "approval/draftPage";
		
		return view;
	}
	
	@RequestMapping(value = "/approval/draftInfo")
	public String draftInfo(HttpServletRequest req, String draft_no) throws Exception {
		System.out.println("draftInfo");
		String view = "approval/draftInfo";
		
		DraftVO draftVO = approvalService.selectDraftInfo(draft_no);
		
		req.setAttribute("draft", draftVO);
		return view;
	}
	
	@RequestMapping(value = "/approval/grantEmployee")
	public String employee(HttpServletRequest req) throws Exception {
		System.out.println("grantEmployee");
		String view = "approval/grantEmployee";
		
		List<CommonVO> commonVO = approvalService.selectCommon();
		List<EmployeeVO> employeeVO = approvalService.selectGrantEmployee();
		
		req.setAttribute("commonVO", commonVO);
		req.setAttribute("employeeVO", employeeVO);
		return view;
	}

}
