package com.now.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.IFreeBoardDao;
import com.now.vo.FreeBoardSearchVO;
import com.now.vo.FreeBoardVO;

@Service
public class FreeBoardServiceImpl implements IFreeBoardService{
	   
	@Autowired
	private IFreeBoardDao boardDao;
	    
	@Override
	public List<FreeBoardVO> selectFreeBoardList(FreeBoardSearchVO freeSearchVO) throws Exception {
		
		int rowCount = boardDao.selectFreeBoardCount(freeSearchVO);
		freeSearchVO.setTotalRowCount(rowCount);
		freeSearchVO.pageSetting();
		
		List<FreeBoardVO> list = boardDao.selectFreeBoardList(freeSearchVO);
		
		return list;
	}

	@Override
	public FreeBoardVO selectFreeBoard(int fr_no) throws Exception {
		FreeBoardVO freeBoard = boardDao.selectFreeBoard(fr_no);
		return freeBoard;
	}

	@Override
	public int updateFreeBoard(FreeBoardVO freeVO) throws Exception{
		int cnt = boardDao.updateFreeBoard(freeVO);
		
		return cnt;
	}

	@Override
	public int insertFreeBoard(FreeBoardVO freeVO) throws Exception{
		int cnt = boardDao.insertFreeBoard(freeVO);
		return 0;
	}

	@Override
	public int deleteFreeBoard(int fr_no) throws Exception{
		// TODO Auto-generated method stub
		return 0;
	}
	
}
