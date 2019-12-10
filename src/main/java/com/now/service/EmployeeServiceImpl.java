package com.now.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.IEmployeeDao;
import com.now.vo.EmployeeVO;

@Service
public class EmployeeServiceImpl implements IEmployeeService {
	
	@Autowired
	IEmployeeDao employee_dao;
	
	@Override
	public EmployeeVO selectTest() throws Exception {
		return employee_dao.selectTest();
	}

}
