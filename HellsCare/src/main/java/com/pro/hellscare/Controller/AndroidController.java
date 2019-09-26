package com.pro.hellscare.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pro.hellscare.VO.BoardVO;
import com.pro.hellscare.VO.ClubBoardVO;
import com.pro.hellscare.VO.ClubVO;
import com.pro.hellscare.VO.CommentVO;
import com.pro.hellscare.VO.DiseaseVO;
import com.pro.hellscare.VO.ExerciseVO;
import com.pro.hellscare.VO.FoodVO;
import com.pro.hellscare.VO.KcalVO;
import com.pro.hellscare.VO.MyClubVO;
import com.pro.hellscare.VO.MychalleangeVO;
import com.pro.hellscare.VO.NutritionCSV;
import com.pro.hellscare.VO.NutritionInfo;
import com.pro.hellscare.VO.UserDayKcalInfo;
import com.pro.hellscare.VO.UsersVO;
import com.pro.hellscare.persistence.HellsCareDAO;


//전체 페이지를 관리하는 메인 컨트롤러
@Controller
public class AndroidController {
	private static final Logger logger = LoggerFactory.getLogger(AndroidController.class);

	//DAO Autowired로 연결	
	@Autowired HellsCareDAO dao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder; // 비밀번호 암호화 객체
	 
	//안드로이드 연동시에 Gson방식의 어노테이션 필요함! 
	// @ResponseBody   //맵에서 안드로이드로 값을 전달하기위한 어노테이션(Gson형식)
	//return 형식이 주소값이 아닌 그 외의 자료형의 값일경우 사용. 나머지는 IP연동으로 안드로이드에서 설정
	
// 재관 시작
	// 로그인
	@ResponseBody // spring에서 안드로이드로 데이터(json)를 보내기 위한 어노테이션
	@RequestMapping("androidSignIn")
	public Map<String, String> androidSignIn(HttpServletRequest req){
		logger.info("androidSignIn");
		
		// Android 로그인 화면에서 로그인 정보를 넘겨준다.
		String username = req.getParameter("id");
		String password = req.getParameter("pwd");
		
		String enabled ="";
		// 암호화된 비밀번호를 변수에 담는다.
		String encodedPassword = dao.returnPassword(username);
		if(encodedPassword==null) {
			enabled=null;
		} else {
			// 입력받은 비밀번호화 암호화된 비밀번호를 비교한다.
			Boolean checkPwd = passwordEncoder.matches(password, encodedPassword);
			
			if(checkPwd) {
				enabled = dao.confirmId(username);  // 비밀번호가 일치하면  1이 들어간다.
			} else {
				enabled="0";
			}
		}
		// 로그인 정보를 안드로이드로 보낸다.
		Map<String, String> out = new HashMap<String, String>();
		if(enabled != null) {
			logger.info("비밀번호 확인 : " + enabled);
			out.put("username", username);
			out.put("enabled", enabled);
		} else {
			logger.info("로그인 실패");
			out.put("username", null);
			out.put("enabled", enabled);
		}
		
		return out;
	}

	// 질병정보목록
	@ResponseBody
	@RequestMapping("androidDiseaseList")
	public Map<String, DiseaseVO> androidDiseaseList(HttpServletRequest req) {
		logger.info("androidDiseaseList");
		// 화면에서 질병명, 질병코드를 입력받는다.
		String s_name = req.getParameter("disease_name");
		String s_code = req.getParameter("disease_code");
		// 검색할 keyword를 map에 담는다.
		Map<String, Object> in = new HashMap<String, Object>();
		in.put("s_name", s_name);
		in.put("s_code", s_code);
		in.put("start", 0);
		in.put("end", 350);
		
		// 코드와 질병명으로 정보를 조회
		List<DiseaseVO> list = dao.getDiseaseList(in);
		Map<String, DiseaseVO> map = new HashMap<String, DiseaseVO>();
		// 리스트정보를 map으로 변환한다.
		for(int i=0; i<list.size(); i++) {
			// System.out.println(list.get(i).getDisease_name());
			map.put("data"+i, list.get(i));
		}
	
		return map;
	}	
// 재관 끝

// 규진시작
	@ResponseBody
	@RequestMapping("androidMychall")
	public Map<String,MychalleangeVO> androidMychall(HttpServletRequest req){
		logger.info("androidMychall");
		String id = req.getParameter("id");
		List<MychalleangeVO> list = dao.Mychallenge(id);
		Map<String, MychalleangeVO> map = new HashMap<String, MychalleangeVO>();		
		for(int i=0; i<list.size(); i++){
			System.out.println(list.get(i).getChallenge_name());
			map.put("data"+i, list.get(i));
		}
		return map;
	}
// 규진끝	
	
	//동렬파트 시작==============
	// 오늘의 칼로리 - 음식 분류에 맞는 음식 리스트 가져오기
		@ResponseBody
		@RequestMapping("androidGetFoodList")
		public Map<String, FoodVO> androidGetFoodList(HttpServletRequest req) {
			logger.info("androidGetFoodList");
			
			String food_kind = req.getParameter("food_kind");
			
			List<FoodVO> foodList = dao.getFoodNamesByUsingFoodKind(food_kind);
			Map<String, FoodVO> map = new HashMap<>();
				
			for (int i = 0; i < foodList.size(); i++) {
				map.put("Data"+i, foodList.get(i));
			}
			
			return map;
		}
		
		// 오늘의 칼로리 - 선택한 음식명에 맞는 FoodVO 가져오기
		@ResponseBody
		@RequestMapping("androidGetFoodInfo")
		public Map<String, FoodVO> androidGetFoodInfo(HttpServletRequest req) {
			logger.info("androidGetFoodInfo");
			
			String food_name = req.getParameter("food_name");
			
			Map<String, String> foodMap = new HashMap<>();
			foodMap.put("food_name", food_name);
			
			FoodVO food = dao.getFoodInfoByUsingFoodName(foodMap);
			
			Map<String, FoodVO> map = new HashMap<>();
			map.put("Data"+0, food);
			
			return map;
		}
		
