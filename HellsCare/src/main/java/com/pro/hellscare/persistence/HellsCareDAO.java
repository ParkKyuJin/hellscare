package com.pro.hellscare.persistence;

import java.util.List;
import java.util.Map;

import com.pro.hellscare.VO.BoardQnaVO;
import com.pro.hellscare.VO.BoardVO;
import com.pro.hellscare.VO.ClubBoardVO;
import com.pro.hellscare.VO.ClubVO;
import com.pro.hellscare.VO.CommentQnaVO;
import com.pro.hellscare.VO.CommentVO;
import com.pro.hellscare.VO.DiseaseVO;
import com.pro.hellscare.VO.ExerciseVO;
import com.pro.hellscare.VO.FoodVO;
import com.pro.hellscare.VO.KcalVO;
import com.pro.hellscare.VO.MyClubVO;
import com.pro.hellscare.VO.MychalleangeVO;
import com.pro.hellscare.VO.UserInfoVO;
import com.pro.hellscare.VO.UsersVO;
import com.pro.hellscare.VO.challengeVO;

//DAO 인터페이스 필요하다싶은 인터페이스 작성및 구현
// 인터페이스 작성양식
// 함수명() 위에 어떤기능인지 반드시 적을것
public interface HellsCareDAO {

	// == 동렬 시작
	// 관리자 - 음식 등록
	public int insertFood(FoodVO food);

	// 관리자 - 음식 개수
	public int getFoodCount();

	// 관리자 - 음식 목록
	public List<FoodVO> getFoodList(Map<String, Integer> map);

	// 관리자 - 음식 상세 정보
	public FoodVO getFoodInfo(String food_code);

	// 관리자 - 음식 정보 수정
	public int updateFood(FoodVO food);

	// 관리자 - 음식 삭제
	public int deleteFood(String food_code);

	// 관리자 - 음식 중복 확인
	public int checkFoodDup(String food_name);

	// 사용자 - 섭취한 음식 입력 정보 확인
	public FoodVO getFoodInfoByUsingFoodNameAndFoodKind(Map<String, String> map);

	// 사용자 - 음식 종류에 해당하는 음식명들 찾기
	public List<FoodVO> getFoodNamesByUsingFoodKind(String food_kind);

	// 사용자 - 세션에 접속한 사용자의 정보룰 가져오기
	public UsersVO getUserInfoByUsingId(String username);

	// 사용자 - 사용자가 입력했던 음식 칼로리 값들 가져오기
	public String getKcalInfo(Map<String, String> map);

	// 사용자 - 사용자가 입력 폼에 입력한 음식 정보 입력하기
	public int insertUserFood(Map<String, String> map);

	// 사용자 - 칼로리 테이블에 입력된 회원의 일주일 간 칼로리 정보 가져오기
	public List<KcalVO> getUserKcalInfo(Map<String, String> map);

	// 사용자 - 칼로리 테이블에 입력된 정보가 없으면 0으로 데이터 생성하기
	public int makeUserKcalInfo(Map<String, String> map);

	// 사용자 - 칼로리 테이블에서 각 일자 데이터들을 가져오기
	public List<KcalVO> getUserKcalInfoEachDay(Map<String, String> map);

	// 사용자 - 칼로리 테이블에 해당 날짜 칼로리 정보가 있는지 조회하기
	public int searchUserKcalInfo(Map<String, String> map);

	// 안드로이드 - 음식 이름으로 음식 정보 가져오기
	public FoodVO getFoodInfoByUsingFoodName(Map<String, String> map);

	// 안드로이드 - 메인화면에 띄울 칼로리 정보 가져오기
	public List<KcalVO> getTodayKcalInfo(String username);

	// 동호회 블록체인 개설비지급후 해쉬값 저장
	public int payCreateClubDone(ClubVO vo);
	// == 동렬 종료
	
	//==규진 시작
	//유저건강정보 가져오기
	public UserInfoVO Userhealthss(String username);
	//도전과제 검색
	public List<challengeVO> challengesearch(String content);
	//도전과제 담기
	public int addchall(Map<String,Object> map);
	//나의 도전과제
	public List<MychalleangeVO> Mychallenge(String id);
	//도전과제 중복체크
	public int challchek(Map<String, Object> map);
	//도전과제 삭제
	public int delchall(Map<String, Object> map);
	//도전과제 유무 체크
	public int challcheck2(String id);
	

	//==규진 종료
		
	// 아이디 찾기 시 이름 & 이메일 체크
		public int chkCnt(Map<String, Object> map);
		
