package com.pro.hellscare.Controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pro.hellscare.Service.HellsCareService;


//전체 페이지를 관리하는 메인 컨트롤러
@Controller
public class hellsCareController {
	private static final Logger logger = LoggerFactory.getLogger(hellsCareController.class);

	//서비스 Autowired로 연경
	 @Autowired HellsCareService service;
	 
	 
	 //안드로이드 연동시에 Gson방식의 어노테이션 필요함! 
	 // @ResponseBody   //맵에서 안드로이드로 값을 전달하기위한 어노테이션(Gson형식)
	 //return 형식이 주소값이 아닌 그 외의 자료형의 값일경우 사용. 나머지는 IP연동으로 안드로이드에서 설정
	 
	//메인페이지 이동 컨트롤러. 테스트용
	@RequestMapping("main")
	public String main(HttpServletRequest req, Model model){
		//로거 작성 필수!
		logger.info("URL ==> main");
		// service.testSetvice(req, model);
		return "Users/index";
	}
	
	//DAO를 타지 않는 메뉴 테스트
	@RequestMapping("main2")
	public String main2(HttpServletRequest req, Model model){
		//로거 작성 필수!
		logger.info("URL ==> main");
		
		return "index";
	}

}
