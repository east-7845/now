package com.now.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.now.vo.ReplySearchVO;
import com.now.vo.ReplyVO;

@Mapper
public interface IReplyDao {
	
	/**
	 * 댓글 갯수
	 * @return
	 */
	public int selectReplyCount(ReplySearchVO reVO) throws Exception;
	
	/**
	 * 댓글 리스트
	 * @return
	 */
	public List<ReplyVO> selectReplyList(ReplySearchVO reVO) throws Exception;
	
	/**
	 * 댓글 찾기
	 * @return
	 */
	public ReplyVO selectReply(int reNO) throws Exception;
	
	
	/**
	 *  댓글 등록
	 */
	public int insertReply(ReplyVO reVO) throws Exception;
	
	
	/**
	 * 
	 * @param reVO
	 * @return
	 * @throws Exception
	 */
	public int updateReply(ReplyVO reVO) throws Exception;
	
	/**
	 * 댓글 삭제
	 * @param reNo
	 * @return
	 * @throws Exception
	 */
	public int deleteReply(int reNo) throws Exception;
	
}