		// 오늘의 칼로리 - 해당 아이디의 입력없이 결과만 보는 메소드
		@ResponseBody
		@RequestMapping("androidGetCalInfoNoInput")
		public Map<String, String> androidGetCalInfoNoInput(HttpServletRequest req) {
			logger.info("androidGetCalInfoNoInput");
			
			String id = req.getParameter("username");
			UsersVO user = dao.getUserInfoByUsingId(id);
			
			// 오늘 날짜를 받고 
			Date today = new Date();
			SimpleDateFormat formatType = new SimpleDateFormat("YYYYMMdd");
			
			// 오늘 년도와 태어난 년도의 차를 구한 다음 나이를 구한다.
			int present = Integer.parseInt((String)formatType.format(today)) / 10000;	// 현재 년도 환산
			int birth = Integer.parseInt(user.getBirth()) / 10000;	// 출생년도
			
			int age = present - birth + 1;
			
			String getGender = user.getGender();
			String gender ="";
			
			if(getGender.startsWith("M")) {
				gender = "man";
			} else if(getGender.startsWith("F")) {
				gender = "woman";
			}
			
			// 영양소 기준표 불러오기
			NutritionCSV nutritionCSV = new NutritionCSV();
			
			List<NutritionInfo> nutritionStandard = nutritionCSV.readCsv();
			
			NutritionInfo standard = new NutritionInfo();
			
			for (int i = 0; i < nutritionStandard.size(); i++) {
				if(age == nutritionStandard.get(i).getAge() &&
					gender.equals(nutritionStandard.get(i).getSeparation())) {
					standard = nutritionStandard.get(i);
				}
			}
			
			if(gender.startsWith("m")) {
				gender = "남성";
			} else if(gender.startsWith("f")) {
				gender = "여성";
			}
			
			// 오늘 섭취한 칼로리
			int userTodayKcal = 0;
			
			// 오늘날짜의 기존에 입력했던 섭취 칼로리 정보 가져오기
			Map<String, String> todayMap = new HashMap<>();
			
			todayMap.put("username", id);
			todayMap.put("kcal_date", (String)formatType.format(today));
			
			if(dao.getKcalInfo(todayMap) != null) {
				userTodayKcal += Integer.parseInt(dao.getKcalInfo(todayMap));
			}
			
			// 어제 섭취한 칼로리
			int userYesterdayKcal = 0;
			
			Map<String, String> yesterdayMap = new HashMap<>();
			
			Calendar cal = new GregorianCalendar();
			cal.add(Calendar.DATE, -1);
			
			Date yesterday = cal.getTime();
			SimpleDateFormat yesterdayDate = new SimpleDateFormat("YY/MM/dd");
			
			yesterdayMap.put("kcal_date", (String)(yesterdayDate.format(yesterday)));
			yesterdayMap.put("username", id);
			
			if(dao.getKcalInfo(yesterdayMap) != null) {
				userYesterdayKcal = Integer.parseInt(dao.getKcalInfo(yesterdayMap));
			}
			
			Map<String, String> map = new HashMap<>();
			map.put("age", Integer.toString(age));
			map.put("gender", gender);
			map.put("userTodayKcal", Integer.toString(userTodayKcal));
			map.put("userYesterdayKcal", Integer.toString(userYesterdayKcal));
			map.put("standardKcal", Integer.toString(standard.getCalory()));
			return map;
		}
		
		// 오늘의 칼로리 - 입력 완료 버튼 클릭 시
		@ResponseBody
		@RequestMapping("androidKcalInputComplete")
		public Map<String, String> androidKcalInputComplete(HttpServletRequest req) {
			logger.info("androidKcalInputComplete");
			
			String id = req.getParameter("username");
			String food_kind = req.getParameter("food_kind");
			String food_name = req.getParameter("food_name");
			String food_count = req.getParameter("food_amount");
			
			UsersVO user = dao.getUserInfoByUsingId(id);
			
			// 오늘 날짜를 받고 
			Date today = new Date();
			SimpleDateFormat formatType = new SimpleDateFormat("YYYYMMdd");
			
			// 오늘 년도와 태어난 년도의 차를 구한 다음 나이를 구한다.
			int present = Integer.parseInt((String)formatType.format(today)) / 10000;	// 현재 년도 환산
			int birth = Integer.parseInt(user.getBirth()) / 10000;	// 출생년도
			
			int age = present - birth + 1;
			
			String getGender = user.getGender();
			String gender ="";
			
			if(getGender.startsWith("M")) {
				gender = "man";
			} else if(getGender.startsWith("F")) {
				gender = "woman";
			}
			
			// 영양소 기준표 불러오기
			NutritionCSV nutritionCSV = new NutritionCSV();
			
			List<NutritionInfo> nutritionStandard = nutritionCSV.readCsv();
			
			NutritionInfo standard = new NutritionInfo();
			
			for (int i = 0; i < nutritionStandard.size(); i++) {
				if(age == nutritionStandard.get(i).getAge() &&
					gender.equals(nutritionStandard.get(i).getSeparation())) {
					standard = nutritionStandard.get(i);
				}
			}
			
			if(gender.startsWith("m")) {
				gender = "남성";
			} else if(gender.startsWith("f")) {
				gender = "여성";
			}
			
			// 오늘 섭취한 칼로리
			int userTodayKcal = 0;
			
			// 오늘날짜의 기존에 입력했던 섭취 칼로리 정보 가져오기
			Map<String, String> todayMap = new HashMap<>();
			
			todayMap.put("username", id);
			todayMap.put("kcal_date", (String)formatType.format(today));
			
			if(dao.getKcalInfo(todayMap) != null) {
				userTodayKcal += Integer.parseInt(dao.getKcalInfo(todayMap));
			}
			
			int insertCnt = 0;
			
			// 오늘의 칼로리 입력 폼에서 입력한 정보들 테이블에 insert
			Map<String, String> map = new HashMap<>();
			
			map.put("food_kind", food_kind);
			map.put("food_name", food_name);
			
			FoodVO food = dao.getFoodInfoByUsingFoodNameAndFoodKind(map);
			
			Map<String, String> insertFoodMap = new HashMap<>();
			
			insertFoodMap.put("username", id);
			insertFoodMap.put("food_code", food.getFood_code());
			insertFoodMap.put("kcal", Integer.toString(Integer.parseInt(food_count) * food.getKcal()));
			insertFoodMap.put("kcal_date", (String)formatType.format(today));
			
			insertCnt += dao.insertUserFood(insertFoodMap);
			
			userTodayKcal += Integer.parseInt(food_count) * food.getKcal();
			
			// 어제 섭취한 칼로리
			int userYesterdayKcal = 0;
			
			Map<String, String> yesterdayMap = new HashMap<>();
			
			Calendar cal = new GregorianCalendar();
			cal.add(Calendar.DATE, -1);
			
			Date yesterday = cal.getTime();
			SimpleDateFormat yesterdayDate = new SimpleDateFormat("YY/MM/dd");
			
			yesterdayMap.put("kcal_date", (String)(yesterdayDate.format(yesterday)));
			yesterdayMap.put("username", id);
			
			if(dao.getKcalInfo(yesterdayMap) != null) {
				userYesterdayKcal = Integer.parseInt(dao.getKcalInfo(yesterdayMap));
			}
			
			Map<String, String> kcalMap = new HashMap<>();
			
			if(insertCnt >0) {
				kcalMap.put("age", Integer.toString(age));
				kcalMap.put("gender", gender);
				kcalMap.put("userTodayKcal", Integer.toString(userTodayKcal));
				kcalMap.put("userYesterdayKcal", Integer.toString(userYesterdayKcal));
				kcalMap.put("standardKcal", Integer.toString(standard.getCalory()));
			}
			
			return kcalMap;
		}
		
