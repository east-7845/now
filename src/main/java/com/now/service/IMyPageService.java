package com.now.service;

import java.util.List;

import com.now.vo.EmployeeVO;

public interface IMyPageService {

	int updateMyPage(EmployeeVO employeeVO);

	public List<EmployeeVO> selectEmp();

}
