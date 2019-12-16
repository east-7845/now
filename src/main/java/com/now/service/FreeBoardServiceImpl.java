package com.now.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.IAttachDao;
import com.now.dao.IFreeBoardDao;
import com.now.vo.AttachVO;
import com.now.vo.FreeBoardSearchVO;
import com.now.vo.FreeBoardVO;

@Service
public class FreeBoardServiceImpl implements IFreeBoardService{
	   
	@Autowired
	private IFreeBoardDao boardDao;
	
	@Autowired
	private IAttachDao iattachDao;
	    
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
		
		// vo != 첨부파일을 가져와서 보드에 담기
		if (freeBoard != null) {
			List<AttachVO> parentList = iattachDao.selectAttachByParentNo(fr_no);
			freeBoard.setAttaches(parentList);
		}
		
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
		
		List<AttachVO> atchList = freeVO.getAttaches();
		if (atchList != null) {

			for (AttachVO attachVO : atchList) {
				attachVO.setFa_parent_no(freeVO.getFr_no());
				iattachDao.insertAttach(attachVO);
			}

			// 일부러 에러내기.
//			for (int i = 0; i < atchList.size(); i++) {
//				AttachVO vo = atchList.get(i);
//				attachVO.setAtch_parent_no(board.getBo_no());
//				iattachDao.insertAttach(attachVO);
//			}
		}
		return cnt;
	}

	@Override
	public int deleteFreeBoard(int fr_no) throws Exception{
		// TODO Auto-generated method stub
		return 0;
	}
	
}
