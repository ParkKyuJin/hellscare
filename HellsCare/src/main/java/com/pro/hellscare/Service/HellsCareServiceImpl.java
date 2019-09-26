package com.pro.hellscare.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;


import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.pro.hellscare.VO.BoardQnaVO;
import com.pro.hellscare.VO.BoardVO;
import com.pro.hellscare.VO.ClubBoardVO;
import com.pro.hellscare.VO.ClubVO;
import com.pro.hellscare.VO.CommentVO;
import com.pro.hellscare.VO.DayWeather;
import com.pro.hellscare.VO.DiseaseVO;
import com.pro.hellscare.VO.ExerciseVO;
import com.pro.hellscare.VO.FoodVO;
import com.pro.hellscare.VO.KcalVO;
import com.pro.hellscare.VO.MyClubVO;
import com.pro.hellscare.VO.MychalleangeVO;
import com.pro.hellscare.VO.NewsVO;
import com.pro.hellscare.VO.NutritionCSV;
import com.pro.hellscare.VO.NutritionInfo;
import com.pro.hellscare.VO.UserDayKcalInfo;
import com.pro.hellscare.VO.UserInfoVO;
import com.pro.hellscare.VO.UsersVO;
import com.pro.hellscare.VO.WeatherVO;
import com.pro.hellscare.VO.WindInfo;
import com.pro.hellscare.VO.challengeVO;
import com.pro.hellscare.persistence.HellsCareDAO;

import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;



//서비스인터페이스 오버라이딩해서 사용할것.


@Service
public class HellsCareServiceImpl implements HellsCareService {
	
	//크롤링 전역변수 기사 리스트
	private static String NEWSURL = "http://health.chosun.com/list.html?";
	
	  private static String WEATHERURL = "https://search.naver.com/search.naver?sm=top_sly.hst&fbm=1&acr=1&ie=utf8&query=";
	@Autowired
	HellsCareDAO dao;
	
	
	//암호화한 비밀번호에 대해 로그인처리를 하거나 회원정보 변경, 탈퇴, 아이디 비밀번호 찾기 등등 구현할때 사용합니다. 
	//사용하지 않는다고 해서 주석처리 하지 않으셔도됩니다. 
	// 사용법
	// 화면에서 사용자가 입력한 비밀번호를 암호화하여 DB에 저장할 경우 : pass.encode(화면에서 받아온 암호값);
	// 로그인 등등 암호가 맞는지 확인 할 경우 : pass.matches(화면에서 사용자가입력한 암호, DB에 들어있는 암호화된 암호);
	@Autowired
	BCryptPasswordEncoder pass;
	
	//==나현 시작
	
	
			// 아이디 찾기 시 이름 & 이메일 체크
			@Override
			public void forgotidChk(HttpServletRequest req, Model model) {
				String name = req.getParameter("name"); 
				String email = req.getParameter("email"); 
				System.out.println("name :: "+name);
				System.out.println("email :: "+email);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("name", name);
				map.put("email", email);
				
				int chkCnt = dao.chkCnt(map);
				System.out.println(chkCnt);
				if(chkCnt == 1) {
					String username = dao.getUsername(map); 	
					model.addAttribute("username", username); 
					
					dao.sendmail(email, username);
				}else {
					model.addAttribute("username", null); 
				}
			
			}
			
			// 비밀번호 찾기 시 이메일로 비밀번호 보낸 후 비밀번호 암호화
			@Override
			public void forgotPwChk(HttpServletRequest req, Model model) {
				String username = req.getParameter("username"); 
				String email = req.getParameter("email"); 

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("email", email);
				map.put("username", username);
				
				int pChkCnt = dao.pChkCnt(map);
				if(pChkCnt == 1) {
					StringBuffer temp = new StringBuffer();
			        Random rnd = new Random();
			        
			        for(int i = 0; i < 6; i++) {
			            int rIndex = rnd.nextInt(2);
			            switch(rIndex) {
			            case 0:
			                // A-Z
			                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
			                break;
			            case 1:
			                // 0-9
			                temp.append((rnd.nextInt(10)));
			                break;
			            }
			        }
			        
			        String rdpw = temp.toString();
			        System.out.println("rdpw :: "+rdpw);
			        
			        String enPw = pass.encode(rdpw); 
			        Map<String, String> map2 = new HashMap<String, String>();
					map2.put("username", username);
					map2.put("rdpw", enPw);
					
					dao.updatePw(map2); 
					dao.sendmail2(email, rdpw);
					
					
					
					model.addAttribute("cnt", 1); 
				}else {
					model.addAttribute("cnt", 0); 
				}
			
			}
			
			//회원가입 시 아이디 중복확인 처리
			@Override
			public void confirmId(HttpServletRequest req, Model model) {
				//3단계. commonSignUp.jsp에서 입력받은 ID값 받아오기 
				String strId = req.getParameter("username");
				System.out.println("username : " + strId);

				//4단계. 다형성 적용, 싱글톤 방식으로 dao 객체 생성
			
				//5단계 중복된 id가 있는지 확인 
				int cnt = dao.idCheck(strId);
				System.out.println("아이디 중복확인 cnt" + cnt);
				
				//6단계 request나 session에 처리결과를 저장(jsp에 전달하기 위함) 
				model.addAttribute("selectCnt", cnt);
				model.addAttribute("username", strId);
				System.out.println("중복확인cnt:" + cnt);
				System.out.println("strId=> username:" + strId);
			}
			
			@Override
			public void regPro(HttpServletRequest req, Model model) {

				String username = req.getParameter("username");
				String password = req.getParameter("password");
				String name = req.getParameter("name");
				
				String address1 = req.getParameter("address_1");
				String address2 = req.getParameter("address_2");
				String address3 = req.getParameter("address_3");
				String address = address1+address2+address3;
				
				
				String phone_number = req.getParameter("phone_number");
				String gender = req.getParameter("gender");
				String birth = req.getParameter("birth");
				String email = req.getParameter("email");
				String authority = req.getParameter("authority");
				System.out.println("gender: " +gender);
				//map으로 매개변수에 써준 정보를 다 전달하자  BUT 비밀번호는 암호화한 후 전달 
				Map<String, String> map = new HashMap<String, String>(); 
				map.put("username",username); 
				System.out.println("암호화 전의 비밀번호:" + password);
				
				// 비밀번호 암호화 
				String encryptPassword = pass.encode(password); 
				System.out.println("암호화 후의 비밀번호:" + encryptPassword);
			
				map.put("password",encryptPassword); 
				map.put("name",name); 
				map.put("address",address); 
				map.put("phone_number",phone_number); 
				map.put("gender",gender); 
				map.put("birth",birth); 
				map.put("email",email); 
				map.put("authority",authority); 
				
				System.out.println("authority ==> " + authority);
				System.out.println(map);
				int cnt = dao.regUser(map);
				System.out.println("cnt ==>" + cnt);
			}
			
			
		
		// 마이페이지 회원정보 수정시 비밀번호 체크
		@Override
		public int pwCheckCnt(Map<String,Object> map) {
			String username = (String)map.get("username");
			String pwdDB = dao.returnPassword(username);
			if(pass.matches((String)map.get("password"), pwdDB)) {
				map.put("pwdDB", pwdDB);
				return dao.pwCheckCnt(map);
			} else {
				return 0;
			}
		}
		
		//회원정보 수정폼
		@Override
		public void userModiView(HttpServletRequest req, Model model) {
			String username = (String)req.getSession().getAttribute("memId"); 
			UsersVO vo = dao.userModiView(username);
			
			model.addAttribute("vo",vo);
		}

		//회원정보 수정처리
		@Override
		public void modifyPro(HttpServletRequest req, Model model) {
			String username = (String) req.getSession().getAttribute("memId");
			String password = req.getParameter("scrit");
			String name = req.getParameter("name");
			String address = req.getParameter("address");
			String phone_number = req.getParameter("phone_number");
			String encryptPassword = pass.encode(password);
			
			UsersVO vo = new UsersVO();
			vo.setUsername(username);
			vo.setPassword(encryptPassword);
			vo.setName(name);
			vo.setAddress(address);
			vo.setPhone_number(phone_number);
			
			int updateCnt = dao.userModifyPro(vo);
			
			model.addAttribute("updateCnt",updateCnt);
		}
		
		// 회원탈퇴처리
		@Override
		public void delMember(HttpServletRequest req, Model model) {
			String username = req.getParameter("username");
			int deleteCnt = dao.deleteMember(username);
			
			req.getSession().removeAttribute("memId");
			model.addAttribute("deleteCnt",deleteCnt);
		}
		
		
	//== 이나현 끝
	
