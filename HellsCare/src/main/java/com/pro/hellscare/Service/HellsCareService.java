package com.pro.hellscare.Service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.HTTP;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

//서비스인터페이스 원칙적으로는 1개 기능 1서비스지만 필요한경우 한 서비스 안에 DAO를 여러개 넣는것은 상관없음.
//서비스 안에 서비스 넣는건 지양해주시길...

public interface HellsCareService {

	//==============유저용 서비스
	//==규진 
	public void challengesearch(HttpServletRequest req, Model model);
	//내 도전과제 추가
	public void addchall(HttpServletRequest req, Model model);
	//나의 도전과제
	public void Mychallenge(HttpServletRequest req, Model model);
	//내 도전과제 삭제
	public void delchall(HttpServletRequest req, Model model);
	
	//==규진 끝
	
	//====재관시작
	// 질병상세정보보기 
		public void diseaseView(HttpServletRequest req, Model model);
		// 건강정보 불러오기
		public void getUserInfo(HttpServletRequest req, Model model);
		// 건강정보 입력 처리
		public void userInfoRegPro(HttpServletRequest req, Model model);
		// 건강정보 입력 처리
		public void userInfoModifyPro(HttpServletRequest req, Model model);
	//=====
	
	
	
	
	
	//이나현 시작 ---------------------	
		//회원가입 시 아이디 중복확인 처리
		public void confirmId(HttpServletRequest req, Model	model);

		//회원가입처리
		public void regPro(HttpServletRequest req, Model model);
			
		// 이메일인증
	    public void emailChk(HttpServletRequest req, Model model);
		
		// 마이페이지 회원정보 수정시 비밀번호 체크
		public int pwCheckCnt(Map<String,Object> map);
		
		// 회원정보 수정 폼
		public void userModiView(HttpServletRequest req, Model model);

		// 회원정보 수정처리
		public void modifyPro(HttpServletRequest req, Model model);

		// 회원탈퇴 처리
		public void delMember(HttpServletRequest req, Model model);
	//이나현 끝 -----------------------
	
	
	//한결
	
		//글목록
		public void boardList(HttpServletRequest req, Model model);
		
		//글 상세페이지
		public void contentForm(HttpServletRequest req,  Model model);
		
		//글쓰기 처리 페이지
//		public void writePro(MultipartHttpServletRequest req, Model model);
		public void writePro(HttpServletRequest req,  Model model);

		//댓글 뷰
		public void commentList(HttpServletRequest req,  Model model);
		
		//댓글등록
		public void commentIn(HttpServletRequest req, Model model);
		
		//게시글 삭제
		public void b_delete(HttpServletRequest req, Model model);
		public void q_delete(HttpServletRequest req, Model model);
		
		//게시글 수정 화면
		public void b_modify_view(HttpServletRequest req, Model model);
		//qna 수정 화면
		public void q_modify_view(HttpServletRequest req, Model model);
		
		//게시글 수정
		public void b_modify(HttpServletRequest req, Model model);
		public void q_modify(HttpServletRequest req, Model model);
		
		//QnA 작성 처리
		public void qnaWritePro(HttpServletRequest req, Model model);
		
		public void add(HttpServletRequest req, Model model);
		
		//QnA 비밀번호 확인 & 글내용보기
		public void pwdConfirm(HttpServletRequest req, Model model);
		
//		//QnA 글내용 보기
//		public void qnaContent(HttpServletRequest req, Model model);

		//마이페이지 1:1
		public void myQnaList(HttpServletRequest req, Model model);
		
		//한결host=====================================================start
		
		//notice list 
		public void noticeList(HttpServletRequest req, Model model);

		//notice detail
		public void notice_contentForm(HttpServletRequest req, Model model);

		//notice modify
		public void n_modify_view(HttpServletRequest req, Model model);

		//notice modify pro
		public void n_modify(HttpServletRequest req, Model model);
	//한결 끝
	
	
	// 동렬 시작 --------------	-
		//뉴스기사 크롤링 Service 담당자 
		public void crawlArticle(HttpServletRequest req, Model model) throws IOException;
		
