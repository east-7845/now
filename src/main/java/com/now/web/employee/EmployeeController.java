package com.now.web.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.now.service.employee.IEmployeeService;

@Controller
public class EmployeeController {
	
	@Autowired
	IEmployeeService employee_service;
	
}