		// =========== 동렬 서비스 시작
				// 동네 날씨 정보 크롤링
				@Override
				public void crawlDongWeather(HttpServletRequest req, Model model) throws IOException {
					
					WeatherVO weather = new WeatherVO();
						
					String city = req.getParameter("dong");
					weather.setCity(city);
						
					// 동 이름만 골라내기
					String[] dongSplit = city.split(" ");
						
					// 동 이름
					String dong = dongSplit[dongSplit.length -1];
					weather.setDong(dong);
					
					// 크롤링 시작
					Document weatherPage = Jsoup.connect(WEATHERURL + dong + "날씨").get();
					
					// 기온(현재, 내일 오전/오후, 모레 오전/오후)
					Elements temperatures = weatherPage.select(".cs_weather .main_info .info_temperature .todaytemp");
					
					for (int i = 0; i < temperatures.size(); i++) {
						switch (i) {
							case 0:			// 현재 기온
								String presentTemp = temperatures.get(i).text();
								weather.setPresentTemp(presentTemp);
								break;
							case 1:			// 내일 오전 기온
								String tomorrowAMTemp = temperatures.get(i).text();
								weather.setTomorrowAMTemp(tomorrowAMTemp);
								break;
							case 2:			// 내일 오후 기온
								String tomorrowPMTemp = temperatures.get(i).text();
								weather.setTomorrowPMTemp(tomorrowPMTemp);
								break;
							case 3:			// 모레 오전 기온
								String theDayAfterTomorrowAMTemp = temperatures.get(i).text();
								weather.setTheDayAfterTomorrowAMTemp(theDayAfterTomorrowAMTemp);
								break;
							case 4:			// 모레 오후 기온
								String theDayAfterTomorrowPMTemp = temperatures.get(i).text();
								weather.setTheDayAfterTomorrowPMTemp(theDayAfterTomorrowPMTemp);
								break;
						}
					}
						
					// 오늘 최저 기온
					String minimumTemp = weatherPage.select(".cs_weather .main_info .info_data .info_list li .min").text();
					weather.setMinimumTemp(minimumTemp);
					
					// 오늘 최고 기온
					String maximumTemp = weatherPage.select(".cs_weather .main_info .info_data .info_list li .max").text();
					weather.setMaximumTemp(maximumTemp);
					
					// 오늘 체감 온도
					String sensibleTemp = weatherPage.select(".cs_weather .main_info .info_data .info_list li .sensible em").text();
					weather.setSensibleTemp(sensibleTemp);
					
					// 상세 날씨 설명	
					Elements weatherDescriptions = weatherPage.select(".cs_weather .main_info .info_data .info_list li .cast_txt");
					
					String nowWeather = "";
					for (int i = 0; i < weatherDescriptions.size(); i++) {
						switch (i) {
							case 0:			// 현재 날씨 설명
								String presentWeather = weatherDescriptions.get(i).text();
								String[] nowWeathers = presentWeather.split(",");
								nowWeather = nowWeathers[0];
								weather.setNowWeather(nowWeather);
								weather.setPresentWeather(presentWeather);
								break;
							case 1:			// 내일 오전 날씨 설명
								String tomorrowAMWeather = weatherDescriptions.get(i).text();
								weather.setTomorrowAMWeather(tomorrowAMWeather);
								break;
							case 2:			// 내일 오후 날씨 설명
								String tomorrowPMWeather = weatherDescriptions.get(i).text();
								weather.setTomorrowPMWeather(tomorrowPMWeather);
								break;
							case 3:			// 모레 오전 날씨 설명
								String theDayAfterTomorrowAMWeather = weatherDescriptions.get(i).text();
								weather.setTheDayAfterTomorrowAMWeather(theDayAfterTomorrowAMWeather);
								break;
							case 4:			// 모레 오후 날씨 설명
								String theDayAfterTomorrowPMWeather = weatherDescriptions.get(i).text();
								weather.setTheDayAfterTomorrowPMWeather(theDayAfterTomorrowPMWeather);
								break;
						}
					}
						
					// 오늘 미세먼지, 초미세먼지, 오존지수
					Elements dusts = weatherPage.select(".cs_weather .sub_info .detail_box dl dd .num");
					
					for (int i = 0; i < dusts.size(); i++) {
						String[] getDustValue;
						switch (i) {
						
							// 오늘자 미세먼지
							case 0 :
								getDustValue = dusts.get(i).text().split("㎍/㎥");
								int microdust = Integer.parseInt(getDustValue[0]);
								weather.setMicrodust(microdust);
								break;
								
							// 오늘자 초미세먼지
							case 1 :
								getDustValue = dusts.get(i).text().split("㎍/㎥");
								int superMicrodust = Integer.parseInt(getDustValue[0]);
								weather.setSuperMicrodust(superMicrodust);
								break;
								
							// 오늘자 오존지수
							case 2 :
								getDustValue = dusts.get(i).text().split("ppm");
								double ozon = Double.parseDouble(getDustValue[0]);
								weather.setOzon(ozon);
								break;
						}
					}
						
					// 내일과 모레 미세먼지
					Elements dustAfterToday = weatherPage.select(".detail_box .indicator span");
					
					List<String> dustInfoAfterToday = new ArrayList<>();
					
					// 내일과 모레 오전,오후 미세먼지 필터링
					for(Element tomorrowDust : dustAfterToday) {
						if(tomorrowDust.text().contains("나쁨") ||
								tomorrowDust.text().contains("보통") ||
								tomorrowDust.text().contains("좋음")) {
							dustInfoAfterToday.add(tomorrowDust.text());
						}
					}
						
					for (int i = 0; i < dustInfoAfterToday.size(); i++) {
						switch (i) {
							// 내일 오전 미세먼지
							case 0:
								weather.setTomorrowAMMicrodust(dustInfoAfterToday.get(i));
								break;
							
							// 내일 오후 미세먼지
							case 1:
								weather.setTomorrowPMMicrodust(dustInfoAfterToday.get(i));
								break;
								
							// 모레 오전 미세먼지
							case 2:
								weather.setDayAfterTomorrowAMMicrodust(dustInfoAfterToday.get(i));
								break;
							
							// 모레 오후 미세먼지
							case 3:
								weather.setDayAfterTomorrowPMMicrodust(dustInfoAfterToday.get(i));
								break;
						}
					}
						
					// 내일, 시, 공백, 맞지 않는 숫자 갯수 맞추기
					Elements timesElements = weatherPage.select(".cs_weather .table_info .list_area .item_time span");
					
					String blank = "";
						
					// 내일 제거
					for (int i = 0; i < timesElements.size(); i++) {
						if(!timesElements.get(i).text().equals("") && !timesElements.get(i).text().equals("내일")) {
							blank += timesElements.get(i).text();
						}
					}
						
					// 시 제거
					String[] timeAfterArrange = blank.split("시");
						
					// 시간대(오늘, 내일, 모레)
					List<Integer> times = new ArrayList<>();
					
					for (int i = 0; i < timeAfterArrange.length; i++) {
						times.add(Integer.parseInt(timeAfterArrange[i]));
					}
						
					// 중복되는 시간대 제거 시작
					try {
						for (int i = 0; i < times.size(); i++) {
							if(times.get(i) == times.get(i+1)
									&& times.get(i) != 0) {
								times.remove(i);
							}
						}
					} catch (IndexOutOfBoundsException e) {}
						
					try {
						for (int i = 0; i < times.size(); i++) {
							if(times.get(i) == times.get(i+1)
									&& times.get(i) != 0) {
								times.remove(i);
							}
						}
					} catch (IndexOutOfBoundsException e) {}
					// 중복되는 시간대 제거 종료
						
					// 데이터 필터링 작업
					String timeToTemp = weatherPage.select(".cs_weather .table_info .list_area .weather_item>span").text();
					
					// 1. "도"를 걸러낸다. 
					String[] doCount = timeToTemp.split("도");
					
					// 2. 문자열들을 이어붙인다.
					String temp1 = "";
					for (int i = 0; i < doCount.length; i++) {
						temp1 += doCount[i];
					}
						
					// 3. " "을 제거한다.
					String[] splitWeatherInfo = temp1.split("  ");
					
					// 4. trim을 이용해 남은 " "를 제거한다.
					for (int i = 0; i < splitWeatherInfo.length; i++) {
						splitWeatherInfo[i] = splitWeatherInfo[i].trim();
					}
						
					// 날씨 정보를 가져온다.
					Elements weathers = weatherPage.select(".list_area .item_condition span");
					
					List<String> weatherList = new ArrayList<>();
						
					for (int i = 0; i < weathers.size(); i++) {
						if(weathers.get(i).text().contains("맑음") ||
							weathers.get(i).text().contains("구름") ||
							weathers.get(i).text().contains("흐림") ||
							weathers.get(i).text().contains("비") ||
							weathers.get(i).text().contains("눈")) {
							weatherList.add(weathers.get(i).text());
						}
					}
						
					// 오늘 시간대의 기온, 날씨, 강수확률, 바람, 습도
					List<String> todayTime = new ArrayList<>();
					List<Integer> todayTimes = new ArrayList<>();					// 오늘의 시간대
					List<Integer> todayTemperature = new ArrayList<>();				// 오늘 시간대의 기온
					List<String> todayWeather = new ArrayList<>();					// 오늘 시간대의 날씨
					List<Integer> todayPrecipitation = new ArrayList<>();			// 오늘 시간대의 강수확률
					List<WindInfo> todayWind = new ArrayList<>();					// 오늘 시간대의 바람
					List<Integer> todayHumidity = new ArrayList<>();				// 오늘 시간대의 습도
					
					// 내일 시간대의 기온, 날씨, 강수확률, 바람, 습도
					List<Integer> tomorrowTimes = new ArrayList<>();				// 내일의 시간대
					List<Integer> tomorrowTemperature = new ArrayList<>();			// 내일 시간대의 기온
					List<String> tomorrowWeather = new ArrayList<>();				// 내일 시간대의 날씨
					List<Integer> tomorrowPrecipitation = new ArrayList<>();		// 내일 시간대의 강수확률
					List<WindInfo> tomorrowWind = new ArrayList<>();				// 내일 시간대의 바람
					List<Integer> tomorrowHumidity = new ArrayList<>();				// 내일 시간대의 습도
						
					// 모레 시간대의 기온, 날씨, 강수확률, 바람, 습도
					List<Integer> dayAfterTomorrowTimes = new ArrayList<>();		// 모레의 시간대
					List<Integer> dayAfterTomorrowTemperature = new ArrayList<>();	// 모레 시간대의 기온
					List<String> dayAfterTomorrowWeather = new ArrayList<>();		// 모레 시간대의 날씨
					List<Integer> dayAfterTomorrowPrecipitation = new ArrayList<>();// 모레 시간대의 강수확률
					List<WindInfo> dayAfterTomorrowWind = new ArrayList<>();		// 모레 시간대의 바람
					List<Integer> dayAfterTomorrowHumidity = new ArrayList<>();		// 모레 시간대의 습도
						
					// 풍향 정보 시작
					Elements windDirections = weatherPage.select(".cs_weather .wt_status span");
					
					List<String> windDirectionList = new ArrayList<>();
					
					for(Element wind : windDirections) {
						if(!wind.text().equals("")) {
							windDirectionList.add(wind.text());
						}
					}
					// 풍향 정보 필터링 끝
					
					// 오늘 날씨 시간대에 따른 정확한 값을 받기 
					Date today_time = new Date();
					SimpleDateFormat formatTypeTemp = new SimpleDateFormat("YYMMddHH");
					
					String today_time_trans = (String)formatTypeTemp.format(today_time);
					
					int transTime = Integer.parseInt(today_time_trans);
					
					transTime /= 100;
					transTime *= 100;
					
					// 시간대에 따른 날씨정보
					for (int i = 0; i < times.size(); i++) {
						int temperature, precipitation, windSpeed, humidity;
						String direction, weatherDescription;
						
						// 0 ~ 31 : 오늘 날씨 정보
						if(i >=0 && i <= 31) {
							// 내일 시간대라면
//							if(times.get(i) < times.get(0)) {
//								todayTimes.add(times.get(i) + transTime + 100);	// 시간 대입
//							} else {
//								todayTimes.add(times.get(i) + transTime);	// 시간 대입
//							}
							
							todayTimes.add(times.get(i));	// 시간 대입
							
							switch (i/8) {
								// 0 : 기온, 날씨
								case 0:
									temperature = Integer.parseInt(splitWeatherInfo[i]);
									weatherDescription = weatherList.get(i);
									
									todayTemperature.add(temperature);
									todayWeather.add(weatherDescription);
									break;
										
								// 1 : 강수
								case 1:
									precipitation = Integer.parseInt(splitWeatherInfo[i]);
									
									todayPrecipitation.add(precipitation);
									break;
									
								// 2 : 풍향, 풍속
								case 2:
									WindInfo windInfo = new WindInfo();
									direction = windDirectionList.get(i%8);
									windSpeed = Integer.parseInt(splitWeatherInfo[i]);
									
									windInfo.setDirection(direction);
									windInfo.setWindSpeed(windSpeed);
									
									todayWind.add(windInfo);
									break;
									
								// 3 : 습도
								case 3:
									humidity = Integer.parseInt(splitWeatherInfo[i]);
									
									todayHumidity.add(humidity);
									break;
							}	// switch
						}		// end if
							
						// 32 ~ 63 : 내일 날씨 정보
						else if(i >= 32 && i <= 63) {
							
							tomorrowTimes.add(times.get(i));
							
							switch (i/8) {
								// 4 : 기온, 날씨
								case 4:
									temperature  = Integer.parseInt(splitWeatherInfo[i]);
									weatherDescription = weatherList.get(i%8 + 8);
									
									tomorrowTemperature.add(temperature);
									tomorrowWeather.add(weatherDescription);
									break;
									
								// 5 : 강수
								case 5:
									precipitation = Integer.parseInt(splitWeatherInfo[i]);
									
									tomorrowPrecipitation.add(precipitation);
									break;
									
								// 6 : 풍향, 풍속
								case 6:
									WindInfo windInfo = new WindInfo();
									direction = windDirectionList.get(i%8 + 8);
									windSpeed = Integer.parseInt(splitWeatherInfo[i]);
									
									windInfo.setDirection(direction);
									windInfo.setWindSpeed(windSpeed);
									
									tomorrowWind.add(windInfo);
									break;
									
								// 7 : 습도
								case 7:
									humidity = Integer.parseInt(splitWeatherInfo[i]);
									
									tomorrowHumidity.add(humidity);
									break;
							}	// end switch
						}		// end else if
						
						// 64 ~ 95 : 모레 날씨 정보
						else {
							
							// 자정에 실행 시 모레 시간대별 날씨 정보가 누락됨. 크롤링 되지 않아서 막아버림
							if(times.size() >= 77) {
								dayAfterTomorrowTimes.add(times.get(i));
								
								switch (i/8) {
									// 8 : 기온, 날씨 
									case 8:
										temperature  = Integer.parseInt(splitWeatherInfo[i]);
										weatherDescription = weatherList.get(i%8 + 16);
										
										dayAfterTomorrowTemperature.add(temperature);
										dayAfterTomorrowWeather.add(weatherDescription);
										break;
										
									// 9 : 강수
									case 9:
										precipitation = Integer.parseInt(splitWeatherInfo[i]);
										
										dayAfterTomorrowPrecipitation.add(precipitation);
										break;
										
									// 10 : 풍향, 풍속
									case 10:
										WindInfo windInfo = new WindInfo();
										direction = windDirectionList.get(i%8 + 16);
										windSpeed = Integer.parseInt(splitWeatherInfo[i]);
										
										windInfo.setDirection(direction);
										windInfo.setWindSpeed(windSpeed);
										
										dayAfterTomorrowWind.add(windInfo);
										break;
									
									// 11 : 습도
									case 11:
										humidity = Integer.parseInt(splitWeatherInfo[i]);
									
										dayAfterTomorrowHumidity.add(humidity);
										break;
								}	//  end switch
							}	// if times.size() >= 66
							
						}	// end else
					}	// end for
					
					// 오늘 시간대 정보 저장
					weather.setTodayTimes(todayTimes);
					weather.setTodayTemperature(todayTemperature);
					weather.setTodayWeather(todayWeather);
					weather.setTodayPrecipitation(todayPrecipitation);
					weather.setTodayWind(todayWind);
					weather.setTodayHumidity(todayHumidity);
					
					// 내일 시간대 정보 저장
					weather.setTomorrowTimes(tomorrowTimes);
					weather.setTomorrowTemperature(tomorrowTemperature);		
					weather.setTomorrowWeather(tomorrowWeather);
					weather.setTomorrowPrecipitation(tomorrowPrecipitation);
					weather.setTomorrowWind(tomorrowWind);
					weather.setTomorrowHumidity(tomorrowHumidity);
						
					// 모레 시간대 정보 저장
					weather.setDayAfterTomorrowTimes(dayAfterTomorrowTimes);
					weather.setDayAfterTomorrowTemperature(dayAfterTomorrowTemperature);
					weather.setDayAfterTomorrowWeather(dayAfterTomorrowWeather);
					weather.setDayAfterTomorrowPrecipitation(dayAfterTomorrowPrecipitation);
					weather.setDayAfterTomorrowWind(dayAfterTomorrowWind);
					weather.setDayAfterTomorrowHumidity(dayAfterTomorrowHumidity);
					
					// 주간 날씨 정보
					Elements daysList = weatherPage.select(".cs_weather .table_info.weekly .list_area li .day_info span");
					
					// 주간 날씨 정보 날짜 리스트
					List<String> dayList = new ArrayList<>();
					
					for(Element day : daysList) {
						dayList.add(day.text());
					}
						
					// 날짜 중복 제거
					try {
						for (int i = 0; i < dayList.size(); i++) {
							if(dayList.get(i).equals(dayList.get(i+1)) ) {
								dayList.remove(i);
							}
						}
					} catch (IndexOutOfBoundsException e) {}
						
					List<String> dayList2 = new ArrayList<>();

					// 오늘, 내일, 모레 => 날짜로 변환, 그외 날짜들은 앞에 "0"추가.
					// 필터링 된 데이터들은 dayList2로 대입
					for (int i = 0; i < dayList.size(); i++) {
						String getDate = "";
							
						if(dayList.get(i).contains("오늘")) {
							Date today = new Date();
							SimpleDateFormat formatType = new SimpleDateFormat("MM.dd.");
							
							getDate = (String)formatType.format(today);
						} else if(dayList.get(i).contains("내일")) {
							Calendar cal = new GregorianCalendar();
							cal.add(Calendar.DATE, 1);
							
							Date tomorrow = cal.getTime();
							SimpleDateFormat formatType = new SimpleDateFormat("MM.dd.");
							
							getDate = (String)(formatType.format(tomorrow));
						} else if(dayList.get(i).contains("모레")) {
							Calendar cal = new GregorianCalendar();
							cal.add(Calendar.DATE, 2);
							
							Date theDayAfterTomorrow = cal.getTime();
							SimpleDateFormat formatType = new SimpleDateFormat("MM.dd.");
							
							getDate = (String)(formatType.format(theDayAfterTomorrow));
						} else {
							getDate = "0" + dayList.get(i);
						}
						
						dayList2.add(getDate);
					}
						
					// 주간 날씨 정보 오전 강수 확률
					Elements morningRainRates = weatherPage.select(".cs_weather .table_info.weekly .list_area li .morning .rain_rate .num");
					
					List<Integer> morningRainRateList = new ArrayList<>();
					
					for(Element morningRainRate : morningRainRates) {
						int morningRain = Integer.parseInt(morningRainRate.text());
						morningRainRateList.add(morningRain);
					}
						
					// 주간 날씨 정보 오후 강수 확률
					Elements afternoonRainRates = weatherPage.select(".cs_weather .table_info.weekly .list_area li .afternoon .rain_rate .num");
					
					List<Integer> afternoonRainRateList = new ArrayList<>();
					
					for(Element afternoonRainRate : afternoonRainRates) {
						int afternoonRain = Integer.parseInt(afternoonRainRate.text());
						afternoonRainRateList.add(afternoonRain);
					}
						
					// 주간 날씨 정보 오전 오후 기온
					Elements dayMaxMinTemp = weatherPage.select(".cs_weather .table_info.weekly .list_area li dd span");
					
					List<Integer> dayTempFilter = new ArrayList<>();
					
					for(Element dayTemp : dayMaxMinTemp) {
						if(!dayTemp.text().equals("/")) {
							dayTempFilter.add(Integer.parseInt(dayTemp.text().trim()));
						}
					}
						
					// 요일별 오전, 오후 기온
					List<Integer> dayMorningTemps = new ArrayList<>();
					List<Integer> dayAfternoonTemps = new ArrayList<>();
						
					for (int i = 0; i < dayTempFilter.size(); i++) {
						if(i % 2 == 0) {
							dayMorningTemps.add(dayTempFilter.get(i));
						} else if(i % 2 == 1) {
							dayAfternoonTemps.add(dayTempFilter.get(i));
						}
					}
						
					// 주간 날씨 정보 통합
					List<DayWeather> dayWeatherList = new ArrayList<>();
					
					for (int i = 0; i < morningRainRateList.size(); i++) {
						DayWeather dayWeather = new DayWeather();
						
						String day = dayList2.get(i);
						int morningRain = morningRainRateList.get(i);
						int afternoonRain = afternoonRainRateList.get(i);
						int maxTemp = dayMorningTemps.get(i);
						int minTemp = dayAfternoonTemps.get(i);
						
						dayWeather.setDay(day);
						dayWeather.setMorningRainRate(morningRain);
						dayWeather.setAfternoonRainRate(afternoonRain);
						dayWeather.setMaxTemperature(maxTemp);
						dayWeather.setMinTemperature(minTemp);
						
						dayWeatherList.add(dayWeather);
					}
						
					weather.setDayWeather(dayWeatherList);
						
					Elements raindrops = weatherPage.select(".cs_weather .main_info .info_data .info_list li .rainfall");
						
					String[] raindropArr = raindrops.text().split(" ");
					
					String check = raindropArr[0].trim();
					
					weather.setCheckWeather(check);
					
					// 흐릴 때는 시간별 강수량
					if(check.contains("")) {
						String ultraVioletRay = weatherPage.select(".cs_weather .main_info .info_data .info_list li .indicator span .num").text();
						weather.setUltraVioletRay(Integer.parseInt(ultraVioletRay.trim()));
					} else {
						String rainfallOnHour = weatherPage.select(".cs_weather .main_info .info_data .info_list li .rainfall em span").text();
						weather.setRainfallOnHour(Double.parseDouble(rainfallOnHour));
					}
						
					model.addAttribute("weather", weather);
				}
						
