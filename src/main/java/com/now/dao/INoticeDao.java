package com.now.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.now.vo.NoticeVO;

@Mapper
public interface INoticeDao {
	
		public List<NoticeVO> selectNoticeList() throws Exception;

		
		public NoticeVO selectNotice(int nt_no) throws Exception;

		
		public int insertNotice(NoticeVO noticeVO) throws Exception;


		public int updateNotice(NoticeVO noticeVO) throws Exception;


		public int deleteNotice (NoticeVO noticeVO) throws Exception;
		
		
		public int increamentNoticeHit(int nt_no)throws Exception;

}