		// 뉴스 기사 상세 페이지  담당자 
		public void crawlNewsDetail(HttpServletRequest req, Model model) throws IOException;
		
		// 현재 위치한 행정동의 날씨 크롤링
		public void crawlDongWeather(HttpServletRequest req, Model model) throws IOException;

		// 오늘 섭취한 음식 등록
		public void foodEnrollAteToday(HttpServletRequest req, Model model);
		
		// 오늘 섭취한 음식 - 종류에 해당하는 음식명들 탐색
		public void foodFindEqualKind(HttpServletRequest req, Model model);

		
	// 동렬 끝 -----------------	
	
	

	// ========================== 동렬 관리자 시작 =============================
	
		// 관리자 - 음식 등록
		public void registerFood(MultipartHttpServletRequest req, Model model);
		
		// 관리자 - 음식 목록
		public void foodList(HttpServletRequest req, Model model);
		
		// 관리자 - 음식 상세 페이지
		public void foodDetail(HttpServletRequest req, Model model);
		
		// 관리자 - 음식 수정 처리
		public void foodModifyPro(MultipartHttpServletRequest req, Model model);
		
		// 관리자 - 음식 삭제
		public void foodDeletePro(HttpServletRequest req, Model model);
		
		// 관리자 - 음식 목록에서 음식 여러개 삭제
		public void foodListDeletePro(HttpServletRequest req, Model model);
		
		// 관리자 - 음식 중복 확인
		public void foodDupcheck(HttpServletRequest req, Model model);
		
		// ========================== 동렬 관리자 끝 =============================
	
	
	
	
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

		// 즐겨찾기 목록
		public void favoriteList(HttpServletRequest req, Model model);
		
		// 동호회명 중복확인
		public int clubNameCheck(String club_id);
		
		// 버튼 - 즐겨찾기 제거
		public void removeFavorit(HttpServletRequest req, Model model);
		
		// 사용자 - 즐겨찾기 제거
		public void removefavorites(HttpServletRequest req, Model model);

		// 동호회 - 개설신청
		public void addClubApply(HttpServletRequest req, Model model);
		
		// 관리자 - 동호회 개설승인 / 거절
		public void clubList(HttpServletRequest req, Model model);
		
		// 관리자 - 동호회 상세페이지
		public void clubDetail(HttpServletRequest req, Model model);
		
		// 관리자 - 동호회 신청 삭제
		public void deleteApplyClub(HttpServletRequest req, Model model);

		// 관리자 - 동호회 승인
		public void clubPermit(HttpServletRequest req, Model model);

		// 동호회 - 목록
		public void club_List(HttpServletRequest req, Model model);
		
		// 동호회 - 동호회 상세페이지
		public void getClub(HttpServletRequest req, Model model);
		
		// 관리자 - 개설된 동호회 목록
		public void existenceClub(HttpServletRequest req, Model model);
		
		// 동호회 - 내가가입한 동호회 개수
		public void myClub(HttpServletRequest req, Model model);
		
		// 동호회 - 동호회 가입신청
		public void clubApply(HttpServletRequest req, Model model);
		
		// 동호회 - 가입신청한 동호회 목록
		public void applyList(HttpServletRequest req, Model model);
	
	
	
	
	//==============호스트 서비스
	
	//=====규진 담당
	//이벤트 갯수 가져오고 내용 가져오기 담당자 : 규진
	public void challengeView(HttpServletRequest req, Model model);
	//이벤트 등록 프로세스 담당자 : 규진
	public void challengeRegpro(MultipartHttpServletRequest req, Model model);
	//이벤트 삭제 프로세스 담당자 : 규진
	public void challengedelpro(HttpServletRequest req, Model model);
	//도전과제 상세페이지
	public void challengedetail(HttpServletRequest req, Model model);
	
	//=====규진 담당 끝
	
	
	
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
		// 회원리스트
		public void userList(HttpServletRequest req, Model model);
		// 회원삭제
		public void userDel(HttpServletRequest req, Model model);
		// 회원 통계
		public void userStatistics(HttpServletRequest req, Model model);
	//====재관담당 종료
}