				// 관리자 - 음식 등록
				@Override
				public void registerFood(MultipartHttpServletRequest req, Model model) {
					String food_name = req.getParameter("food_name");
					
					int quantity = Integer.parseInt(req.getParameter("quantity"));
					int food_kind = Integer.parseInt(req.getParameter("food_kind"));
					int kcal = Integer.parseInt(req.getParameter("kcal"));
					int carbohydrate = Integer.parseInt(req.getParameter("carbohydrate"));
					int protein = Integer.parseInt(req.getParameter("protein"));
					int fat = Integer.parseInt(req.getParameter("fat"));
					int saccharides = Integer.parseInt(req.getParameter("saccharides"));
					int salt = Integer.parseInt(req.getParameter("salt"));
					int cholesterol = Integer.parseInt(req.getParameter("cholesterol"));
					int saturation = Integer.parseInt(req.getParameter("saturation"));
					int trans = Integer.parseInt(req.getParameter("trans"));
					
					MultipartFile file = req.getFile("food_img");

					@SuppressWarnings("deprecation")
					String saveDir = req.getRealPath("/resources/images/food/");

					String realDir = "C:\\Dev50\\workspace_spring\\HellsCare\\src\\main\\webapp\\resources\\images\\food\\";

					try {
						file.transferTo(new File(saveDir + file.getOriginalFilename()));

						FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
						FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

						int data = 0;
						// 논리적인 경로에 저장된 임시 파일을 물리적인 경로로 복사함
						while ((data = fis.read()) != -1) {
							fos.write(data);
						}
						fis.close();
						fos.close();

						String food_img = file.getOriginalFilename(); // 음식이미지
						
						FoodVO food = new FoodVO();
						
						food.setFood_name(food_name);
						food.setFood_img(food_img);
						food.setQuantity(quantity);
						food.setFood_kind(food_kind);
						food.setKcal(kcal);
						food.setCarbohydrate(carbohydrate);
						food.setProtein(protein);
						food.setFat(fat);
						food.setSaccharides(saccharides);
						food.setSalt(salt);
						food.setCholesterol(cholesterol);
						food.setSaturation(saturation);
						food.setTrans(trans);
						
						int insertCnt = 0;

						insertCnt = dao.insertFood(food);

						model.addAttribute("insertCnt", insertCnt);

					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}
				
				// 관리자 - 음식 목록
				@Override
				public void foodList(HttpServletRequest req, Model model) {
					int pageSize = 10;			// 한 페이지당 출력할 글 개수
					int pageBlock = 5;			// 한 블럭당 페이지 개수
					
					int cnt = 0; 				// 글의 개수
					int start = 0;				// 현재 페이지 시작 글번호
					int end = 0;				// 현재 페이지 마지막 글번호
					int number = 0;				// 출력용 글번호
					String pageNum = "";		// 페이지 번호
					int currentPage = 0;		// 현재 페이지
					
					int pageCount = 0;			// 페이지 개수
					int startPage = 0;			// 시작 페이지
					int endPage = 0;			// 마지막 페이지
					
					// 5-1. 음식 수 구하기
					cnt = dao.getFoodCount();
					
					System.out.println("Food count : " + cnt); 
					
					pageNum = req.getParameter("pageNum");
					
					if(pageNum == null) {
						pageNum = "1";			// 첫 페이지를 1 페이지로 지정
					}
					
					currentPage = Integer.parseInt(pageNum); 		// 현재 페이지 : 1
					System.out.println("currentPage : " + currentPage);
					
					// 6 페이지 + 한건이 남으면 7페이지까지 만들어서 하나를 넣어준다.
					pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
					
					// 현재 페이지 시작 글 번호(페이지별)
					start = (currentPage - 1) * pageSize + 1;
					
					// 현재 페이지 마지막 글 번호(페이지별)
					end = start + pageSize -1;
					
					System.out.println("start : " + start);
					System.out.println("end : " + end);
					
					if (end > cnt)
						end = cnt;

					// 출력용 글번호
					number = cnt - (currentPage - 1) * pageSize;

					System.out.println("number : " + number);
					System.out.println("pageSize : " + pageSize);

					Map<String, Integer> map = new HashMap<String, Integer>();

					map.put("start", start);
					map.put("end", end);
					
					if (cnt > 0) {
						// 5-2단계. 게시글 목록조회
						List<FoodVO> foodList = dao.getFoodList(map);
						model.addAttribute("foodList", foodList); // 큰바구니 : 게시글 목록 , 작은 바구니 : 게시글 1건
					}
					
					// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기위함)
					// 시작페이지
					startPage = (currentPage / pageBlock) * pageBlock + 1;

					if (currentPage % pageBlock == 0)
						startPage -= pageBlock;
					System.out.println("startPage : " + startPage);

					// 마지막 페이지
					endPage = startPage + pageBlock - 1;

					if (endPage > pageCount)
						endPage = pageCount;
					System.out.println("endPage : " + endPage);

					System.out.println("=====================");
					
					model.addAttribute("cnt", cnt); // 글 개수
					model.addAttribute("number", number); // 출력용 글번호
					model.addAttribute("pageNum", pageNum); // 페이지번호
					
					if (cnt > 0) {
						model.addAttribute("startPage", startPage); // 시작 페이지
						model.addAttribute("endPage", endPage); // 마지막 페이지
						model.addAttribute("pageBlock", pageBlock); // 출력할 페이지개수
						model.addAttribute("pageCount", pageCount); // 페이지 개수
						model.addAttribute("currentPage", currentPage); // 현재페이지
					}
				}
				
				// 관리자 - 음식 정보 상세
				@Override
				public void foodDetail(HttpServletRequest req, Model model) {
					String food_code = req.getParameter("food_code");
					int pageNum = Integer.parseInt(req.getParameter("pageNum"));
					
					FoodVO food = dao.getFoodInfo(food_code);
					
					model.addAttribute("pageNum", pageNum);
					model.addAttribute("food", food);
				}
				
				// 관리자 - 음식 수정 처리
				@Override
				public void foodModifyPro(MultipartHttpServletRequest req, Model model) {
					String food_code = req.getParameter("food_code");
					String food_name = req.getParameter("food_name");
					int pageNum = Integer.parseInt(req.getParameter("pageNum"));
					
					int quantity = Integer.parseInt(req.getParameter("quantity"));
					int food_kind = Integer.parseInt(req.getParameter("food_kind"));
					int kcal = Integer.parseInt(req.getParameter("kcal"));
					int carbohydrate = Integer.parseInt(req.getParameter("carbohydrate"));
					int protein = Integer.parseInt(req.getParameter("protein"));
					int fat = Integer.parseInt(req.getParameter("fat"));
					int saccharides = Integer.parseInt(req.getParameter("saccharides"));
					int salt = Integer.parseInt(req.getParameter("salt"));
					int cholesterol = Integer.parseInt(req.getParameter("cholesterol"));
					int saturation = Integer.parseInt(req.getParameter("saturation"));
					int trans = Integer.parseInt(req.getParameter("trans"));
					
					MultipartFile file = req.getFile("food_img");

					@SuppressWarnings("deprecation")
					String saveDir = req.getRealPath("/resources/images/food/");

					String realDir = "C:\\Dev50\\workspace_spring\\HellsCare\\src\\main\\webapp\\resources\\images\\food\\";

					try {
						file.transferTo(new File(saveDir + file.getOriginalFilename()));

						FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
						FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

						int data = 0;
						// 논리적인 경로에 저장된 임시 파일을 물리적인 경로로 복사함
						while ((data = fis.read()) != -1) {
							fos.write(data);
						}
						fis.close();
						fos.close();

						String food_img = file.getOriginalFilename(); // 음식이미지
						
						FoodVO food = new FoodVO();
						
						food.setFood_code(food_code);
						food.setFood_name(food_name);
						food.setFood_img(food_img);
						food.setQuantity(quantity);
						food.setFood_kind(food_kind);
						food.setKcal(kcal);
						food.setCarbohydrate(carbohydrate);
						food.setProtein(protein);
						food.setFat(fat);
						food.setSaccharides(saccharides);
						food.setSalt(salt);
						food.setCholesterol(cholesterol);
						food.setSaturation(saturation);
						food.setTrans(trans);
						
						System.out.println("food : " + food);
						
						int updateCnt = 0;

						updateCnt = dao.updateFood(food);

						model.addAttribute("updateCnt", updateCnt);
						model.addAttribute("pageNum", pageNum);

					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
				// 관리자 - 음식 삭제
				@Override
				public void foodDeletePro(HttpServletRequest req, Model model) {
					String food_code = req.getParameter("food_code");
					int pageNum = Integer.parseInt(req.getParameter("pageNum"));
					
					int deleteCnt = 0;
					deleteCnt = dao.deleteFood(food_code);
					
					model.addAttribute("deleteCnt", deleteCnt);
					model.addAttribute("pageNum", pageNum);
				}
				
				// 관리자 - 음식 목록에서 여러 개 삭제
				@Override
				public void foodListDeletePro(HttpServletRequest req, Model model) {
					String[] food_codes = req.getParameterValues("food_code");
					int pageNum = Integer.parseInt(req.getParameter("pageNum"));
					
					int deleteCnt = 0;
					
					for (int i = 0; i < food_codes.length; i++) {
						String food_code = food_codes[i];
						
						deleteCnt += dao.deleteFood(food_code);
					}
					
					model.addAttribute("deleteCnt", deleteCnt);
					model.addAttribute("pageNum", pageNum);
				}
				
			
				// 관리자 - 음식 중복 체크
				@Override
				public int foodDupcheck(HttpServletRequest req, Model model) {
					String food_name = req.getParameter("food_name");
					return dao.checkFoodDup(food_name);
				}
				
//				pom.xml에 추가
//				<!-- openCSV -->
//				<dependency>
//				   <groupId>net.sf.opencsv</groupId>
//				   <artifactId>opencsv</artifactId>
//				   <version>2.0</version>
//				</dependency>
				
				// 사용자 - 섭취한 음식 입력
				@Override
				public void foodEnrollAteToday(HttpServletRequest req, Model model) {
					String[] food_kinds = req.getParameterValues("food_kind");
					String[] food_names = req.getParameterValues("food_name");
					String[] food_counts = req.getParameterValues("food_count");

					// id로 사용자 정보를 얻는다.
					String id = (String)req.getSession().getAttribute("memId");
					
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
					for(int i = 0; i < food_kinds.length; i++) {
						String food_kind = food_kinds[i];
						String food_name = food_names[i];
						int food_count = Integer.parseInt(food_counts[i]);
						
						Map<String, String> map = new HashMap<>();
						
						map.put("food_kind", food_kind);
						map.put("food_name", food_name);
						
						FoodVO food = dao.getFoodInfoByUsingFoodNameAndFoodKind(map);
						
						Map<String, String> insertFoodMap = new HashMap<>();
						
						insertFoodMap.put("username", id);
						insertFoodMap.put("food_code", food.getFood_code());
						insertFoodMap.put("kcal", Integer.toString(food_count * food.getKcal()));
						insertFoodMap.put("kcal_date", (String)formatType.format(today));
						
						insertCnt += dao.insertUserFood(insertFoodMap);
						
						userTodayKcal += food_count * food.getKcal();
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
					
					if(insertCnt > 0 ) {
						model.addAttribute("standard", standard);
						model.addAttribute("userYesterdayKcal", userYesterdayKcal);
						model.addAttribute("userTodayKcal", userTodayKcal);
					}
				}
				
				// 사용자 - 음식 종류에 해당하는 음식명들 탐색
				@Override
				public List<FoodVO> foodFindEqualKind(HttpServletRequest req, Model model) {
					String food_kind = req.getParameter("food_kind");
					List<FoodVO> foodList = dao.getFoodNamesByUsingFoodKind(food_kind);
					
					return  foodList;
				}
				
				// 사용자 - 오늘의 칼로리 입력 폼 입력 없이 기존의 정보 받아오기
				@Override
				public void getKcalInfoNoInput(HttpServletRequest req, Model model) {
					// id로 사용자 정보를 얻는다.
					String id = (String)req.getSession().getAttribute("memId");
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
					
					model.addAttribute("standard", standard);
					model.addAttribute("userYesterdayKcal", userYesterdayKcal);
					model.addAttribute("userTodayKcal", userTodayKcal);
					
				}
				
				// 식단 추천을 위한 회원의 건강정보 수집, 입력했던 칼로리 테이블 조회 
				@Override
				public void getUserHealthInfo(HttpServletRequest req, Model model) {
					
					// 세션에 접속한 사용자의 아이디 정보로 개인 건강 정보와 칼로리 입력 정보를 가져온다.
					String username = (String)req.getSession().getAttribute("memId");
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
					
					// 최근 칼로리 섭취량에 따른 영양성분 분석하기
					List<KcalVO> userWeeklyKcalNotCombined = new ArrayList<>();
					
					// 지난 주 날짜 구하기
					int tempNum = 7;
					for (int i = 0; i < 7; i++) {
						List<KcalVO> tempList = new ArrayList<>();
						
						String tempDate = "";
						int tempI = tempNum * -1;
						
						Calendar tempCal = new GregorianCalendar();
						tempCal.add(Calendar.DATE, tempI);
						
						Date lastWeekDay = tempCal.getTime();
						SimpleDateFormat tempFormatType = new SimpleDateFormat("YY/MM/dd");
						tempDate = (String)(tempFormatType.format(lastWeekDay));
						
						Map<String, String> tempMap = new HashMap<>();
						tempMap.put("username", username);
						tempMap.put("kcal_date", tempDate);
						
						// 일자별 칼로리 정보 검색
						int selectCnt = dao.searchUserKcalInfo(tempMap);
						int insertCnt = 0;
						
						// 해당 일자에 데이터가 없으면 0으로 초기화하여 만든다.
						if(selectCnt <= 0) insertCnt = dao.makeUserKcalInfo(tempMap);
						
						tempList = dao.getUserKcalInfoEachDay(tempMap);
						
						for (int k = 0; k < tempList.size(); k++) {
							KcalVO tempKcalVO = tempList.get(k);
							
							if(tempKcalVO != null) {
								userWeeklyKcalNotCombined.add(tempKcalVO);
							}
						}
						
						tempNum--;
					}
					
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
					
					UserInfoVO userHealthVO = dao.getUserInfo(username);
					
					model.addAttribute("standard", standard);
					model.addAttribute("userWeeklyKcalList", userWeeklyKcalList);
					model.addAttribute("weekCarbo", weekCarbo);
					model.addAttribute("weekProtein", weekProtein);
					model.addAttribute("weekFat", weekFat);
					model.addAttribute("weekSaccharide", weekSaccharide);
				}
				
				// ============ 동렬 파트 종료



//규진 유저 서비스
	
	@Override
	public void Userhealthss(HttpServletRequest req, Model model) {
		String username=(String)req.getSession().getAttribute("memId");
		UserInfoVO vo = dao.Userhealthss(username);
		model.addAttribute("dto",vo);
	}
	
	
	@Override
	public void challengesearch(HttpServletRequest req, Model model) {
		String cc = req.getParameter("content");
		List<challengeVO> list = dao.challengesearch(cc);
		model.addAttribute("dtos", list);
	}


	
	
	
	@Override
	public void challengeView(HttpServletRequest req, Model model) {
		int pageSize = 5; // 한페이지당 글 갯수
		int PageBlock = 3; // 페이지 갯수는 3개씩 보여줄거임

		int cnt = 0;// 글 갯수
		int start = 0;// 현재 페이지의 시작되는 글 번호
		int end = 0;// 현재 페이지의 마지막 글번호
		int number = 0;// 출력용 글 번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0;

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지
		cnt = dao.challengecount();
		System.out.println("도전과제 갯수 : " + cnt);
		pageNum = req.getParameter("pageNum");
		
		if (pageNum == null) {
			pageNum = "1";
		}
		currentPage = Integer.parseInt(pageNum);
		System.out.println(currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		System.out.println("Start:" + start);
		System.out.println("end : " + end);
		if (end > cnt)
			end = cnt;
		number = cnt - (currentPage - 1) * pageSize;
		System.out.println("number :" + number);
		System.out.println("pageSize :" + number);

		if (cnt > 0) {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			List<challengeVO> list = dao.challengecount2(map);
			model.addAttribute("dtos", list);
		}
		startPage = (currentPage / PageBlock) * PageBlock + 1;
		if (currentPage % PageBlock == 0)
			startPage -= PageBlock;
		System.out.println("startPage : " + startPage);

		// 마지막페이지
		endPage = startPage + PageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number);// 출력용 글 번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage);// 시작페이지
			model.addAttribute("endPage", endPage);// 마지막페이지
			model.addAttribute("pageBlock", PageBlock);// 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}

	}	
	
	
//도전과제 상세보기 페이지	
	@Override
	public void challengedetail(HttpServletRequest req, Model model) {
		String ids = (String)req.getSession().getAttribute("memId"); //세션에서 사용자 아이디를 가져옴
		int id = Integer.parseInt(req.getParameter("code"));//사용자가 클릭한 이벤트의 고유번호 파라미터로 가져옴
		challengeVO vo = dao.challengedetail(id); //VO에 이벤트의 제목 내용등등 세부사항을 담는다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", ids);
		map.put("code", id);
		int cnt = dao.challchek(map); //사용자가 기존에 찜한 이벤트인지 아닌지 체크
		model.addAttribute("dto",vo); //VO를 반환
		model.addAttribute("cnt",cnt); //이미 추가되어있는 이벤트인지 아닌지 1또는 0을 반환 1이면 이미 등록된내용 0이면 없는내용
	}
				
//나의 도전과제
	@Override
	public void Mychallenge(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("memId");
		List<MychalleangeVO> list = dao.Mychallenge(id); //내 도전과제가 있으면 List에 담아서 리턴 할수 있게 준비
		int cnt = dao.challcheck2(id); //도전과제가 없을 경우를 대비한 찜해둔 이벤트 갯수 DAO
		model.addAttribute("list",list);
		model.addAttribute("cnt",cnt);
	}
//내 도전과제 삭제
	@Override
	public void delchall(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("memId"); //세션에서 가져온 사용자 ID
		String code = req.getParameter("code"); //파라미터로 넘겨받은 이벤트 고유코드
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("code",code);
		int cnt = dao.delchall(map);
		model.addAttribute("cnt",cnt);
	}
	
	
//규진 유저서비스 종료	
	
	
	
	
//=============호스트 서비스	
	
	
	//==규진 호스트 영역
	//도전과제 등록 프로세스
	@Override
	public void challengeRegpro(MultipartHttpServletRequest req, Model model) {
		MultipartFile file = req.getFile("c_img");
		

		String saveDir = req.getSession().getServletContext().getRealPath("/resources/eventimg/");
		String realDir = "C:\\workspace_git\\hellscare\\HellsCare\\src\\main\\webapp\\resources\\eventimg\\";
		
		try {
			file.transferTo(new File(saveDir +file.getOriginalFilename() ));
		
		FileInputStream fis = new FileInputStream(saveDir+file.getOriginalFilename());
		FileOutputStream fos = new FileOutputStream(realDir+file.getOriginalFilename());
		
		int data = 0;
		
		while((data = fis.read()) != -1) {
			fos.write(data);
		}
		fis.close();
		fos.close();
		
		String c_name = req.getParameter("c_name");
		String c_content = req.getParameter("c_content");
		int c_point = Integer.parseInt(req.getParameter("c_point"));
		String c_img =  file.getOriginalFilename();
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
		System.out.println("위도"+lat);
		System.out.println("경도"+lng);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("challenge_name", c_name);
		map.put("challenge_content", c_content);
		map.put("challenge_gift", c_point);
		map.put("challenge_img", c_img);
		map.put("challange_date", new Timestamp(System.currentTimeMillis()));
		map.put("lat", lat);
		map.put("lng", lng);
	    int cnt = dao.challengePro(map);
		model.addAttribute("cnt", cnt); 
		}catch(IOException e){
			e.printStackTrace();
		}
		
	}

	

//도전과제 삭제

	@Override
	public void challengedelpro(HttpServletRequest req, Model model) {
		String[] arr = req.getParameterValues("challenge_check");
		int cnt=0;
		int lastcnt = 0;
		for(String i : arr) {
			dao.challengedel(Integer.parseInt(i));
			cnt +=1;
		}
		if(arr.length==cnt) {
			lastcnt = 1;
		}else {
			lastcnt = 0;
		}
		model.addAttribute("cnt", lastcnt);
	}

	//이벤트 추가 서비스
	@Override
	public void addchall(HttpServletRequest req, Model model) {
		String code=(String) req.getParameter("code"); //이벤트 고유번호 가져오기
		String id = (String)req.getSession().getAttribute("memId"); //세션에서 아이디 가져오기
		int done = 0;
		Date start = new Timestamp(System.currentTimeMillis()); //이벤트 등록시간
		Map<String, Object> map =  new HashMap<String, Object>();
		map.put("code", code);
		map.put("id", id);
		map.put("done", done); //이벤트 완료된 이벤트인지 아닌지 0이면 미완료 1이면 완료
		map.put("start", start);
		int cnts = dao.addchall(map);	
		model.addAttribute("cnt", cnts);
		model.addAttribute("code",code);
	}

	
	
//==규진 호스트 영역 종료




	






	@Override
	public void crawlNewsDetail(HttpServletRequest req, Model model) throws IOException {
		NewsVO news = new NewsVO();
		
		String newsUrl = req.getParameter("newsUrl");
		Document detailNewsPage = Jsoup.connect(newsUrl).get();
			
		String newsTitle = detailNewsPage.select(".news_title_text h1").get(0).text();
		news.setNewsTitle(newsTitle);
			
		if(detailNewsPage.select(".news_imgbox img") != null) {
			try {
				// 기사들 중 i번째의 thumb 클래스의 dd 태그의 img 태그에서 0번째의 src를 가져오는 이유는
				// 어짜피 i번째의 기사는 하나이기 때문에
				String newsImg = detailNewsPage.select(".news_imgbox img").get(0).attr("src");
				news.setNewsImg(newsImg);
					
				String newsCaption = detailNewsPage.select(".news_imgbox img + figcaption").get(0).text();
				news.setNewsCaption(newsCaption);
			} catch (Exception e) {
				// System.out.println("IndexOutOfBoundsException 발생");
			}
		}
			
		String newsContents = "";
			
		Elements detailNewsContents = detailNewsPage.select(".news_body .par > p");
			
		for(Element newsPTag : detailNewsContents) {
			newsContents += newsPTag.text() + "<br/><br/>";
		}
			
		news.setNewsContents(newsContents);
			
		String newsDate = detailNewsPage.select("#date_text").get(0).text();
		news.setNewsDate(newsDate);
			
		String newsAuthor = detailNewsPage.select(".news_title_author ul li a").get(0).text();
		news.setNewsAuthor(newsAuthor);
		
		model.addAttribute("news", news);
		
	}

	
	



		
	//=====예찬 서비스 시작
		// 관리자 - 운동등록처리 / 파일업로드처리
					@Override
					public void exerciseAddPro(MultipartHttpServletRequest req, Model model) {
						String part = "";

						MultipartFile file = req.getFile("img");
						MultipartFile file2 = req.getFile("video");

						@SuppressWarnings("deprecation")
						String saveDir = req.getRealPath("/resources/images/videos/");
						
						String realDir = "C:\\Users\\wovkf\\git\\hellscare\\hellscare\\HellsCare\\src\\main\\webapp\\resources\\images\\videos\\";

						try {
							file.transferTo(new File(saveDir + file.getOriginalFilename()));

							FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
							FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

							file2.transferTo(new File(saveDir + file2.getOriginalFilename()));
							FileInputStream fis2 = new FileInputStream(saveDir + file2.getOriginalFilename());
							FileOutputStream fos2 = new FileOutputStream(realDir + file2.getOriginalFilename());
							
							int data = 0;
							// 논리적인 경로에 저장된 임시 파일을 물리적인 경로로 복사함
							while ((data = fis.read()) != -1) {
								fos.write(data);
							}
							fis.close();
							fos.close();
							
							data = 0;
							// 논리적인 경로에 저장된 임시 파일을 물리적인 경로로 복사함
							while ((data = fis2.read()) != -1) {
								fos2.write(data);
							}
							fis2.close();
							fos2.close();

							String name = req.getParameter("name"); // 운동명
							String img = file.getOriginalFilename(); // 대표이미지
							String video = file2.getOriginalFilename();	// 영상
							int kind = Integer.parseInt(req.getParameter("kind")); // 종류 -- 1. 스트레칭, 2. 다이어트 운동
							// 스트레칭일때만 운동부위가 존재함.
							if (kind == 1) {
								part = req.getParameter("part");
							}
							String way = req.getParameter("way"); // 운동방법
							String note = req.getParameter("note"); // 주의사항
							int kcal = Integer.parseInt(req.getParameter("kcal")); // 소모칼로리

							// 바구니 생성
							ExerciseVO vo = new ExerciseVO();

							vo.setExercise_name(name);
							vo.setExercise_img(img);
							vo.setExercise_video(video);
							vo.setWay(way);
							vo.setPart(part);
							vo.setKcal(kcal);
							vo.setNote(note);
							vo.setKind(kind);

							int insertCnt = 0;

							insertCnt = dao.insertExercise(vo);

							model.addAttribute("insertCnt", insertCnt);

						} catch (Exception e) {
							e.printStackTrace();
						}
					}

					// 관리자 - 운동목록
					@Override
					public void exerciseList(HttpServletRequest req, Model model) {
						// 3단계. 화면으로부터 입력받은 값을 받아온다.
						// 페이징 처리
						int pageSize = 10; // 한페이지당 출력할 글 개수
						int pageBlock = 3; // 한 블럭당 페이지 개수

						int cnt = 0; // 글의 개수
						int start = 0; // 현재 페이지 시작 글번호
						int end = 0; // 현재 페이지 마지막 글번호
						int number = 0; // 출력용 글번호
						String pageNum = ""; // 페이지 번호
						int currentPage = 0; // 현재 페이지

						int pageCount = 0; // 페이지 개수
						int startPage = 0; // 시작페이지
						int endPage = 0; // 마지막페이지

						// 5-1단계. 운동수 구하기
						cnt = dao.getexerciseArticleCnt();
						int cntSt = dao.getArticleCntSt();
						int cntDi = dao.getArticleCntDi();
						
						System.out.println("cnt : " + cnt); // 먼저 테이블에 30건 insert

						pageNum = req.getParameter("pageNum");

						if (pageNum == null) {
							pageNum = "1"; // 첫 페이지를 1페이지로 지정
						}

						// 글30건 기준
						// 현재페이지
						currentPage = Integer.parseInt(pageNum); // 현재 페이지 : 1
						System.out.println("currentPage : " + currentPage);

						// 6페이지 + 한건이남으면 7페이지까지 만들어서 하나를 넣어준다.
						pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);

						// 현재페이지 시작 글번호(페이지별)
						start = (currentPage - 1) * pageSize + 1;

						// 현재페이지 마지막 글번호(페이지별)
						end = start + pageSize - 1;

						System.out.println("start : " + start);
						System.out.println("end : " + end);

						if (end > cnt)
							end = cnt;

						// 출력용 글번호
						number = cnt - (currentPage - 1) * pageSize;

						System.out.println("number : " + number);
						System.out.println("pageSize : " + pageSize);

						Map<String, Integer> map = new HashMap<String, Integer>();

						map.put("start", start);
						map.put("end", end);
						
						if (cnt > 0) {
							// 5-2단계. 게시글 목록조회
							List<ExerciseVO> dtos = dao.getexerciseList(map);
							model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 , 작은 바구니 : 게시글 1건
						}
						
						if(cntSt > 0) {
							List<ExerciseVO> dtosSt = dao.getstretching(map);
							model.addAttribute("dtosSt",dtosSt);
						}
						
						if(cntDi > 0) {
							List<ExerciseVO> dtosDi = dao.getdiet(map);
							model.addAttribute("dtosDi",dtosDi);
						}
						
						// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기위함)
						// 시작페이지
						startPage = (currentPage / pageBlock) * pageBlock + 1;

						if (currentPage % pageBlock == 0)
							startPage -= pageBlock;
						System.out.println("startPage : " + startPage);

						// 마지막 페이지
						endPage = startPage + pageBlock - 1;

						if (endPage > pageCount)
							endPage = pageCount;
						System.out.println("endPage : " + endPage);

						System.out.println("=====================");

						model.addAttribute("cnt", cnt); // 글 개수
						model.addAttribute("cntSt",cntSt);	// 스트레칭개수
						model.addAttribute("cntDi",cntDi);	// 유산소운동개수
						model.addAttribute("number", number); // 출력용 글번호
						model.addAttribute("pageNum", pageNum); // 페이지번호

						if (cnt > 0) {
							model.addAttribute("startPage", startPage); // 시작 페이지
							model.addAttribute("endPage", endPage); // 마지막 페이지
							model.addAttribute("pageBlock", pageBlock); // 출력할 페이지개수
							model.addAttribute("pageCount", pageCount); // 페이지 개수
							model.addAttribute("currentPage", currentPage); // 현재페이지
						}
					}

					// 관리자 - 운동삭제
					@Override
					public void deleteExercise(HttpServletRequest req, Model model) {
						// 3단계. 화면으로부터 입력받은 값을 받아온다.
						String[] remove = req.getParameterValues("remove2");

						int deleteCnt = 0;

						// 5단계. 삭제처리
						for (int i = 0; i < remove.length; i++) {
							deleteCnt = dao.deleteExercise(remove[i]);
						}
						// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기위함)
						model.addAttribute("deleteCnt", deleteCnt);
					}

					//관리자 - 운동수정 뷰
					@Override
					public void modifyExercise(HttpServletRequest req, Model model) {
						// 3단계. 화면으로부터 입력받은 값을 받아와서 VO 바구니에 담는다.
						String exercise_code = req.getParameter("exercise_code");
						String pageNum = req.getParameter("pageNum");
						
						// 5단계. 회원정보 수정
						ExerciseVO vo = dao.getExercise(exercise_code);

						// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)
						model.addAttribute("vo", vo);
						model.addAttribute("pageNum",pageNum);
					}

					// 관리자 - 운동수정처리
					@Override
					public void modifyExercisePro(HttpServletRequest req, Model model) {
						String exercise_code = req.getParameter("exercise_code");
						String name = req.getParameter("name"); // 운동명
						int kind = Integer.parseInt(req.getParameter("kind")); // 종류 -- 1. 스트레칭, 2. 다이어트 운동
						String part = "";
						String pageNum = req.getParameter("pageNum");
						System.out.println("pageNum : " + pageNum);
						// 스트레칭일때만 운동부위가 존재함.
						if (kind == 1) {
							part = req.getParameter("part");
						}
						String way = req.getParameter("way"); // 운동방법
						String note = req.getParameter("note"); // 주의사항
						int kcal = Integer.parseInt(req.getParameter("kcal")); // 소모칼로리

						// 바구니 생성
						ExerciseVO vo = new ExerciseVO();

						vo.setExercise_code(exercise_code);
						vo.setExercise_name(name);
						vo.setWay(way);
						vo.setPart(part);
						vo.setKcal(kcal);
						vo.setNote(note);
						vo.setKind(kind);
						
						int updateCnt = 0;
						
						updateCnt = dao.modifyPro(vo);
						
						model.addAttribute("updateCnt",updateCnt);
						model.addAttribute("pageNum",pageNum);
					}

					// 운동 - 상세페이지
					@Override
					public void detailExercise(HttpServletRequest req, Model model) {
						String exercise_code = req.getParameter("exercise_code");
						String username = (String)req.getSession().getAttribute("memId");
						int cnt = 0;
						String favorite_code = "";
						
						ExerciseVO vo = dao.detailExercise(exercise_code);
						if(username != null) {
							Map<String, Object> map = new HashMap<>();
							
							map.put("username", username);
							map.put("exercise_code", exercise_code);
							
							cnt = dao.favoritCnt(map);
							favorite_code = dao.favoritCode(map);
							
							model.addAttribute("favorite_code",favorite_code);
							model.addAttribute("cnt",cnt);
						}
						model.addAttribute("vo",vo);
					}

					// 운동 - 즐겨찾기 추가
					@Override
					public void addFavorit(HttpServletRequest req, Model model) {
						String username = (String) req.getSession().getAttribute("memId");
						String exercise_code = req.getParameter("exercise_code");
						
						int insertCnt = 0;
						
						Map<String,Object> map = new HashMap<>();
						
						map.put("username", username);
						map.put("exercise_code", exercise_code);
						
						insertCnt = dao.addFavorit(map);
						
						model.addAttribute("insertCnt",insertCnt);
						model.addAttribute("exercise_code",exercise_code);
					}

					// 운동 - 부위별 목록
					@Override
					public void stretchingList(HttpServletRequest req, Model model) {
						String part = req.getParameter("part");
						int cnt = 0;
						
						List<ExerciseVO> dtos = dao.getPartList(part);
						cnt = dao.getPartCnt(part);
						
						model.addAttribute("dtos",dtos);
						model.addAttribute("part",part);
						model.addAttribute("cnt",cnt);
					}
					
					// 즐겨찾기 목록
					@Override
					public void favoriteList(HttpServletRequest req, Model model) {
						String username = (String)req.getSession().getAttribute("memId");
						
						Map<String,Object> map = new HashMap<>();
						int cnt = dao.getFavoriteCnt(username);
						List<ExerciseVO> dtos = new ArrayList<ExerciseVO>();
						map.put("username", username);
						
						if(cnt > 0) {
							List<ExerciseVO> vo = dao.getFavoriteList(username);
							for(int i = 0; i<vo.size(); i++) {
								String exercise_code = vo.get(i).getExercise_code();
								map.put("exercise_code",exercise_code);
								dtos.add(dao.getExerciseInfo(map));
							}
							model.addAttribute("dtos",dtos);
						}
						model.addAttribute("cnt",cnt);
					}
					
					// 동호회 - 동호회명 중복확인
					@Override
					public int clubNameCheck(String club_id) {
						return dao.clubNameCheck(club_id);
					}
					
					// 버튼 - 즐겨찾기 제거
					@Override
					public void removeFavorit(HttpServletRequest req, Model model) {
						String favorite_code = req.getParameter("favorite_code");
						String exercise_code = req.getParameter("exercise_code");
						int deleteCnt = 0;
						
						deleteCnt = dao.removeFavorit(favorite_code);
						
						model.addAttribute("deleteCnt",deleteCnt);
						model.addAttribute("exercise_code",exercise_code);
						
					}
					
					// 사용자 - 즐겨찾기 제거
					@Override
					public void removefavorites(HttpServletRequest req, Model model) {
						// 3단계. 화면으로부터 입력받은 값을 받아온다.
						String[] remove = req.getParameterValues("remove2");

						int deleteCnt = 0;

						// 5단계. 삭제처리
						for (int i = 0; i < remove.length; i++) {
							deleteCnt = dao.deletefavorite(remove[i]);
						}
						// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기위함)
						model.addAttribute("deleteCnt", deleteCnt);
					}
					
					// 동호회 개설신청
					@Override
					public void addClubApply(HttpServletRequest req, Model model) {
						String club_name = req.getParameter("club_name");
						String club_kind = req.getParameter("kind");
											
						if(club_kind.equals("1")) {
							club_kind = "건강정보";
						} else if(club_kind.equals("2")) {
							club_kind = "운동";
						} else if(club_kind.equals("3")) {
							club_kind = "다이어트";
						} else {
							club_kind = "스트레칭";
						}
						
						int club_max = Integer.parseInt(req.getParameter("club_max"));
						String area = req.getParameter("area");
						if(area.equals("1")) {
							area = "서울특별시";
						} else if(area.equals("2")) {
							area = "부산광역시";
						} else if(area.equals("3")) {
							area = "대구광역시";
						} else if(area.equals("4")) {
							area = "인천광역시";
						} else if(area.equals("5")) {
							area = "광주광역시";
						} else if(area.equals("6")) {
							area = "대전광역시";
						} else if(area.equals("7")) {
							area = "울산광역시";
						} else if(area.equals("8")) {
							area = "세종특별자치시";
						} else if(area.equals("9")) {
							area = "경기도";
						} else if(area.equals("10")) {
							area = "강원도";
						} else if(area.equals("11")) {
							area = "충청북도";
						} else if(area.equals("12")) {
							area = "충청남도";
						} else if(area.equals("13")) {
							area = "전라북도";
						} else if(area.equals("14")) {
							area = "전라남도";
						} else if(area.equals("15")) {
							area = "경상북도";
						} else if(area.equals("16")) {
							area = "경상남도";
						} else {
							area = "제주특별자치도";
						}
						
						
						String club_master = req.getParameter("club_master");
						String club_pr = req.getParameter("club_pr");
						
						
						ClubVO vo = new ClubVO();
						
						vo.setClub_name(club_name);
						vo.setClub_kind(club_kind);
						vo.setClub_max(club_max);
						vo.setArea(area);
						vo.setClub_master(club_master);
						vo.setClub_pr(club_pr);
						
						int insertCnt = 0;
						insertCnt = dao.addClubApply(vo);
						
						model.addAttribute("insertCnt",insertCnt);
						model.addAttribute("vo",vo);
					}

					// 관리자 - 동호회 신청 목록
					@Override
					public void clubList(HttpServletRequest req, Model model) {
						// 3단계. 화면으로부터 입력받은 값을 받아온다.
						// 페이징 처리
						int pageSize = 10; // 한페이지당 출력할 글 개수
						int pageBlock = 3; // 한 블럭당 페이지 개수

						int cnt = 0; // 글의 개수
						int start = 0; // 현재 페이지 시작 글번호
						int end = 0; // 현재 페이지 마지막 글번호
						int number = 0; // 출력용 글번호
						String pageNum = ""; // 페이지 번호
						int currentPage = 0; // 현재 페이지

						int pageCount = 0; // 페이지 개수
						int startPage = 0; // 시작페이지
						int endPage = 0; // 마지막페이지

						// 5-1단계. 동호회신청 개수 구하기
						cnt = dao.getClubCnt();
						
						System.out.println("cnt : " + cnt); // 먼저 테이블에 30건 insert

						pageNum = req.getParameter("pageNum");

						if (pageNum == null) {
							pageNum = "1"; // 첫 페이지를 1페이지로 지정
						}

						// 글30건 기준
						// 현재페이지
						currentPage = Integer.parseInt(pageNum); // 현재 페이지 : 1
						System.out.println("currentPage : " + currentPage);

						// 6페이지 + 한건이남으면 7페이지까지 만들어서 하나를 넣어준다.
						pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);

						// 현재페이지 시작 글번호(페이지별)
						start = (currentPage - 1) * pageSize + 1;

						// 현재페이지 마지막 글번호(페이지별)
						end = start + pageSize - 1;

						System.out.println("start : " + start);
						System.out.println("end : " + end);

						if (end > cnt)
							end = cnt;

						// 출력용 글번호
						number = cnt - (currentPage - 1) * pageSize;

						System.out.println("number : " + number);
						System.out.println("pageSize : " + pageSize);

						Map<String, Object> map = new HashMap<String, Object>();

						map.put("start", start);
						map.put("end", end);
						
						if (cnt > 0) {
							// 5-2단계. 게시글 목록조회
							List<ClubVO> dtos = dao.getClubList(map); 
							model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 , 작은 바구니 : 게시글 1건
						}
						
						// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기위함)
						// 시작페이지
						startPage = (currentPage / pageBlock) * pageBlock + 1;

						if (currentPage % pageBlock == 0)
							startPage -= pageBlock;
						System.out.println("startPage : " + startPage);

						// 마지막 페이지
						endPage = startPage + pageBlock - 1;

						if (endPage > pageCount)
							endPage = pageCount;
						System.out.println("endPage : " + endPage);

						System.out.println("=====================");

						model.addAttribute("cnt", cnt); // 글 개수
						model.addAttribute("number", number); // 출력용 글번호
						model.addAttribute("pageNum", pageNum); // 페이지번호

						if (cnt > 0) {
							model.addAttribute("startPage", startPage); // 시작 페이지
							model.addAttribute("endPage", endPage); // 마지막 페이지
							model.addAttribute("pageBlock", pageBlock); // 출력할 페이지개수
							model.addAttribute("pageCount", pageCount); // 페이지 개수
							model.addAttribute("currentPage", currentPage); // 현재페이지
						}
					}
					
					// 관리자 - 동호회 상세페이지
					@Override
					public void clubDetail(HttpServletRequest req, Model model) {
						String club_name = req.getParameter("club_name");
						String pageNum = req.getParameter("pageNum");
						
						ClubVO vo = dao.clubDetail(club_name);
						
						model.addAttribute("pageNum",pageNum);
						model.addAttribute("vo",vo);
					}

					// 관리자 - 동호회 신청 삭제 / 개설된 동호회 삭제
					@Override
					public void deleteApplyClub(HttpServletRequest req, Model model) {
						// 3단계. 화면으로부터 입력받은 값을 받아온다.
						String[] remove = req.getParameterValues("remove2");
						String pageNum = req.getParameter("pageNum");
						String club1=null;
						String club2=null;
						String club3=null;
						
						int deleteCnt = 0;

						// 5단계. 삭제처리
						for (int i = 0; i < remove.length; i++) {
							deleteCnt = dao.deleteApplyClub(remove[i]);
							
							// 해당 동호회의 회원목록을 가져옴
							List<UsersVO> dto = dao.getUserName(remove[i]);
							
							// 해당 동호회의 회원수만큼 반복
							for (int j = 0; j < dto.size(); j++) {
								
								// 회원한명의 이름을 가져옴
								MyClubVO vo = dao.getMyClubList(dto.get(j).getUsername());
								
								if(vo != null) {
									// 회원한명의 모든 클럽값을 가져옴
									club1 = vo.getClub1();
									club2 = vo.getClub2();
									club3 = vo.getClub3();
									
									// 그중 같은 클럽값이 있을때 update처리해줌
									if(club1 != null) {
										if(club1.equals(remove[i])) {
											dao.removeClub1(dto.get(j).getUsername());
										}
									}
									if(club2 != null) {
										if(club2.equals(remove[i])) {
											dao.removeClub2(dto.get(j).getUsername());
										}
									}
									if(club3 != null) {
										if(club3.equals(remove[i])) {
											dao.removeClub3(dto.get(j).getUsername());
										}
									}
								}
								
							}
							dao.deleteClub(remove[i]);
						}
						
						// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기위함)
						model.addAttribute("deleteCnt", deleteCnt);
						model.addAttribute("pageNum",pageNum);
					}

					// 관리자 - 동호회 승인
					@Override
					public void clubPermit(HttpServletRequest req, Model model) {
						String club_name = req.getParameter("club_name");
						String pageNum = req.getParameter("pageNum");
						int updateCnt = 0;
						String club1 = null;
						String club2 = null;
						String club3 = null;
						String name = null;
						
						String username = dao.getClubMaster(club_name);
						
						MyClubVO vo = dao.getMyClubList(username);
						
						if(vo != null) {
							club1 = vo.getClub1();
							club2 = vo.getClub2();
							club3 = vo.getClub3();
							name  = vo.getUsername();
						}
						
						Map<String, Object> map = new HashMap<>();
						
						map.put("username", username);
						map.put("club_name", club_name);
						if(club1 != null && club2 != null && club3 != null) {
							updateCnt = 2;
						} else if(name == null){
							dao.addClub1(map);
							updateCnt = dao.clubPermit((String)map.get("club_name"));
						} else if(name != null && club1 == null) {
							dao.add_Club1(map);
							updateCnt = dao.clubPermit((String)map.get("club_name"));
						} else if(club1 != null && club2 == null) {
							dao.addClub2(map);
							updateCnt = dao.clubPermit((String)map.get("club_name"));
						} else if(club1 != null && club2 != null && club3 == null) {
							dao.addClub3(map);
							updateCnt = dao.clubPermit((String)map.get("club_name"));
						}
						model.addAttribute("pageNum",pageNum);
						model.addAttribute("updateCnt",updateCnt);
					}

					// 고객 - 동호회 목록
					@Override
					public void club_List(HttpServletRequest req, Model model) {
						String username = (String) req.getSession().getAttribute("memId");
						
						// 3단계. 화면으로부터 입력받은 값을 받아온다.
						// 페이징 처리
						int pageSize = 10; // 한페이지당 출력할 글 개수
						int pageBlock = 3; // 한 블럭당 페이지 개수

						int cnt = 0; // 글의 개수
						int start = 0; // 현재 페이지 시작 글번호
						int end = 0; // 현재 페이지 마지막 글번호
						int number = 0; // 출력용 글번호
						String pageNum = ""; // 페이지 번호
						int currentPage = 0; // 현재 페이지

						int pageCount = 0; // 페이지 개수
						int startPage = 0; // 시작페이지
						int endPage = 0; // 마지막페이지

						// 5-1단계. 동호회 개수 구하기
						cnt = dao.getClub_Cnt(username);
						
						System.out.println("cnt : " + cnt); // 먼저 테이블에 30건 insert

						pageNum = req.getParameter("pageNum");

						if (pageNum == null) {
							pageNum = "1"; // 첫 페이지를 1페이지로 지정
						}

						// 글30건 기준
						// 현재페이지
						currentPage = Integer.parseInt(pageNum); // 현재 페이지 : 1
						System.out.println("currentPage : " + currentPage);

						// 6페이지 + 한건이남으면 7페이지까지 만들어서 하나를 넣어준다.
						pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);

						// 현재페이지 시작 글번호(페이지별)
						start = (currentPage - 1) * pageSize + 1;

						// 현재페이지 마지막 글번호(페이지별)
						end = start + pageSize - 1;

						System.out.println("start : " + start);
						System.out.println("end : " + end);

						if (end > cnt)
							end = cnt;

						// 출력용 글번호
						number = cnt - (currentPage - 1) * pageSize;

						System.out.println("number : " + number);
						System.out.println("pageSize : " + pageSize);

						Map<String, Object> map = new HashMap<String, Object>();

						map.put("start", start);
						map.put("end", end);
						
						int MyClubcnt = 0;
						
						String club1 = null;
						String club2 = null;
						String club3 = null;
						
						if(username != null) {
							map.put("username", username);
					
							MyClubcnt = dao.getMyClubCnt(username);
						
							if(MyClubcnt != 0) {
								MyClubVO vo = dao.getMyClubList(username);
								if(vo != null) {
									club1 = vo.getClub1();
									club2 = vo.getClub2();
									club3 = vo.getClub3();
								}
							}
						}
						if(club1 == null) club1 = "0"; 
						if(club2 == null) club2 = "0";
						if(club3 == null) club3 = "0";
					
						map.put("club1", club1);
						map.put("club2", club2);
						map.put("club3", club3);

						if (cnt > 0) {
							// 5-2단계. 게시글 목록조회
							List<ClubVO> dtos = dao.getClub_List(map);
							model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 , 작은 바구니 : 게시글 1건
						}
						// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기위함)
						// 시작페이지
						startPage = (currentPage / pageBlock) * pageBlock + 1;

						if (currentPage % pageBlock == 0)
							startPage -= pageBlock;
						System.out.println("startPage : " + startPage);

						// 마지막 페이지
						endPage = startPage + pageBlock - 1;

						if (endPage > pageCount)
							endPage = pageCount;
						System.out.println("endPage : " + endPage);

						System.out.println("=====================");

						model.addAttribute("cnt", cnt); // 글 개수
						model.addAttribute("number", number); // 출력용 글번호
						model.addAttribute("pageNum", pageNum); // 페이지번호

						if (cnt > 0) {
							model.addAttribute("startPage", startPage); // 시작 페이지
							model.addAttribute("endPage", endPage); // 마지막 페이지
							model.addAttribute("pageBlock", pageBlock); // 출력할 페이지개수
							model.addAttribute("pageCount", pageCount); // 페이지 개수
							model.addAttribute("currentPage", currentPage); // 현재페이지
						}
					}
					
					// 동호회 - 상세페이지
					@Override
					public void getClub(HttpServletRequest req, Model model) {
						String username = (String) req.getSession().getAttribute("memId");
						String club_name = req.getParameter("club_name");
						String pageNum = req.getParameter("pageNum");
						int memCnt = 0;
						
						ClubVO vo = dao.getClub(club_name);
						
						Map<String,Object> map = new HashMap<>();
						
						map.put("username", username);
						map.put("club_name", club_name);
						
						// 가입한 동호회 체크
						memCnt = dao.getMember(map);
						
						model.addAttribute("vo",vo);
						model.addAttribute("pageNum",pageNum);
						model.addAttribute("memCnt",memCnt);
					}

					// 관리자 - 개설된 동호회 목록
					@Override
					public void existenceClub(HttpServletRequest req, Model model) {
						// 3단계. 화면으로부터 입력받은 값을 받아온다.
						// 페이징 처리
						int pageSize = 10; // 한페이지당 출력할 글 개수
						int pageBlock = 3; // 한 블럭당 페이지 개수

						int cnt = 0; // 글의 개수
						int start = 0; // 현재 페이지 시작 글번호
						int end = 0; // 현재 페이지 마지막 글번호
						int number = 0; // 출력용 글번호
						String pageNum = ""; // 페이지 번호
						int currentPage = 0; // 현재 페이지

						int pageCount = 0; // 페이지 개수
						int startPage = 0; // 시작페이지
						int endPage = 0; // 마지막페이지

						// 5-1단계. 개설된 동호회 개수 구하기
						cnt = dao.getExistenceClubCnt();
						
						System.out.println("cnt : " + cnt); // 먼저 테이블에 30건 insert

						pageNum = req.getParameter("pageNum");

						if (pageNum == null) {
							pageNum = "1"; // 첫 페이지를 1페이지로 지정
						}

						// 글30건 기준
						// 현재페이지
						currentPage = Integer.parseInt(pageNum); // 현재 페이지 : 1
						System.out.println("currentPage : " + currentPage);

						// 6페이지 + 한건이남으면 7페이지까지 만들어서 하나를 넣어준다.
						pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);

						// 현재페이지 시작 글번호(페이지별)
						start = (currentPage - 1) * pageSize + 1;

						// 현재페이지 마지막 글번호(페이지별)
						end = start + pageSize - 1;

						System.out.println("start : " + start);
						System.out.println("end : " + end);

						if (end > cnt)
							end = cnt;

						// 출력용 글번호
						number = cnt - (currentPage - 1) * pageSize;

						System.out.println("number : " + number);
						System.out.println("pageSize : " + pageSize);

						Map<String, Object> map = new HashMap<String, Object>();

						map.put("start", start);
						map.put("end", end);
						
						if (cnt > 0) {
							// 5-2단계. 게시글 목록조회
							List<ClubVO> dtos = dao.getExistenceClubList(map); 
							model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 , 작은 바구니 : 게시글 1건
						}
						
						// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기위함)
						// 시작페이지
						startPage = (currentPage / pageBlock) * pageBlock + 1;

						if (currentPage % pageBlock == 0)
							startPage -= pageBlock;
						System.out.println("startPage : " + startPage);

						// 마지막 페이지
						endPage = startPage + pageBlock - 1;

						if (endPage > pageCount)
							endPage = pageCount;
						System.out.println("endPage : " + endPage);

						System.out.println("=====================");

						model.addAttribute("cnt", cnt); // 글 개수
						model.addAttribute("number", number); // 출력용 글번호
						model.addAttribute("pageNum", pageNum); // 페이지번호

						if (cnt > 0) {
							model.addAttribute("startPage", startPage); // 시작 페이지
							model.addAttribute("endPage", endPage); // 마지막 페이지
							model.addAttribute("pageBlock", pageBlock); // 출력할 페이지개수
							model.addAttribute("pageCount", pageCount); // 페이지 개수
							model.addAttribute("currentPage", currentPage); // 현재페이지
						}
					}

