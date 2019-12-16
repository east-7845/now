package com.now.service;

import java.util.List;

<<<<<<< HEAD
import com.now.vo.EmployeeVO;

public interface IMyPageService {

	int updateMyPage(EmployeeVO employeeVO);

	public List<EmployeeVO> selectEmp();
=======
import com.now.vo.CommonVO;
import com.now.vo.EmployeeVO;

public interface IMyPageService {

	int updateMyPage(EmployeeVO employeeVO);

	public List<EmployeeVO> selectEmp();

	public List<CommonVO> selectEmpCom(String com_cd);

	public String selectEmpNo();

	int insertEmp(EmployeeVO employeeVO);
>>>>>>> refs/remotes/origin/shinHome

}
