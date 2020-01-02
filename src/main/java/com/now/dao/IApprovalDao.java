package com.now.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.now.vo.ApprovalVO;
import com.now.vo.CommonVO;
import com.now.vo.DraftVO;
import com.now.vo.EmployeeVO;
import com.now.vo.FreeBoardSearchVO;

@Mapper
public interface IApprovalDao {

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

	public int selectDraftCount(FreeBoardSearchVO freeSearchVO);

	public int selectApprovalCount(FreeBoardSearchVO freeSearchVO);

	public int selectGrantCount(FreeBoardSearchVO freeSearchVO);

	public int updateApproval(ApprovalVO approvalVO);

}
