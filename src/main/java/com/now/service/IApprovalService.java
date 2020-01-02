package com.now.service;

import java.util.List;

import com.now.vo.ApprovalVO;
import com.now.vo.CommonVO;
import com.now.vo.DraftVO;
import com.now.vo.EmployeeVO;
import com.now.vo.FreeBoardSearchVO;

public interface IApprovalService {

	public List<DraftVO> selectDraft(FreeBoardSearchVO freeSearchVO);

	public int insertDraft(DraftVO draftVO);

	public DraftVO selectDraftInfo(String draft_no);

	public List<EmployeeVO> selectGrantEmployee();

	public List<CommonVO> selectCommon();

	public int insertGrant(ApprovalVO approvalVO);

	public int insertApproval(ApprovalVO approvalVO);

	public String selectAppNo();

	public List<ApprovalVO> selectMyApprovalList(FreeBoardSearchVO freeSearchVO);

	public ApprovalVO selectMyApproval(String app_no);

	public List<ApprovalVO> selectGrantApproval(FreeBoardSearchVO freeSearchVO);

	public int updateGrant(ApprovalVO approvalVO);

	public int updateApproval(ApprovalVO approvalVO);

}
