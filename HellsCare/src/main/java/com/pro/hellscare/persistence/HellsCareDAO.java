package com.pro.hellscare.persistence;

import java.util.List;
import java.util.Map;

import com.pro.hellscare.VO.BoardVO;
import com.pro.hellscare.VO.CommentVO;
import com.pro.hellscare.VO.DiseaseVO;
import com.pro.hellscare.VO.ExerciseVO;
import com.pro.hellscare.VO.challengeVO;

//DAO 인터페이스 필요하다싶은 인터페이스 작성및 구현
// 인터페이스 작성양식
// 함수명() 위에 어떤기능인지 반드시 적을것
public interface HellsCareDAO {
	
	
		
		
		
		
		
		
		
		
//==============host DAO부분
		//관리자 이벤트 등록 페이지
		public int challengePro(Map<String,Object> map); //같은 이름의 도전과제가 있는지 체크
		public int challengePro2(Map<String,Object> map); //도전과에 insert
		public int challengecount(); //도전과제 갯수 
		public List<challengeVO> challengecount2(Map<String,Object> map);
		//도전과제 삭제
		public int challengedel(int challenge_check);
		
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

	
		
	// ==한결 시작
	// 게시글 갯수 구하기 --몇건인지
	public int getBoardCnt();

	// 게시글의 댓글 수
	public int getCommentCnt(int board_code);

	// 게시글 목록 조회
	public List<BoardVO> getArticleList(); // start와 end 값을 가지고 가겠다.
	// 한건의 게시글 상세 조회시 boardVO, 여러건의 게시글을 상세조회시에는 ArrayList

	// 조회수 증가
	public void addReadCnt(int board_code);

	// 게시글 상세조회
	public BoardVO getArticle(int board_code);

	// 게시글 저장
	public int boardWrite(BoardVO vo);

	// 댓글 읽어오기
	public List<CommentVO> getCommentList(int board_code);

	// 댓글 등록
	public int commentWrite(CommentVO vo);

	// ==한결 종료
		
		
		
		//==예찬 시작

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

	// ==예찬 종료
		
		
		
}