package com.now.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.now.service.IFreeBoardService;
import com.now.vo.FreeBoardVO;

@Controller
public class FreeBoardController {
	
	@Autowired
	private IFreeBoardService boardService;
	
	
	
	/**
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/freeBoardView", params = "fr_no")
	public String freeBoardView(HttpServletRequest req, int fr_no) throws Exception {
		FreeBoardVO boardVO = new FreeBoardVO();
		//BeanUtils.populate(searchVO, req.getParameterMap());
		FreeBoardVO freeBoard = boardService.selectFreeBoard(fr_no);
		req.setAttribute("board", freeBoard);
		
		return "freeboard/freeBoardView";
	}
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/freeBoardList")
	public String freeBoardList(HttpServletRequest req) throws Exception {
		FreeBoardVO boardVO = new FreeBoardVO();
		//BeanUtils.populate(searchVO, req.getParameterMap());
		List<FreeBoardVO> freeBoardList = boardService.selectFreeBoardList(boardVO);
		req.setAttribute("freeBoardList", freeBoardList);
		
		return "freeboard/freeBoardList";
	}
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/freeBoardModfiy")
	public String freeBoardModify(HttpServletRequest req
				,@ModelAttribute("board") FreeBoardVO freeVO) throws Exception {
		String view = "";
		
		System.out.println(freeVO.getFr_no());
		System.out.println(freeVO.getFr_parent_no());
		//BeanUtils.populate(searchVO, req.getParameterMap());
		int freeBoardList = boardService.updateFreeBoard(freeVO);
		System.out.println("수정하자 " + freeBoardList);
		if(freeBoardList != 1) {
			return "forward:/freeBoardEdit?fr_no="+ freeVO.getFr_no();
		}
		
		//return "freeboard/freeBoardList";
		return "freeboard/freeBoardList";
	}
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/freeBoardForm")
	public String freeBoardForm(HttpServletRequest req) throws Exception {
		FreeBoardVO boardVO = new FreeBoardVO();
		//BeanUtils.populate(searchVO, req.getParameterMap());
		List<FreeBoardVO> freeBoardList = boardService.selectFreeBoardList(boardVO);
		req.setAttribute("freeBoardList", freeBoardList);
		
		return "freeboard/freeBoardList";
	}
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/freeBoardEdit", params = "fr_no")
	public String freeBoardEdit(HttpServletRequest req, int fr_no,Model model) throws Exception {
		FreeBoardVO boardVO = new FreeBoardVO();
		//BeanUtils.populate(searchVO, req.getParameterMap());
		FreeBoardVO boardList = boardService.selectFreeBoard(fr_no);
		//req.setAttribute("board", boardList);
		model.addAttribute("board", boardList);
		return "freeboard/freeBoardEdit";
	}
	
	
	
	
	
	
}
