package com.now.dao;

import org.apache.ibatis.annotations.Mapper;

import com.now.vo.EmployeeVO;

@Mapper
public interface ILoginDao {

	public EmployeeVO loginCheck(EmployeeVO employee);

}