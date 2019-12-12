package com.now.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.now.service.IReplyService;
import com.now.vo.ReplySearchVO;
import com.now.vo.ReplyVO;

@Controller
public class ReplyController {
	
	@Autowired
	private IReplyService replyService;
	
	@RequestMapping(path = "/reply/replyList")
	@ResponseBody
	public Map<String, Object> selectReplyList(ReplySearchVO reVO) throws Exception{
		
		Map<String,Object> map = new HashMap<String, Object>();
		int cnt = replyService.selectReplyCount(reVO);
		reVO.setTotalPageCount(cnt);
		reVO.pageSetting();
		
		List<ReplyVO> list = replyService.selectReplyList(reVO);
		
		map.put("result", true);
		map.put("msg", "목록조회성공");
		map.put("data", list);
		map.put("count", list.size());
		map.put("totalRow", reVO.getTotalRowCount());
		
		return map;
	}
	
	@RequestMapping(path = "/reply/replyRegist")
	@ResponseBody
	public Map<String, Object> selectReplyRegist(ReplyVO reVO,  HttpServletRequest req) throws Exception{
		
		Map<String,Object> map = new HashMap<String, Object>();
		int cnt = replyService.insertReply(reVO);

		
		return map;
	}

	
	
	
	
}


