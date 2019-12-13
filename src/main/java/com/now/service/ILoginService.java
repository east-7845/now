package com.now.service;

import com.now.vo.EmployeeVO;

public interface ILoginService {

	public EmployeeVO selectEmp(EmployeeVO employee);

	public EmployeeVO session(String emp_no);

}
