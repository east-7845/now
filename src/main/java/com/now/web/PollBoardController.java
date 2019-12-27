package com.now.web;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.now.service.IPollBoardService;
import com.now.vo.PollBoardVO;

@Controller
public class PollBoardController {

	@Autowired
	private IPollBoardService pollBoardService;
	
	
	
	/**
	 * <b> 전체 글목록 조회<br>
	 * @throws Exception 
	 */
	@RequestMapping(value = "/pollboard/pollBoardList")
	public String pollBoardList(ModelMap model) throws Exception {
		model.addAttribute("pollBoardList", pollBoardService.selectPollBoardList(null));
		/*
		 * System.out.println("pollboard"); PollBoardVO boardVO = new PollBoardVO();
		 * List<PollBoardVO> pollBoardList = boardService.selectPollBoardList(boardVO);
		 * req.setAttribute("pollBoardList", pollBoardList);
		 */
		return "pollboard/pollBoardList";
	}
	
	/**
	 * <b>글 내용 상세보기<br>
	 * @throws Exception 
	 */

	@RequestMapping(value = "/pollboard/pollBoardView", params = "po_no")
	public String pollBoradView(HttpServletRequest req, int po_no) throws Exception {
		
		// TODO : true 뭐지 : 조회수 증가 
		PollBoardVO vo = pollBoardService.selectPollBoard(po_no);
		req.setAttribute("pollBoard", vo);
		
		return "pollboard/pollBoardView";
	}
	
	/**
	 * <b>글 등록<br>
	 * @throws Exception 
	 */    
	@RequestMapping(value = "/pollboard/pollBoardForm")
	public String pollBoardForm(@ModelAttribute("pollBoard") PollBoardVO boardVO) throws Exception {
		
		return "pollboard/pollBoardForm";
	}
	
	@RequestMapping(value = "/pollboard/pollBoardRegist", method = RequestMethod.POST)
	public String pollBoardRegist(HttpServletRequest req, @ModelAttribute("pollBoard") @Valid PollBoardVO boardVO, BindingResult errors) throws Exception{
		// TODO : 나중에 Login session에서 writer id 받아오기
//		System.out.println("등록 성공");
		
		/*
		 * if (boardVO.getPo_no() < 1) { erros.reject("po_no", "글번호 필수"); }
		 */
		
		if (errors.hasErrors()) {
			return "pollboard/pollBoardForm";
		}
		
		boardVO.setPo_writer("NOW0000005");
		int cnt = pollBoardService.insertPollBoard(boardVO);
		return "redirect:/pollboard/pollBoardList";
	}

	/**
	 * <b>글 수정<br>
	 * @throws Exception 
	 */    
	@RequestMapping(value = "/pollboard/pollBoardEdit")
	public String pollBoradEdit(int po_no, ModelMap model) throws Exception{
		// TODO : 나중에 Login session에서 writer id 받아오기
//		System.out.println("po_no "+ po_no);
		
	PollBoardVO pollVO = pollBoardService.selectPollBoard(po_no);
		model.addAttribute("pollBoard",  pollVO);
		
		return "pollboard/pollBoardEdit";
	}
	
	@RequestMapping(value = "/pollboard/pollBoardModify", method = RequestMethod.POST)
	public String pollBoardModify(HttpServletRequest req, @ModelAttribute("pollBoard") @Valid PollBoardVO boardVO, BindingResult errors) throws Exception{
		if (errors.hasErrors()) {
			return "pollboard/pollBoardEdit";
		}
						
		boardVO.setPo_writer("NOW0000005");
		int cnt = pollBoardService.updatePollBoard(boardVO);
		return "redirect:/pollboard/pollBoardList";
	}

	/**
	 * <b>글 삭제<br>
	 * @throws Exception 
	 */    
	@RequestMapping(value = "/pollboard/pollBoardDelete")
	public String pollBoardDelete(int po_no) throws Exception{

		
		
		int cnt = pollBoardService.deletePollBoard(po_no);
		return "redirect:/pollboard/pollBoardList";
	}
}
