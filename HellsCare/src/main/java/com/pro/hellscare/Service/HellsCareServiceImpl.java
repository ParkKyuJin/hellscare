package com.pro.hellscare.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.pro.hellscare.VO.ExerciseVO;
import com.pro.hellscare.VO.NewsVO;
import com.pro.hellscare.VO.challengeVO;
import com.pro.hellscare.persistence.HellsCareDAO;



//서비스인터페이스 오버라이딩해서 사용할것.


@Service
public class HellsCareServiceImpl implements HellsCareService {
	
	//크롤링 전역변수 기사 리스트
	private static String NEWSURL = "http://health.chosun.com/list.html?";
	
	
	@Autowired
	HellsCareDAO dao;
	
	
	//암호화한 비밀번호에 대해 로그인처리를 하거나 회원정보 변경, 탈퇴, 아이디 비밀번호 찾기 등등 구현할때 사용합니다. 
	//사용하지 않는다고 해서 주석처리 하지 않으셔도됩니다. 
	// 사용법
	// 화면에서 사용자가 입력한 비밀번호를 암호화하여 DB에 저장할 경우 : pass.encode(화면에서 받아온 암호값);
	// 로그인 등등 암호가 맞는지 확인 할 경우 : pass.matches(화면에서 사용자가입력한 암호, DB에 들어있는 암호화된 암호);
	@Autowired
	BCryptPasswordEncoder pass;
	
	
	
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
	public void exerciseAddPro(MultipartHttpServletRequest req, Model model) {
String part = "";
		
		MultipartFile file = req.getFile("img");
		
		@SuppressWarnings("deprecation")
		String saveDir = req.getRealPath("/resources/video/");
		
		String realDir = "C:\\workspace_git\\hellscare\\HellsCare\\src\\main\\webapp\\resources\\video\\";
		
		try {
			file.transferTo(new File(saveDir+file.getOriginalFilename()));
			
			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
			
			int data = 0;
			// 논리적인 경로에 저장된 임시 파일을 물리적인 경로로 복사함
			while ((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();
			
			String name = req.getParameter("name");		// 운동명
			String img = file.getOriginalFilename();	// 영상
			int kind = Integer.parseInt(req.getParameter("kind"));		// 종류	-- 1. 스트레칭, 2. 다이어트 운동
			// 스트레칭일때만 운동부위가 존재함.
			if(kind == 1) {
				part = req.getParameter("part");
			}
			String way = req.getParameter("way");		// 운동방법
			String note = req.getParameter("note");		// 주의사항
			int kcal = Integer.parseInt(req.getParameter("kcal"));	// 소모칼로리
			
			// 바구니 생성
			ExerciseVO vo = new ExerciseVO();
			
			vo.setExercise_name(name);
			vo.setExercise_img(img);
			vo.setWay(way);
			vo.setPart(part);
			vo.setKcal(kcal);
			vo.setNote(note);
			vo.setKind(kind);;

			int insertCnt = 0;

			insertCnt = dao.insertExercise(vo);

			model.addAttribute("insertCnt", insertCnt);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
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

	
			
}


