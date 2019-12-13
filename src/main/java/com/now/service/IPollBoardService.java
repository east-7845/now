package com.now.service;

import java.util.List;

import com.now.vo.PollBoardVO;

public interface IPollBoardService {
	
	/**
	 * <b> 조건에 해당하는 투표 게시판 목록 조회 <br>
	 * @param 
	 * @return
	 * @throws
	 */
//	public List<PollBoardVO> selectPollBoardList(PollBoardSearchVO pollSearchVO) throws Exception;
	
	/**
	 * <b> 투표게시판 전체리스트 <br>
	 * @param 
	 * @return
	 * @throws
	 */
	public List<PollBoardVO> selectPollBoardList(PollBoardVO pollVO) throws Exception;
	
	/**
	 * <b> 상세보기 <br>
	 * @param 
	 * @return
	 * @throws
	 */
	public PollBoardVO selectPollBoard(int po_no) throws Exception;

	/**
	 * <b> 입력된 내용 저장 <br>
	 * @param 
	 * @return
	 * @throws
	 */
	public int insertPollBoard(PollBoardVO pollBoard) throws Exception;

	/**
	 * <b> 게시판 수정 <br>
	 * @param 
	 * @return
	 * @throws
	 */
	public int updatePollBoard(PollBoardVO pollBoard) throws Exception;
	
	/**
	 * <b> 게시판 삭제 <br>
	 * 해당 게시물 삭제여부 "Y"로 변경 <br>
	 * @param 
	 * @return
	 * @throws
	 */
	public int deletePollBoard(PollBoardVO pollBoard) throws Exception;
}
