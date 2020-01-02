package com.now.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.now.service.IScheduleService;
import com.now.vo.EmployeeVO;
import com.now.vo.ScheduleVO;

@Controller
public class ScheduleController {
	
	@Autowired
	private IScheduleService scService;
	
	
	@RequestMapping(value="/schedule/schList")
	@ResponseBody
	public String scheduleList(HttpServletRequest req) throws Exception {
		
		return "schedule/schView";
	}

	@RequestMapping(value="/schedule/schView")
	@ResponseBody
	public List<ScheduleVO> scheduleView(HttpServletRequest req) throws Exception {
		
		EmployeeVO attribute = (EmployeeVO)req.getSession().getAttribute("sessionEmp");
		Map<String,Object> map = new HashMap<String, Object>();
		List<ScheduleVO> list = scService.selectScList(attribute.getEmp_no());
		
		// map.put("scList", list);
		//req.setAttribute("scList", list); // 사용자 스케쥴러. 전체적인 스케줄러 view에 그려주기
		
		//return "schedule/schView";
		return list;
	}
	
	@RequestMapping(value="/schedule/schInput")
	@ResponseBody
	public String scheduleInput(HttpServletRequest req,String checkValue, String startStr, String endStr) throws Exception {
		
		Map<String,Object> map = new HashMap<String, Object>();
		EmployeeVO attribute = (EmployeeVO)req.getSession().getAttribute("sessionEmp");
		List<ScheduleVO> list = scService.selectScList(attribute.getEmp_no());
		
		Date date = new Date(); 	// 현재 날짜
		
		return "schedule/schView";
	}
}
