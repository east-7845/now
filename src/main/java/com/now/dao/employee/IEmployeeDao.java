package com.now.dao.employee;

import org.apache.ibatis.annotations.Mapper;

import com.now.vo.employee.EmployeeVO;

@Mapper
public interface IEmployeeDao {
	
	public EmployeeVO selectTest() throws Exception;

}
