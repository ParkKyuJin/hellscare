package com.pro.hellscare.Service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

//서비스인터페이스 원칙적으로는 1개 기능 1서비스지만 필요한경우 한 서비스 안에 DAO를 여러개 넣는것은 상관없음.
//서비스 안에 서비스 넣는건 지양해주시길...

public interface HellsCareService {

	//==============유저용 서비스
	
	//뉴스기사 크롤링 Service 담당자 : 동렬
	public void crawlArticle(HttpServletRequest req, Model model) throws IOException;
	// 뉴스 기사 상세 페이지  담당자 : 동렬
	public void crawlNewsDetail(HttpServletRequest req, Model model) throws IOException;
	
	
	
	//관리자 - 운동등록처리 / 파일업로드처리 담당자 : 예찬
	public void exerciseAddPro(MultipartHttpServletRequest req, Model model);
	
	
	
	
	
	//==============호스트 서비스
	
	
	//이벤트 갯수 가져오고 내용 가져오기 담당자 : 규진
	public void challengeView(HttpServletRequest req, Model model);
	//이벤트 등록 프로세스 담당자 : 규진
	public void challengeRegpro(MultipartHttpServletRequest req, Model model);
	//이벤트 삭제 프로세스 담당자 : 규진
	public void challengedelpro(HttpServletRequest req, Model model);
}
