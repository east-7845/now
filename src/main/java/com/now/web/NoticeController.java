package com.now.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.now.service.INoticeService;
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
	
	@RequestMapping("/notice/list")
	public String list(Model model) throws Exception {
		List<NoticeVO> r = noticeService.selectNoticeList();
		model.addAttribute("noticeList", r);
		return "notice/list";
	}
	
	
}
