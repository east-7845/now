package com.now.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.IApprovalDao;
import com.now.vo.CommonVO;
import com.now.vo.DraftVO;
import com.now.vo.EmployeeVO;

@Service
public class ApprovalServiceImpl implements IApprovalService {
	
	@Autowired
	private IApprovalDao approvalDao;

	@Override
	public List<DraftVO> selectDraft() {
		return approvalDao.selectDraft();
	}

	@Override
	public int insertDraft(DraftVO draftVO) {
		return approvalDao.insertDraft(draftVO);
	}

	@Override
	public DraftVO selectDraftInfo(String draft_no) {
		return approvalDao.selectDraftInfo(draft_no);
	}

	@Override
	public List<EmployeeVO> selectGrantEmployee() {
		return approvalDao.selectGrantEmployee();
	}

	@Override
	public List<CommonVO> selectCommon() {
		return approvalDao.selectCommon();
	}

}
