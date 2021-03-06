package com.now.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.now.service.INoticeService;
import com.now.vo.NoticeSearchVO;
import com.now.vo.NoticeVO;

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
	
	@RequestMapping(value = "/notice/noticeList")
	public String noticeList(NoticeSearchVO ntSearchVO, Model model) throws Exception {

		List<NoticeVO> r = noticeService.selectNoticeList(ntSearchVO);
		model.addAttribute("noticeList", r);
		model.addAttribute("searchVO", ntSearchVO);
		
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
		
	@RequestMapping(value = "/notice/noticeModify", method = RequestMethod.POST)
	public String noticeModify(ModelMap model,
																		@ModelAttribute("notice") NoticeVO noticeVO
																		) throws Exception {

		int noticeList = noticeService.updateNotice(noticeVO);
		if(noticeList >= 1) {
			return "redirect:/notice/noticeList";
		}

		return "redirect:/notice/noticeEdit?nt_no=" + noticeVO.getNt_no();
	}
	
	@RequestMapping(value = "notice/noticeDelete")
	public String noticeDelete(int nt_no) throws Exception {
		int vo = noticeService.deleteNotice(nt_no);
		
		return "redirect:/notice/noticeList";
	}
		
}