		// 식단 추천
		@ResponseBody
		@RequestMapping("androidFoodRecommendation")
		public Map<String, String> androidFoodRecommendation(HttpServletRequest req) {
			
			logger.info("androidFoodRecommendation");
			
			String username = req.getParameter("username");
			String getDate = "";
			
			// 사용자의 나이 구하기
			UsersVO user = dao.getUserInfoByUsingId(username);
			
			// 오늘 날짜 받기
			Date today = new Date();
			SimpleDateFormat getAge = new SimpleDateFormat("YYYYMMdd");
			
			// 오늘 년도와 태어난 년도의 차를 구한 다음 나이를 구한다.
			int present = Integer.parseInt((String)getAge.format(today)) / 10000;	// 현재 년도 환산
			int birth = Integer.parseInt(user.getBirth()) / 10000;	// 출생년도
			
			int age = present - birth + 1;
			String getGender = user.getGender(), gender = "";
			
			if(getGender.startsWith("M")) {
				gender = "man";
			} else if(getGender.startsWith("F")) {
				gender = "woman";
			}
			
			// 영양소 기준표 불러오기
			NutritionCSV nutritionCSV = new NutritionCSV();
			List<NutritionInfo> nutritionStandard = nutritionCSV.readCsv();
			
			NutritionInfo standard = new NutritionInfo();
			
			for (int i = 0; i < nutritionStandard.size(); i++) {
				if(age == nutritionStandard.get(i).getAge() &&
					gender.equals(nutritionStandard.get(i).getSeparation())) {
					standard = nutritionStandard.get(i);
				}
			}
			
			if(gender.startsWith("m")) {
				gender = "남성";
			} else if(gender.startsWith("f")) {
				gender = "여성";
			}
			
			// 최근 칼로리 섭취량에 따른 식단 추천하기
			// 지난 주 날짜 구하기
			Calendar cal = new GregorianCalendar();
			cal.add(Calendar.DATE, -7);
			
			Date lastWeek = cal.getTime();
			SimpleDateFormat formatType = new SimpleDateFormat("YY/MM/dd");
			getDate = (String)(formatType.format(lastWeek));
			
			Map<String, String> map = new HashMap<>();
			map.put("username", username);
			map.put("kcal_date", getDate);

			// 일주일 간 칼로리 섭취 정보 가져오기
			// 리스트로 kcal_tbl에 지난 일주일간 정보들을 모두 가져와서
			List<KcalVO> userWeeklyKcalNotCombined = dao.getUserKcalInfo(map);
			
			// 일자가 같은 칼로리 정보들은 합친다.
			List<UserDayKcalInfo> userWeeklyKcalList = new ArrayList<>();
			
			int j = 0;	// userWeeklyKcalNotCombined와 숫자 불일치 시 
						// userWeeklyKcalList를 맞춰갈 순환 수
			for (int i = 0; i < userWeeklyKcalNotCombined.size(); i++) {
				UserDayKcalInfo oneDayKcalInfo = new UserDayKcalInfo();
				
				// 처음 시작 칼로리 정보는 일단 넣는다.
				if(i == 0) {
					// 
					oneDayKcalInfo.getKcalList().add(userWeeklyKcalNotCombined.get(i));
					oneDayKcalInfo.setTotal_kcal(userWeeklyKcalNotCombined.get(i).getKcal());
					oneDayKcalInfo.setKcal_date(userWeeklyKcalNotCombined.get(i).getKcal_date());
					
					userWeeklyKcalList.add(oneDayKcalInfo);
				} else if(i >= 1) {
					// userWeeklyKcalNotCombined의 날짜들을 순차적으로 비교한다.
					// 날짜가 동일하다면 총합 칼로리를 증가시키고 KcalVO 리스트에 추가해준다.
					if(userWeeklyKcalList.get(j).getKcal_date().equals(userWeeklyKcalNotCombined.get(i).getKcal_date())) {
						int total_kcal = userWeeklyKcalNotCombined.get(i).getKcal() + userWeeklyKcalList.get(j).getTotal_kcal();
						userWeeklyKcalList.get(j).setTotal_kcal(total_kcal);
						userWeeklyKcalList.get(j).getKcalList().add(userWeeklyKcalNotCombined.get(i));
					} else {
						// 날짜가 동일하지 않다면 리스트에 추가해주고, 
						// 다음 일주일치 리스트의 인덱스를 다음 값으로 바꾸기 위해 j를 증가시킨다.
						oneDayKcalInfo.getKcalList().add(userWeeklyKcalNotCombined.get(i));
						oneDayKcalInfo.setTotal_kcal(userWeeklyKcalNotCombined.get(i).getKcal());
						oneDayKcalInfo.setKcal_date(userWeeklyKcalNotCombined.get(i).getKcal_date());
						
						userWeeklyKcalList.add(oneDayKcalInfo);
						j++;
					}
				}	// end else if(i >= 1)
			}
			
			
			// 일주일 치 정보가 모이지 않는다면
			if(userWeeklyKcalList.size() < 7) {
				// 나머지 일자에 대한 정보는 입력하지 않은 것이므로
				// 나머지 남은 정보들을 다 0으로 처리한다.
				for (int i = userWeeklyKcalList.size()-1; i < 6; i++) {
					// 날짜
					UserDayKcalInfo oneDayKcalInfo = new UserDayKcalInfo();
					
					int number = userWeeklyKcalList.size() - i;
					number = number * (-1);
					
					Calendar tempCal = new GregorianCalendar();
					tempCal.add(Calendar.DATE, number);
					Date tempDate = tempCal.getTime();
					java.sql.Date tempSQLDate = new java.sql.Date(tempDate.getTime());
					
					oneDayKcalInfo.setKcal_date(tempSQLDate);
					
					// 총합 칼로리
					oneDayKcalInfo.setTotal_kcal(0);
					
					userWeeklyKcalList.add(oneDayKcalInfo);
				}
				
				// 제대로 된 주간 칼로리 리스트 날짜를 받는다.
				List<java.sql.Date> sqlDateList = new ArrayList<>();
				
				// 선행되어 저장된 주간 칼로리 리스트에 저장되지 않은 날짜들을 저장한다.
				// 결과적으로 순차적인 일자들을 저장하게 된다.
				for (int i = 0; i < 7; i++) {
					Calendar tempCal = new GregorianCalendar();
					tempCal.add(Calendar.DATE, -(7-i));
					Date tempDate = tempCal.getTime();
					java.sql.Date tempSQLDate = new java.sql.Date(tempDate.getTime());
					sqlDateList.add(tempSQLDate);
				}
				
				for (int i = 0; i < sqlDateList.size(); i++) {
					System.out.println("sqlDate : " + sqlDateList.get(i));
				}
				
				// 두 리스트의 날짜 값을 순차적으로 받는다.
				for (int i = 0; i < 7; i++) {
					
					int compare = userWeeklyKcalList.get(i).getKcal_date().compareTo(sqlDateList.get(i));
					
					// 순차적으로 날짜 비교 후 일치하지 않는다면
					if(compare > 0) {
						UserDayKcalInfo temp = new UserDayKcalInfo();
						
						temp.setKcal_date(sqlDateList.get(i));
						temp.setTotal_kcal(0);
						temp.setKcalList(new ArrayList<>());
						
						userWeeklyKcalList.add(temp);
					}
				}

				// 유효한 값들만 걸러낸다.
				List<UserDayKcalInfo> kcalList = new ArrayList<>();
				
				for (int i = 0; i < userWeeklyKcalList.size(); i++) {
					
					if(i > 0) {
						UserDayKcalInfo temp = userWeeklyKcalList.get(i-1);
						
						// 값이 0이 아닌 날짜들만 먼저 선별하고
						if(temp.getTotal_kcal() != 0) {
							kcalList.add(temp);
						} else {
							// 값이 0이 아닌 것들은 날짜를 비교해서 
							int compare = temp.getKcal_date().compareTo(userWeeklyKcalList.get(i).getKcal_date());
							
							// 날짜가 같지 않은 것들만 선별한다.
							if(compare != 0) {
								kcalList.add(userWeeklyKcalList.get(i));
							}
						}
					}
				}
				
				// 날짜가 중복되는 인덱스를 찾는다.
				List<Integer> find = new ArrayList<>();
				
				for (int i = 0; i < kcalList.size(); i++) {
					
					java.sql.Date tempDate = kcalList.get(i).getKcal_date();
					
					for (int k = i+1; k < kcalList.size(); k++) {
						
						String compareI = tempDate.toString();
						String compareK = kcalList.get(k).getKcal_date().toString();
						
						if(compareI.equals(compareK)) {
							find.add(k);
						}
					}
				}
				
				for (int i = 0; i < find.size(); i++) {
					kcalList.remove(find.get(i));
				}
				
				find.clear();
				userWeeklyKcalList = kcalList;
			}
			
			// 섭취한 성분 분석
			// 탄수화물, 단백질, 지방 성분을 분석하여 섭취한 영양소 성분에 대한 통계를 낸다.
			// 기준치와 비교해서 자신이 섭취한 양과 비교한다.
			
			// 한주간 섭취한 탄수화물, 단백질, 지방 비율
			double weekCarbo = 0;
			double weekProtein = 0;
			double weekFat = 0;
			double weekSaccharide = 0;
			
			for (int i = 0; i < userWeeklyKcalList.size(); i++) {
				// 순차적으로 돌면서 하루의 칼로리 데이터를 받는다.
				UserDayKcalInfo tempKcalInfo = userWeeklyKcalList.get(i);
				
				// 하루 총 섭취량
				double onedayCarbo = 0;
				double onedayProtein = 0;
				double onedayFat = 0;
				double onedaySaccharide = 0;
				
				// 비율 산출을 위한 하루 평균치
				double avgCarbo = standard.getAvgCarbohydrate() * 100;
				double avgFat = standard.getAvgFat() * 100;
				
				// 하루의 칼로리를 섭취한 칼로리 리스트 정보를 받는다.
				for (int k = 0; k < tempKcalInfo.getKcalList().size(); k++) {
					KcalVO tempKcalVO = tempKcalInfo.getKcalList().get(k);
					
					// 칼로리 리스트에 담겨있는 음식 리스트의 정보를 받는다.
					FoodVO tempFoodVO = dao.getFoodInfo(tempKcalVO.getFood_code());
					
					// k번째 칼로리 정보에서 k번째 칼로리 섭취한 음식 정보의 칼로리 값을 받아서
					// 총 음식을 섭취한 칼로리 / 1개당 함유 칼로리를 계산해서
					// 음식의 섭취 갯수를 받는다.
					int foodCount = tempKcalInfo.getKcalList().get(k).getKcal() /
									tempFoodVO.getKcal();
					
					// 해당 음식을 섭취한 갯수에 영양 성분들의 그람수를 곱하여 하루 섭취량을 누적 계산한다.
					double eachCarbo = (double)tempFoodVO.getCarbohydrate() * foodCount;
					double eachProtein = (double)tempFoodVO.getProtein() * foodCount;
					double eachFat = (double)tempFoodVO.getFat() * foodCount;
					double eachSaccharide = (double)tempFoodVO.getSaccharides() * foodCount;
					
					// 탄수화물과 지방만 비율 값을 산출한다.
					// 하루 기준 섭취량
					// 하루 기준 탄수화물량(g) = 하루 섭취기준 칼로리 / 100 * 평균치 / 4(1g당 4kcal) 
					double availableCarbo = (double)standard.getCalory() / 100 * avgCarbo / 4;
					
					// 하루 기준 지방량(g) = 하루 섭취기준 칼로리 / 100 * 평균치 / 9(1g당 9kcal)
					double availableFat = (double)standard.getCalory() / 100 * avgFat / 9;
					
					onedayCarbo += eachCarbo * 100 / availableCarbo;
					onedayProtein += eachProtein;
					onedayFat += eachFat * 100 / availableFat;
					onedaySaccharide += eachSaccharide;
				}
				
				// 하루 섭취한 영양소 값들을 
				weekCarbo += onedayCarbo / tempKcalInfo.getKcalList().size();
				weekProtein += onedayProtein / tempKcalInfo.getKcalList().size();
				weekFat += onedayFat / tempKcalInfo.getKcalList().size();
				weekSaccharide += onedaySaccharide / tempKcalInfo.getKcalList().size();
			}
			
			weekCarbo = weekCarbo / userWeeklyKcalList.size();
			weekProtein = weekProtein / userWeeklyKcalList.size();
			weekFat = weekFat / userWeeklyKcalList.size();
			weekSaccharide = weekSaccharide / userWeeklyKcalList.size();
			
			System.out.println("일주일 평균 탄수화물 섭취량 : " + weekCarbo + "%");
			System.out.println("일주일 평균 단백질 섭취량 : " + weekProtein + "g");
			System.out.println("일주일 평균 지방 섭취량 : " + weekFat + "%");
			System.out.println("일주일 평균 당류 섭취량 : " + weekSaccharide + "g");
			
			int weekTotalKcal = 0;
			
			for (int i = 0; i < userWeeklyKcalList.size(); i++) {
				weekTotalKcal += userWeeklyKcalList.get(i).getTotal_kcal();
			}
			
			weekTotalKcal /= userWeeklyKcalList.size();
			
			Map<String, String> recommendationMap = new HashMap<>();
			
			recommendationMap.put("weekCarbo", String.valueOf(weekCarbo));
			recommendationMap.put("weekProtein", String.valueOf(weekProtein));
			recommendationMap.put("weekFat", String.valueOf(weekFat));
			recommendationMap.put("weekSaccharide", String.valueOf(weekSaccharide));
			
			recommendationMap.put("weekAvgKcal", String.valueOf(weekTotalKcal));
			
			recommendationMap.put("stdKcal", String.valueOf(standard.getCalory()));
			
			recommendationMap.put("gender", gender);
			recommendationMap.put("age", String.valueOf(age));
			
			recommendationMap.put("avgCarbo", String.valueOf(standard.getAvgCarbohydrate()*100));
			recommendationMap.put("avgProtein", String.valueOf(standard.getAvgProtein()));
			recommendationMap.put("avgFat", String.valueOf(standard.getAvgFat()*100));
			
			recommendationMap.put("stdSaccharide", String.valueOf(standard.getSaccharide()));
			
			recommendationMap.put("recoCarbo", String.valueOf(standard.getRecoCarbohydrate()*100));
			recommendationMap.put("recoProtein", String.valueOf(standard.getRecoProtein()));
			recommendationMap.put("recoFat", String.valueOf(standard.getRecoFat()*100));

			return recommendationMap;
		}
		
