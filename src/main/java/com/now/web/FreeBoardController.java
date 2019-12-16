package com.now.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.now.service.IFreeBoardService;
import com.now.util.StudyAttachUtils;
import com.now.vo.AttachVO;
import com.now.vo.FreeBoardSearchVO;
import com.now.vo.FreeBoardVO;

@Controller
public class FreeBoardController {
	
	@Autowired
	private StudyAttachUtils attachUtils;
	
	@Autowired
	private IFreeBoardService boardService;
	
	/**
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/freeboard/freeBoardView", params = "fr_no")
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
	@RequestMapping(value = "/freeboard/freeBoardList")
	public String freeBoardList(HttpServletRequest req) throws Exception {
		FreeBoardSearchVO searchVO = new FreeBoardSearchVO();
		BeanUtils.populate(searchVO, req.getParameterMap());
		
		List<FreeBoardVO> freeBoardList = boardService.selectFreeBoardList(searchVO);
		req.setAttribute("freeBoardList", freeBoardList);
		req.setAttribute("searchVO", searchVO);
		
		return "freeboard/freeBoardList";
	}
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/freeboard/freeBoardModfiy", method = RequestMethod.POST)
	public String freeBoardModify(HttpServletRequest req
				,@ModelAttribute("board") FreeBoardVO freeVO) throws Exception {
		String view = "";
		
		//BeanUtils.populate(searchVO, req.getParameterMap());
		int freeBoardList = boardService.updateFreeBoard(freeVO);
		if(freeBoardList >= 1) {
			return "redirect:/freeboard/freeBoardList";
		}
		
		//return "freeboard/freeBoardList";
		return "redirect:/freeboard/freeBoardEdit?fr_no="+ freeVO.getFr_no();
	}
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/freeboard/freeBoardForm")
	public String freeBoardForm(HttpServletRequest req
			,@ModelAttribute("board") FreeBoardVO freeVO) throws Exception {
				
		return "freeboard/freeBoardForm";
	}
	
	/**
	 * 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/freeboard/freeBoardEdit", params = "fr_no")
	public String freeBoardEdit(HttpServletRequest req, int fr_no,Model model) throws Exception {
		FreeBoardVO boardVO = new FreeBoardVO();
		//BeanUtils.populate(searchVO, req.getParameterMap());
		FreeBoardVO boardList = boardService.selectFreeBoard(fr_no);
		//req.setAttribute("board", boardList);
		model.addAttribute("board", boardList);
		return "freeboard/freeBoardEdit";
	}
	
	/**
	 * 등록하기
	 * @param req
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/freeboard/freeBoardRegist", method = RequestMethod.POST)
	public String freeBoardRegist(HttpServletRequest req
				, @RequestParam("fr_file") MultipartFile[] fr_file
				, @ModelAttribute("board") FreeBoardVO freeVO) throws Exception {
		String view = "";
		freeVO.setFr_parent_no("NOW0000005");
		
		// 파일업로드
		if (fr_file != null) {
			List<AttachVO> attaches = attachUtils.getAttachListByMultiparts(fr_file, "BOARD", "board");
			// 중요. 첨부파일 정보를 board에 설정
			freeVO.setAttaches(attaches);
		}
		
		//BeanUtils.populate(searchVO, req.getParameterMap());
		int cnt = boardService.insertFreeBoard(freeVO);
//		if( cnt >= 1) {
//			return "redirect:/freeBoardList?fr_no="+ freeVO.getFr_no();
//		}
		
		//return "freeboard/freeBoardList";
		return "redirect:/freeboard/freeBoardList";
	}
	
	
	
	
	
	
}
