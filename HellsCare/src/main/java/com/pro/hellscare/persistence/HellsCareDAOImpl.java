package com.pro.hellscare.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.pro.hellscare.VO.BoardVO;
import com.pro.hellscare.VO.CommentVO;
import com.pro.hellscare.VO.DiseaseVO;
import com.pro.hellscare.VO.ExerciseVO;
import com.pro.hellscare.VO.HellsCareVO;
import com.pro.hellscare.VO.challengeVO;

//*********인터페이스에 작성한 기능 오버라이드 해서 구현하면됨.
//*********DB접속시에 반드시 Mapper에도 어떤기능의 Mapper인지 작성할것
/*
<Resource auth="Container" driverClassName="oracle.jdbc.driver.OracleDriver" 
    maxActive="1" maxWait="1000" name="jdbc/Oracle11g_Hellscare" 
    password="careman" type="javax.sql.DataSource" 
    url="jdbc:oracle:thin:@192.168.219.143:1521:xe" username="hellscare"/>
    
    !!!!!!!!!!!!!!!서블릿 컨텍스트에 넣는거 아님!!!!!!!!!!!!!
    		경로 - Servers -> Tomcat v8.5 Server at localhost-config
    			-> server.xml -> 이 안에 잘 붙여넣으세요. 
    			!!!! name="jdbc/Oracle11g_Hellscare" !!!!
    			잘 기억했다가 DB연동 구문 작성시에 반드시 이름 맞춰줄것.
 */



@Repository
public class HellsCareDAOImpl implements HellsCareDAO{

	
	//mapper에 접근하기 위한 어노테이션. mapper접근시 sqlsession.~ 으로 mapper ID로 접근하시면됩니다.
	@Autowired
	SqlSession sqlsession;
	
	//암호화한 비밀번호에 대해 로그인처리를 하거나 회원정보 변경, 탈퇴, 아이디 비밀번호 찾기 등등 구현할때 사용합니다. 
	//사용하지 않는다고 해서 주석처리 하지 않으셔도됩니다. 
	// 사용법
	// 화면에서 사용자가 입력한 비밀번호를 암호화하여 DB에 저장할 경우 : pass.encode(화면에서 받아온 암호값);
	// 로그인 등등 암호가 맞는지 확인 할 경우 : pass.matches(화면에서 사용자가입력한 암호, DB에 들어있는 암호화된 암호);
	@Autowired
	BCryptPasswordEncoder pass;


	
//=============호스트 DAO	
	
	
	@Override
	public int challengePro(Map<String, Object> map) {
		int cnt = sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.challengePro2", map);	
		if(cnt==0) {
			cnt = challengePro2(map);
		}else {
			cnt = 2;
		}		
		return cnt;
	}
	@Override
	public int challengePro2(Map<String, Object> map) {		
		return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.challengePro", map);
	}


	@Override
	public int challengecount() {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.challengecount");
	}


	@Override
	public List<challengeVO> challengecount2(Map<String, Object> map) {
		
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.challengecount2",map);
	}

	@Override
	public int challengedel(int challenge_check) {
		
		return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.challengedel",challenge_check);
	}



	
	// host
		// 질병정보갯수
		@Override 
		public int getDiseaseCount() {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getDiseaseCount");
		}
		// 질병코드중복체크
		@Override
		public int diseaseCodeCheck(String disease_code) {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.diseaseCodeCheck", disease_code);
		}
		// 질병정보 목록 구하기
		@Override
		public List<DiseaseVO> getDiseaseList(Map<String, Object> map) {
			return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getDiseaseList", map);
		}
		// 질병정보 상세 페이지
		@Override
		public DiseaseVO getDisease(String disease_code) {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getDisease", disease_code);
		}
		// 질병 정보 등록
		@Override
		public int insertDisease(DiseaseVO vo) {
			return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.insertDisease", vo);
		}
		// 질병 정보 수정
		@Override
		public int updateDisease(DiseaseVO vo) {
			return sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.updateDisease", vo);
		}
		// 질병 정보 삭제
		@Override
		public int deleteDisease(String disease_code) {
			return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.deleteDisease", disease_code);
		}
	
		//==예찬 시작
		//관리자 - 운동등록처리
		@Override
		public int insertExercise(ExerciseVO vo) {
			return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.insertExercise",vo);
		}
		
		//관리자 - 운동목록 개수구하기
		@Override
		public int getexerciseArticleCnt() {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getexerciseArticleCnt");
		}
		
		//운동 - 스트레칭 개수구하기
		@Override
		public int getArticleCntSt() {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getArticleCntSt");
		}
		
		//운동 - 유산소운동 개수구하기
		@Override
		public int getArticleCntDi() {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getArticleCntDi");
		}
		
		//관리자 - 운동목록
		@Override
		public List<ExerciseVO> getexerciseList(Map<String, Integer> map) {
			List<ExerciseVO> dtos = sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getexerciseList",map);
			return dtos;
		}
		
		//운동목록 - 스트레칭
		@Override
		public List<ExerciseVO> getstretching(Map<String, Integer> map) {
			List<ExerciseVO> dtosSt = sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getstretching",map);
			return dtosSt;
		}
		
		//운동목록 - 다이어트 (유산소운동)
		@Override
		public List<ExerciseVO> getdiet(Map<String, Integer> map) {
			List<ExerciseVO> dtosDi = sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getdiet",map);
			return dtosDi;
		}
		
		//관리자 - 운동삭제
		@Override
		public int deleteExercise(String exercise_code) {
			return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.deleteExercise",exercise_code);
		}
		
		//관리자 - 운동수정 뷰
		@Override
		public ExerciseVO getExercise(String exercise_code) {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getExercise",exercise_code);
		}
		
		//관리자 - 운동수정처리
		@Override
		public int modifyPro(ExerciseVO vo) {
			return sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.modifyPro",vo);
		}
		
		//운동 - 상세페이지
		@Override
		public ExerciseVO detailExercise(String exercise_code) {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.detailExercise",exercise_code);
		}
		
		//운동 - 즐겨찾기 추가
		@Override
		public int addFavorit(Map<String, Object> map) {
			return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.addFavorit",map);
		}
		
		//운동 - 부위별 목록
		@Override
		public List<ExerciseVO> getPartList(String part) {
			return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getPartList",part);
		}
		//==예찬 종료
		//==한결 시작
		//게시글 갯수 조회
		@Override
		public int getBoardCnt() {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getBoardCnt");
		}
		
		//게시글 당 댓글 수
		@Override
		public int getCommentCnt(int board_code) {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getCommentCnt", board_code);
		}

		//게시글 목록 조회
		@Override
		public List<BoardVO> getArticleList() {
			return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getArticleList");
		}

		//조회수 증가 
		@Override
		public void addReadCnt(int board_code) {
			HellsCareDAO dao = sqlsession.getMapper(HellsCareDAO.class);
			dao.addReadCnt(board_code);
		}

		//게시글 상세 조회
		@Override
		public BoardVO getArticle(int board_code) {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getArticle", board_code);
		}

		//게시글 저장
		@Override
		public int boardWrite(BoardVO vo) {
			return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.boardWrite", vo);
		}

		//댓글 불러움
		@Override
		public List<CommentVO> getCommentList(int board_code) {
			return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getCommentList", board_code);
		}

		//댓글 등록
		@Override
		public int commentWrite(CommentVO vo) {
			return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.commentWrite", vo);
		}
		
		//==한결 종료
		
		
		
		
}
