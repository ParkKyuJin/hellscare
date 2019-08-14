package com.pro.hellscare.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.pro.hellscare.VO.HellsCareVO;
import com.pro.hellscare.VO.NewsVO;
import com.pro.hellscare.persistence.HellsCareDAO;

//서비스인터페이스 오버라이딩해서 사용할것.


@Service
public class HellsCareServiceImpl implements HellsCareService {
	
	//크롤링 전역변수 기사 리스트
	private static String URL = "http://health.chosun.com/list.html?";
	
	
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
		Document doc = Jsoup.connect(URL + "nowcode=1&pn=1").get();
			
		// 이미지와 기사 요약내용을 따올 Elements
		// 기사가 있는 태그는 dl 태그 중 list_item 클래스만 있음
		Elements newsList = doc.select("dl.list_item");
			
		// 기사 목록을 담을 기사 바구니 생성
		List<NewsVO> newsDtos = new ArrayList<>();
		    
		// 기사의 갯수만큼 for문을 돈다.
		for (int i = 0; i < 8; i++) {
				
			// NewsVO 생성
			NewsVO news = new NewsVO();
		    	
			// 썸네일 이미지 주소를 받아와서 setter에 썸네일 이미지 넣기
			if(newsList.get(i).select("dd.thumb") != null) {
				try {
					// 기사들 중 i번째의 thumb 클래스의 dd 태그의 img 태그에서 0번째의 src를 가져오는 이유는
					// 어짜피 i번째의 기사는 하나이기 때문에
					news.setNewsThumbnail(newsList.get(i).select("dd.thumb img").get(0).attr("src"));
				} catch (Exception e) {
					// System.out.println("IndexOutOfBoundsException 발생");
				}
				}
				
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
				
				// Jsoup으로 뉴스 상세 내용 페이지 URL html문서 get 
				Document detailNews = Jsoup.connect(newsUrl).get();
				
				// 기사 상세 내용 페이지에서 실제 기사 내용이 담긴 <p> 태그를 크롤링 
				Elements detailNesContents = detailNews.select(".news_body .par > p");
				
				String newsContents = "";
				
				for (Element newsPTag : detailNesContents) {
					// <p> 태그의 문자 내용들을 newsContents에 담는다.
					newsContents += newsPTag.text() + " ";
				}
				
				news.setNewsContents(newsContents);
				
				newsDtos.add(news);
			}
			
			model.addAttribute("newsDtos", newsDtos);
		
	}



	
	
	
//=============호스트 서비스	
	
	//도전과제 등록 프로세스
	@Override
	public void challengeRegpro(MultipartHttpServletRequest req, Model model) {
		MultipartFile file = req.getFile("Game_img");
		

		String saveDir = req.getSession().getServletContext().getRealPath("/resources/eventimg/");
		String realDir = "C:\\java prac\\workspace_spring\\spring_PJ_PKJ\\src\\main\\webapp\\resources\\saveimages";
		
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
		
		int Game_code = Integer.parseInt(req.getParameter("Game_code"));
		int Game_count = Integer.parseInt(req.getParameter("Game_count"));
		String Game_img =  file.getOriginalFilename();
		System.out.println("게임이미지 테스트"+Game_img);
		System.out.println(saveDir);
		System.out.println(Game_code);
		System.out.println(Game_count);
		System.out.println();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("Game_code", Game_code);
		map.put("Game_count", Game_count);
		map.put("Game_img", Game_img);
			/* int cnt = dao.orderpro(map); */
			/* model.addAttribute("orderCnt", cnt); */
		
		
		}catch(IOException e){
			e.printStackTrace();
		}
		
	}
	
		
		
			
}


