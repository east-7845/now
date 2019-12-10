package com.now.service;

import java.util.List;

import com.now.vo.NoticeVO;

public interface INoticeService {
	
	 public List<NoticeVO> selectNoticeList() throws Exception;
		
		public NoticeVO selectNotice(int nt_no) throws Exception;

		
		public int insertNotice(NoticeVO noticeVO) throws Exception;


		public int updateNotice(NoticeVO noticeVO) throws Exception;


		public int deleteNotice (NoticeVO noticeVO) throws Exception;
}
