package com.now.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.INoticeDao;
import com.now.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements INoticeService{

	@Autowired
	private INoticeDao noticeDao ;	
	
	@Override
	public List<NoticeVO> selectNoticeList() throws Exception {
		
		return noticeDao.selectNoticeList();
	}

	public NoticeVO selectBoard(int nt_no, boolean incrementHit) throws Exception{	
		return noticeDao.selectNotice(nt_no);
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
	public int deleteNotice(NoticeVO noticeVO) throws Exception {
		return noticeDao.deleteNotice(noticeVO);
	}

	@Override
	public NoticeVO selectNotice(int nt_no, boolean b) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
