package com.now.service.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.employee.IEmployeeDao;
import com.now.vo.employee.EmployeeVO;

@Service
public class EmployeeServiceImpl implements IEmployeeService {
	
	@Autowired
	IEmployeeDao employee_dao;
	
	@Override
	public EmployeeVO selectTest() throws Exception {
		return employee_dao.selectTest();
	}

}