		// 오늘일자 현재기준 칼로리 정보 받아오기
		@ResponseBody
		@RequestMapping("androidPresentKcal")
		public Map<String, Integer> androidPresentKcal(HttpServletRequest req) {
			
			String id = req.getParameter("username");
			List<KcalVO> todayKcal = dao.getTodayKcalInfo(id);
			
			int totalKcal = 0;
			
			for (int i = 0; i < todayKcal.size(); i++) {
				totalKcal += todayKcal.get(i).getKcal();
			}
			
			Map<String, Integer> map = new HashMap<>();
			map.put("todayKcal", totalKcal);
			
			return map;
		}
	
	//동렬파트 종료 ==============
	
		//나현파트 시작=============
		// 마이페이지
		@ResponseBody
		@RequestMapping("androidMyPageMain")
		public Map<String, Object> androidMyPageMain(HttpServletRequest req) {
			logger.info("androidMyPageMain");
			
			String username = req.getParameter("id");
			
			// id를 통해서 회원정보를 조회
			UsersVO member = (UsersVO)dao.getMemberInfo(username);
			
			System.out.println("username : " + username + " -- " + member.getName());
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("data1", member.getName());
			map.put("data2", member.getEmail());
			map.put("data3", 0);
			map.put("data4", 0);
			map.put("member", member);
		
			return map;
		}	

