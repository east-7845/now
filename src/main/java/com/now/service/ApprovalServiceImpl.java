package com.now.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.IApprovalDao;
import com.now.vo.ApprovalVO;
import com.now.vo.CommonVO;
import com.now.vo.DraftVO;
import com.now.vo.EmployeeVO;
import com.now.vo.FreeBoardSearchVO;

@Service
public class ApprovalServiceImpl implements IApprovalService {
	
	@Autowired
	private IApprovalDao approvalDao;

	@Override
	public List<DraftVO> selectDraft(FreeBoardSearchVO freeSearchVO) {
		
		int rowCount = approvalDao.selectDraftCount(freeSearchVO);
		freeSearchVO.setTotalRowCount(rowCount);
		freeSearchVO.pageSetting();
		
		return approvalDao.selectDraft(freeSearchVO);
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

	@Override
	public int insertGrant(ApprovalVO approvalVO) {
		return approvalDao.insertGrant(approvalVO);
	}

	@Override
	public int insertApproval(ApprovalVO approvalVO) {
		return approvalDao.insertApproval(approvalVO);
	}

	@Override
	public String selectAppNo() {
		return approvalDao.selectAppNo();
	}

	@Override
	public List<ApprovalVO> selectMyApprovalList(FreeBoardSearchVO freeSearchVO) {
		
		int rowCount = approvalDao.selectApprovalCount(freeSearchVO);
		freeSearchVO.setTotalRowCount(rowCount);
		freeSearchVO.pageSetting();
		
		return approvalDao.selectMyApprovalList(freeSearchVO);
	}

	@Override
	public ApprovalVO selectMyApproval(String app_no) {
		return approvalDao.selectMyApproval(app_no);
	}

	@Override
	public List<ApprovalVO> selectGrantApproval(FreeBoardSearchVO freeSearchVO) {
		
		int rowCount = approvalDao.selectGrantCount(freeSearchVO);
		freeSearchVO.setTotalRowCount(rowCount);
		freeSearchVO.pageSetting();
		
		return approvalDao.selectGrantApproval(freeSearchVO);
	}

	@Override
	public int updateGrant(ApprovalVO approvalVO) {
		return approvalDao.updateGrant(approvalVO);
	}

	@Override
	public int updateApproval(ApprovalVO approvalVO) {
		return approvalDao.updateApproval(approvalVO);
	}

	@Override
	public List<EmployeeVO> selectGrantRank() {
		return approvalDao.selectGrantRank();
	}

}
