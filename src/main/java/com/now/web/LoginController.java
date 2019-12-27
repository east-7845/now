package com.now.web;

import java.io.BufferedInputStream;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.now.service.ILoginService;
import com.now.vo.EmployeeVO;

@Controller
public class LoginController {
	
	@Autowired
	private ILoginService loginService;
	
	@RequestMapping(value = "/now", method = RequestMethod.POST)
	public String loginCheck(HttpServletRequest req, EmployeeVO employee) throws Exception {
		System.out.println("loginController");
		String view = "forward:/main";
		
//		HttpSession session = req.getSession();
//		EmployeeVO attribute = (EmployeeVO) session.getAttribute("sessionEmp");
//		if(attribute.getEmp_id() == null || attribute.getEmp_id().equals("")) {
//			
//		}else {
//			
//		}
		
		EmployeeVO vo = loginService.selectEmp(employee);
		if(vo == null) {
			view = "forward:/";
			employee.setMessage("아이디나 비밀번호가 일치하지 않습니다.");
			req.setAttribute("resultMessage", employee);
		}
		return view;
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String session(HttpServletRequest req, EmployeeVO employee) throws Exception {
		String view = "main";
		System.out.println("session");
		HttpSession session = req.getSession();
		EmployeeVO vo = loginService.session(employee);
		
		// 메인페이지 
		// 공용 API사용하기(미세먼지)
		
		URL url = new URL("http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty?stationName=둔산동&dataTerm=month&pageNo=1&numOfRows=10&ServiceKey=CzzGplsj26NjeJzJmS4tqEvGGYeBeJTlV4iwMfgCew%2BBOyOsWRY67Uk%2BUAUPyxRZ1N78jnvk5PCiCzCcDEujEg%3D%3D&ver=1.3&_returnType=json");
		BufferedInputStream reader = new BufferedInputStream(url.openStream());
		
		StringBuffer buffer = new StringBuffer();
        int i =0;
        byte[] b = new byte[4096];
        while( (i = reader.read(b)) != -1){
          buffer.append(new String(b, 0, i));
         System.out.println(buffer);
        }
        JSONParser jsonparser = new JSONParser();
        // API 미세먼지 값 가져오기.
        JSONObject jsonobject = (JSONObject)jsonparser.parse(buffer.toString());
        JSONArray array = (JSONArray) jsonobject.get("list");
        JSONObject entity = (JSONObject)array.get(0);
        String day = (String) entity.get("dataTime");
        String dust = (String) entity.get("pm25Grade1h");
		
        System.out.println("day"+dust);
        System.out.println("dust"+day);
		// 메인페이지 용권 작업
        req.setAttribute("dust", dust); // 오픈 API 미세먼지
        req.setAttribute("dustDay", day); // 측정일
		session.setAttribute("sessionEmp", vo);

		return view;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req, EmployeeVO employee) throws Exception {
		String view = "forward:/";
		System.out.println("logout");
		
		HttpSession session = req.getSession();
		session.invalidate();

		return view;
	}

}
