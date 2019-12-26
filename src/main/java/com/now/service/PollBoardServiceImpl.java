package com.now.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.IPollBoardDao;
import com.now.vo.PollBoardVO;

@Service
public class PollBoardServiceImpl implements IPollBoardService{
	
	@Autowired
	private IPollBoardDao boardDao;
	
	

	@Override
	public List<PollBoardVO> selectPollBoardList(PollBoardVO pollVO) throws Exception {
		return boardDao.selectPollBoardList(pollVO);
	}

	@Override
	public PollBoardVO selectPollBoard(int po_no) throws Exception {
		return boardDao.selectPollBoard(po_no);
	}

	@Override
	public int insertPollBoard(PollBoardVO pollBoard) throws Exception {
		return boardDao.insertPollBoard(pollBoard);
	}

	@Override
	public int updatePollBoard(PollBoardVO pollBoard) throws Exception {
		return boardDao.updatePollBoard(pollBoard);
	}

	@Override
	public int deletePollBoard(PollBoardVO pollBoard) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
