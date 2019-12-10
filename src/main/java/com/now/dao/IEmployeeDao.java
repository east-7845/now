package com.now.dao;

import org.apache.ibatis.annotations.Mapper;

import com.now.vo.EmployeeVO;

@Mapper
public interface IEmployeeDao {
	
	public EmployeeVO selectTest() throws Exception;

}
