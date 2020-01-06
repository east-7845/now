package com.now.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.now.vo.EmployeeVO;

@Mapper
public interface ILoginDao {

	public EmployeeVO selectEmp(EmployeeVO employee);

	public EmployeeVO session(EmployeeVO employeeVO);

}
