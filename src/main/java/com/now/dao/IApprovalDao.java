package com.now.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.now.vo.CommonVO;
import com.now.vo.DraftVO;
import com.now.vo.EmployeeVO;

@Mapper
public interface IApprovalDao {

	public List<DraftVO> selectDraft();

	public int insertDraft(DraftVO draftVO);

	public DraftVO selectDraftInfo(String draft_no);

	public List<EmployeeVO> selectGrantEmployee();

	public List<CommonVO> selectCommon();

}
