package com.pro.hellscare.Controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


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
	
	//유저 메인페이지
	@RequestMapping("main2")
	public String main2(HttpServletRequest req, Model model){
		//로거 작성 필수!
		logger.info("URL ==> main");
		return "Users/index";
	}
	
	// 건강진단 목록페이지
	@RequestMapping("nextpage")
	public String nextpage(HttpServletRequest req, Model model) {
		logger.info("URL ==> healthstate");
		return "Users/healthstate";
	}
	// 건강진단 목록페이지
	@RequestMapping("healthstateresult")
	public String healthstateresult(HttpServletRequest req, Model model) {
		logger.info("URL ==> healthstateresult");
		return "Users/healthstateresult";
	}
		
	
	
//===재관 Part -Strart
	
	// 약품정보 페이지
	@RequestMapping("drugInfo")
	public String drugInfo(HttpServletRequest req, Model model) {
		logger.info("URL ==> drugInfo");
		return "Users/drugInfo";
	}
	// 질병정보 페이지
	@RequestMapping("disease")
	public String disease(HttpServletRequest req, Model model) {
		logger.info("URL ==> disease");
		return "Users/disease";
	}
	// 질병정보 상세 페이지
		@RequestMapping("diseaseView")
		public String diseaseView(HttpServletRequest req, Model model) {
			logger.info("URL ==> diseaseView");
			return "Users/diseaseView";
		}
	// 약검색 페이지
	@RequestMapping("drugView")
	public String drugView(HttpServletRequest req, Model model) {
		logger.info("URL ==> drugView");
		return "Users/drugView";
	}
	
	// 유저옵션?
	@RequestMapping("userOptionForm")
	public String userOptionForm(HttpServletRequest req, Model model) {
		logger.info("URL ==> userOptionForm");
		return "Users/userOptionForm";
	}
//===재관 Part -End	
	
	
	
//===예찬 Part -Strart
	//동호회 목록보기
	@RequestMapping("club")
	public String club(HttpServletRequest req, Model model) {
		logger.info("URL ==> club");
		return "Users/club";
	}
	//동호회 상세보기
	@RequestMapping("details_Club")
	public String details_Club(HttpServletRequest req, Model model) {
		logger.info("URL ==> details_Club");
		return "Users/details_Club";
	}
	//동호회 개설
	@RequestMapping("makeClub")
	public String makeClub(HttpServletRequest req, Model model) {
		logger.info("URL ==> makeClub");
		return "Users/makeClub";
	}
	// 운동정보
	@RequestMapping("exercise")
	public String exercise(HttpServletRequest req, Model model) {
		logger.info("URL ==> exercise");
		return "Users/exercise";
	}
	// 운동 상세정보
	@RequestMapping("details_exercise")
	public String details_exercise(HttpServletRequest req, Model model) {
		logger.info("URL ==> details_exercise");
		return "Users/details_exercise";
	}
	// 운동 즐겨찾기 상세정보
	@RequestMapping("exercise_favorite")
	public String exercise_favorite(HttpServletRequest req, Model model) {
		logger.info("URL ==> exercise_favorite");
		return "Users/exercise_favorite";
	}
//===예찬 Part -End

//===나현 Part - Start
	/*
	 * // 로그인 메인
	 * 
	 * @RequestMapping("loginMain") public String loginMain(HttpServletRequest req,
	 * Model model) { logger.info("URL ==> loginMain"); return "Users/loginMain"; }
	 */
	// 운동 즐겨찾기 상세정보
	@RequestMapping("login_reg")
	public String login_reg(HttpServletRequest req, Model model) {
		logger.info("URL ==> login_reg");
		return "Users/login_reg";
	}
	
	// 운동 즐겨찾기 상세정보
		@RequestMapping("myPage")
		public String myPage(HttpServletRequest req, Model model) {
			logger.info("URL ==> myPage");
			return "Users/myPage";
		}
//===나현 Part -End
		
//===동렬 part - start
	// 식단 정보
	@RequestMapping("food_info")
	public String food_info(HttpServletRequest req, Model model) {
		logger.info("URL ==> food_info");

		return "Users/food_info";
	}

	// 식단 추천
	@RequestMapping("food_recommendation")
	public String food_recommendation(HttpServletRequest req, Model model) {
		logger.info("URL ==> food_recommendation");

		return "Users/food_recommendation";
	}

	// 오늘의 칼로리
	@RequestMapping("food_today_cal")
	public String food_today_cal(HttpServletRequest req, Model model) {
		logger.info("URL ==> food_today_cal");

		return "Users/food_today_cal";
	}

	// 다이어트 식품
	@RequestMapping("food_diet")
	public String food_diet(HttpServletRequest req, Model model) {
		logger.info("URL ==> food_diet");

		return "Users/food_diet";
	}
//===동렬 part - end		

//===한결 part - start
	//게시판
	@RequestMapping("boardList")
	public String boardList(HttpServletRequest req, Model model) {
		logger.info("URL ==> boardList");

		return "Users/boardList";
	}
	//걸음수
	@RequestMapping("steps")
	public String steps(HttpServletRequest req, Model model) {
		logger.info("URL ==> steps");

		return "Users/steps";
	}
	@RequestMapping("stepsRank")
	public String stepsRank(HttpServletRequest req, Model model) {
		logger.info("URL ==> stepsRank");

		return "Users/stepsRank";
	}
//===한결 part - end	
	
	
	
//======================이하 호스트부분==================
	
//==예찬 Part	 Start	
		// 관리자 메인페이지
	@RequestMapping("host_main")
	public String main(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> main");
		return "host/host_main";
	}
	// 관리자 운동관리페이지
	@RequestMapping("host_exercise")
	public String host_exercise(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_exercise");	
		return "host/host_exercise";
	}
	// 관리자 동호회 결산
	@RequestMapping("host_total")
	public String host_total(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_total");
		return "host/host_total";
	}
	
	//동호회 창설승인
	@RequestMapping("host_clubManage")
	public String host_clubManage(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_clubManage");
		return "host/host_clubManage";
	}
//==예찬 Part	 End		
	
//==나현 Part	 Start
	@RequestMapping("memChart")
	public String memChart(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> memChart");
		return "host/memChart";
	}

	@RequestMapping("memList")
	public String memList(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> memList");
		return "host/memList";
	}
//==나현 Part	 End	
	//==재관 Part	 Start
	@RequestMapping("host_DrugInfo")
	public String host_DrugInfo(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_DrugInfo");
		return "host/host_DrugInfo";
	}
	//==재관 Part	 End
}
