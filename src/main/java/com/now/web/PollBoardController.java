package com.now.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.now.service.IPollBoardService;

@Controller
public class PollBoardController {

	@Autowired
	private IPollBoardService boardService;
	
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/pollBoardList")
	public String pollBoardList(ModelMap model) throws Exception {
		model.addAttribute("pollBoardList", boardService.selectPollBoardList(null));
		/*
		 * System.out.println("pollboard"); PollBoardVO boardVO = new PollBoardVO();
		 * List<PollBoardVO> pollBoardList = boardService.selectPollBoardList(boardVO);
		 * req.setAttribute("pollBoardList", pollBoardList);
		 */
		return "pollboard/pollBoardList";
	}

	/**
	 * 
	 */
	/*
	 * @RequestMapping(value = "/pollBoardView", params = "po_no") public String
	 * pollBoradView(HttpServletRequest req, int po_no) throws Exception{
	 * PollBoardVO boardVO = new PollBoardVO(); PollBoardVO pollBoard =
	 * boardService.selectPollBoard(po_no); req.setAttribute("board", pollBoard);
	 * 
	 * return "pollboard/pollBoardView"; }
	 */
}