					// 동호회 - 내가 가입한 동호회 개수 구하기
					@Override
					public void myClub(HttpServletRequest req, Model model) {
						String username = (String)req.getSession().getAttribute("memId");
						int cnt = 0;
						String club1 = null;
						String club2 = null;
						String club3 = null;
						
						if(username == null) {
							cnt = 0;
						} else {
							cnt = dao.getMyClubCnt(username);
							// 현재 회원이 가입한 동호회명 리턴
							MyClubVO vo = dao.getMyClubList(username);
							if(vo != null) {
								club1 = vo.getClub1();
								club2 = vo.getClub2();
								club3 = vo.getClub3();
							}
						}
						
						if(cnt > 0) {
							// 동호회명에 따른 동호회 정보를 넘겨줌
							if(club1 != null) {
								ClubVO vo1 = dao.getMy_ClubList(club1);
								model.addAttribute("vo1",vo1);
							}
							
							if(club2 != null) {
								ClubVO vo2 = dao.getMy_ClubList(club2);
								model.addAttribute("vo2",vo2);
							}
							
							if(club3 != null) {
								ClubVO vo3 = dao.getMy_ClubList(club3);
								model.addAttribute("vo3",vo3);
							}
							
							if(club1 == null && club2 == null && club3 == null) {
								cnt = 0;
							}
							
						}
						model.addAttribute("myClubCnt",cnt);
					}

					
					// 동호회 - 동호회 가입신청
					@Override
					public void clubApply(HttpServletRequest req, Model model) {
						String username = req.getParameter("username");
						String club_name = req.getParameter("club_name");
						int insertCnt = 0;
						int clubJoinCnt = dao.getJoinClubCnt(username);
						int selectCnt = 0;
						
						Map<String,Object> map = new HashMap<>();
						
						map.put("username", username);
						map.put("club_name", club_name);
						
						if(clubJoinCnt == 0) {
							selectCnt = dao.clubWhether(map);
							if(selectCnt == 0) {
								insertCnt = dao.applyClub(map);
							} else {
								insertCnt = 0;
							}  
						} else {
							insertCnt = 2;
						}
						model.addAttribute("insertCnt",insertCnt);
					}
					
