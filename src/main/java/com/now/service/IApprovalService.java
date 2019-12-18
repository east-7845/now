package com.now.service;

import java.util.List;

import com.now.vo.CommonVO;
import com.now.vo.DraftVO;
import com.now.vo.EmployeeVO;

public interface IApprovalService {

	public List<DraftVO> selectDraft();

	public int insertDraft(DraftVO draftVO);

	public DraftVO selectDraftInfo(String draft_no);

	public List<EmployeeVO> selectGrantEmployee();

	public List<CommonVO> selectCommon();

}
