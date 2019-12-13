package com.now.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.now.vo.PollBoardVO;

@Mapper
public interface IPollBoardDao {

	/**
	 * 투표 게시판 글 보기
	 * @return
	 */
	public List<PollBoardVO> selectPollBoardList(PollBoardVO pollVO) throws Exception;
	
	/**
	 * 투표 게시판 글내용 보기
	 * @return
	 */
	public PollBoardVO selectPollBoard(int po_no) throws Exception;
	
	/**
	 * 게시글 수정
	 */
	public int updatePollBoard(PollBoardVO pollVO) throws Exception;
	
	/**
	 * 글 등록
	 * @param freeVO
	 * @return
	 */
	public int insertPollBoard(PollBoardVO pollVO) throws Exception;
	
	/**
	 * 글 삭제
	 * @param bo_no
	 * @return
	 */
	public int deletePollBoard(int po_no) throws Exception;
}
