package com.now.employee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.employee.dao.IEmployeeDao;
import com.now.employee.vo.EmployeeVO;

@Service
public class EmployeeServiceImpl implements IEmployeeService {
	
	@Autowired
	IEmployeeDao employee_dao;
	
	@Override
	public EmployeeVO selectTest() throws Exception {
		return employee_dao.selectTest();
	}

}
