package com.now.service.freeboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.freeboard.IFreeBoardDao;
import com.now.vo.freeboard.FreeBoardVO;

@Service
public class FreeBoardServiceImpl implements IFreeBoardService{
	
	@Autowired
	private IFreeBoardDao boardDao;
	
	@Override
	public List<FreeBoardVO> selectFreeBoardList(FreeBoardVO freeVO) throws Exception {
		
		List<FreeBoardVO> list = boardDao.selectFreeBoardList(freeVO);
		
		return list;
	}

	@Override
	public FreeBoardVO selectFreeBoard(int fr_no) throws Exception {
		FreeBoardVO freeBoard = boardDao.selectFreeBoard(fr_no);
		return freeBoard;
	}

	@Override
	public int updateFreeBoard(FreeBoardVO freeVO) throws Exception{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertFreeBoard(FreeBoardVO freeVO) throws Exception{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFreeBoard(int fr_no) throws Exception{
		// TODO Auto-generated method stub
		return 0;
	}
	
}
