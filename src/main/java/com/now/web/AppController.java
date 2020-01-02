package com.now.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.now.service.IApprovalService;
import com.now.vo.ApprovalVO;
import com.now.vo.CommonVO;
import com.now.vo.DraftVO;
import com.now.vo.EmployeeVO;
import com.now.vo.FreeBoardSearchVO;

@Controller
public class AppController {
	
	@Autowired
	private IApprovalService approvalService;
	
	@RequestMapping(value = "/approval/approvalList")
	public String approvalList(HttpServletRequest req) throws Exception {
		System.out.println("approvalList");
		String view = "approval/approvalList";
		
		HttpSession session = req.getSession();
		EmployeeVO sessionVO = (EmployeeVO) session.getAttribute("sessionEmp");
		
		FreeBoardSearchVO searchVO = new FreeBoardSearchVO();
		BeanUtils.populate(searchVO, req.getParameterMap());
		List<DraftVO> draftVO = approvalService.selectDraft(searchVO);
		
//		FreeBoardSearchVO approvalSearchVO = new FreeBoardSearchVO();
//		BeanUtils.populate(approvalSearchVO, req.getParameterMap());
//		approvalSearchVO.setSearchWord(sessionVO.getEmp_no());
//		List<ApprovalVO> approvalVO = approvalService.selectMyApprovalList(approvalSearchVO);
//		
//		FreeBoardSearchVO grantSearchVO = new FreeBoardSearchVO();
//		BeanUtils.populate(grantSearchVO, req.getParameterMap());
//		grantSearchVO.setSearchWord(sessionVO.getEmp_no());
//		List<ApprovalVO> grantVO = approvalService.selectGrantApproval(grantSearchVO);
		
		req.setAttribute("draft", draftVO);
//		req.setAttribute("approval", approvalVO);
//		req.setAttribute("grant", grantVO);
		
		req.setAttribute("searchVO", searchVO);
//		req.setAttribute("approvalSearchVO", approvalSearchVO);
//		req.setAttribute("grantSearchVO", grantSearchVO);
		
		
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
	
	@RequestMapping(value = "/approval/approval")
	public String approval(HttpServletRequest req, String app_no) throws Exception {
		System.out.println("approval");
		String view = "approval/approval";
		
		ApprovalVO approvalVO = approvalService.selectMyApproval(app_no);
		
		req.setAttribute("approval", approvalVO);
		
		return view;
	}
	
	@RequestMapping(value = "/approval/grantEmployee")
	public String grantEmployee(HttpServletRequest req) throws Exception {
		System.out.println("grantEmployee");
		String view = "approval/grantEmployee";
		
		List<CommonVO> commonVO = approvalService.selectCommon();
		List<EmployeeVO> employeeVO = approvalService.selectGrantEmployee();
		
		req.setAttribute("commonVO", commonVO);
		req.setAttribute("employeeVO", employeeVO);
		return view;
	}
	
	@RequestMapping(value = "/approval/approvalInsert")
	public String approvalInsert(HttpServletRequest req, ApprovalVO approvalVO) throws Exception {
		System.out.println("approvalInsert");
		
		HttpSession session = req.getSession();
		EmployeeVO sessionVO = (EmployeeVO) session.getAttribute("sessionEmp");
		
		approvalVO.setApp_emp_no(sessionVO.getEmp_no());
		
		int app = approvalService.insertApproval(approvalVO);
		if(app == 1) {
			String grant_app_no = approvalService.selectAppNo();
			approvalVO.setGrant_app_no(grant_app_no);
			int grant = approvalService.insertGrant(approvalVO);
			
			if(grant == 1) {
				
//				String view = "approval/grantEmployee";
				
			}
		}
		
		return null;
	}
	
	@RequestMapping(value = "/approval/grantUpdate")
	public String grantUpdate(HttpServletRequest req, ApprovalVO approvalVO) throws Exception {
		System.out.println("grantEmployee");
		String view = "approval/grantUpdate";
		if(approvalVO.getGrant_state().equals("0")) {
			if(approvalVO.getGrant_emp_no2().equals("")) approvalVO.setGrant_state("9");
			else approvalVO.setGrant_state("1");
		} else if(approvalVO.getGrant_state().equals("1")) {
			if(approvalVO.getGrant_emp_no3().equals("")) approvalVO.setGrant_state("9");
			else approvalVO.setGrant_state("2");
		} else if(approvalVO.getGrant_state().equals("2")) {
			if(approvalVO.getGrant_emp_no4().equals("")) approvalVO.setGrant_state("9");
			else approvalVO.setGrant_state("3");
		} else approvalVO.setGrant_state("9");
		System.out.println(approvalVO.getGrant_state());
		System.out.println(approvalVO.getGrant_app_no());
		int grantUpdate = approvalService.updateGrant(approvalVO);
		
		if(approvalVO.getGrant_state().equals("9") && grantUpdate == 1) {
			int appUpdate = approvalService.updateApproval(approvalVO);
			if(appUpdate == 1) {
				System.out.println("성공");
			}
//			view = "";
		}
//		List<CommonVO> commonVO = approvalService.selectCommon();
//		List<EmployeeVO> employeeVO = approvalService.selectGrantEmployee();
		
//		req.setAttribute("commonVO", commonVO);
//		req.setAttribute("employeeVO", employeeVO);
		return view;
	}

	@RequestMapping(value = "/approval/selectDraft")
	@ResponseBody
	public Map<String, Object> selectDraft(HttpServletRequest req) throws Exception {
		
		FreeBoardSearchVO searchVO = new FreeBoardSearchVO();
		BeanUtils.populate(searchVO, req.getParameterMap());
		List<DraftVO> draftVO = approvalService.selectDraft(searchVO);
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("draftVO", draftVO);
		map.put("searchVO", searchVO);
		
		return map;
	}
	
	@RequestMapping(value = "/approval/selectApproval")
	@ResponseBody
	public Map<String, Object> selectApproval(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		EmployeeVO sessionVO = (EmployeeVO) session.getAttribute("sessionEmp");
		
		FreeBoardSearchVO searchVO = new FreeBoardSearchVO();
		BeanUtils.populate(searchVO, req.getParameterMap());
		searchVO.setSearchWord(sessionVO.getEmp_no());
		List<ApprovalVO> approvalVO = approvalService.selectMyApprovalList(searchVO);
		
		Map<String,Object> map = new HashMap<String, Object>();
	
		map.put("approvalVO", approvalVO);
		map.put("searchVO", searchVO);
		return map;
		
	}
	
	@RequestMapping(value = "/approval/selectGrant")
	@ResponseBody
	public Map<String, Object> selectGrant(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		EmployeeVO sessionVO = (EmployeeVO) session.getAttribute("sessionEmp");
		
		FreeBoardSearchVO searchVO = new FreeBoardSearchVO();
		BeanUtils.populate(searchVO, req.getParameterMap());
		searchVO.setSearchWord(sessionVO.getEmp_no());
		List<ApprovalVO> grantVO = approvalService.selectGrantApproval(searchVO);
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("grantVO", grantVO);
		map.put("searchVO", searchVO);
		return map;
	}
}