		// 아이디 찾기 시 아이디 반환
		public String getUsername(Map<String, Object> map);
		
		//아이디 찾기 _ 이메일로 아이디보내기 
	    public void sendmail(String email, String username); 
	  
		// 비밀번호 찾기 시 아이디 & 이메일 체크
		public int pChkCnt(Map<String, Object> map);

		// 비밀번호 찾기 시  이메일로 보낼 비밀번호 반환
		public void updatePw(Map<String, String> map2);
		
		//비밀번호 찾기 _ 이메일로 비밀번호 보낸 후 비밀번호 암호화 
		public void sendmail2(String email, String rdpw); 
		
		//회원가입 시 아이디 중복확인 처리
		public int idCheck(String strId);
		
		//회원가입처리_INSERT INTO USERS
		public int regUser(Map<String, String>  map); 
		
		//회원가입처리_INSERT INTO AUTHORITIES
		public int regUser1(Map<String, Object> Amap);

		  
	    // 권한 핸들러_  회원 상세 정보 
	 	public Map<String, String> selectUser(String username); 
	 		
	 	// 마이페이지 회원정보 수정시 비밀번호 체크
		public int pwCheckCnt(Map<String, Object> map);
		
		// 회원정보 수정폼
		public UsersVO userModiView(String username);

		// DB에 있는 비밀번호 리턴
		public String returnPassword(String username);
		
		// 회원정보 수정처리
		public int userModifyPro(UsersVO vo);
				
		// 회원탈퇴 처리
		public int deleteMember(String username);
		
		// 안드로이드 회원정보 수정처리
		public UsersVO andrModiPro(String username);
		
		// 안드로이드 건강정보 수정처리
		public int andrHealthModi(UserInfoVO vo) ;

		// 일대일 문의 목록 
		public List<BoardQnaVO> getOtOInfo(String username);
	
		// 문의글 답글
		public List<CommentQnaVO> QnAComment(int qna_code);
		
		//==나현 종료
		
		
//==============host DAO부분
	
	//===규진 시작
		//관리자 이벤트 등록 페이지
		public int challengePro(Map<String,Object> map); //같은 이름의 도전과제가 있는지 체크
		public int challengePro2(Map<String,Object> map); //도전과에 insert
		public int challengecount(); //도전과제 갯수 
		public List<challengeVO> challengecount2(Map<String,Object> map);
		//도전과제 삭제
		public int challengedel(int challenge_check);
		public challengeVO challengedetail(int code);
		
		//===규진 종료
		
		
		
		// 재관 시작
		// ===== 관리자 =====
			// 질병정보갯수
			public int getDiseaseCount();

			// 질병정보 목록 구하기
			public List<DiseaseVO> getDiseaseList(Map<String, Object> map);

			// 질병정보 상세 페이지
			public DiseaseVO getDisease(String disease_code);

			// 질병코드중복체크
			public int diseaseCodeCheck(String disease_code);

			// 질병 정보 등록
			public int insertDisease(DiseaseVO vo);

			// 질병 정보 수정
			public int updateDisease(DiseaseVO vo);

			// 질병 정보 삭제
			public int deleteDisease(String disease_code);

			// 회원수 구하기
			public int getUserCnt();

			// 회원리스트
			public List<UsersVO> getUserList(Map<String, Object> map);

			// 회원성별차트
			public Map<String, Integer> getGenderChart();

			// 최근가입회원
			public List<UsersVO> recentJoinUser();

		// ===== 유저 =====
			// 건강정보가 있는지 확인
			public int checkUserInfo(String username);

			// 건강정보 불러오기
			public UserInfoVO getUserInfo(String username);

			// 건강정보 입력
			public int insertUserInfo(UserInfoVO vo);

			// 건강정보 수정
			public int updateUserInfo(UserInfoVO vo);

		// ===== 안드로이드 =====
			// 로그인 정보체크
			public String confirmId(String username);

			// 회원정보
			public UsersVO getMemberInfo(String username);
		// 재관 종료
			
	
		
	// ==한결 시작
		//한결 ==============================
		//댓글만 삭제
			public int cDelete(String c_code);
			
			
				// 게시글 갯수 구하기 --몇건인지 
				public int getBoardCnt();
				
				//게시글의 댓글 수 
				public int getCommentCnt(int board_code);
				public int getQnaCommentCnt(int qna_code);
				
				//게시글 목록 조회 
				public List<BoardVO> getArticleList(); //start와 end 값을 가지고 가겠다. 
				//한건의 게시글 상세 조회시 boardVO,  여러건의 게시글을 상세조회시에는 ArrayList
				
