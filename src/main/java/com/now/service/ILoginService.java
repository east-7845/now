package com.now.service;

import java.util.List;

import com.now.vo.EmployeeVO;

public interface ILoginService {

	public EmployeeVO selectEmp(EmployeeVO employee);

	public EmployeeVO session(EmployeeVO employeeVO);

}
