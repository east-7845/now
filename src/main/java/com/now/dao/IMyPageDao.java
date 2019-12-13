<<<<<<< HEAD
=======
package com.now.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.now.vo.EmployeeVO;

@Mapper
public interface IMyPageDao {

	public int updateMyPage(EmployeeVO employeeVO);

	public List<EmployeeVO> selectEmp();

}
>>>>>>> refs/heads/master
