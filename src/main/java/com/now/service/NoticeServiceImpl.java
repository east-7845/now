package com.now.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.INoticeDao;
import com.now.vo.NoticeSearchVO;
import com.now.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements INoticeService{

	@Autowired
	private INoticeDao noticeDao ;	
	
	@Override
	public List<NoticeVO> selectNoticeList(NoticeSearchVO ntSearchVO) throws Exception {
		
		int rowCount = noticeDao.selectNoticeCount(ntSearchVO);
		ntSearchVO.setTotalRowCount(rowCount);
		ntSearchVO.pageSetting();
		
		List<NoticeVO> list = noticeDao.selectNoticeList(ntSearchVO);
		
		return list;
	}

	@Override
	public NoticeVO selectNotice(int nt_no, boolean incrementHit) throws Exception {
		NoticeVO vo = noticeDao.selectNotice(nt_no);
		if (vo != null && incrementHit) {
			noticeDao.increamentNoticeHit(nt_no);
		}
		return vo;
	}
	
	@Override
	public int insertNotice(NoticeVO noticeVO) throws Exception {
		return noticeDao.insertNotice(noticeVO);
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) throws Exception {
		return noticeDao.updateNotice(noticeVO);
	}

	@Override
	public int deleteNotice(int nt_no) throws Exception {
		return noticeDao.deleteNotice(nt_no);
	}

	@Override
	public int selectnoticeCount(int nt_no) throws Exception {
		
		return noticeDao.deleteNotice(nt_no);
	}

}
