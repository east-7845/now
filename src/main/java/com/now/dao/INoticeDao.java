package com.now.dao;

import com.now.vo.NoticeVO;

public interface INoticeDao {

	
		public NoticeVO selectNotice(int nt_no) throws Exception;

		
		public int insertNotice(NoticeVO noticeVO) throws Exception;


		public int updateNotice(NoticeVO noticeVO) throws Exception;


		public int deleteNotice (NoticeVO noticeVO) throws Exception;

}