		// 마이페이지 _회원정보 수정 
		@ResponseBody
		@RequestMapping("androidMyPageModi")
		public Map<String, Object> androidMyPageModi(HttpServletRequest req) {
			logger.info("androidMyPageModi");
			
			String username = req.getParameter("username");
			String name = req.getParameter("name");
			String password = req.getParameter("password");
			String address = req.getParameter("address");
			String email = req.getParameter("email");
			String phone_number = req.getParameter("phone_number");	
			String encryptPassword = passwordEncoder.encode(password);
			
			System.out.println("name : " + name);
			
			UsersVO vo = new UsersVO();
			vo.setUsername(username);
			vo.setName(name);
			vo.setPassword(encryptPassword);
			vo.setAddress(address);
			vo.setEmail(email);
			vo.setPhone_number(phone_number);
			
			int updateCnt = dao.userModifyPro(vo);
			
			UsersVO member2;
			
			Map<String, Object> umap = new HashMap<String, Object>();
			
			if(updateCnt != 1) {
				logger.info("업데이트 실패, cnt : " + updateCnt);
				member2 = (UsersVO)dao.getMemberInfo(username);
				umap.put("member", member2);  
				
			} else {
				logger.info("업데이트 성공, cnt : " + updateCnt);
				member2 = (UsersVO)dao.getMemberInfo(username);
				umap.put("member", member2);  
			}
			
			return umap;
		}	
		
