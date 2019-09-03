package com.pro.hellscare.Controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.HTTP;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.hellscare.Service.HellsCareService;
import com.pro.hellscare.Service.ParseService;
//변경전

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
	
//규진 시작
	//유저 메인페이지
		@RequestMapping("main2")
		public String main2(HttpServletRequest req, Model model)throws IOException{
			//로거 작성 필수!
			logger.info("URL ==> main");
			req.getSession().setAttribute("user_id", "test1");
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
		//나의 도전과제 페이지
		@RequestMapping("Mychallenge")
		public String Mychallenge(HttpServletRequest req, Model model) {
			logger.info("URL ==> Mychallenge");
			service.Mychallenge(req, model);
			return "Users/Mychallenge";
		}	
		//도전과제 상세보기
		@RequestMapping("challengedetail")
		public String challengedetail(HttpServletRequest req, Model model) {
			service.challengedetail(req, model);
			logger.info("URL ==> challengedetail");
			return "Users/challengedetail";
		}
		//도전과제 검색
		@RequestMapping("challengesearch")
		public String challengesearch(HttpServletRequest req, Model model) {
			service.challengesearch(req, model);
			logger.info("URL ==> challengesearch");
			return "Users/challengesearch";
		}
		//도전과제 추가하기
		@RequestMapping("addchall")
		public String addchall(HttpServletRequest req, Model model) {
			logger.info("URL ==> addchall");
			service.addchall(req, model);
			return "Users/addchall";
		}
		//도전과제 삭제
		@RequestMapping("delchall")
		public String delchall(HttpServletRequest req, Model model) {
			logger.info("URL ==> delchall");
			service.delchall(req, model);
			return "Users/delchall";
		}
//규진 종료
//=============================	
//재관 시작
		@RequestMapping("logout")
		public String logout(HttpSession session, HttpServletRequest req) {
			session.invalidate();		
			// 세션 삭제
			req.getSession().removeAttribute("memId");
			
			return "index";
		}
		
		// 약품정보 페이지
		@RequestMapping("drugInfo")
		public String drugInfo(HttpServletRequest req, Model model) {
			logger.info("URL ==> drugInfo");
			return "Users/drugInfo";
		}
		
		// 약정보검색 결과
		   @RequestMapping("drugInfo_sub")
		   public String drugInfo_sub(HttpServletRequest req, Model model) {
		      logger.info("URL ==> drugInfo_sub");
		      service2.getDrugList(req, model);
		      return "Users/drugInfo_sub";
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
		
		// 유저 건강정보 입력 진행
		@RequestMapping("userInfoRegPro")
		public String userInfoRegPro(HttpServletRequest req, Model model) {
			logger.info("URL ==> userInfoRegPro");
			service.userInfoRegPro(req, model);
			return "Users/userInfoRegPro";
		}
		// 유저건강정보 수정진행
		@RequestMapping("userInfoModifyPro")
		public String userInfoModifyPro(HttpServletRequest req, Model model) {
			logger.info("URL ==> userInfoModifyPro");
			service.userInfoModifyPro(req, model);
			return "Users/userInfoModifyPro";
		}	
			
		
//재관 종료
//=============================	
//동렬시작
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
		
		// 날씨 정보
		@RequestMapping("weather_info")
		public String weather_info(HttpServletRequest req, Model model) throws IOException {
			logger.info("URL ==> weather_info");
			
			return "Users/weather_info";
		}
		
		// 해당 동의 날씨
		@RequestMapping("weather_info_sub")
		public String weather_info_sub(HttpServletRequest req, Model model) throws IOException {
			logger.info("URL ==> weather_info_sub");
			
			service.crawlDongWeather(req, model);
			
			return "Users/weather_info_sub";
		}
		
		// 사용자 - 오늘의 칼로리 정보 입력
		@RequestMapping("food_today_cal_sub")
		public String food_today_cal_sub(HttpServletRequest req, Model model) {
			logger.info("URL ==> food_today_cal_sub");
			service.foodEnrollAteToday(req, model);
			
			return "Users/food_today_cal_sub";
		}
		
		// 사용자 - 오늘의 칼로리 음식 정보에 해당하는 음식명들 탐색
		@RequestMapping("food_find_equal_kind")
		public String food_find_equal_kind(HttpServletRequest req, Model model) {
			logger.info("URL ==> food_find_equal_kind");
			service.foodFindEqualKind(req, model);
			
			return "Users/food_find_equal_kind";
		}
		
		// 뉴스 기사 상세 페이지
		@RequestMapping("news_detail")
		public String news_detail(HttpServletRequest req, Model model) throws IOException {
			logger.info("URL ==> news_detail");
			service.crawlNewsDetail(req, model);
			service.crawlArticle(req, model);
			
			return "Users/news_detail";
		}
//동렬 종료
//=============================	
//한결 시작
		//===한결 part - start

		// 게시판 목록
		@RequestMapping("boardList")
		public String boardList(HttpServletRequest req, Model model) {
			logger.info("URL ==> boardList");

			service.boardList(req, model);
			System.out.println("성공");

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

		
//		//게시글 작성 처리
//		@RequestMapping(value="writePro",method=RequestMethod.POST) 
//		public String writePro(MultipartHttpServletRequest req, Model model) {
	//  
//			logger.info("URL ==> writePro");
	//  
//			service.writePro(req, model);
	//  
//			return "Users/boardList"; 
//		}
		
		//게시글 작성 처리
		@RequestMapping("writePro") 
		public String writePro(HttpServletRequest req, Model model) {
	  
			logger.info("URL ==> writePro");
	  
			service.writePro(req, model);
	  
			return "redirect:boardList"; 
		}
		
		
		//게시글 삭제
		@RequestMapping("board_delete")
		public String board_delete(HttpServletRequest req, Model model) {

			logger.info("URL ==> board_delete");
			service.b_delete(req, model);
	 
			return "Users/board_delete";
		}
		
		//게시글 수정화면
		@RequestMapping("board_modi")
		public String board_modi(HttpServletRequest req, Model model) {

			logger.info("URL ==> board_modi");
			service.b_modify_view(req, model);

			return "Users/board_modifyView";
		}
		
		//게시글 수정처리
		@RequestMapping("boardUpdate")
		public String boardUpdate(HttpServletRequest req, Model model) {

			logger.info("URL ==> boardUpdate");
			service.b_modify(req, model);

			return "redirect:board_detail";
		}
		
		// 댓글뷰 ajax->controller
		@RequestMapping("commentList")
		public String commentList(HttpServletRequest req, Model model) {
			logger.info("URL ==> commentList");

			service.commentList(req, model);
			return "Users/commentList";
		}
		
//		// 댓글뷰 ajax
//		@RequestMapping(value = "test", method = RequestMethod.GET)
//		public String ajaxTest() {
//			logger.info("URL ==> commentList");
//			
//			return "test";
//		}
		
		//댓글 등록
		@RequestMapping("commentIn")
		public void commentUp(HttpServletRequest req, Model model) {
			logger.info("URL ==> commentIn");

			service.commentIn(req, model);
		}
		
		// 게시글 작성 폼
		@RequestMapping("qnaWriteForm")
		public String qnaWriteForm(Locale locale, HttpServletRequest req, Model model) {

			logger.info("URL ==> qnaWriteForm");
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

			String formattedDate = dateFormat.format(date);

			model.addAttribute("serverTime", formattedDate);

			return "Users/qna_writeForm";
		}
		
		//게시글 작성 처리
		@RequestMapping("qnaWritePro") 
		public String qnaWritePro(HttpServletRequest req, Model model) {
	  
			logger.info("URL ==> qnaWritePro");
	  
			service.qnaWritePro(req, model);
	  
			return "redirect:boardList"; 
		}
		
		// qna 글 pwd확인
		@RequestMapping("qna_pwdconfirm")
		public String qna_pwdconfirm(HttpServletRequest req, Model model) {

			logger.info("URL ==> qna_pwdconfirm");
			service.add(req, model);
			
			return "Users/qna_pwdConfirm";
		}
		
		
		// qna 상세보기
		@RequestMapping("qna_detail")
		public String qna_detail(HttpServletRequest req, Model model) {

			logger.info("URL ==> qna_detail");
			service.pwdConfirm(req, model);
			//service.qnaContent(req, model);
			logger.info("URL ==> qna_detail ok??");
			return "Users/qna_detail";
		}
		
		//qna 수정화면
		@RequestMapping("qna_modi")
		public String qna_modi(HttpServletRequest req, Model model) {

			logger.info("URL ==> qna_modi");
			service.q_modify_view(req, model);

			return "Users/qna_modifyView";
		}
		
		//게시글 수정처리
		@RequestMapping("qnaUpdate")
		public String qnaUpdate(HttpServletRequest req, Model model) {

			logger.info("URL ==> qnaUpdate");
			service.q_modify(req, model);

			return "redirect:qna_detail";
		}
		
		//qna 삭제
		@RequestMapping("qna_delete")
		public String qna_delete(HttpServletRequest req, Model model) {

			logger.info("URL ==> qna_delete");
			service.q_delete(req, model);
	 
			return "Users/qna_delete";
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
		
		//마이페이지 내 문의 목록
		@RequestMapping("myPage")
		public String myQnaList(HttpServletRequest req, Model model) {
			logger.info("URL ==> myQnaList");
			service.userModiView(req, model);
			service.myQnaList(req, model);
			service.getUserInfo(req, model);
			System.out.println("성공");

			return "Users/myPage";
		}
		
		
	//===한결 part - end	
//한결 종료
//=============================		
//나현 시작
		// 로그인_회원가입
		   @RequestMapping("login_reg")
		   public String login_reg(HttpServletRequest req, Model model) {
		      logger.info("URL ==> login_reg");
		      
		      return "login_reg";
		   }
		   
		
		
		//중복확인 서브페이지(자바스크립트 호출,아이디가 중복된 경우)
		
		@RequestMapping("confirmId")
		public String confirmId(HttpServletRequest req,Model model) {
			logger.info("url => Users/confirmId");
			
			service.confirmId(req, model); 
			
			return "Users/confirmId";
		}
		//회원가입처리 
		//String userid =req.getParameter(userid) ===> 이거 대신 @RequestParam String userid이렇게 
		@RequestMapping("regPro")
		public String regPro(HttpServletRequest req,Model model) {
			logger.info("url => Users/regPro");

			service.regPro(req, model); 

			return "login_reg"; // 나중에 회원가입이랑 로그인 나누면 로그인하는 화면으로 이동시켜주기 
		}
			
		 // 아이디찾기 이메일 코드 보내기
	    @RequestMapping(value="findId", method=RequestMethod.GET)
	    public String findId(HttpServletRequest req, Model model) {
	        System.out.println("findId");
	        
	        service.emailChk(req, model);
	        
	        return "Users/find_id";
	    }
	 
	    // 권한이 없는 사용자에게 안내 페이지 출력 - 403 ERROR
	 	@RequestMapping("/Users/denied")
	 	public String denied(HttpServletRequest req, Model model, Authentication auth) {
	 		
	 		logger.info("경로 : denied");
	 		AccessDeniedException ade = (AccessDeniedException) req.getAttribute(WebAttributes.ACCESS_DENIED_403);
	 		
	 		model.addAttribute("errMsg", ade); 
	 		
	 		return "Users/denied";
	 	}
			
			
			
		// 마이페이지 회원정보 수정시 비밀번호 체크
		@RequestMapping(value = "pwCheckCnt", method = RequestMethod.GET)
		@ResponseBody
		public int pwCheckCnt(@RequestParam("password") String password, @RequestParam("username") String username) {
			Map<String, Object> map = new HashMap<>();
			
			map.put("password", password);
			map.put("username", username);
			return service.pwCheckCnt(map);
		}
		
		// 회원정보 수정처리
		@RequestMapping("modifyPro")
		public String modifyPro(HttpServletRequest req, Model model, Authentication auth) {
			auth.getAuthorities(); 
			logger.info("URL ==> modifyPro");
			
			service.modifyPro(req, model);
			return "Users/modifyPro";
		}
		
		// 회원 탈퇴처리
		@RequestMapping("delMember")
		public String delMember(HttpServletRequest req, Model model, Authentication auth) {
			auth.getAuthorities(); 
			logger.info("URL ==> delMember");
			
			service.delMember(req, model);
			return "Users/delMember";
		}
		
//나현 종료
//=============================		
//예찬 시작
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
			
			service.favoriteList(req, model);
			return "Users/exercise_favorite";
		}
		
		// 동호회 목록
		@RequestMapping("club")
		public String club(HttpServletRequest req, Model model) {
			logger.info("URL ==> club");
			
			service.club_List(req, model);
			service.myClub(req,model);
			
			return "Users/club";
		}
		
		// 동호회 상세페이지
		@RequestMapping("details_Club")
		public String details_Club(HttpServletRequest req, Model model) {
			logger.info("URL ==> details_Club");
			
			service.getClub(req,model);
			return "Users/details_Club";
		}
			
		// 동호회 개설
		@RequestMapping("makeClub")
		public String makeClub(HttpServletRequest req, Model model) {
			logger.info("URL ==> makeClub");
			
			return "Users/makeClub";
		}
		
		// 동호회이름 중복체크 컨트롤러
		@RequestMapping(value = "club_IdCheck", method = RequestMethod.GET)
		@ResponseBody
		public int club_IdCheck(@RequestParam("clubId") String club_id) {
			
			return service.clubNameCheck(club_id);
		}
		
		// 버튼 - 즐겨찾기 삭제
		@RequestMapping("removeFavorit")
		public String removeFavorit(HttpServletRequest req, Model model) {
			logger.info("URL ==> removeFavorit");
			
			service.removeFavorit(req,model);
			return "Users/removeFavorit";
		}
		

		// 사용자 - 즐겨찾기 삭제
		@RequestMapping("deletefavorite")
		public String deletefavorite(HttpServletRequest req, Model model) {
			logger.info("URL ==> deletefavorite");
			
			service.removefavorites(req,model);
			return "Users/deletefavorite";
		}
		
		// 동호회 - 개설 신청
		@RequestMapping("makeClubApply")
		public String makeClubApply(HttpServletRequest req, Model model) {
			logger.info("URL ==> makeClubApply");
			
			service.addClubApply(req,model);
			return "Users/makeClubApply";
		}
		
		// 관리자 - 동호회 관리
		@RequestMapping("host_clubManagement")
		public String host_clubManagement(HttpServletRequest req, Model model) {
			logger.info("URL ==> host_clubManagement");
			
			service.existenceClub(req,model);
			return "host/host_clubManagement";
		}
		
		// 동호회 - 동호회 가입신청
		@RequestMapping("clubApply")
		public String clubApply(HttpServletRequest req, Model model) {
			logger.info("URL ==> clubApply");
			
			service.clubApply(req,model);
			return "Users/clubApply";
		}
		
		// 동호회 - 동호회 가입신청목록
		@RequestMapping("user_applyList")
		public String user_applyList(HttpServletRequest req, Model model) {
			logger.info("URL ==> user_applyList");
			
			service.applyList(req,model);
			return "Users/user_applyList";
		}
//예찬 종료
//=============================	

	
	
	
//======================이하 호스트부분==================

//규진 시작
			
//규진 끝

//재관 시작
			// 질병 정보 관리
			@RequestMapping("host_disease")
			public String host_diseaseInfo(HttpServletRequest req, Model model) {
				logger.info("URL ==> host_disease");
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
			@RequestMapping("codeDuplChk")
			public @ResponseBody int codeDuplChk(HttpServletRequest req, Model model) {
				logger.info("URL ==> codeDuplChk");
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
			
			// 회원 정보 관리
			@RequestMapping("host_userList")
			public String host_userList(HttpServletRequest req, Model model) {
				logger.info("URL ==> host_userList");
				service.userList(req, model);
				return "host/host_userList";
			}
			// 회원삭제
			@RequestMapping("host_userDel")
			public String host_userDel(HttpServletRequest req, Model model) {
				logger.info("URL ==> host_userDel");
				service.userDel(req, model);
				return "host/host_userDelPro";
			}	
			// 이용자통계
			@RequestMapping("host_userChart")
			public String host_userChart(HttpServletRequest req, Model model) {
				logger.info("URL ==> host_userChart");
				try {
					service.userStatistics(req, model);
				} catch(Exception e) {
					e.printStackTrace();
				}
				return "host/host_userChart";
			}

//재관 끝
			
//동렬 시작
			//==동렬 Part	 Strart

			// 관리자 - 음식 목록
			@RequestMapping("host_foodList")
			public String host_foodList(HttpServletRequest req, Model model) {
				logger.info("URL ==> host_foodList");
				service.foodList(req, model);
				
				return "host/host_foodList";
			}
			
			// 관리자 - 음식 등록 양식
			@RequestMapping("host_foodRegForm")
			public String host_foodRegForm(HttpServletRequest req, Model model) {
				// 로거 작성 필수!
				logger.info("URL ==> host_foodRegForm");
				return "host/host_foodRegForm";
			}
			
			// 관리자 - 음식 등록 처리
			@RequestMapping("host_foodRegPro")
			public String host_foodRegPro(MultipartHttpServletRequest req, Model model ) {
				logger.info("URL ==> host_foodRegPro");
				service.registerFood(req, model);
				
				return "host/host_foodRegPro";
			}
			
			// 관리자 - 음식 상세 정보
			@RequestMapping("host_foodDetail")
			public String host_foodDetail(HttpServletRequest req, Model model) {
				logger.info("URL ==> host_foodDetail");
				service.foodDetail(req, model);
				
				return "host/host_foodDetail";
			}
			
			// 관리자 - 음식 수정 페이지
			@RequestMapping("host_foodModifyForm")
			public String host_foodModifyForm(HttpServletRequest req, Model  model) {
				logger.info("URL ==> host_foodModifyForm");
				service.foodDetail(req, model);
				
				return "host/host_foodModifyForm";
			}
			
			// 관리자 - 음식 수정 처리 페이지
			@RequestMapping("host_foodModifyPro")
			public String host_foodModifyPro(MultipartHttpServletRequest req, Model model) {
				logger.info("URL ==> host_foodModifyPro");
				service.foodModifyPro(req, model);
				
				return "host/host_foodModifyPro";
			}
			
			// 관리자 - 음식 삭제 처리
			@RequestMapping("host_foodDeletePro")
			public String host_foodDeletePro(HttpServletRequest req, Model model) {
				logger.info("URL ==> host_foodDeletePro");
				service.foodDeletePro(req, model);
				
				return "host/host_foodDeletePro";
			}
			
			// 관리자 - 음식 목록에서 여러개 삭제 처리
			@RequestMapping("host_foodListDeletePro")
			public String host_foodListDeletePro(HttpServletRequest req, Model model) {
				logger.info("URL ==> host_foodListDeletePro");
				service.foodListDeletePro(req, model);
				
				return "host/host_foodListDeletePro";
			}
			
			// 관리자 - 음식 중복 확인
			@RequestMapping("host_foodDupCheck")
			public String host_foodDupCheck(HttpServletRequest req, Model model) {
				logger.info("URL ==> host_foodDupCheck");
				service.foodDupcheck(req, model);
				
				return "host/host_foodDupCheck";
			}
			
		//==동렬 Part	 End
//동렬 끝
			
//한결 시작
			
//한결 끝
			
//나현 시작
			
//나현 끝
//예찬 시작
			// 관리자 메인
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
			
			// 관리자 운동등록처리
			@RequestMapping("host_exerciseAddPro")
			public String host_exerciseAddPro(HttpServletRequest req, Model model) {
				logger.info("URL ==> exercise");
				
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
			
			// 관리자 - 동호회 개설승인/거절
			@RequestMapping("host_clubManage")
			public String host_clubManage(HttpServletRequest req, Model model) {
				// 로거 작성 필수!
				logger.info("URL ==> host_clubManage");
				
				service.clubList(req,model);
				return "host/host_clubManage";
			}
			
			// 관리자 - 동호회 상세페이지
			@RequestMapping("host_ClubDetail")
			public String host_ClubDetail(HttpServletRequest req, Model model) {
				// 로거 작성 필수!
				logger.info("URL ==> host_ClubDetail");
				
				service.clubDetail(req,model);
				return "host/host_ClubDetail";
			}
			
			// 관리자 - 동호회 신청 삭제
			@RequestMapping("host_deleteApplyClub")
			public String host_deleteApplyClub(HttpServletRequest req, Model model) {
				// 로거 작성 필수!
				logger.info("URL ==> host_deleteApplyClub");
				
				service.deleteApplyClub(req,model);
				return "host/host_deleteApplyClub";
			}
			
			// 관리자 - 동호회 신청 승인
			@RequestMapping("host_PermitClub")
			public String host_PermitClub(HttpServletRequest req, Model model) {
				// 로거 작성 필수!
				logger.info("URL ==> host_PermitClub");
				
				service.clubPermit(req,model);
				return "host/host_PermitClub";
			}
			
			// 관리자 - 개설된 동호회 삭제
			@RequestMapping("host_existenceClubRemove")
			public String host_existenceClubRemove(HttpServletRequest req, Model model) {
				// 로거 작성 필수!
				logger.info("URL ==> host_existenceClubRemove");
				
				service.deleteApplyClub(req,model);
				return "host/host_existenceClubRemove";
			}
//예찬 끝
			
			
			
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
	
	

	// ==한결 Part Start===============================================================
		@RequestMapping("host_qna")
		public String host_qna(HttpServletRequest req, Model model) {
			// 로거 작성 필수!
			logger.info("URL ==> host_qna");
			return "host/host_qna";
		}
		
		// 게시판 목록 -> 공지사항
		@RequestMapping("host_notice")
		public String noticeList(HttpServletRequest req, Model model) {
			logger.info("URL ==> noticeList");

			service.noticeList(req, model);
			System.out.println("성공");

			return "host/host_notice";
		}
		
		//공지사항 글 보기
		@RequestMapping("host_noticeContent")
		public String host_noticeContent(HttpServletRequest req, Model model) {
			// 로거 작성 필수!
			logger.info("URL ==> host_noticeContent");
			
			service.notice_contentForm(req, model);
			return "host/host_noticeContent";
		}
		
		//공지사항 수정 뷰
		@RequestMapping("notice_modify")
		public String notice_modify(HttpServletRequest req, Model model) {
			// 로거 작성 필수!
			logger.info("URL ==> notice_modify");
			
			service.n_modify_view(req, model);
			return "host/host_notice_modify";
		}
		
		//공지사항 수정 처리
		@RequestMapping("noticeUpdate")
		public String noticeUpdate(HttpServletRequest req, Model model) {

			logger.info("URL ==> noticeUpdate");
			service.n_modify(req, model);

			return "redirect:host_noticeContent";
		}
		
		//공지사항 삭제
//		@RequestMapping("notice_delete")
//		public String notice_delete(HttpServletRequest req, Model model) {
//
//			logger.info("URL ==> notice_delete");
//			service.n_delete(req, model);
//	 
//			return "host/board_delete";
//		}
		
		@RequestMapping("host_boardContent")
		public String host_boardContent(HttpServletRequest req, Model model) {

			logger.info("URL ==> host_boardContent");
			
			return "host/host_boardContent";
		}

		@RequestMapping("host_board")
		public String host_board(HttpServletRequest req, Model model) {
			// 로거 작성 필수!
			logger.info("URL ==> host_board");
			return "host/host_board";
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
		// ==한결 Part End==================================================
		
}
