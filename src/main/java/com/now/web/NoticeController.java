package com.now.web;

import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.now.service.INoticeService;
import com.now.vo.FreeBoardVO;
import com.now.vo.NoticeVO;
import com.now.vo.ResultMessageVO;

@Controller
public class NoticeController {

	// url 생각 
	//  /notice/list : 공지사항 목록 조회                      
 //  /notice/view?nt_no=34 : 공지사항 상세  조회
	
	//     관리자가 접근하는 CRUD 화면의 url 에 admin 같은게 필요한가 고민 
 //  /notice/regist : 공지사항 등록 (화면) 처리  (관리자)
 //  /notice/regist : 공지사항 등록 처리 (POST)(관리자)
 //  /notice/edit : 공지사항 수정화면(관리자)
 //  /notice/edit : 공지사항 수정 처리 (관리자)
	
	@Autowired
	private INoticeService noticeService;
	
	@RequestMapping("/notice/noticeList")
	public String noticeList(Model model) throws Exception {
		List<NoticeVO> r = noticeService.selectNoticeList();
		model.addAttribute("noticeList", r);
		return "notice/noticeList";
	}

	
	@RequestMapping(value = "/notice/noticeForm")
	public String noticeForm(NoticeVO noticeVO)  {
		return "notice/noticeForm";
	}
	
	@RequestMapping(value = "/notice/noticeView", params = "nt_no")
	public String noticeView(HttpServletRequest req, int nt_no) throws Exception {
		
		NoticeVO vo = noticeService.selectNotice(nt_no, true);
		req.setAttribute("notice", vo);
		
		return "notice/noticeView";
	}
	
	@RequestMapping(value="/notice/noticeRegist")
	public String noticeRegist(HttpServletRequest req
            , ModelMap model
            , @ModelAttribute("notice") NoticeVO notice
         ) throws Exception {
		
			noticeService.insertNotice(notice);
		
			return "redirect:/notice/noticeList";
	}
	
	@RequestMapping(value = "/notice/noticeEdit", params = "nt_no")
	public String noticeEdit(ModelMap model, @RequestParam("nt_no") int nt_no) throws Exception {
		String view = "notice/noticeEdit";

		NoticeVO vo = noticeService.selectNotice(nt_no, false);
		model.addAttribute("notice", vo);

		return view;
	}
	
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
	
	
	@RequestMapping(value = "/notice/noticeModify", method = RequestMethod.POST)
	public String noticeModify(ModelMap model,
																		@ModelAttribute("notice") NoticeVO noticeVO
																		) throws Exception {

		int freeBoardList = noticeService.updateBoard(freeVO);
		if(freeBoardList >= 1) {
			return "redirect:/freeboard/freeBoardList";
		}

		return "notice/noticeEdit?nt_no=" + noticeVO.getNt_no();
	}
	
	@RequestMapping(value = "notice/noticeModify")
	public String noticeDelete(Model model,
																	 NoticeVO noticeVO) throws Exception {
		String view = "notice/message";
//		ResultMessageVO messageVO = new ResultMessageVO();
//		
//		model.addAttribute("resultMessage", messageVO);
		return view;
	}
		
	
}
