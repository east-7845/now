package com.now.service;

import java.util.List;

import com.now.vo.CommonVO;

public interface ICommonService {
	/**
	 * 코드분류 (com_parent)에 따른 목록 반환<br>
	 * <code> List = selectCodeByType</code>
	 * 
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public List<CommonVO> selectCodeByType(String type) throws Exception;
}
