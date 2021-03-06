package com.pro.hellscare.Service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.HTTP;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.hellscare.VO.FoodVO;



public interface HellsCareService {

	// ==============유저용 서비스
	// ==규진
	public void challengesearch(HttpServletRequest req, Model model);

	// 내 도전과제 추가
	public void addchall(HttpServletRequest req, Model model);

	// 나의 도전과제
	public void Mychallenge(HttpServletRequest req, Model model);

	// 내 도전과제 삭제
	public void delchall(HttpServletRequest req, Model model);

	// 로그인한 유저 건강정보 가져오기
	public void Userhealthss(HttpServletRequest req, Model model);
	// ==규진 끝

	// ====재관시작 : 유저
	// 질병상세정보보기
	public void diseaseView(HttpServletRequest req, Model model);

	// 건강정보 불러오기
	public void getUserInfo(HttpServletRequest req, Model model);

	// 건강정보 입력 처리
	public void userInfoRegPro(HttpServletRequest req, Model model);

	// 건강정보 입력 처리
	public void userInfoModifyPro(HttpServletRequest req, Model model);
	// =====
	// =====

	// 나현 시작 ==
	// 아이디 찾기 시 아이디 & 이메일 체크
	public void forgotidChk(HttpServletRequest req, Model model);

	// 비밀번호 찾기 시 이메일로 비밀번호 보낸 후 비밀번호 암호화
	public void forgotPwChk(HttpServletRequest req, Model model);

	// 회원가입 시 아이디 중복확인 처리
	public void confirmId(HttpServletRequest req, Model model);

	// 회원가입처리
	public void regPro(HttpServletRequest req, Model model);

	// 마이페이지 회원정보 수정시 비밀번호 체크
	public int pwCheckCnt(Map<String, Object> map);

	// 회원정보 수정 폼
	public void userModiView(HttpServletRequest req, Model model);

	// 회원정보 수정처리
	public void modifyPro(HttpServletRequest req, Model model);

	// 회원탈퇴 처리
	public void delMember(HttpServletRequest req, Model model);
	// 나현 종료==

	// 한결
	// 댓글만 삭제
	public void cDelete(HttpServletRequest req, Model model);

	// 글목록
	public void boardList(HttpServletRequest req, Model model);

	// 글 상세페이지
	public void contentForm(HttpServletRequest req, Model model);

	// 글쓰기 처리 페이지
//		public void writePro(MultipartHttpServletRequest req, Model model);
	public void writePro(HttpServletRequest req, Model model);

	// 댓글 뷰
	public void commentList(HttpServletRequest req, Model model);

	// 댓글등록
	public void commentIn(HttpServletRequest req, Model model);

	// 게시글 삭제
	public void b_delete(HttpServletRequest req, Model model);

	public void q_delete(HttpServletRequest req, Model model);

	// 게시글 수정 화면
	public void b_modify_view(HttpServletRequest req, Model model);

	// qna 수정 화면
	public void q_modify_view(HttpServletRequest req, Model model);

	// 게시글 수정
	public void b_modify(HttpServletRequest req, Model model);

	public void q_modify(HttpServletRequest req, Model model);

	// QnA 작성 처리
	public void qnaWritePro(HttpServletRequest req, Model model);

	public void add(HttpServletRequest req, Model model);

	// QnA 비밀번호 확인 & 글내용보기
	public void pwdConfirm(HttpServletRequest req, Model model);

//		//QnA 글내용 보기
//		public void qnaContent(HttpServletRequest req, Model model);

	// 마이페이지 1:1
	public void myQnaList(HttpServletRequest req, Model model);

	// 한결host=====================================================start

	// notice list
	public void noticeList(HttpServletRequest req, Model model);

	// notice detail
	public void notice_contentForm(HttpServletRequest req, Model model);

	// notice modify
	public void n_modify_view(HttpServletRequest req, Model model);

	// notice modify pro
	public void n_modify(HttpServletRequest req, Model model);

	// 호스트 QNA보기
	public void host_qnaContent(HttpServletRequest req, Model model);

	// 호스트 QnA 답변등록
	public void QnAAnswer(HttpServletRequest req, Model model);

