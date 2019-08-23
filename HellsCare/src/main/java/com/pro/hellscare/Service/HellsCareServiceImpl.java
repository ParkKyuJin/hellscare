package com.pro.hellscare.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

import com.pro.hellscare.VO.BoardVO;
import com.pro.hellscare.VO.CommentVO;
import com.pro.hellscare.VO.DayWeather;
import com.pro.hellscare.VO.DiseaseVO;
import com.pro.hellscare.VO.ExerciseVO;
import com.pro.hellscare.VO.NewsVO;
import com.pro.hellscare.VO.WeatherVO;
import com.pro.hellscare.VO.WindInfo;
import com.pro.hellscare.VO.challengeVO;
import com.pro.hellscare.persistence.HellsCareDAO;



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
	BCryptPasswordEncoder passwordEncoder;
	
	
	
	//뉴스기사 크롤링 서비스 
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


//==이나현 시작
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
			String encryptPassword = passwordEncoder.encode(password); 
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
		
		//회원가입_이메일인증
		@Override
	    public void emailChk(HttpServletRequest req, Model model) {
	        String email = req.getParameter("email");
	        req.getSession().setAttribute("email", email);
	        
	        System.out.println("email : " + email);
	        
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
	        
	        String key = temp.toString();// StringBuffer 형식인 Key를 String으로 변환
	        System.out.println("key : " + key);
	        req.getSession().setAttribute("key", key);
	        model.addAttribute("cnt", 1);
	        
	        dao.sendmail(email, key);
	        
	}
	
	
	
//== 이나현 끝
	
	
	
	
	
	
	
//=============호스트 서비스	
	
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
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("challenge_name", c_name);
		map.put("challenge_content", c_content);
		map.put("challenge_gift", c_point);
		map.put("challenge_img", c_img);
		map.put("challange_date", new Timestamp(System.currentTimeMillis()));
	
	    int cnt = dao.challengePro(map);
		model.addAttribute("cnt", cnt); 
		}catch(IOException e){
			e.printStackTrace();
		}
		
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

	
		@Override
		public void diseaseList(HttpServletRequest req, Model model) {
			// 페이징 처리
			int pageSize = 5;		// 한페이지당 출력할 상품 갯수
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
			
			// 상품 5건 기준
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
			
			// 검색어어 받기
			String s_code = req.getParameter("disease_code");
			String s_name = req.getParameter("disease_name");
			
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
//			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
//	  		System.out.println("pageNum: "+pageNum);      
			   
	  		
	  		// HostStockVO 바구니 생성 
	  		DiseaseVO vo = new DiseaseVO();
			// 화면으로부터 입력받은 값을 받아와서 바구니에 담는다.
			vo.setDisease_code(req.getParameter("disease_code"));
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
//		    model.addAttribute("pageNum", pageNum);
			
		}
			

		// 질병수정 처리
		@Override
		public void diseaseModifyPro(HttpServletRequest req, Model model) {
			String disease_code = req.getParameter("disease_code");
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		    // System.out.println(disease_code + "              " +pageNum);           

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



		
		//=====예찬 서비스 시작
		// 관리자 - 운동등록처리 / 파일업로드처리
		@Override
		public void exerciseAddPro(MultipartHttpServletRequest req, Model model) {
			String part = "";

			MultipartFile file = req.getFile("img");
			MultipartFile file2 = req.getFile("video");

			@SuppressWarnings("deprecation")
			String saveDir = req.getRealPath("/resources/video/");

			String realDir = "C:\\Users\\park\\workspace_git\\hellscare\\hellscare\\HellsCare\\src\\main\\webapp\\resources\\video\\";

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
			
			ExerciseVO vo = dao.detailExercise(exercise_code);
			
			model.addAttribute("vo",vo);
		}

		// 운동 - 즐겨찾기 추가
		@Override
		public void addFavorit(HttpServletRequest req, Model model) {
			String username = (String) req.getSession().getAttribute("username");
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
			
			List<ExerciseVO> dtos = dao.getPartList(part);
			
			model.addAttribute("dtos",dtos);
			model.addAttribute("part",part);
		}
		
		
		//=====예찬 서비스 종료
		
		
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
				
			// 시간대에 따른 날씨정보
			for (int i = 0; i < times.size(); i++) {
				int temperature, precipitation, windSpeed, humidity;
				String direction, weatherDescription;
				
				// 0 ~ 31 : 오늘 날씨 정보
				if(i >=0 && i <= 31) {
					
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
				
			Elements raindrops = weatherPage.select(".cs_weather .main_info .info_data .info_list li .indicator");
				
			String[] raindropArr = raindrops.text().split(" ");
			String check = raindropArr[0].trim();
			weather.setCheckWeather(check);
			
			// 흐릴 때는 시간별 강수량
			if(check.contains("시간")) {
				String rainfallOnHour = weatherPage.select(".cs_weather .main_info .info_data .info_list li .rainfall em span").text();
				weather.setRainfallOnHour(Double.parseDouble(rainfallOnHour));
			} else {
				String ultraVioletRay = weatherPage.select(".cs_weather .main_info .info_data .info_list li .indicator span .num").text();
				weather.setUltraVioletRay(Integer.parseInt(ultraVioletRay.trim()));
			}
				
			model.addAttribute("weather", weather);
		}
		
		
	//==한결 파트
		
		//게시글 목록
		@Override
		public void boardList(HttpServletRequest req, Model model) {
			int cnt = 0; //글의 갯수
			
			cnt = dao.getBoardCnt();
			System.out.println("게시글 갯수 : " + cnt);
			
			
			if(cnt > 0) { //(글갯수)cnt가 0보다 클 때 읽으러 감
				
				System.out.println("읽으러 옴");
				
				List<BoardVO> dtos = dao.getArticleList();
				model.addAttribute("dtos", dtos); 	//큰바군 : 게시글 목록 cf) 작은바구니 : 게시글1
				model.addAttribute(cnt);
				
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
		@Override
		public void writePro(MultipartHttpServletRequest req, Model model) {
			
			String username = SecurityContextHolder.getContext().getAuthentication().getName();
			
			System.out.println("username : " + username);
			
			MultipartFile file = req.getFile("jobs-application-resume");
			System.out.println("file : " + file);
			//임시 파일이 저장되는 논리적인 경로
			String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");
			//업로드할 파일이 위치하게될 물리적인 경로
			String realDir = "C:\\프로그램\\workspace_mybatis\\spring_pj\\spring_PJ\\src\\main\\webapp\\resources\\upload\\";
			
			try {
				file.transferTo(new File(saveDir+file.getOriginalFilename()));
				
				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
				int data = 0;
				while((data = fis.read()) != -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			BoardVO vo = new BoardVO();
			vo.setTitle(req.getParameter("title"));
			vo.setUsername(username);                                                                  
			vo.setContent(req.getParameter("jobs-application-message"));
			vo.setBoard_image(file.getOriginalFilename());
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
			vo.setBoard_code(board_code);
			vo.setContent(req.getParameter("comment"));
			int commentInsert = dao.commentWrite(vo);
			
			System.out.println("댓글 등록: " + commentInsert);
			
			model.addAttribute("commentInsert", commentInsert);
			
			
		}
	//==한결 파트 종료	
		
		
		
		//==재관 유저
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
			
		
		//==재관 유저 종료
}


