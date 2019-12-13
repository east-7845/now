package com.now.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.IReplyDao;
import com.now.vo.ReplySearchVO;
import com.now.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements IReplyService{

	@Autowired
	private IReplyDao dao;
	
	@Override
	public int selectReplyCount(ReplySearchVO reVO) throws Exception {
		int cnt = dao.selectReplyCount(reVO);
		return cnt;
	}

	@Override
	public List<ReplyVO> selectReplyList(ReplySearchVO reVO) throws Exception {
		List<ReplyVO> replyList = dao.selectReplyList(reVO);
		
		return replyList;
	}

	@Override
	public ReplyVO selectReply(int reNO) throws Exception {
		ReplyVO replyVO = dao.selectReply(reNO);
		return replyVO;
	}

	@Override
	public int insertReply(ReplyVO reVO) throws Exception {
		int cnt = dao.insertReply(reVO);
		return cnt;
	}

	@Override
	public int updateReply(ReplyVO reVO) throws Exception {
		int cnt = dao.updateReply(reVO);
		return cnt;
	}

	@Override
	public int deleteReply(int reNo) throws Exception {
		int cnt = dao.deleteReply(reNo);
		return cnt;
	}

}