	public void QnAHosts(HttpServletRequest req, Model model);

	// notice write pro
	public void noticeWritePro(HttpServletRequest req, Model model);
	
	public void MyqnaWritePro(HttpServletRequest req, Model model);
	
	// 한결 끝

	// 동렬 시작 ---------------
	
	// 뉴스기사 크롤링 Service 담당자
	public void crawlArticle(HttpServletRequest req, Model model) throws IOException;

	// 뉴스 기사 상세 페이지 담당자
	public void crawlNewsDetail(HttpServletRequest req, Model model) throws IOException;

	// 현재 위치한 행정동의 날씨 크롤링
	public void crawlDongWeather(HttpServletRequest req, Model model) throws IOException;

	// 오늘 섭취한 음식 등록
	public void foodEnrollAteToday(HttpServletRequest req, Model model);

	// 오늘 섭취한 음식 - 종류에 해당하는 음식명들 탐색
	public List<FoodVO> foodFindEqualKind(HttpServletRequest req, Model model);

	// 오늘의 칼로리 입력 없이 기존의 정보 받아오기
	public void getKcalInfoNoInput(HttpServletRequest req, Model model);

	// 식단 추천을 위한 회원의 건강정보 수집, 입력했던 칼로리 테이블 조회
	public void getUserHealthInfo(HttpServletRequest req, Model model);

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
	public int foodDupcheck(HttpServletRequest req, Model model);

// ========================== 동렬 관리자 끝 =============================

	// 관리자 - 운동등록처리 / 파일업로드처리 담당자 : 예찬
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

	// 동호회 - 가입신청 동호회 삭제
	public void deleteApplyPro(HttpServletRequest req, Model model);

	// 동호회 - 동호회 회원목록
	public void getMember(HttpServletRequest req, Model model);

	// 동호회 - 동호회원 탈퇴처리
	public void deleteMemberPro(HttpServletRequest req, Model model);

	// 동호회 - 회원 동호회 탈퇴
	public void exitMemberPro(HttpServletRequest req, Model model);

	// 동호회 - 해당 동호회 가입신청 목록
	public void getApplyList(HttpServletRequest req, Model model);

	// 동호회 - 해당 동호회 가입신청 승인
	public void confirmMember(HttpServletRequest req, Model model);

	// 동호회 - 동호회 게시판목록
	public void getClubBoard(HttpServletRequest req, Model model);

	// 동호회 - 동호회게시판 글쓰기 폼
	public void club_BoardWriteForm(HttpServletRequest req, Model model);

	// 동호회 - 동호회게시판 글쓰기 처리
	public void club_BoardWirtePro(HttpServletRequest req, Model model);

	// 동호회 - 동호회게시판 글 삭제
	public void club_BoardRemove(HttpServletRequest req, Model model);

	// 동호회 - 동호회게시판 글 상세페이지
	public void detail_clubBoard(HttpServletRequest req, Model model);

	// 동호회 - 동호회게시판 글 수정처리
	public void club_BoardModifyPro(HttpServletRequest req, Model model);

	// 관리자 - 운동등록처리 / 파일업로드처리 담당자 : 예찬 끝
	// ==========================================

	// ==============호스트 서비스

	// =====규진 담당
	// 이벤트 갯수 가져오고 내용 가져오기 담당자 : 규진
	public void challengeView(HttpServletRequest req, Model model);

	// 이벤트 등록 프로세스 담당자 : 규진
	public void challengeRegpro(MultipartHttpServletRequest req, Model model);

	// 이벤트 삭제 프로세스 담당자 : 규진
	public void challengedelpro(HttpServletRequest req, Model model);

	// 도전과제 상세페이지
	public void challengedetail(HttpServletRequest req, Model model);

	// =====규진 담당 끝

	// =====재관 담당 : 관리자
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

	// 회원강제탈퇴
	public void userDel(HttpServletRequest req, Model model);

	// 회원 통계
	public void userStatistics(HttpServletRequest req, Model model);

	// 회원 최근 가입목록
	public void userRecentList(HttpServletRequest req, Model model);
	
	// 동호회 개설취소
	public void cancel_club(HttpServletRequest req, Model model);
	// ====재관담당 종료


}
