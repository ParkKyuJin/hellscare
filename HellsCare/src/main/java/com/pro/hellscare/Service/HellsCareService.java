package com.pro.hellscare.Service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

//서비스인터페이스 원칙적으로는 1개 기능 1서비스지만 필요한경우 한 서비스 안에 DAO를 여러개 넣는것은 상관없음.
//서비스 안에 서비스 넣는건 지양해주시길...

public interface HellsCareService {

	//==============유저용 서비스
	// 질병상세정보보기 : 재관
	public void diseaseView(HttpServletRequest req, Model model);
	
	//이나현 시작
	
	//회원가입 시 아이디 중복확인 처리
	public void confirmId(HttpServletRequest req, Model	model);

	//회원가입처리
	public void regPro(HttpServletRequest req, Model model);
		
	// 이메일인증
    public void emailChk(HttpServletRequest req, Model model);
	
	//이나현 끝
	
	
	
	
	//한결
	
	// 글목록
	public void boardList(HttpServletRequest req, Model model);

	// 글 상세페이지
	public void contentForm(HttpServletRequest req, Model model);

	// 글쓰기 처리 페이지
	public void writePro(MultipartHttpServletRequest req, Model model);

	// 댓글 뷰
	public void commentList(HttpServletRequest req, Model model);

	// 댓글등록
	public void commentIn(HttpServletRequest req, Model model);
	
	//한결 끝
	
	
	//뉴스기사 크롤링 Service 담당자 : 동렬
	public void crawlArticle(HttpServletRequest req, Model model) throws IOException;
	// 뉴스 기사 상세 페이지  담당자 : 동렬
	public void crawlNewsDetail(HttpServletRequest req, Model model) throws IOException;
	public void crawlDongWeather(HttpServletRequest req, Model model) throws IOException;
	
	
	//관리자 - 운동등록처리 / 파일업로드처리 담당자 : 예찬
	public void exerciseAddPro(MultipartHttpServletRequest req, Model model);

	// 관리자 - 운동목록
	public void exerciseList(HttpServletRequest req, Model model);

	// 관리자 - 운동삭제
	public void deleteExercise(HttpServletRequest req, Model model);

	// 관리자 - 운동수정 뷰
	public void modifyExercise(HttpServletRequest req, Model model);

	// 관리자 - 운동수정처리
	public void modifyExercisePro(HttpServletRequest req, Model model);

	// 운동 - 상세페이지
	public void detailExercise(HttpServletRequest req, Model model);

	// 운동 - 즐겨찾기 추가
	public void addFavorit(HttpServletRequest req, Model model);

	// 운동 - 부위별 목록
	public void stretchingList(HttpServletRequest req, Model model);

	// 관리자 - 운동등록처리 / 파일업로드처리 담당자 : 예찬 끝
	
	
	
	
	//==============호스트 서비스
	
	
	//이벤트 갯수 가져오고 내용 가져오기 담당자 : 규진
	public void challengeView(HttpServletRequest req, Model model);
	//이벤트 등록 프로세스 담당자 : 규진
	public void challengeRegpro(MultipartHttpServletRequest req, Model model);
	//이벤트 삭제 프로세스 담당자 : 규진
	public void challengedelpro(HttpServletRequest req, Model model);
	
	//=====재관 담당
	
	// 질병목록
	public void diseaseList(HttpServletRequest req, Model model);

	// 질병정보 상세페이지
	public void diseaseModifyView(HttpServletRequest req, Model model);

	// 질병코드 중복체크
	public int diseaseCodeCheck(HttpServletRequest req, Model model);

	// 질병등록처리
	public void diseaseInsertPro(HttpServletRequest req, Model model);

	// 질병수정 처리
	public void diseaseModifyPro(HttpServletRequest req, Model model);

	// 질병삭제 처리
	public void diseaseDeletePro(HttpServletRequest req, Model model);
	//====재관담당 종료
}
