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
	public Map<String, Object> replyList(ReplySearchVO reVO) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		int cnt = replyService.selectReplyCount(reVO);
		reVO.setTotalPageCount(cnt);
		reVO.pageSetting();
		
		if(cnt >= 1) {
			List<ReplyVO> list = replyService.selectReplyList(reVO);
		
			map.put("result", true);
			map.put("msg", "목록조회성공");
			map.put("data", list);
			map.put("count", list.size());
			map.put("totalRow", reVO.getTotalRowCount());
		}else {
			map.put("result", false);
		}
		return map;
	}
	
	@RequestMapping(path = "/reply/replyRegist")
	@ResponseBody
	public Map<String, Object> selectReplyRegist(ReplyVO reVO,  HttpServletRequest req) throws Exception{
		System.out.println("댓글등록");
		Map<String,Object> map = new HashMap<String, Object>();
		int cnt = replyService.insertReply(reVO);

		return map;
	}
	
	@RequestMapping(path = "/reply/replyRegistUpdate")
	@ResponseBody
	public Map<String, Object> replyRegistUpdate(ReplyVO reVO,  HttpServletRequest req) throws Exception{
		System.out.println("댓글 수정들어옴");
		
		  int re_no = Integer.parseInt(req.getParameter("re_no")); 
		  String re_content = req.getParameter("re_content"); 
		  int re_parent_no = Integer.parseInt(req.getParameter("re_parent_no"));
		  
		  System.out.println(""+re_no); 
		  System.out.println(""+re_content);
		  System.out.println(""+re_parent_no);
		  
		  reVO.setRe_no(re_no); 
		  reVO.setRe_content(re_content);
		  reVO.setRe_parent_no(re_parent_no);
		 
		  //System.out.println(reVO.getRe_no());
		
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		int cnt = replyService.updateReply(reVO);
		
		return map;
	}

	
	
	
	
}