				//조회수 증가 
				public void addReadCnt(int board_code);
				
				public void addQnAReadCnt(int qna_code);
				
				//게시글 상세조회
				public BoardVO getArticle(int board_code);		
				
				//게시글 저장
				public int boardWrite(BoardVO vo);
				
				//댓글 읽어오기
				public List<CommentVO> getCommentList(int board_code);
				
				//댓글 등록
				public int commentWrite(CommentVO vo);
				
				//게시글 삭제
				public int b_delete(int board_code);
				public int q_delete(int qna_code);
				
				//게시글에 따른 댓글 삭제
				public int c_delete(int board_code);
				public int qc_delete(int qna_code);
				
				//게시글 수정
				public int boardUpdate(BoardVO vo);
				public int qnaUpdate(BoardQnaVO vo);
				
				//QnA게시글 갯수
				public int getQnaCnt();
				
				//QnA 목록 조회 
				public List<BoardQnaVO> getQnaArticleList();
				
				//QnA 글작성 처리
				public int qnaWrite(BoardQnaVO vo);
				
				//비밀번호 확인
				public int getPwdConfirm(Map<String, Object> map);
				
				//qna 내용가져오깅
				public BoardQnaVO getQnaArticle(int qna_code);
				
				//공지사항 갯수
				public int getnoticeCnt();

				//공지사항
				public List<BoardVO> getNoticeArticleList();

				//공지사항 내용
				public BoardVO getNoticeArticle(int board_code);

//				//
				public List<BoardQnaVO> getmyArticleList(Map<String, Object> map);
		//
				//내 질문글 갯수
				public int getmyArticleCnt(String username);

				//Qna에 댓글달기
				public int QnAAnswer(Map<String, Object> map);
				//Qna답변시 QnA게시글 상태변경
				public int Qnastate(int qna_code);
				//사용자화면에서 Qna답변보기
				public List<BoardQnaVO> QnAHosts(int qna_code);
//				//공지사항 수정처리
//				public int noticeUpdate(BoardVO vo);
				//게시글 검색
				public List<BoardVO> boardSearch(String query);
				//공지사항 작성 처리
				public int noticeWrite(BoardVO vo);
	// ==한결 종료
		
		
		
	// ==예찬 시작
	// 관리자 - 운동등록처리
	public int insertExercise(ExerciseVO vo);

	// 관리자 - 운동 개수구하기
	public int getexerciseArticleCnt();

	// 운동 - 스트레칭 개수구하기
	public int getArticleCntSt();

	// 운동 - 유산소운동 개수구하기
	public int getArticleCntDi();

	// 관리자 - 운동목록
	public List<ExerciseVO> getexerciseList(Map<String, Integer> map);

	// 운동목록 - 스트레칭
	public List<ExerciseVO> getstretching(Map<String, Integer> map);

	// 운동목록 - 유산소운동
	public List<ExerciseVO> getdiet(Map<String, Integer> map);

	// 관리자 - 운동삭제
	public int deleteExercise(String exercise_code);

	// 관리자 - 운동수정 뷰
	public ExerciseVO getExercise(String exercise_code);

	// 관리자 - 운동수정처리
	public int modifyPro(ExerciseVO vo);

	// 운동 - 상세페이지
	public ExerciseVO detailExercise(String exercise_code);

	// 운동 - 즐겨찾기 추가
	public int addFavorit(Map<String, Object> map);

	// 운동 - 부위별 목록
	public List<ExerciseVO> getPartList(String part);

	// 운동 - 부위별 목록 여부
	public int getPartCnt(String part);

	// 즐겨찾기 여부
	public int getFavoriteCnt(String username);

	// 동호회 - 동호회명 중복체크
	public int clubNameCheck(String club_id);

	// 즐겨찾기 - 해당아이디에 즐겨찾기 여부
	public int favoritCnt(Map<String, Object> map);

	// 즐겨찾기한 코드값
	public String favoritCode(Map<String, Object> map);

	// 즐겨찾기 삭제 - 버튼
	public int removeFavorit(String favorite_code);

	// 즐겨찾기 목록
	public List<ExerciseVO> getFavoriteList(String username);

	// 즐겨찾기 - 해당 운동코드에 맞는 운동정보
	public ExerciseVO getExerciseInfo(Map<String, Object> map);

	// 즐겨찾기 삭제 - 사용자
	public int deletefavorite(String favorite_code);

	// 동호회 - 개설신청
	public int addClubApply(ClubVO vo);

	// 관리자 - 동호회 개설승인 / 거절
	public List<ClubVO> getClubList(Map<String, Object> map);

