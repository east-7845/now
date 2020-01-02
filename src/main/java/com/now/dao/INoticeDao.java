package com.now.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.now.vo.NoticeSearchVO;
import com.now.vo.NoticeVO;

@Mapper
public interface INoticeDao {
	
		public int selectNoticeCount(NoticeSearchVO ntSearchVO) throws Exception;
	
		
		public List<NoticeVO> selectNoticeList(NoticeSearchVO ntSearchVO) throws Exception;

		
		public NoticeVO selectNotice(int nt_no) throws Exception;

		
		public int insertNotice(NoticeVO noticeVO) throws Exception;


		public int updateNotice(NoticeVO noticeVO) throws Exception;


		public int deleteNotice (int nt_no) throws Exception;
		
		
		public int increamentNoticeHit(int nt_no) throws Exception;


}
