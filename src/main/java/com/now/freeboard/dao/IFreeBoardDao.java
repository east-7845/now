package com.now.freeboard.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.now.freeboard.vo.FreeBoardVO;

@Mapper
public interface IFreeBoardDao {

	/**
	 * 자유게시판 전체 검색
	 * @return
	 */
	public List<FreeBoardVO> selectFreeBoadrList();
	
	/**
	 * 자유게시판 등록
	 */
	public int updateFreeBoard(FreeBoardVO freeVO);
	
}
