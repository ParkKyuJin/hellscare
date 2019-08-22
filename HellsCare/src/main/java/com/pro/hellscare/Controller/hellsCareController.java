package com.pro.hellscare.Controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.hellscare.Service.HellsCareService;
import com.pro.hellscare.Service.ParseService;


//전체 페이지를 관리하는 메인 컨트롤러
@Controller
public class hellsCareController {
	private static final Logger logger = LoggerFactory.getLogger(hellsCareController.class);


	
	//서비스 Autowired로 연경
	 @Autowired HellsCareService service;
	 @Autowired ParseService service2;
	 
	 
	 
	 //안드로이드 연동시에 Gson방식의 어노테이션 필요함! 
	 // @ResponseBody   //맵에서 안드로이드로 값을 전달하기위한 어노테이션(Gson형식)
	 //return 형식이 주소값이 아닌 그 외의 자료형의 값일경우 사용. 나머지는 IP연동으로 안드로이드에서 설정
	
	//유저 메인페이지
	@RequestMapping("main2")
	public String main2(HttpServletRequest req, Model model)throws IOException{
		//로거 작성 필수!
		logger.info("URL ==> main");
		service.exerciseList(req,model);
		service.crawlArticle(req, model);
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
	//이벤트 도전과제 페이지
	@RequestMapping("challenge")
	public String challenge(HttpServletRequest req, Model model) {
		service.challengeView(req, model);
		logger.info("URL ==> challenge");
		return "Users/challenge";
	}
	@RequestMapping("Mychallenge")
	public String Mychallenge(HttpServletRequest req, Model model) {
		logger.info("URL ==> Mychallenge");
		return "Users/Mychallenge";
	}	
	
	
//===재관 Part -Strart
	
	// 약품정보 페이지
	@RequestMapping("drugInfo")
	public String drugInfo(HttpServletRequest req, Model model) {
		logger.info("URL ==> drugInfo");
		return "Users/drugInfo";
	}

	// 질병정보 목록 호출
	@RequestMapping("disease_sub")
	public String disease_sub(HttpServletRequest req, Model model) {
		service.diseaseList(req, model);
		logger.info("URL ==> disease_sub");
		return "Users/disease_sub";

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
		service.diseaseView(req, model);
		logger.info("URL ==> diseaseView");
		return "Users/diseaseView";
	}

	// 약검색 페이지
	@RequestMapping("drugView")
	public String drugView(HttpServletRequest req, Model model) {
		logger.info("URL ==> drugView");
		return "Users/drugView";
	}
	
//===재관 Part -End	
	
	
	
//===예찬 Part -Strart
	// 운동정보
		@RequestMapping("exercise")
		public String exercise(HttpServletRequest req, Model model) {
			logger.info("URL ==> exercise");
			
			service.exerciseList(req, model);
			return "Users/exercise";
		}
		
		// 운동 상세정보
		@RequestMapping("details_exercise")
		public String details_exercise(HttpServletRequest req, Model model) {
			logger.info("URL ==> details_exercise");
			
			service.detailExercise(req, model);
			return "Users/details_exercise";
		}
		
		// 운동 - 부위별 목록
		@RequestMapping("details_stretching")
		public String details_stretching(HttpServletRequest req, Model model) {
			logger.info("URL ==> details_stretching");
			
			service.stretchingList(req, model);
			return "Users/details_stretching";
		}
		
		// 운동 즐겨찾기 추가
		@RequestMapping("addFavorit")
		public String addFavorit(HttpServletRequest req, Model model) {
			logger.info("URL ==> exercise");
			
			service.addFavorit(req, model);
			return "Users/addFavorit";
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
	// 병원 위치
	@RequestMapping("hospital_location")
	public String hospital_location(HttpServletRequest req, Model model) {
		logger.info("URL ==> hospital_location");
		return "Users/hospital_location";
	}
	@RequestMapping("pharmacy_location")
	public String pharmacy_location(HttpServletRequest req, Model model) {
		logger.info("URL ==> pharmacy_location");
		return "Users/pharmacy_location";
	}
	@RequestMapping("weather_info")
	public String weather_info(HttpServletRequest req, Model model) throws IOException {
		logger.info("URL ==> weather_info");
		
		return "Users/weather_info";
	}
	@RequestMapping("weather_info_sub")
	public String weather_info_sub(HttpServletRequest req, Model model) throws IOException {
		logger.info("URL ==> weather_info_sub");
		
		service.crawlDongWeather(req, model);
		
		return "Users/weather_info_sub";
	}
	
	
	// 뉴스 기사 상세 페이지
	@RequestMapping("news_detail")
	public String news_detail(HttpServletRequest req, Model model) throws IOException {
		logger.info("URL ==> news_detail");
		service.crawlNewsDetail(req, model);
		service.crawlArticle(req, model);
		
		return "Users/news_detail";
	}

	
	
//===동렬 part - end		

//===한결 part - start
	// 게시판 목록
		@RequestMapping("boardList")
		public String boardList(HttpServletRequest req, Model model) {
			logger.info("URL ==> boardList");

			service.boardList(req, model);

			return "Users/boardList";
		}

		// 게시글 상세보기
		@RequestMapping("board_detail")
		public String contentForm(HttpServletRequest req, Model model) {

			logger.info("URL ==> board_detail");
			service.contentForm(req, model);

			return "Users/board_detail";
		}

		// 게시글 작성 폼
		@RequestMapping("writeForm")
		public String writeForm(Locale locale, HttpServletRequest req, Model model) {

			logger.info("URL ==> writeForm");
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

			String formattedDate = dateFormat.format(date);

			model.addAttribute("serverTime", formattedDate);

			return "Users/board_writeForm";
		}

		
		//게시글 작성 처리
		@RequestMapping(value="writePro",method=RequestMethod.POST) 
		public String writePro(MultipartHttpServletRequest req, Model model) {
	  
			logger.info("URL ==> writePro");
	  
			service.writePro(req, model);
	  
			return "Users/boardList"; 
		}
		
		// 댓글뷰 ajax->controller
		@RequestMapping("commentList")
		public String commentList(HttpServletRequest req, Model model) {
			logger.info("URL ==> commentList");

			service.commentList(req, model);
			return "Users/commentList";
		}
		
		//댓글 등록
		@RequestMapping("commentIn")
		public void commentUp(HttpServletRequest req, Model model) {
			logger.info("URL ==> commentIn");

			service.commentIn(req, model);
		}

		// 걸음수
		@RequestMapping("steps")
		public String steps(HttpServletRequest req, Model model) {
			logger.info("URL ==> steps");

			return "Users/steps";
		}

		// 걸음수 랭킹
		@RequestMapping("stepsRank")
		public String stepsRank(HttpServletRequest req, Model model) {
			logger.info("URL ==> stepsRank");

			return "Users/stepsRank";
		}
//===한결 part - end	
	
	
	
//======================이하 호스트부분==================
	
//규진 part Start
	//관리자 챌린지 관리
	@RequestMapping("host_challenge")
	public String host_challenge(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		service.challengeView(req, model);
		logger.info("URL ==> host_challenge");
		return "host/host_challenge";
	}	
	//관리자 챌린지 등록
	@RequestMapping("host_challengeReg")
	public String host_challengeReg(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_challengeReg");
		return "host/host_challengeReg";
	}
	
	//관리자 챌린지 등록 프로세스
	@RequestMapping("host_challengeRegpro")
	public String host_challengeRegpro(MultipartHttpServletRequest req, Model model) {
		// 로거 작성 필수!
		service.challengeRegpro(req, model);
		logger.info("URL ==> host_challengeRegpro");
		return "host/host_challengeRegpro";
	}
	//관리자 챌린지 삭제 프로세스
	@RequestMapping("host_challengedelpro")
	public String host_challengedelpro(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		System.out.println(req.getParameterValues("challenge_check"));
		logger.info("URL ==> host_challengedelpro");
		service.challengedelpro(req, model);
		return "host/host_challengedelpro";
	}
//규진 part End
		
	
//==예찬 Part	 Start	
	@RequestMapping("host_main")
	public String main(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> main");
		service.exerciseList(req,model);
		
		return "host/host_main";
	}
	
	// 관리자 운동관리페이지 / 운동 목록 리스트
	@RequestMapping("host_exercise")
	public String host_exercise(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_exercise");
		service.exerciseList(req,model);
		return "host/host_exercise";
	}
	
	// 관리자 운동삭제처리
	@RequestMapping("deleteExercise")
	public String deleteExercise(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_exercise");
		service.deleteExercise(req,model);
		return "host/deleteExercise";
	}
	
	// 관리자 운동수정 보여주는 페이지
	@RequestMapping("modifyExercise")
	public String modifyExercise(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_exercise");
		service.modifyExercise(req,model);
		return "host/modifyExercise";
	}
	
	// 관리자 운동등록
	@RequestMapping(value="host_exerciseAddPro", method=RequestMethod.POST)
	public String host_exerciseAddPro(MultipartHttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_exerciseAddPro");	
		
		service.exerciseAddPro(req,model);
		return "host/host_exerciseAddPro";
	}
	
	// 관리자 운동수정 처리
	@RequestMapping("modifyExercisePro")
	public String modifyExercisePro(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> modifyExercisePro");	
		
		service.modifyExercisePro(req,model);
		return "host/modifyExercisePro";
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
	@RequestMapping("disease_reg")
	public String medi_reg(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> disease_reg");
		return "host/disease_reg";
	}

//==나현 Part	 End	
	
	//==재관 Part	 Start
	// 질병 정보 관리
	@RequestMapping("host_disease")
	public String host_diseaseInfo(HttpServletRequest req, Model model) {
		logger.info("URL ==> disease");
		service.diseaseList(req, model);
		return "host/host_disease";
	}

	// 질병정보 등록 폼
	@RequestMapping("host_diseaseReg")
	public String host_diseaseReg(HttpServletRequest req, Model model) {
		logger.info("URL ==> host_diseaseReg");
		return "host/host_diseaseReg";
	}

	// 질병정보등록 코드 중복
	@RequestMapping("host_codeDuplChk")
	public @ResponseBody int host_codeDuplChk(HttpServletRequest req, Model model) {
		logger.info("URL ==> host_codeDuplChk");
		int result = service.diseaseCodeCheck(req, model);
		return result;
	}

	// 질병정보등록 처리
	@RequestMapping("host_diseaseRegPro")
	public String host_diseaseRegPro(HttpServletRequest req, Model model) {
		logger.info("URL ==> host_diseaseRegPro");
		service.diseaseInsertPro(req, model);
		return "host/host_diseaseRegPro";
	}

	// 질병정보 수정 폼
	@RequestMapping("host_diseaseModify")
	public String host_diseaseModify(HttpServletRequest req, Model model) {
		logger.info("URL ==> host_diseaseModify");
		service.diseaseModifyView(req, model);
		return "host/host_diseaseModify";
	}

	// 질병정보 수정 처리
	@RequestMapping("host_diseaseModifyPro")
	public String host_diseaseModifyPro(HttpServletRequest req, Model model) {
		logger.info("URL ==> host_diseaseModifyPro");
		service.diseaseModifyPro(req, model);
		return "host/host_diseaseModifyPro";
	}

	// 질병정보 삭제 처리
	@RequestMapping("host_diseaseDeletePro")
	public String host_diseaseDelete(HttpServletRequest req, Model model) {
		logger.info("URL ==> host_diseaseDelete");
		service.diseaseDeletePro(req, model);
		return "host/host_diseaseDeletePro";
	}

	//==재관 Part	 End
	//==한결	 Part	 Start
	@RequestMapping("host_qna")
	public String host_qna(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_qna");
		return "host/host_qna";
	}
	@RequestMapping("host_notice")
	public String host_notice(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_notice");
		return "host/host_notice";
	}
	@RequestMapping("host_board")
	public String host_board(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_board");
		return "host/host_board";
	}
	
	@RequestMapping("host_boardContent")
	public String host_boardContent(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_boardContent");
		return "host/host_boardContent";
	}
	@RequestMapping("host_noticeContent")
	public String host_noticeContent(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_noticeContent");
		return "host/host_noticeContent";
	}
	@RequestMapping("host_qnaContent")
	public String host_qnaContent(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_qnaContent");
		return "host/host_qnaContent";
	}
	@RequestMapping("notice_write")
	public String notice_write(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> notice_write");
		return "host/notice_write";
	}
	//==한결 Part	 End
	
	//==동렬 Part	 Strart
	@RequestMapping("host_foodList")
	public String host_foodList(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_foodList");
		return "host/host_foodList";
	}
	@RequestMapping("host_foodRegForm")
	public String host_foodRegForm(HttpServletRequest req, Model model) {
		// 로거 작성 필수!
		logger.info("URL ==> host_foodRegForm");
		return "host/host_foodRegForm";
	}
	
	//==동렬 Part	 End
}