					// 동호회 - 가입신청 목록
					@Override
					public void applyList(HttpServletRequest req, Model model) {
						String username = (String)req.getSession().getAttribute("memId");
						int cnt = 0;
						
						cnt = dao.applyCnt(username);
						List<ClubVO> dtos = dao.getApplyList(username);

						model.addAttribute("dtos",dtos);
						model.addAttribute("cnt",cnt);
					}
					
					
					//=====예찬 서비스 종료
					// ==========================================
					
					// 동호회 가입신청 삭제
					@Override
					public void deleteApplyPro(HttpServletRequest req, Model model) {
						// 3단계. 화면으로부터 입력받은 값을 받아온다.
						String club_name = req.getParameter("club_name");
						String[] remove = req.getParameterValues("remove2");

						int deleteCnt = 0;
						// 5단계. 삭제처리
						for (int i = 0; i < remove.length; i++) {
							deleteCnt = dao.deleteApply(remove[i]);
						}
						// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기위함)
						model.addAttribute("deleteCnt", deleteCnt);
						model.addAttribute("club_name",club_name);
					}
					
					// 동호회 - 동호회 회원 정보 목록
					@Override
					public void getMember(HttpServletRequest req, Model model) {
						// 3단계. 화면으로부터 입력받은 값을 받아온다.
						String club_name = req.getParameter("club_name");
						
						// 페이징 처리
						int pageSize = 20; // 한페이지당 출력할 글 개수
						int pageBlock = 3; // 한 블럭당 페이지 개수

						int memberCnt = 0; // 글의 개수
						int start = 0; // 현재 페이지 시작 글번호
						int end = 0; // 현재 페이지 마지막 글번호
						int number = 0; // 출력용 글번호
						String pageNum = ""; // 페이지 번호
						int currentPage = 0; // 현재 페이지

						int pageCount = 0; // 페이지 개수
						int startPage = 0; // 시작페이지
						int endPage = 0; // 마지막페이지

						// 5-1단계. 동호회 회원수 리턴
						memberCnt = dao.getCurrentMember(club_name);
						System.out.println("memberCnt : " + memberCnt); // 먼저 테이블에 30건 insert

						pageNum = req.getParameter("pageNum");

						if (pageNum == null) {
							pageNum = "1"; // 첫 페이지를 1페이지로 지정
						}

						// 글30건 기준
						// 현재페이지
						currentPage = Integer.parseInt(pageNum); // 현재 페이지 : 1
						System.out.println("currentPage : " + currentPage);

						// 6페이지 + 한건이남으면 7페이지까지 만들어서 하나를 넣어준다.
						pageCount = (memberCnt / pageSize) + (memberCnt % pageSize > 0 ? 1 : 0);

						// 현재페이지 시작 글번호(페이지별)
						start = (currentPage - 1) * pageSize + 1;

						// 현재페이지 마지막 글번호(페이지별)
						end = start + pageSize - 1;

						System.out.println("start : " + start);
						System.out.println("end : " + end);

						if (end > memberCnt)
							end = memberCnt;

						// 출력용 글번호
						number = memberCnt - (currentPage - 1) * pageSize;

						System.out.println("number : " + number);
						System.out.println("pageSize : " + pageSize);

						Map<String, Object> map = new HashMap<String, Object>();

						map.put("start", start);
						map.put("end", end);
						map.put("club_name", club_name);

						if (memberCnt > 0) {
							// 5-2단계. 게시글 목록조회
							List<UsersVO> dtos = dao.getMemberList(map);
							model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 , 작은 바구니 : 게시글 1건
						}
						
						// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기위함)
						// 시작페이지
						startPage = (currentPage / pageBlock) * pageBlock + 1;

						if (currentPage % pageBlock == 0)
							startPage -= pageBlock;
						System.out.println("startPage : " + startPage);

						// 마지막 페이지
						endPage = startPage + pageBlock - 1;

						if (endPage > pageCount)
							endPage = pageCount;
						System.out.println("endPage : " + endPage);

						System.out.println("=====================");

						model.addAttribute("number", number); // 출력용 글번호
						model.addAttribute("pageNum", pageNum); // 페이지번호
						model.addAttribute("memberCnt",memberCnt); // 회원수
						if (memberCnt > 0) {
							model.addAttribute("startPage", startPage); // 시작 페이지
							model.addAttribute("endPage", endPage); // 마지막 페이지
							model.addAttribute("pageBlock", pageBlock); // 출력할 페이지개수
							model.addAttribute("pageCount", pageCount); // 페이지 개수
							model.addAttribute("currentPage", currentPage); // 현재페이지
						}
					}
					
