package com.now.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.ILoginDao;
import com.now.vo.EmployeeVO;

@Service
public class LoginServiceImpl implements ILoginService {

	@Autowired
	ILoginDao loginDao;

	@Override
	public EmployeeVO selectEmp(EmployeeVO employee) {
		System.out.println("loginServiceImpl");
		return loginDao.selectEmp(employee);
	}

	@Override
	public EmployeeVO session(String emp_no) {
		return loginDao.session(emp_no);
	}

}
