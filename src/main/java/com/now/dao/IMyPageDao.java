package com.now.dao;

import org.apache.ibatis.annotations.Mapper;

import com.now.vo.EmployeeVO;

@Mapper
public interface IMyPageDao {

	public int updateMyPage(EmployeeVO employeeVO);

}