		//나현파트 끝========
		
//예찬파트 시작===========
		// 운동목록
		@ResponseBody
		@RequestMapping("androidGetExerciseList")
		public Map<String, ExerciseVO> androidGetExerciseList(HttpServletRequest req) {
			logger.info("androidGetExerciseList");

			Map<String, Integer> map = new HashMap<>();

			map.put("start", 0);
			map.put("end", 1000);
			// 운동목록 조회
			List<ExerciseVO> list = dao.getexerciseList(map);
			Map<String, ExerciseVO> exerciseMap = new HashMap<String, ExerciseVO>();
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).getExercise_name());
				exerciseMap.put("Data" + i, list.get(i));
			}
			return exerciseMap;
		}

		// 내 동호회 목록
		@ResponseBody
		@RequestMapping("androidGetMyClubList")
		public Map<String, ClubVO> androidGetMyClubList(HttpServletRequest req) {
			logger.info("androidGetMyClubList");

			String username = req.getParameter("username");
			System.out.println("username : " + username);
			String club1 = null;
			String club2 = null;
			String club3 = null;

			// 내 동호회
			int cnt = dao.getMyClubCnt(username);
			Map<String, ClubVO> clubMap = new HashMap<String, ClubVO>();

			if (cnt > 0) {
				MyClubVO vo = dao.getMyClubList(username);

				if (vo != null) {
					club1 = vo.getClub1();
					club2 = vo.getClub2();
					club3 = vo.getClub3();
				}

				if (club1 != null) {
					ClubVO vo1 = dao.getMy_ClubList(club1);
					clubMap.put("vo1", vo1);
				}

				if (club2 != null) {
					ClubVO vo2 = dao.getMy_ClubList(club2);
					clubMap.put("vo2", vo2);
				}

				if (club3 != null) {
					ClubVO vo3 = dao.getMy_ClubList(club3);
					clubMap.put("vo3", vo3);
				}

				if (club1 == null && club2 == null && club3 == null) {
					clubMap.put("cnt", null);
				}

				return clubMap;
			} else {
				clubMap.put("cnt", null);
				return clubMap;
			}
		}

		// 전체 동호회 목록
		@ResponseBody
		@RequestMapping("androidGetClubList")
		public Map<String, ClubVO> androidGetClubList(HttpServletRequest req) {
			logger.info("androidGetClubList");

			String username = req.getParameter("username");
			String club1 = null;
			String club2 = null;
			String club3 = null;

			// 전체동호회
			int cnt = dao.getClub_Cnt(username);

			if (cnt > 0) {
				Map<String, ClubVO> clubMap = new HashMap<String, ClubVO>();
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("start", 1);
				map.put("end", 1000);
				map.put("username", username);

				int MyClubcnt = dao.getMyClubCnt(username);

				if (MyClubcnt != 0) {
					MyClubVO vo = dao.getMyClubList(username);
					if (vo != null) {
						club1 = vo.getClub1();
						club2 = vo.getClub2();
						club3 = vo.getClub3();
					}
				}
				if (club1 == null)
					club1 = "0";
				if (club2 == null)
					club2 = "0";
				if (club3 == null)
					club3 = "0";

				map.put("club1", club1);
				map.put("club2", club2);
				map.put("club3", club3);

				List<ClubVO> list = dao.getClub_List(map);

				for (int i = 0; i < list.size(); i++) {
					System.out.println("allClub : " + list.get(i).getClub_name());
					clubMap.put("DATA" + i, list.get(i));
				}
				return clubMap;

			} else {
				return null;
			}
		}

		// 동호회 상세페이지
		@ResponseBody
		@RequestMapping("androidGetClubDetail")
		public Map<String, ClubVO> androidGetClubDetail(HttpServletRequest req) {
			logger.info("androidGetClubDetail");

			String club_name = req.getParameter("club_name");

			ClubVO vo = dao.getClub(club_name);

			Map<String, ClubVO> clubMap = new HashMap<String, ClubVO>();

			System.out.println(vo.getCurrent_personnel());
			clubMap.put("DATA", vo);

			return clubMap;
		}

		// 동호회 가입신청
		@ResponseBody
		@RequestMapping("androidClubApply")
		public Map<String, Integer> androidClubApply(HttpServletRequest req) {
			logger.info("androidClubApply");
			Map<String, Integer> applyMap = new HashMap<String, Integer>();

			String club_name = req.getParameter("club_name");
			String username = req.getParameter("username");
			int insertCnt = 0;
			int clubJoinCnt = dao.getJoinClubCnt(username);
			int selectCnt = 0;
			//applyCnt = dao.clubApplyCnt(club_name);
			Map<String, Object> map = new HashMap<>();
			map.put("username", username);
			map.put("club_name", club_name);

			if (clubJoinCnt == 0) {
				selectCnt = dao.clubWhether(map);
				if (selectCnt == 0) {
					insertCnt = dao.applyClub(map);
				} else {
					insertCnt = 0;
				}
			} else {
				insertCnt = 2;
			}

			applyMap.put("insertCnt", insertCnt);

			return applyMap;
		}

		// 동호회 - 가입한 동호회 회원목록
		@ResponseBody
		@RequestMapping("androidGetMemberList")
		public Map<String, UsersVO> androidGetMemberList(HttpServletRequest req) {
			logger.info("androidGetMemberList");

			String club_name = req.getParameter("club_name");
			String username = req.getParameter("username");

			System.out.println("username :: " + username);
			System.out.println("club_name ::" + club_name);
			int memberCnt = dao.getCurrentMember(club_name);

			Map<String, UsersVO> memberMap = new HashMap<>();
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("start", 1);
			map.put("end", 1000);
			map.put("club_name", club_name);

			if (memberCnt > 0) {
				List<UsersVO> list = dao.getMemberList(map);
				for (int i = 0; i < list.size(); i++) {
					memberMap.put("Member" + i, list.get(i));
				}
			}

			return memberMap;
		}

		// 동호회 - 회원탈퇴처리
		@ResponseBody
		@RequestMapping("androidDeleteMember")
		public Map<String, Integer> androidDeleteMember(HttpServletRequest req) {
			logger.info("androidDeleteMember");

			Map<String, Integer> map = new HashMap<>();

			String club_name = req.getParameter("club_name");	//클럽명
			String username = req.getParameter("member");		//탈퇴시키는 회원
			String memId = req.getParameter("username");		//세션아이디

			int deleteCnt = 0;
			
			String club_master = dao.getClubMaster(club_name);	//클럽장
			
			if (memId.equals(club_master)) {
				if (memId.equals(club_master) && memId.equals(username)) {
					// 탈퇴시키려는 회원이 동호회장일때
					deleteCnt = 3;
				} else {
					MyClubVO vo = dao.getMyClubList(username);
					String club1 = vo.getClub1();
					String club2 = vo.getClub2();
					String club3 = vo.getClub3();

					if (club1 != null) {
						if (club1.equals(club_name))
							deleteCnt = dao.removeClub1(username);
					}

					if (club2 != null) {
						if (club2.equals(club_name))
							deleteCnt = dao.removeClub2(username);
					}

					if (club3 != null) {
						if (club3.equals(club_name))
							deleteCnt = dao.removeClub3(username);
					}
					dao.minusMember(club_name);

				}
				map.put("deleteCnt", deleteCnt);
			} else {
				// 동호회장이 아닐때
				map.put("deleteCnt", 2);
			}

			return map;
		}

		// 동호회 - 회원탈퇴
		@ResponseBody
		@RequestMapping("androidExitMember")
		public Map<String, Integer> androidExitMember(HttpServletRequest req) {
			logger.info("androidExitMember");

			Map<String,Integer> map = new HashMap<>();
			
			String username = req.getParameter("username");
			String club_name = req.getParameter("club_name");
			
			int updateCnt = 0;
			
			String master = dao.getClubMaster(club_name);
			
			if(username.equals(master)) {
				Map<String,Object> mMap = new HashMap<>();
				mMap.put("club_name", club_name);
				mMap.put("club_master", master);
				
				dao.updateMaster(mMap);
			}
			
			MyClubVO vo = dao.getMyClubList(username);
			String club1 = vo.getClub1();
			String club2 = vo.getClub2();
			String club3 = vo.getClub3();

			if(club1 != null) {
				if(club1.equals(club_name))	updateCnt = dao.removeClub1(username);
			}
			
			if(club2 != null) {
				if(club2.equals(club_name))	updateCnt = dao.removeClub2(username);
			} 

			if(club3 != null) {
				if(club3.equals(club_name))	updateCnt = dao.removeClub3(username);
			}
			
			dao.minusMember(club_name);
			
			int curMember = dao.getCurrentMember(club_name);
			
			if(curMember == 0) {
				dao.deleteClub(club_name);
			}

			map.put("updateCnt", updateCnt);
			
			return map;
		}

		// 동호회 - 해당 동호회 가입신청목록
		@ResponseBody
		@RequestMapping("androidClubApplyList")
		public Map<String, UsersVO> androidClubApplyList(HttpServletRequest req) {
			logger.info("androidClubApplyList");

			String club_name = req.getParameter("club_name");
			
			Map<String,UsersVO> map = new HashMap<>();
			
			int applyCnt = dao.clubApplyCnt(club_name);
			Map<String, Object> a_map = new HashMap<String, Object>();

			a_map.put("start", 1);
			a_map.put("end", 1000);
			a_map.put("club_name", club_name);
			
			if(applyCnt > 0) {
				List<UsersVO> list = dao.getClubApply(a_map);
				
				for(int i = 0; i<list.size(); i++) {
					map.put("apply"+i, list.get(i));
				}
			} 
			
			return map;
		}
		
		// 동호회 - 가입신청목록 승인
		@ResponseBody
		@RequestMapping("androidAddMember")
		public Map<String, Integer> androidAddMember(HttpServletRequest req) {
			logger.info("androidAddMember");

			Map<String,Integer> map = new HashMap<String, Integer>();
			
			String club_name = req.getParameter("club_name");
			String username = req.getParameter("username");
			String apply_code = req.getParameter("apply_code");
			String memId = req.getParameter("memId");
			
			String club_master = dao.getClubMaster(club_name);
			
			int updateCnt = 0;
			
			// 동호회 최대인원수
			int max = dao.getMax(club_name);
			
			// 동호회 현재인원수
			int current = dao.getCurrent(club_name);
			
			if(club_master.equals(username)) {
				if(current < max) {
	 				String club1 = null;
					String club2 = null;
					String club3 = null;
					String name = null;
					
					Map<String,Object> map2 = new HashMap<>();
					map2.put("username",memId);
					map2.put("club_name", club_name);
					
					MyClubVO vo = dao.getMyClubList(memId);
					if(vo != null) {
						club1 = vo.getClub1();
						club2 = vo.getClub2();
						club3 = vo.getClub3();
						name = vo.getUsername();
					}
					
					// 이미 세개의 동호회에 가입했을때
					if(club1 != null && club2 != null && club3 != null) {
						updateCnt = 2;
						
					// 처음 동호회에 가입할때
					} else if(name == null){
						dao.plusMember(club_name);
						dao.addClub1(map2);
						updateCnt = dao.deleteApply(apply_code);
						
					// 처음이 아니지만 가입한 동호회가 없을때
					} else if(name != null && club1 == null) {
						dao.plusMember(club_name);
						dao.add_Club1(map2);
						updateCnt = dao.deleteApply(apply_code);
						
					// 두번째 동호회애 가입할때
					} else if(name != null && club1 != null && club2 == null) {
						dao.plusMember(club_name);
						dao.addClub2(map2);
						updateCnt = dao.deleteApply(apply_code);
						
					// 세번째 동호회에 가입할때
					} else if(name != null && club1 != null && club2 != null && club3 == null) {
						dao.plusMember(club_name);
						dao.addClub3(map2);
						updateCnt = dao.deleteApply(apply_code);
					} 
				} else {
					// 동호회에 인원이 최대일때
					updateCnt = 3;
				}
				map.put("updateCnt",updateCnt);
			} else {
				// 동호회장이 아닐때 0
				map.put("updateCnt", 0);
			}
			
			return map;
		}
		
		// 동호회 - 가입신청목록 거절
		@ResponseBody
		@RequestMapping("androidNoMember")
		public Map<String, Integer> androidNoMember(HttpServletRequest req) {
			logger.info("androidNoMember");

			Map<String,Integer> map = new HashMap<String, Integer>();
			
			String club_name = req.getParameter("club_name");
			String username = req.getParameter("username");
			String apply_code = req.getParameter("apply_code");
			String club_master = dao.getClubMaster(club_name);
			
			int deleteCnt = 0;
			
			if(club_master.equals(username)) {
				deleteCnt = dao.deleteApply(apply_code);
			}else {
				deleteCnt = 0;
			}
			
			map.put("deleteCnt", deleteCnt);
			return map;
		}
		
		// 동호회 - 동호회 게시판 목록
		@ResponseBody
		@RequestMapping("androidGetClubBoardList")
		public Map<String, ClubBoardVO> androidGetClubBoardList(HttpServletRequest req) {
			logger.info("androidGetClubBoardList");

			Map<String,ClubBoardVO> map = new HashMap<String, ClubBoardVO>();
			
			String club_name = req.getParameter("club_name");
					
			List<ClubBoardVO> list = dao.getClubBoardList(club_name);
			
			for(int i=0; i<list.size(); i++) {
				map.put("board"+i, list.get(i));
			}
			
			return map;
		}
		
		// 동호회 - 동호회 게시글 조회수 증가
		@ResponseBody
		@RequestMapping("androidPlusReadCnt")
		public Map<String, ClubBoardVO> androidPlusReadCnt(HttpServletRequest req) {
			logger.info("androidPlusReadCnt");

			String club_board_code = req.getParameter("club_board_code");
			
			dao.plusReadCnt(club_board_code);
			
			return null;
		}
		
		// 동호회 - 동호회 게시글 글쓰기
		@ResponseBody
		@RequestMapping("androidWriteClubBoard")
		public Map<String, Integer> androidWriteClubBoard(HttpServletRequest req) {
			logger.info("androidWriteClubBoard");
			Map<String, Integer> map = new HashMap<>();
			
			int insertCnt = 0;
			String username = req.getParameter("username");
			String club_name = req.getParameter("club_name");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
			ClubBoardVO vo = new ClubBoardVO();
			
			vo.setUsername(username);
			vo.setClub_name(club_name);
			vo.setTitle(title);
			vo.setContent(content);

			insertCnt = dao.insertClubBoard(vo);
			
			map.put("insertCnt", insertCnt);
			
			return map;
		}
