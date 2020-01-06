package com.now.web;

import java.text.SimpleDateFormat;
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
	
	EmployeeVO attribute;
	
	@RequestMapping(value="/schedule/schList")
	public String scheduleList(HttpServletRequest req) throws Exception {
		
		return "schedule/schView";
	}

	@RequestMapping(value="/schedule/schView")
	@ResponseBody
	public List<ScheduleVO> scheduleView(HttpServletRequest req) throws Exception {
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		ScheduleVO scheduleVO = new ScheduleVO();
		attribute = (EmployeeVO)req.getSession().getAttribute("sessionEmp");
		scheduleVO.setSc_emp_no(attribute.getEmp_no());
		List<ScheduleVO> list = scService.selectScList(scheduleVO);
		// map.put("scList", list);
		//req.setAttribute("scList", list); // 사용자 스케쥴러. 전체적인 스케줄러 view에 그려주기
		//return "schedule/schView";
		return list;
	}
	
	@RequestMapping(value="/schedule/schInput")
	@ResponseBody
	public int scheduleInput(HttpServletRequest req,String checkValue, String startStr, String endStr) throws Exception {
		
		Map<String,Object> map = new HashMap<String, Object>();
		ScheduleVO scheduleVO = new ScheduleVO();
		attribute = (EmployeeVO)req.getSession().getAttribute("sessionEmp");
		scheduleVO.setSc_emp_no(attribute.getEmp_no());
		List<ScheduleVO> list = scService.selectScList(scheduleVO);
		Date date = new Date(); 	// 현재 날짜
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		String time1 = format1.format(date);
		int cnt = 0;
		
		System.out.println("checkValue" + checkValue);
		System.out.println("startStr" + startStr);
		
		if(checkValue.equals("출근")) {
			System.out.println("출근들어와");
			scheduleVO.setSc_emp_no(attribute.getEmp_no());
			scheduleVO.setSc_date(time);
			scheduleVO.setSc_attendance(time1);
			scheduleVO.setSc_status("출근");
			cnt = scService.insertSc(scheduleVO);
		}else if(checkValue.equals("퇴근")) {
			System.out.println("퇴근들어와");
			scheduleVO.setSc_emp_no(attribute.getEmp_no());
			scheduleVO.setSc_date(time);
			scheduleVO.setSc_leave(time1);
			scheduleVO.setSc_status("퇴근");
			cnt = scService.updateSc(scheduleVO);
		}else if(checkValue.equals("휴가")) {
			scheduleVO.setSc_emp_no(attribute.getEmp_no());
			scheduleVO.setSc_attendance(startStr);
			scheduleVO.setSc_leave(endStr);
			scheduleVO.setSc_division("여름휴가");
			scheduleVO.setSc_status("휴가");
			cnt = scService.insertScHoliday(scheduleVO);
		}
		
		
		
		return cnt;
	}
}