					// 동호회 - 동호회원 추방
					@Override
					public void deleteMemberPro(HttpServletRequest req, Model model) {
						String pageNum = req.getParameter("pageNum");
						String username = req.getParameter("username");
						String club_name = req.getParameter("club_name");
						int updateCnt = 0;
						
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
						
						model.addAttribute("updateCnt",updateCnt);
						model.addAttribute("club_name",club_name);
						model.addAttribute("pageNum",pageNum);
					}
					
					// 동호회 - 동호회 탈퇴하기
					@Override
					public void exitMemberPro(HttpServletRequest req, Model model) {
						String username = (String) req.getSession().getAttribute("memId");
						String club_name = req.getParameter("club_name");
						int updateCnt = 0;
						
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
						
						model.addAttribute("updateCnt",updateCnt);
					}
					
					// 동호회 - 해당동호회 가입신청목록
					@Override
					public void getApplyList(HttpServletRequest req, Model model) {
						String club_name = req.getParameter("club_name");
						
						
						// 페이징 처리
						int pageSize = 20; // 한페이지당 출력할 글 개수
						int pageBlock = 3; // 한 블럭당 페이지 개수

						int applyCnt = 0; // 글의 개수
						int start = 0; // 현재 페이지 시작 글번호
						int end = 0; // 현재 페이지 마지막 글번호
						int number = 0; // 출력용 글번호
						String pageNum = ""; // 페이지 번호
						int currentPage = 0; // 현재 페이지

						int pageCount = 0; // 페이지 개수
						int startPage = 0; // 시작페이지
						int endPage = 0; // 마지막페이지

						// 5-1단계. 해당동호회 신청수
						applyCnt = dao.clubApplyCnt(club_name);
						
						System.out.println("applyCnt : " + applyCnt); // 먼저 테이블에 30건 insert

						pageNum = req.getParameter("a_pageNum");

						if (pageNum == null) {
							pageNum = "1"; // 첫 페이지를 1페이지로 지정
						}

						// 글30건 기준
						// 현재페이지
						currentPage = Integer.parseInt(pageNum); // 현재 페이지 : 1
						System.out.println("currentPage : " + currentPage);

						// 6페이지 + 한건이남으면 7페이지까지 만들어서 하나를 넣어준다.
						pageCount = (applyCnt / pageSize) + (applyCnt % pageSize > 0 ? 1 : 0);

						// 현재페이지 시작 글번호(페이지별)
						start = (currentPage - 1) * pageSize + 1;

						// 현재페이지 마지막 글번호(페이지별)
						end = start + pageSize - 1;

						System.out.println("start : " + start);
						System.out.println("end : " + end);

						if (end > applyCnt)
							end = applyCnt;

						// 출력용 글번호
						number = applyCnt - (currentPage - 1) * pageSize;

						System.out.println("number : " + number);
						System.out.println("pageSize : " + pageSize);

						Map<String, Object> map = new HashMap<String, Object>();

						map.put("start", start);
						map.put("end", end);
						map.put("club_name", club_name);

						if (applyCnt > 0) {
							// 5-2단계. 게시글 목록조회
							List<UsersVO> userdtos = dao.getClubApply(map);
							model.addAttribute("userdtos", userdtos); // 큰바구니 : 게시글 목록 , 작은 바구니 : 게시글 1건
						}
						
						// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기위함)
						// 시작페이지
						startPage = (currentPage / pageBlock) * pageBlock + 1;

						if (currentPage % pageBlock == 0)
							startPage -= pageBlock;
						System.out.println("startPage : " + startPage);

						// 마지막 페이지
						endPage = startPage + pageBlock - 1;

						if (endPage > pageCount)
							endPage = pageCount;
						System.out.println("endPage : " + endPage);

						System.out.println("=====================");

						model.addAttribute("a_number", number); // 출력용 글번호
						model.addAttribute("a_pageNum", pageNum); // 페이지번호
						model.addAttribute("applyCnt",applyCnt); // 지원자수
						if (applyCnt > 0) {
							model.addAttribute("a_startPage", startPage); // 시작 페이지
							model.addAttribute("a_endPage", endPage); // 마지막 페이지
							model.addAttribute("a_pageBlock", pageBlock); // 출력할 페이지개수
							model.addAttribute("a_pageCount", pageCount); // 페이지 개수
							model.addAttribute("a_currentPage", currentPage); // 현재페이지
						}
					}
					
					// 동호회 - 동호회 가입신청 승인(대표자)
					@Override
					public void confirmMember(HttpServletRequest req, Model model) {
						String username = req.getParameter("username");
						String club_name = req.getParameter("club_name");
						String apply_code = req.getParameter("apply_code");
						int updateCnt = 0;
						
						// 동호회 최대인원수
						int max = dao.getMax(club_name);
						
						// 동호회 현재인원수
						int current = dao.getCurrent(club_name);
						
						if(current < max) {
			 				String club1 = null;
							String club2 = null;
							String club3 = null;
							String name = null;
							
							Map<String,Object> map = new HashMap<>();
							map.put("username",username);
							map.put("club_name", club_name);
							
							MyClubVO vo = dao.getMyClubList(username);
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
								dao.addClub1(map);
								updateCnt = dao.deleteApply(apply_code);
								
							// 처음이 아니지만 가입한 동호회가 없을때
							} else if(name != null && club1 == null) {
								dao.plusMember(club_name);
								dao.add_Club1(map);
								updateCnt = dao.deleteApply(apply_code);
								
							// 두번째 동호회애 가입할때
							} else if(name != null && club1 != null && club2 == null) {
								dao.plusMember(club_name);
								dao.addClub2(map);
								updateCnt = dao.deleteApply(apply_code);
								
							// 세번째 동호회에 가입할때
							} else if(name != null && club1 != null && club2 != null && club3 == null) {
								dao.plusMember(club_name);
								dao.addClub3(map);
								updateCnt = dao.deleteApply(apply_code);
							} 
						} else {
							updateCnt = 3;
						}
						model.addAttribute("club_name",club_name);
						model.addAttribute("updateCnt",updateCnt);
					}
					
					// 동호회 - 동호회 게시판 목록
					@Override
					public void getClubBoard(HttpServletRequest req, Model model) {
						String club_name = req.getParameter("club_name");
						
						int boardCnt = dao.getClubBoardCnt(club_name);
						
						List<ClubBoardVO> board_dtos = dao.getClubBoardList(club_name);
						
						System.out.println("boardCnt :"+ boardCnt);
						
						model.addAttribute("boardCnt",boardCnt);
						model.addAttribute("board_dtos",board_dtos);
					}

					// 동호회 - 동호회 게시판 글쓰기 폼
					@Override
					public void club_BoardWriteForm(HttpServletRequest req, Model model) {
						String club_name = req.getParameter("club_name");
						
						model.addAttribute("club_name",club_name);
					}
					
					// 동호회 - 동호회 게시판 글쓰기 처리
					@Override
					public void club_BoardWirtePro(HttpServletRequest req, Model model) {
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
						
						model.addAttribute("insertCnt",insertCnt);
						model.addAttribute("club_name",club_name);
					}
					
					// 동호회 - 동호회 게시판 글삭제
					@Override
					public void club_BoardRemove(HttpServletRequest req, Model model) {
						// 3단계. 화면으로부터 입력받은 값을 받아온다.
						String club_name = req.getParameter("club_name2");
						String[] remove = req.getParameterValues("remove");

						int deleteCnt = 0;

						// 5단계. 삭제처리
						for (int i = 0; i < remove.length; i++) {
							deleteCnt = dao.deleteClubBoard(remove[i]);
						}
						
						// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기위함)
						model.addAttribute("club_name",club_name);
						model.addAttribute("deleteCnt", deleteCnt);
					}
					
					// 동호회 - 동호회게시판 글 상세페이지
					@Override
					public void detail_clubBoard(HttpServletRequest req, Model model) {
						String club_board_code = req.getParameter("club_board_code");
						String club_name = req.getParameter("club_name");
						
						ClubBoardVO vo = dao.getBoardDetail(club_board_code);
						dao.plusReadCnt(club_board_code);
						
						model.addAttribute("vo",vo);
						model.addAttribute("club_name",club_name);
						model.addAttribute("club_board_code",club_board_code);
					}
					
					// 동호회 - 동호회 게시판 글 수정처리
					@Override
					public void club_BoardModifyPro(HttpServletRequest req, Model model) {
						int updateCnt = 0;
						String club_board_code = req.getParameter("club_board_code");
						String club_name = req.getParameter("club_name");
						String title = req.getParameter("title");
						String content = req.getParameter("content");
						
						ClubBoardVO vo = new ClubBoardVO();
						
						vo.setClub_board_code(club_board_code);
						vo.setClub_name(club_name);
						vo.setTitle(title);
						vo.setContent(content);

						updateCnt = dao.updateClubCnt(vo);
						
						model.addAttribute("updateCnt",updateCnt);
						model.addAttribute("club_name",club_name);
					}
					
					// ==========================================
		
		
	
		
		
		
	//==한결 파트
		
		//한결===========================================================
		
					
	// 공지사항 작성 처리
	@Override
	public void noticeWritePro(HttpServletRequest req, Model model) {
		String username = (String) req.getSession().getAttribute("memId");
		System.out.println("username : " + username);

		BoardVO vo = new BoardVO();
		vo.setTitle(req.getParameter("subject"));
		vo.setUsername(username);
		vo.setContent(req.getParameter("message"));
		int noticeWriteCnt = dao.noticeWrite(vo);

		System.out.println("공지사항 등록 : " + noticeWriteCnt);

		model.addAttribute("noticeWriteCnt", noticeWriteCnt);

	}
					
					
					
		@Override
		public void QnAHosts(HttpServletRequest req, Model model) {
		int  qna_code = Integer.parseInt(req.getParameter("qna_code"));
		List<BoardQnaVO> vo = dao.QnAHosts(qna_code);
		model.addAttribute("co",vo);
		
		}
			
					
					
		//답변등록
		@Override
		public void QnAAnswer(HttpServletRequest req, Model model) {
			String username=(String)req.getSession().getAttribute("memId");
			int  qna_code = Integer.parseInt(req.getParameter("qna_code"));
			String content = req.getParameter("message");
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("username", username);
			map.put("qna_code", qna_code);
			map.put("content", content);
			map.put("comment_date", new Timestamp(System.currentTimeMillis()));
			int cnt = dao.QnAAnswer(map);
			if(cnt==1) {
				cnt = dao.Qnastate(qna_code);
			}
			model.addAttribute("cnt",cnt);
			
		}			
								
			//댓글만 삭제
			@Override
			public void cDelete(HttpServletRequest req, Model model) {
				int board_code = Integer.parseInt(req.getParameter("board_code"));
				String c_code = req.getParameter("c_code");	
				int cnt = dao.cDelete(c_code);	
				model.addAttribute("cnt",cnt);
				model.addAttribute("board_code",board_code);
			}

	// 게시글 목록
	@Override
	public void boardList(HttpServletRequest req, Model model) {
		int b_cnt = 0; // 글의 갯수
		int q_cnt = 0; // qna 갯수
		int n_cnt = 0; // 공지사항

		b_cnt = dao.getBoardCnt();
		q_cnt = dao.getQnaCnt();
		n_cnt = dao.getnoticeCnt();

		System.out.println("게시글 갯수 : " + b_cnt);

		if (b_cnt > 0) { // (글갯수)cnt가 0보다 클 때 읽으러 감

			System.out.println("게시글 읽으러 옴");

			List<BoardVO> dtos = dao.getArticleList();
			model.addAttribute("dtos", dtos); // 큰바군 : 게시글 목록 cf) 작은바구니 : 게시글1
			model.addAttribute("b_cnt", b_cnt);

			List<BoardVO> ntos = dao.getNoticeArticleList();
			model.addAttribute("ntos", ntos);
			model.addAttribute("n_cnt", n_cnt);

		}

		if (q_cnt > 0) {
			System.out.println("문의사항 읽으러 옴");

			List<BoardQnaVO> qtos = dao.getQnaArticleList();
			model.addAttribute("qtos", qtos); // 큰바군 : 게시글 목록 cf) 작은바구니 : 게시글1
			model.addAttribute(q_cnt);
		}

	}

		//게시글 상세 보기                                                                                                                                                                                                             
		@Override
		public void contentForm(HttpServletRequest req, Model model) {
			
			int board_code = Integer.parseInt(req.getParameter("board_code"));
			
			System.out.println("게시글 번호 : " + board_code);
			
			dao.addReadCnt(board_code);	//조회수 증가
			
			BoardVO vo = dao.getArticle(board_code);
			
			model.addAttribute("dto", vo); //조회수는 vo가 가지고 있고 키 dto에 넘겨줌

			int commentCnt = 0; //댓글 수
			
			commentCnt = dao.getCommentCnt(board_code);
			System.out.println("댓글 수 : " + commentCnt);
			model.addAttribute("commentCnt",commentCnt);

			/*
			 * System.out.println("댓글 읽으러 옴");
			 * 
			 * List<CommentVO> co = dao.getCommentList(board_code); model.addAttribute("co",
			 * co);
			 */
			
		}
		
		//댓글 뷰
		@Override
		public void commentList(HttpServletRequest req,  Model model) {
			int board_code = Integer.parseInt(req.getParameter("board_code"));
			
			List<CommentVO> co = dao.getCommentList(board_code);
			model.addAttribute("co", co);
			
		}

		//게시글 작성 처리
