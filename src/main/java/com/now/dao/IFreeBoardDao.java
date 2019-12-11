package com.now.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.now.vo.FreeBoardVO;

@Mapper
public interface IFreeBoardDao {

	/**
	 * 자유게시판 전체 검색
	 * @return
	 */
	public List<FreeBoardVO> selectFreeBoardList(FreeBoardVO freeVO) throws Exception;
	
	/**
	 * 자유게시판 상세정보
	 * @return
	 */
	public FreeBoardVO selectFreeBoard(int fr_no) throws Exception;
	
	/**
	 * 자유게시판 수정
	 */
	public int updateFreeBoard(FreeBoardVO freeVO) throws Exception;
	
	/**
	 * 자유게시판 등록
	 * @param freeVO
	 * @return
	 */
	public int insertFreeBoard(FreeBoardVO freeVO) throws Exception;
	
	/**
	 * 자유게시판 삭제
	 * @param bo_no
	 * @return
	 */
	public int deleteFreeBoard(int fr_no) throws Exception;
	
	/**
	 * 조회수 증가
	 * @throws Exception
	 */
	public void increaseBoardCount(int bo_no) throws Exception;
}
