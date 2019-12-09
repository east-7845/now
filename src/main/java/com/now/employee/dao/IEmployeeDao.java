package com.now.employee.dao;

import org.apache.ibatis.annotations.Mapper;

import com.now.employee.vo.EmployeeVO;

@Mapper
public interface IEmployeeDao {
	
	public EmployeeVO selectTest() throws Exception;

}