	// 동호회 - 개수구하기
	public int getClubCnt();

	// 관리자 - 동호회 상세페이지
	public ClubVO clubDetail(String club_name);

	// 관리자 - 동호회 신청 삭제
	public int deleteApplyClub(String club_name);

	// 관리자 - 동호회 신청 승인
	public int clubPermit(String club_name);

	// 동호회 - 목록
	public List<ClubVO> getClub_List(Map<String, Object> map);

	// 동호회 - 개수구하기
	public int getClub_Cnt(String username);

	// 동호회 - 상세페이지
	public ClubVO getClub(String club_name);

	// 동호회 - 로그인한 회원이 동호회원인지 여부
	public int getMember(Map<String, Object> map);

	// 관리자 - 개설된 동호회 개수
	public int getExistenceClubCnt();

	// 관리자 - 개설된 동호회 목록
	public List<ClubVO> getExistenceClubList(Map<String, Object> map);

	// 동호회 - 내가 가입한 동호회 개수
	public int getMyClubCnt(String username);

	// 동호회 - 내가 가입한 동호회 목록
	public MyClubVO getMyClubList(String username);

	// 동호회 - 내가 가입한 동호회 목록 정보
	public ClubVO getMy_ClubList(String club_name);

	// 동호회 - 동호회 가입신청
	public int applyClub(Map<String, Object> map);

	// 동호회 - 중복 가입신청방지
	public int clubWhether(Map<String, Object> map);

	// 동호회 - 최대3곳만 가입가능하도록 설정
	public int getJoinClubCnt(String username);

	// 동호회 - 가입신청 동호회 목록
	public List<ClubVO> getApplyList(String username);

	// 동호회 - 대표자 클럽개수확인
	public String getClubMaster(String club_name);

	// 첫번째 동호회 없을시 첫번째 업데이트
	public void add_Club1(Map<String, Object> map);

	// 동호회 - 첫번째
	public void addClub1(Map<String, Object> map);

	// 동호회 - 두번째
	public void addClub2(Map<String, Object> map);

	// 동호회 - 세번째
	public void addClub3(Map<String, Object> map);

	// 내가 신청한 동호회 목록 개수
	public int applyCnt(String username);

	// 동호회 - 가입시 현재인원 증가
	public void plusMember(String club_name);

	// 동호회 - 가입신청목록 삭제
	public int deleteApply(String apply_code);

	// 동호회 - 신청삭제시 동호회테이블삭제
	public void deleteClub(String club_name);

	// 동호회 - 현재인원
	public int getCurrentMember(String club_name);

	// 동호회 - 현재인원목록
	public List<UsersVO> getMemberList(Map<String, Object> map);

	// 동호회 - 회원탈퇴 1번째 동호회일경우
	public int removeClub1(String username);

	// 동호회 - 회원탈퇴 2번째 동호회일경우
	public int removeClub2(String username);

	// 동호회 - 회원탈퇴 3번째 동호회일경우
	public int removeClub3(String username);

	// 동호회 - 삭제시 필요한 아이디
	public List<UsersVO> getUserName(String club_name);

	// 동호회 - 해당동호회 가입신청목록
	public List<UsersVO> getClubApply(Map<String, Object> map);

	// 동호회 - 해당동호회 신청수
	public int clubApplyCnt(String club_name);

	// 동호회 - 최대인원수
	public int getMax(String club_name);

	// 동호회 - 현재인원수
	public int getCurrent(String club_name);

	// 동호회 - 탈퇴시 인원감소
	public void minusMember(String club_name);

	// 동호회 - 동호회 게시판 개수
	public int getClubBoardCnt(String club_name);

	// 동호회 - 동호회 게시판 목록
	public List<ClubBoardVO> getClubBoardList(String club_name);

	// 동호회 - 동호회 게시판 글쓰기 처리
	public int insertClubBoard(ClubBoardVO vo);

	// 동호회 - 동호회 게시판 글삭제 처리
	public int deleteClubBoard(String club_board_code);

	// 동호회 - 동호회 게시판 글 상세페이지
	public ClubBoardVO getBoardDetail(String club_board_code);

	// 동호회 - 상세페이지 들어갈때마다 조회수 증가
	public void plusReadCnt(String club_board_code);

	// 동호회 - 동호회 게시글 수정처리
	public int updateClubCnt(ClubBoardVO vo);

	
	// 동호회 - 동호회장 탈퇴시 회장변경
	public void updateMaster(Map<String, Object> mMap);
	// ==예찬 종료
		
	
		
}