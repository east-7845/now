package com.now.web.freeboard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.now.service.freeboard.IFreeBoardService;
import com.now.vo.freeboard.FreeBoardVO;

@Controller
public class FreeBoardController {
	
	@Autowired
	private IFreeBoardService boardService;
	
	/**
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/freeBoardView.do", params = "fr_no")
	public String freeBoardView(HttpServletRequest req, int fr_no) throws Exception {
		FreeBoardVO boardVO = new FreeBoardVO();
		//BeanUtils.populate(searchVO, req.getParameterMap());
		FreeBoardVO freeBoard = boardService.selectFreeBoard(fr_no);
		req.setAttribute("freeBoard", freeBoard);
		
		return "freeboard/freeBoardView";
	}
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/freeBoardList.do")
	public String freeBoardList(HttpServletRequest req) throws Exception {
		System.out.println("리스트 들어옴");
		FreeBoardVO boardVO = new FreeBoardVO();
		//BeanUtils.populate(searchVO, req.getParameterMap());
		List<FreeBoardVO> freeBoardList = boardService.selectFreeBoardList(boardVO);
		req.setAttribute("freeBoardList", freeBoardList);
		
		return "freeboard/freeBoardList";
	}
	
	
	
	
	
}
