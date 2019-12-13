package com.now.web;

import javax.servlet.http.HttpServletRequest;
import javax.validation.groups.Default;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.now.service.IPollBoardService;
import com.now.vo.PollBoardVO;

@Controller
public class PollBoardController {

	@Autowired
	private IPollBoardService boardService;
	
	
	/**
	 * <b> 전체 글목록 조회<br>
	 * @throws Exception 
	 */
	@RequestMapping(value = "/pollboard/pollBoardList")
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
	 * <b>글 내용 상세보기<br>
	 * @throws Exception 
	 */

	@RequestMapping(value = "pollboard/pollBoardView", params = "po_no")
	public String pollBoradView(HttpServletRequest req, int po_no) throws Exception {
		
		// TODO : true 뭐지 : 조회수 증가 
		PollBoardVO vo = boardService.selectPollBoard(po_no);
		req.setAttribute("PollBoard", vo);
		
		return "pollboard/pollBoardView";
	}
	
	/**
	 * <b>글 등록<br>
	 * @throws Exception 
	 */
	
	// 이해못하고 그냥하는중
	@RequestMapping(value = "pollboard/pollBoardRegist", method = RequestMethod.POST)
	public String boardRegist(HttpServletRequest req, ModelMap model,
			@ModelAttribute("PollBoard") @Validated(value = { RegistType.class, Default.class }) BoardVO board,
			BindingResult errors) throws Exception {
		// BindingResult는 ModelAttribute뒤에 들어가야함
		String view = "common/message";

		// 1. Spring Validator 구현체로 검증
//		new BoardRegistValidator().validate(board, errors);

		// 2. @Valid를 통해 자동으로 검증
		if (errors.hasErrors()) {
			return "board/boardForm";
		}

		// 접근한 사용자 ip 를 vo에 설정
		board.setBo_ip(req.getRemoteAddr());
		boardServie.insertBoard(board);

		// 메세지 필요없이 바로 상세보기로 이동하고자 함
		// forward: 또는 redirect: 를 사용 가능
		// view = "forward:/board/boardView.do?bo_no=" + board.getBo_no();
		ResultMessageVO messageVO = new ResultMessageVO();
		messageVO.setResult(true).setTitle("글 등록 성공").setMessage("해당 글을 등록완료했습니다.").setUrlTitle("상세보기")
				.setUrl("/board/boardView.do?bo_no" + board.getBo_no());
		// .setUrlTitle("목록으로")
		// .setUrl("/board/boardList.do");

		// req.setAttribute("resultMessage", messageVO);
		model.addAttribute("resultMessage", messageVO);

		return view;
	}
	
	/**
	 * <b>글 내용 수정<br>
	 * @throws Exception 
	 */
	
//	여기 이해 못하고 그냥 함
	@RequestMapping(value = "pollboard/pollBoardEdit", params = "po_no")
	public String pollBoradEdit(ModelMap model, @RequestParam("po_no") int po_no) throws Exception {
		PollBoardVO vo = boardService.selectPollBoard(po_no);
		model.addAttribute("PollBoard", vo);
	
		return "pollboard/pollBoardEdit";
	}
}
