package com.now.service;

import java.util.List;

import com.now.vo.NoticeSearchVO;
import com.now.vo.NoticeVO;

public interface INoticeService {
	
	 public int selectnoticeCount(int nt_no) throws Exception;
	
	 public List<NoticeVO> selectNoticeList(NoticeSearchVO ntSearchVO) throws Exception;
		
		public NoticeVO selectNotice(int nt_no, boolean incrementHit) throws Exception;

		
		public int insertNotice(NoticeVO noticeVO) throws Exception;


		public int updateNotice(NoticeVO noticeVO) throws Exception;


		public int deleteNotice (int nt_no) throws Exception;
		
}