//		@Override
//		public void writePro(MultipartHttpServletRequest req, Model model) {
//			
//			//String username = SecurityContextHolder.getContext().getAuthentication().getName();
//			String username = req.getRequestedSessionId();
//			System.out.println("username : " + username);
//			
//			MultipartFile file = req.getFile("jobs-application-resume");
//			System.out.println("file : " + file);
//			//임시 파일이 저장되는 논리적인 경로
//			String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");
//			//업로드할 파일이 위치하게될 물리적인 경로
//			String realDir = "C:\\프로그램\\workspace_mybatis\\spring_pj\\spring_PJ\\src\\main\\webapp\\resources\\upload\\";
//			
//			try {
//				file.transferTo(new File(saveDir+file.getOriginalFilename()));
//				
//				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
//				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
//				int data = 0;
//				while((data = fis.read()) != -1) {
//					fos.write(data);
//				}
//				fis.close();
//				fos.close();
	//
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			
//			BoardVO vo = new BoardVO();
//			vo.setTitle(req.getParameter("title"));
//			vo.setUsername(username);                                                                  
//			vo.setContent(req.getParameter("jobs-application-message"));
//			vo.setBoard_image(file.getOriginalFilename());
//			int boardWriteCnt = dao.boardWrite(vo);
//			
//			System.out.println("게시글 등록 : " + boardWriteCnt);
//			
//			model.addAttribute("boardWriteCnt", boardWriteCnt);
//		}
		//게시글 작성 처리
		@Override
		public void writePro(HttpServletRequest req, Model model) {
			
			//String username = SecurityContextHolder.getContext().getAuthentication().getName();
			//String username = req.getRequestedSessionId();
			String username = (String)req.getSession().getAttribute("memId");
			System.out.println("username : " + username);
			
			BoardVO vo = new BoardVO();
			vo.setTitle(req.getParameter("title"));
			vo.setUsername(username);                                                                  
			vo.setContent(req.getParameter("jobs-application-message"));
			int boardWriteCnt = dao.boardWrite(vo);
			
			System.out.println("게시글 등록 : " + boardWriteCnt);
			
			model.addAttribute("boardWriteCnt", boardWriteCnt);
		}

		//댓글 등록
		@Override
		public void commentIn(HttpServletRequest req, Model model) {
			//String username = SecurityContextHolder.getContext().getAuthentication().getName();
			int board_code = Integer.parseInt(req.getParameter("board_code"));
			
			CommentVO vo = new CommentVO();
			
			//vo.setUsername(username);
			String username=(String)req.getSession().getAttribute("memId");
			vo.setUsername(username);
			vo.setBoard_code(board_code);
			vo.setContent(req.getParameter("comment"));
			System.out.println("댓글"+req.getParameter("comment"));
			System.out.println("댓글"+username);
			System.out.println("댓글"+board_code);
			int commentInsert = dao.commentWrite(vo);
			
			System.out.println("댓글 등록: " + commentInsert);
			
			model.addAttribute("commentInsert", commentInsert);
			
			
		}

		//게시글 삭제
		@Override
		public void b_delete(HttpServletRequest req, Model model) {
			int board_code = Integer.parseInt(req.getParameter("board_code"));
			
			System.out.println("삭제 게시글 번호 : " + board_code);
			//게시글 삭제
			int board_delete = dao.b_delete(board_code);
			
			System.out.println("삭제 : " + board_delete);
			
			int comment_delete = 0;
			if(board_delete == 1) {
				comment_delete = dao.c_delete(board_code);
				
				model.addAttribute("board_delete",board_delete);
				model.addAttribute("board_code", board_code);
			}
		}
		
		//qna삭제
		@Override
		public void q_delete(HttpServletRequest req, Model model) {
			int qna_code = Integer.parseInt(req.getParameter("qna_code"));
			
			System.out.println("삭제 qna글 번호 : " + qna_code);
			//게시글 삭제
			int qna_delete = dao.q_delete(qna_code);
			
			System.out.println("삭제 : " + qna_delete);
			
			int qna_comment_delete = 0;
			if(qna_delete == 1) {
				qna_comment_delete = dao.qc_delete(qna_code);
				
				model.addAttribute("qna_delete",qna_delete);
				model.addAttribute("board_code", qna_code);
			}
		}
		
		
		//게시글 수정 뷰
		@Override
		public void b_modify_view(HttpServletRequest req, Model model) {
			int board_code = Integer.parseInt(req.getParameter("board_code"));
			
			System.out.println("수정할 게시글 번호 : " + board_code);
			//String username = SecurityContextHolder.getContext().getAuthentication().getName();

			BoardVO vo = dao.getArticle(board_code);
			model.addAttribute("dto", vo);
		}

		//게시글 수정
		@Override
		public void b_modify(HttpServletRequest req, Model model) {
			int board_code = Integer.parseInt(req.getParameter("board_code"));
			
			//String username = SecurityContextHolder.getContext().getAuthentication().getName();
			String username = req.getParameter("username");
			System.out.println("username : " + username);
			BoardVO vo = new BoardVO();
			vo.setBoard_code(board_code);
			vo.setTitle(req.getParameter("title"));
			vo.setUsername(username);                                                                  
			vo.setContent(req.getParameter("jobs-application-message"));
//			vo.setBoard_image(file.getOriginalFilename());
			int boardUpdate = dao.boardUpdate(vo);
			
			System.out.println("게시글 수정 : " + boardUpdate);
			
			model.addAttribute("boardUpdate", boardUpdate);
			model.addAttribute("board_code", board_code);
		}
		
		//qna 수정 뷰
		@Override
		public void q_modify_view(HttpServletRequest req, Model model) {
			int qna_code = Integer.parseInt(req.getParameter("qna_code"));
			
			System.out.println("qna 번호 : " + qna_code);
			//String username = SecurityContextHolder.getContext().getAuthentication().getName();

			BoardQnaVO vo = dao.getQnaArticle(qna_code);
			model.addAttribute("qto", vo);
		}
		
		//qna 수정처리
		@Override
		public void q_modify(HttpServletRequest req, Model model) {
			int qna_code = Integer.parseInt(req.getParameter("qna_code"));
			String username = req.getParameter("username");
			
			System.out.println("qna 번호 : " + qna_code);
			System.out.println("작성자 : " + username);
			
			BoardQnaVO vo = new BoardQnaVO();
			
			vo.setQna_code(qna_code);
			vo.setQna_password(req.getParameter("qna_password"));
			System.out.println("비밀번호????"+req.getParameter("qna_password"));
			vo.setTitle(req.getParameter("title"));
			vo.setUsername(username);                                                                  
			vo.setContent(req.getParameter("jobs-application-message"));
			vo.setKind(req.getParameter("template-contactform-default-select"));
			int qnaUpdateCnt = dao.qnaUpdate(vo);
			
			System.out.println("QNA수정 처리여부 : " + qnaUpdateCnt);
			
			model.addAttribute("qnaUpdateCnt", qnaUpdateCnt);

		}

		//QnA 작성 처리
		@Override
		public void qnaWritePro(HttpServletRequest req, Model model) {
			String username = (String)req.getSession().getAttribute("memId");
			System.out.println("username : " + username);
			
			BoardQnaVO vo = new BoardQnaVO();
			
			vo.setQna_password(req.getParameter("qna_password"));
			vo.setTitle(req.getParameter("title"));
			vo.setUsername(username);                                                                  
			vo.setContent(req.getParameter("jobs-application-message"));
			vo.setKind(req.getParameter("template-contactform-default-select"));
			
			int qnaWriteCnt = dao.qnaWrite(vo);
			
			System.out.println("문의글 등록 : " + qnaWriteCnt);
			
			model.addAttribute("qnaWriteCnt", qnaWriteCnt);
		}

		//비밀번호 확인
		@Override
		public void pwdConfirm(HttpServletRequest req, Model model) {
			String qna_password = req.getParameter("qna_password");
			int qna_code = Integer.parseInt(req.getParameter("qna_code"));
			//String username = req.getParameter("username");
			
			System.out.println("qna_code : " + qna_code);
			System.out.println("pwd : " + qna_password);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("qna_code", qna_code);
			map.put("qna_password", qna_password);
			
			//map.put("username", username);
			int pwdconfirm = dao.getPwdConfirm(map);
			
			System.out.println("비밀번호 확인 : " + pwdconfirm);
			
			if(pwdconfirm >0) {
							
				dao.addQnAReadCnt(qna_code);	//조회수 증가
				
				BoardQnaVO vo = dao.getQnaArticle(qna_code);
				
				model.addAttribute("dto", vo); //조회수는 vo가 가지고 있고 키 dto에 넘겨줌

				int commentCnt = 0; //댓글 수
				
				commentCnt = dao.getQnaCommentCnt(qna_code);
				System.out.println("댓글 수 : " + commentCnt);
				model.addAttribute("commentCnt",commentCnt);
				model.addAttribute("pwdconfirm",pwdconfirm);
			}
			model.addAttribute("pwdconfirm",pwdconfirm);
		}


		@Override
		public void add(HttpServletRequest req, Model model) {
			int qna_code = Integer.parseInt(req.getParameter("qna_code"));
			
			model.addAttribute("qna_code", qna_code);
		}

		//host 한결==========================start==========================================
		//호스트 QNA읽기
		@Override
		public void host_qnaContent(HttpServletRequest req, Model model) {
			int qna_code = Integer.parseInt(req.getParameter("qna_code"));
			BoardQnaVO vo = dao.getQnaArticle(qna_code);
			
			model.addAttribute("dto", vo); //조회수는 vo가 가지고 있고 키 dto에 넘겨줌
		}

		
		
		
		
	// 공지사항 리스트
	@Override
	public void noticeList(HttpServletRequest req, Model model) {
		int n_cnt = 0; // 공지사항 갯수

		n_cnt = dao.getnoticeCnt();

		System.out.println("공지사항 갯수 : " + n_cnt);

		if (n_cnt > 0) { // (글갯수)cnt가 0보다 클 때 읽으러 감

			System.out.println("공지사항 읽으러 옴");

			List<BoardVO> dtos = dao.getNoticeArticleList();
			model.addAttribute("dtos", dtos); // 큰바군 : 게시글 목록 cf) 작은바구니 : 게시글1
			model.addAttribute(n_cnt);

		}

	}

	// 공지사항 보기
	@Override
	public void notice_contentForm(HttpServletRequest req, Model model) {
		int board_code = Integer.parseInt(req.getParameter("board_code"));

		System.out.println("게시글 번호 : " + board_code);

		dao.addReadCnt(board_code); // 조회수 증가

		BoardVO vo = dao.getNoticeArticle(board_code);

		model.addAttribute("dto", vo); // 조회수는 vo가 가지고 있고 키 dto에 넘겨줌

	}

	// notice modify view
	@Override
	public void n_modify_view(HttpServletRequest req, Model model) {
		int board_code = Integer.parseInt(req.getParameter("board_code"));

		System.out.println("수정할 공지사항 번호 : " + board_code);
		// String username =
		// SecurityContextHolder.getContext().getAuthentication().getName();

		BoardVO vo = dao.getNoticeArticle(board_code);
		model.addAttribute("dto", vo);
	}

	// notice modify pro
	// notice modify pro
	// notice modify pro
	@Override
	public void n_modify(HttpServletRequest req, Model model) {
		int board_code = Integer.parseInt(req.getParameter("board_code"));
		String username = (String)req.getSession().getAttribute("memId");

		System.out.println("board_code 번호 : " + board_code);
		System.out.println("관리자 : " + username);

		BoardVO vo = new BoardVO();

		vo.setBoard_code(board_code);
		vo.setTitle(req.getParameter("subject"));
		vo.setUsername(username);
		vo.setContent(req.getParameter("message"));
		int boardUpdate = dao.boardUpdate(vo);

		System.out.println("문의글 등록 : " + boardUpdate);

		model.addAttribute("boardUpdate", boardUpdate);
		model.addAttribute("board_code", board_code);
	}




	//내 질문 목록
	@Override
	public void myQnaList(HttpServletRequest req, Model model) {
		
		//현재 로그인된 아이디 받음
		String username = (String)req.getSession().getAttribute("memId");
		
		int pageSize = 5;    //한 페이지당 출력할 게시글 수
		int pageBlock = 3;   //한 블럭당 페이지 갯수
		
		int cnt = 0;		 //글 갯수
		int start = 0;		 //현재 페이지의 시작 글번호
		int end = 0;		 //현재 페이지의 마지막 글번호
		int number = 0;		 //출력용 글번호 //글이 삭제됐을 때(30,29,28,25) 화면상으로는 (28,27,26,25) 출력되게 하는 용
		String pageNum = ""; //페이지 번호
		int currentPage = 0; //현재 페이지
		
		int pageCount = 0;	 //페이지 갯수
		int startPage = 0;	 //시작 페이지
		int endPage = 0;	 //마지막 페이지
		
		cnt = dao.getmyArticleCnt(username);
		
		System.out.println("cnt : " + cnt); 

		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	//첫 페이지를 1로 지정
		}
		
		//글 30건 기준
		currentPage = Integer.parseInt(pageNum); //현재 페이지 : 1
		System.out.println("currentPage : " + currentPage);
		
		//페이지 갯수 6 = (30 / 5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); //페이지 갯수 + 나머지 있으면 +1
		
		//현재 페이지 시작 글번호 (페이지별)
		// 1 = (1 - 1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;
		
		//현재 페이지의 마지막 글번호(페이지별)
		// 5 = 1 + 5 - 1
		end = start + pageSize - 1;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		System.out.println("username : " + username);
		//현재페이지의 마지막 글번호가 글 갯수보다 클 때 ...마지막글번호에 글갯수 대입(저장)
		if(end > cnt) end = cnt;
		
		//출력용 글번호
		//30 = 30 - ( 1 - 1 ) * 5
		number = cnt - (currentPage - 1) * pageSize;
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("username",username);
		
		if(cnt > 0) { //(글갯수)cnt가 0보다 클 때 읽으러 감
			
			List<BoardQnaVO> dtoqs = dao.getmyArticleList(map);
			
			if(dtoqs != null) {
				System.out.println("ddddddddddddddddddddddddddddddddddd"+dtoqs.get(0).getTitle());
			} else {
				System.out.println("null");
			}
			
			model.addAttribute("dtoqs", dtoqs); 	//큰바군 : 게시글 목록 cf) 작은바구니 : 게시글1
		}
		
		//6단계. requeset나 session에 처리 결과를 저장(jsp에 전달하기 위함)
		
		//시작페이지
		// 1 = (1 / 3) * 3 + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : " + startPage);
		
		//마지막페이지
		// 3 = 1 + 3 - 1;
		endPage = startPage + pageBlock - 1;
		
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		
		System.out.println("===================================");

		model.addAttribute("cnt", cnt); //글 갯수
		model.addAttribute("number", number); //출력용 글번호
		model.addAttribute("pageNum", pageNum); //페이지 번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); //시작페이지
			model.addAttribute("endPage", endPage); //마지막페이지
			model.addAttribute("pageBlock", pageBlock); //출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); //페이지 갯수
			model.addAttribute("currentPage", currentPage); //현재 페이지
		}
	}
	//==한결 파트 종료	
		
		
			// 재관 시작 - 관리자	
			@Override
			public void diseaseList(HttpServletRequest req, Model model) {
				// 페이징 처리
				int pageSize = 10;		// 한페이지당 출력할 갯수
				int pageBlock = 3;		// 한 블럭당 페이지 갯수
				
				int cnt = 0;			// 질병정보갯수
				int start = 0 ;			// 현재페이지 시작 목록번호
				int end = 0;			// 현재페이지 마지막 목록번호
				int number = 0;			// 출력용 목록번호
				String pageNum = "";	// 페이지 번호
				int currentPage = 0;	// 현재 페이지
				
				int pageCount = 0;		// 페이지 갯수
				int startPage = 0;		// 시작 페이지
				int endPage = 0; 		// 마지막 페이지
				
				// 질병정보갯수 구하기
				cnt = dao.getDiseaseCount();
				
				System.out.println("질병정보 cnt : " + cnt);		
					
				pageNum = req.getParameter("pageNum");
				
				if(pageNum == null) {
					pageNum = "1"; // 첫페이지를 1페이지로 지정
				}
				
				// 5건 기준
				currentPage = Integer.parseInt(pageNum); // 현재페이지 : 1
				System.out.println("currentPage : " + currentPage);
				
				// 페이지 갯수 
				pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1
				
				// 현재페이지 시작 번호(페이지별)
				start = (currentPage - 1) * pageSize + 1;
				
				// 현재페이지 마지막 번호(페이지별)
				end = start + pageSize - 1;
				
				System.out.println("start : " + start);
				System.out.println("end : " + end);
				
				if(end > cnt) end = cnt;
				
				// 출력용 목록번호
				number = cnt - (currentPage - 1) * pageSize;
				
				System.out.println("number : " + number);
				System.out.println("pageSize : " + pageSize);
				
				// 검색어 받기
				String s_code = req.getParameter("disease_code");
				String s_name = req.getParameter("disease_name");
				String d_end = req.getParameter("d_end");
				if(d_end != null) end=Integer.parseInt(d_end);  // 유저쪽 검색은 페이지 구분이 없음
				
				// 질병정보 목록 조회
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("start", start);
				map.put("end", end);
				map.put("s_code", s_code);
				map.put("s_name", s_name);
				if(cnt > 0) {
					List<DiseaseVO> dtos = dao.getDiseaseList(map);
					model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은 바구니 : 게시글1건
				}
				
				// model이나 session에 처리 결과를 저장(jsp에 전달하기 위함)		
				// 시작페이지
				startPage = (currentPage / pageBlock) * pageBlock + 1;
				
				if(currentPage % pageBlock == 0) startPage -= pageBlock;
				System.out.println("startPage : " + startPage);
				
				// 마지막페이지
				endPage = startPage + pageBlock - 1;
				
				if(endPage > pageCount) endPage = pageCount;
				System.out.println("endPage : " + endPage);
				
				System.out.println("====================");
				
				model.addAttribute("cnt", cnt); 		// 항목갯수
				model.addAttribute("number", number); 	// 출력용 번호
				model.addAttribute("pageNum", pageNum);	// 페이지번호
				
				if(cnt > 0) {
					model.addAttribute("startPage", startPage);		// 시작페이지
					model.addAttribute("endPage", endPage);			// 마지막페이지
					model.addAttribute("pageBlock", pageBlock);		// 출력할 페이지 갯수
					model.addAttribute("pageCount", pageCount); 	// 페이지 갯수
					model.addAttribute("currentPage", currentPage);	// 현재페이지
				}
				
			}

			// 질병정보 상세페이지 
			@Override
			public void diseaseModifyView(HttpServletRequest req, Model model) {
				String disease_code = req.getParameter("disease_code");
				int pageNum = Integer.parseInt(req.getParameter("pageNum"));
						
				// 해당글 1건을 읽어서 DiseaseVO 바구니에 담는다.
				DiseaseVO vo = dao.getDisease(disease_code);
						
				// model이나 session에 처리 결과를 저장(jsp에 전달하기 위함)		
				model.addAttribute("dto", vo);
				// req.setAttribute("selectCnt", selectCnt); 
				model.addAttribute("disease_code", disease_code);
				model.addAttribute("pageNum", pageNum);
				
			}

			// 질병코드 중복체크
			@Override
			public int diseaseCodeCheck(HttpServletRequest req, Model model) {
				String disease_code = req.getParameter("disease_code");	
				// 중복된 code가 있는지 확인한다.
				int cnt = dao.diseaseCodeCheck(disease_code);
				// System.out.println("cnt : " + cnt);		
				
				return cnt;
			}
				
			// 질병등록처리 
			@Override
			public void diseaseInsertPro(HttpServletRequest req, Model model) {
				String disease_code= req.getParameter("disease_code");
			      String d_code = disease_code.toUpperCase();
			      
			        // DiseaseVO 바구니 생성 
			        DiseaseVO vo = new DiseaseVO();
			      // 화면으로부터 입력받은 값을 받아와서 바구니에 담는다.
			     vo.setDisease_code(d_code);
				vo.setDisease_name(req.getParameter("disease_name"));
				vo.setD_category(req.getParameter("d_category"));
				vo.setDefinition(req.getParameter("definition"));
				vo.setCause(req.getParameter("cause"));
				vo.setSymptom(req.getParameter("symptom"));
				vo.setCure(req.getParameter("cure"));

				// 질병정보등록 처리
				int insertCnt = dao.insertDisease(vo);
				System.out.println("insertCnt : " + insertCnt);
				   			
			    // model에 처리 결과를 저장(jsp에 전달하기 위함)
			    model.addAttribute("insertCnt", insertCnt); 
				
			}
				

			// 질병수정 처리
			@Override
			public void diseaseModifyPro(HttpServletRequest req, Model model) {
				String disease_code = req.getParameter("disease_code");
				int pageNum = Integer.parseInt(req.getParameter("pageNum"));

				// DiseaseVO 바구니 생성 
				DiseaseVO vo = new DiseaseVO();
				// 화면으로부터 입력받은 값을 받아와서 바구니에 담는다.
				vo.setDisease_code(req.getParameter("disease_code"));
				vo.setDisease_name(req.getParameter("disease_name"));
				vo.setD_category(req.getParameter("d_category"));
				vo.setDefinition(req.getParameter("definition"));
				vo.setCause(req.getParameter("cause"));
				vo.setSymptom(req.getParameter("symptom"));
				vo.setCure(req.getParameter("cure"));
			   
			   
			    // 수정 처리 
			    int updateCnt = dao.updateDisease(vo);
			    System.out.println("updateCnt : " + updateCnt);
			   
			    // 처리 결과를 저장(jsp에 전달하기 위함)
			    model.addAttribute("updateCnt", updateCnt);
			    model.addAttribute("disease_code", disease_code);
			    model.addAttribute("pageNum", pageNum);
				
			}


			// 질병삭제 처리
			@Override
			public void diseaseDeletePro(HttpServletRequest req, Model model) {
				int pageNum = Integer.parseInt(req.getParameter("pageNum"));
				String[] codes = req.getParameterValues("check");
						
				int deleteCnt = 0;
				// 삭제처리
				for(int i=0; i<codes.length; i++) {
					deleteCnt = dao.deleteDisease(codes[i]);
				}	
				// model에 처리 결과를 저장(jsp에 전달하기 위함)
				model.addAttribute("pageNum", pageNum);
				model.addAttribute("deleteCnt", deleteCnt);		
			}
			// 회원리스트
			@Override
			public void userList(HttpServletRequest req, Model model) {
				// 페이징 처리
				int pageSize = 10;		// 한페이지당 출력할 상품 갯수
				int pageBlock = 3;		// 한 블럭당 페이지 갯수
				
				int cnt = 0;			// 상품갯수
				int start = 0 ;			// 현재페이지 시작 목록번호
				int end = 0;			// 현재페이지 마지막 목록번호
				int number = 0;			// 출력용 목록번호
				String pageNum = "";	// 페이지 번호
				int currentPage = 0;	// 현재 페이지
				
				int pageCount = 0;		// 페이지 갯수
				int startPage = 0;		// 시작 페이지
				int endPage = 0; 		// 마지막 페이지
				
				//  회원수 구하기
				cnt = dao.getUserCnt();
				
				System.out.println("cnt : " + cnt);	 // 먼저 테이블에 30건 insert	
					
				pageNum = req.getParameter("pageNum");
				
				if(pageNum == null) {
					pageNum = "1"; // 첫페이지를 1페이지로 지정
				}
				
				// 회원 30건 기준
				currentPage = Integer.parseInt(pageNum); // 현재페이지 : 1
				System.out.println("currentPage : " + currentPage);
				
				// 페이지 갯수 
				pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1
				
				// 현재페이지 시작 글번호(페이지별)
				start = (currentPage - 1) * pageSize + 1;
				
				// 현재페이지 마지막 글번호(페이지별)
				end = start + pageSize - 1;
				
				System.out.println("start : " + start);
				System.out.println("end : " + end);
				
				if(end > cnt) end = cnt;
				
				// 출력용 목록번호
				number = cnt - (currentPage - 1) * pageSize;
				
				System.out.println("number : " + number);
				System.out.println("pageSize : " + pageSize);
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("start", start);
				map.put("end", end);
				// 게시글 목록 조회
				if(cnt > 0) {
					List<UsersVO> dtos = dao.getUserList(map);
					// model이나 session에 처리 결과를 저장(jsp에 전달하기 위함)
					model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf) 작은 바구니 : 게시글1건
				}
				
				
				// 시작페이지
				startPage = (currentPage / pageBlock) * pageBlock + 1;
				
				if(currentPage % pageBlock == 0) startPage -= pageBlock;
				System.out.println("startPage : " + startPage);
				
				// 마지막페이지
				endPage = startPage + pageBlock - 1;
				
				if(endPage > pageCount) endPage = pageCount;
				System.out.println("endPage : " + endPage);
				
				System.out.println("====================");
				
				model.addAttribute("cnt", cnt); 		// 회원수
				model.addAttribute("number", number); 	// 출력용 글번호
				model.addAttribute("pageNum", pageNum);	// 페이지번호
				
				if(cnt > 0) {
					model.addAttribute("startPage", startPage);		// 시작페이지
					model.addAttribute("endPage", endPage);			// 마지막페이지
					model.addAttribute("pageBlock", pageBlock);		// 출력할 페이지 갯수
					model.addAttribute("pageCount", pageCount); 	// 페이지 갯수
					model.addAttribute("currentPage", currentPage);	// 현재페이지			
				}
				
			}

			// 회원강제탈퇴
			@Override
			public void userDel(HttpServletRequest req, Model model) {
				int pageNum = Integer.parseInt(req.getParameter("pageNum"));
				String[] usernames = req.getParameterValues("check");
						
				int deleteCnt = 0;
				// 삭제처리
				for(int i=0; i<usernames.length; i++) {
					deleteCnt = dao.deleteMember(usernames[i]);
				}	
				// model에 처리 결과를 저장(jsp에 전달하기 위함)
				model.addAttribute("pageNum", pageNum);
				model.addAttribute("deleteCnt", deleteCnt);		
			}
			
			// 회원 통계
			@Override
			public void userStatistics(HttpServletRequest req, Model model) {
				// 성별 회원수
				Map<String, Integer> map = dao.getGenderChart();
				
				// model이나 session에 처리결과를 저장(jsp에 전달하기 위함)
				model.addAttribute("genderChart", map);
			}
			// 회원 최근 가입목록
			@Override
			public void userRecentList(HttpServletRequest req, Model model) {		
				// 회원수 구하기
				int cnt = dao.getUserCnt();
				
				// 회원 최근 가입자 리스트
				if(cnt > 0) {
					List<UsersVO> dtos = dao.recentJoinUser();
					model.addAttribute("dtos", dtos); 
				}		
				
				// model이나  session에 처리 결과를 저장(jsp에 전달하기 위함)
				model.addAttribute("cnt", cnt); 			
			}	
			
		//==재관 관리자 종료

		
		
	// ==재관 유저 시작
	// 질병상세정보보기
	@Override
	public void diseaseView(HttpServletRequest req, Model model) {
		String disease_code = req.getParameter("disease_code");

		// 해당글 1건을 읽어서 DiseaseVO 바구니에 담는다.
		DiseaseVO vo = dao.getDisease(disease_code);

		// model이나 session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("dto", vo);
		model.addAttribute("disease_code", disease_code);
	}

	// 건강정보 불러오기
	@Override
	public void getUserInfo(HttpServletRequest req, Model model) {
		// 화면으로부터 입력받은 값을 받아온다.
		String username = (String) req.getSession().getAttribute("memId");

		// 유저 정보가 있는지 확인한다
		int selectCnt = dao.checkUserInfo(username);

		// 있으면 vo에 담아서 전달
		if (selectCnt == 1) {
			UserInfoVO ivo = dao.getUserInfo(username);
			model.addAttribute("ivo", ivo);
		}

		// model에 처리결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("selectCnt", selectCnt);
	}

	// 건강정보 입력 처리
	@Override
	public void userInfoRegPro(HttpServletRequest req, Model model) {
		// 화면으로부터 입력받은 값을 받아온다.
		String username = (String) req.getSession().getAttribute("memId");

		// vo에 담는다.
		UserInfoVO vo = new UserInfoVO();
		vo.setUsername(username);
		vo.setHeight(Float.parseFloat(req.getParameter("height")));
		vo.setWeight(Float.parseFloat(req.getParameter("weight")));
		vo.setBmi(Float.parseFloat(req.getParameter("bmi")));
		vo.setSightL(Float.parseFloat(req.getParameter("sightL")));
		vo.setSightR(Float.parseFloat(req.getParameter("sightR")));
		vo.setGlucose(Integer.parseInt(req.getParameter("glucose")));
		vo.setPressure(Integer.parseInt(req.getParameter("pressure")));
		vo.setPressure2(Integer.parseInt(req.getParameter("pressure2")));
		vo.setSmokeAmount(Integer.parseInt(req.getParameter("smokeAmount")));
		vo.setDrinkAmount(Integer.parseInt(req.getParameter("drinkAmount")));

		int insertCnt = dao.insertUserInfo(vo);

		// model에 처리결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("insertCnt", insertCnt);
	}

	// 건강정보 수정 처리
	@Override
	public void userInfoModifyPro(HttpServletRequest req, Model model) {
		String username = (String) req.getSession().getAttribute("memId");

		// vo에 담는다.
		UserInfoVO vo = new UserInfoVO();
		vo.setUsername(username);
		vo.setHeight(Float.parseFloat(req.getParameter("height")));
		vo.setWeight(Float.parseFloat(req.getParameter("weight")));
		vo.setBmi(Float.parseFloat(req.getParameter("bmi")));
		vo.setSightL(Float.parseFloat(req.getParameter("sightL")));
		vo.setSightR(Float.parseFloat(req.getParameter("sightR")));
		vo.setGlucose(Integer.parseInt(req.getParameter("glucose")));
		vo.setPressure(Integer.parseInt(req.getParameter("pressure")));
		vo.setPressure2(Integer.parseInt(req.getParameter("pressure2")));
		vo.setSmokeAmount(Integer.parseInt(req.getParameter("smokeAmount")));
		vo.setDrinkAmount(Integer.parseInt(req.getParameter("drinkAmount")));

		int updateCnt = dao.updateUserInfo(vo);

		// model에 처리결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("updateCnt", updateCnt);
	}
	// 재관 유저 끝

	@Override
	public void crawlArticle(HttpServletRequest req, Model model) throws IOException {
		
		// 기사 사이트 1번 페이지(최신 기사) html 파일 가져옴
		Document doc = Jsoup.connect(NEWSURL + "nowcode=1&pn=1").get();
			
		// 이미지와 기사 요약내용을 따올 Elements
		// 기사가 있는 태그는 dl 태그 중 list_item 클래스만 있음
		Elements newsList = doc.select("dl.list_item");
			
		// 기사 목록을 담을 기사 바구니 생성
		List<NewsVO> newsDtos = new ArrayList<>();
		    
	 	// 기사의 갯수만큼 for문을 돈다.
		for (int i = 0; i < 8; i++) {
			
			// NewsVO 생성
			NewsVO news = new NewsVO();
		    	
			// 뉴스 제목 크롤링
			Element newsATag = newsList.get(i).select("dt a").get(0);
			news.setNewsTitle(newsATag.text());
				
			// 뉴스 일자 크롤링
			Element newsDate = newsList.get(i).select("dl.list_item dd.date_author span.date").get(0);
			news.setNewsDate(newsDate.text());
				
			// 뉴스 저자 크롤링
			Element newsAuthor = newsList.get(i).select("dl.list_item dd.date_author span.author").get(0);
			news.setNewsAuthor(newsAuthor.text());
				
			// 뉴스 기사 요약 내용 크롤링
			Element newsSummary = newsList.get(i).select("dd.desc a").get(0);
			news.setNewsSummary(newsSummary.text());
				
			// 뉴스 기사 상세 내용 페이지 크롤링
			// 1. 뉴스 상세 내용 페이지 URL 대입
			String newsUrl = "http://health.chosun.com" + newsATag.attr("href");
				
			news.setNewsUrl(newsUrl);
				
			// Jsoup으로 뉴스 상세 내용 페이지 URL html문서 get 
			Document detailNews = Jsoup.connect(newsUrl).get();
				
			// 기사 상세 내용 페이지에서 실제 기사 내용이 담긴 <p> 태그를 크롤링 
			Elements detailNewsContents = detailNews.select(".news_body .par > p");
				
			String newsContents = "";
				
			for (Element newsPTag : detailNewsContents) {
				// <p> 태그의 문자 내용들을 newsContents에 담는다.
				newsContents += newsPTag.text() + "  ";
			}
				
			news.setNewsContents(newsContents);
				
			// 썸네일 이미지 주소를 받아와서 setter에 썸네일 이미지 넣기
			if(detailNewsContents.select(".news_imgbox img") != null) {
				try {
					// 기사들 중 i번째의 thumb 클래스의 dd 태그의 img 태그에서 0번째의 src를 가져오는 이유는
					// 어짜피 i번째의 기사는 하나이기 때문에
					news.setNewsThumbnail(detailNews.select(".news_imgbox img").attr("src"));
				} catch (Exception e) {
					// System.out.println("IndexOutOfBoundsException 발생");
				}
			}
				
				
			newsDtos.add(news);
		}
			
		model.addAttribute("newsDtos", newsDtos);
		
	}

	// 동호회 개설 취소
		@Override
		public void cancel_club(HttpServletRequest req, Model model) {
			String club_name = req.getParameter("club_name");
			
			dao.deleteClub(club_name);
			
		}


						


	


	




	
		
		//==재관 유저 종료
}


