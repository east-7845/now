package com.now.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ScheduleController {

	@RequestMapping(value="/schedule/schView")
	public String scheduleView() {
		
		return "schedule/schView";
	}
	
	@RequestMapping(value="/schedule/schInput")
	@ResponseBody
	public String scheduleInput(HttpServletRequest req, String startStr, String endStr) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		/* map.put("", value); */
		
		return "schedule/schView";
	}
	
}
