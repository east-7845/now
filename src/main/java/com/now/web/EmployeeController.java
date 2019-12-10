package com.now.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.now.service.IEmployeeService;

@Controller
public class EmployeeController {
	
	@Autowired
	IEmployeeService employee_service;
	
}
