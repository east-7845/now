<<<<<<< HEAD
=======
package com.now.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.IMyPageDao;
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
	
}
>>>>>>> refs/heads/master
