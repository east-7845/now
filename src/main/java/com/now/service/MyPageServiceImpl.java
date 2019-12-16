package com.now.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.IMyPageDao;

import com.now.vo.CommonVO;
import com.now.vo.EmployeeVO;

@Service
public class MyPageServiceImpl implements IMyPageService {

	@Autowired
	IMyPageDao myPageDao;

	@Override
	public int updateMyPage(EmployeeVO employeeVO) {
		return myPageDao.updateMyPage(employeeVO);
	}

	@Override
	public List<EmployeeVO> selectEmp() {
		return myPageDao.selectEmp();
	}
	
	@Override
	public List<CommonVO> selectEmpCom(String com_cd) {
		return myPageDao.selectEmpCom(com_cd);
	}

	@Override
	public String selectEmpNo() {
		return myPageDao.selectEmpNo();
	}

	@Override
	public int insertEmp(EmployeeVO employeeVO) {
		return myPageDao.insertEmp(employeeVO);

	}
	
}
