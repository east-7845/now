package com.now.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.now.vo.CommonVO;
import com.now.vo.EmployeeVO;


@Mapper
public interface IMyPageDao {

	public int updateMyPage(EmployeeVO employeeVO);

	public List<EmployeeVO> selectEmp();

	public List<CommonVO> selectEmpCom(String com_cd);

	public String selectEmpNo();

	public int insertEmp(EmployeeVO employeeVO);

	public EmployeeVO selectMyPage(EmployeeVO employeeVO);

	public EmployeeVO selectEmployee(EmployeeVO employeeVO);


}