//예찬파트 끝
  
// 한결시작
	// 게시판목록
	   @ResponseBody
	   @RequestMapping("androidBoardList")
	   public Map<String, BoardVO> androidBoardList(HttpServletRequest req) {
	      logger.info("androidBoardList");

	      // 게시글을 모두 조회
	      List<BoardVO> list = dao.getArticleList();
	      Map<String, BoardVO> map = new HashMap<String, BoardVO>();
	      for (int i = 0; i < list.size(); i++) {
	         //System.out.println(list.get(i).getTitle());
	         map.put("data" + i, list.get(i));
	      }
	      return map;
	   }

		   
		   
	//게시글 작성
	@ResponseBody
	@RequestMapping("androidBoardUpdate")
	public Map<String, String> androidBoardUpdate(HttpServletRequest req) {
		logger.info("androidBoardUpdate");
		
		String username = req.getParameter("id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		System.out.println("작성자 : " + username + ", 제목 : " + title);
		
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setUsername(username);                                                                  
		vo.setContent(content);
		
		String boardWriteCnt = String.valueOf(dao.boardWrite(vo));

		Map<String, String> up = new HashMap<String, String>();
		if(boardWriteCnt.equals("1")) {
			logger.info("게시글 등록 성공");
			up.put("boardWriteCnt", boardWriteCnt);
		} else {
			logger.info("게시글 등록 실패");
			up.put("boardWriteCnt", boardWriteCnt);
		}
		return up;
	}
	
	// 댓글목록
	   @ResponseBody
	   @RequestMapping("androidComment")
	   public Map<String, CommentVO> androidComment(HttpServletRequest req) {
	      logger.info("androidComment");

	      int board_code = Integer.parseInt(req.getParameter("boardCode"));
	      System.out.println(board_code);
	      
	      Map<String, Object> in = new HashMap<String, Object>();
	      in.put("board_code", board_code);

	      // 게시글을 모두 조회
	      List<CommentVO> list = dao.getCommentList(board_code);
	      
	      Map<String, CommentVO> map = new HashMap<String, CommentVO>();
	      for (int i = 0; i < list.size(); i++) {
	         System.out.println(list.get(i).getBoard_code());
	         map.put("data" + i, list.get(i));
	      }
	      
	      return map;
	   }
	   
	
	
	 //댓글 작성
	   @ResponseBody
	   @RequestMapping("androidCommentIN")
	   public Map<String, String> androidCommentIN(HttpServletRequest req) {
	      logger.info("androidCommentIN");
	      
	      int board_code = Integer.parseInt(req.getParameter("boardCode"));
	      String username = req.getParameter("username");
	      String content = req.getParameter("content");
	      System.out.println("작성자 : " + username);
	      
	      CommentVO vo = new CommentVO();
	      vo.setUsername(username);                                                                  
	      vo.setContent(content);
	      vo.setBoard_code(board_code);
	      
	      String commentInsert = String.valueOf(dao.commentWrite(vo));

	      Map<String, String> in = new HashMap<String, String>();
	      if(commentInsert.equals("1")) {
	         logger.info("댓글 등록 성공");
	         in.put("commentInsert", commentInsert);
	      } else {
	         logger.info("댓글 등록 실패");
	         in.put("commentInsert", commentInsert);
	      }
	      return in;
	   }

	
	//게시글 수정
	@ResponseBody
	@RequestMapping("androidBoardModify")
	public Map<String, String> androidBoardModify(HttpServletRequest req) {
		logger.info("androidBoardModify");
		
		String username = req.getParameter("id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		int board_code = Integer.parseInt(req.getParameter("boardCode"));
		System.out.println("작성자 : " + username + ", 제목 : " + title + ", 번호 : " + board_code);
		
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setUsername(username);                                                                  
		vo.setContent(content);
		vo.setBoard_code(board_code);
		
		String boardModiCnt = String.valueOf(dao.boardUpdate(vo));

		Map<String, String> up = new HashMap<String, String>();
		if(boardModiCnt.equals("1")) {
			logger.info("게시글 수정 성공");
			up.put("boardModiCnt", boardModiCnt);
		} else {
			logger.info("게시글 수정 실패");
			up.put("boardModiCnt", boardModiCnt);
		}
		return up;
	}
	
	
	//게시글 삭제
	@ResponseBody
	@RequestMapping("androidBoardDelete")
	public Map<String, String> androidBoardDelete(HttpServletRequest req) {
		logger.info("androidBoardDelete");

		int board_code = Integer.parseInt(req.getParameter("boardCode"));
		System.out.println("삭제 글번호 : " + board_code);
		
		String boardDelCnt = String.valueOf(dao.b_delete(board_code));
		
		System.out.println("삭제 : " + boardDelCnt);
		
		Map<String, String> up = new HashMap<String, String>();
		int comment_delete = 0;
		if(boardDelCnt.equals("1")) {
			comment_delete = dao.c_delete(board_code);
			logger.info("게시글 삭제 성공");
			up.put("boardDelCnt", boardDelCnt);
		} else {
			logger.info("게시글 삭제 실패");
			up.put("boardDelCnt", boardDelCnt);
		}
		return up;
	}
	
	//게시글 검색
	@ResponseBody
	@RequestMapping("androidBoardSearch")
	public Map<String, BoardVO> androidBoardSearch(HttpServletRequest req) {
		logger.info("androidBoardSearch");

		String query = req.getParameter("query");
		System.out.println("검색글 : " + query);
		
		List<BoardVO> list  = dao.boardSearch(query);
		
		Map<String, BoardVO> map = new HashMap<String, BoardVO>();
	      for (int i = 0; i < list.size(); i++) {
	         System.out.println(list.get(i).getTitle());
	         map.put("data" + i, list.get(i));
	      }
		
		return map;
	}
	
	//공지사항 목록
	@ResponseBody
	   @RequestMapping("androidNoticeList")
	   public Map<String, BoardVO> androidNoticeList(HttpServletRequest req) {
	      logger.info("androidNoticeList");

	      // 공지사항을 모두 조회
	      List<BoardVO> list = dao.getNoticeArticleList();
	      Map<String, BoardVO> map = new HashMap<String, BoardVO>();
	      for (int i = 0; i < list.size(); i++) {
	         System.out.println(list.get(i).getTitle());
	         map.put("data" + i, list.get(i));
	      }
	      return map;
	   }
	
// 한결끝
			
	
}
