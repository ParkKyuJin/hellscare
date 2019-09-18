package com.pro.hellscare.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.pro.hellscare.VO.BoardQnaVO;
import com.pro.hellscare.VO.BoardVO;
import com.pro.hellscare.VO.ClubBoardVO;
import com.pro.hellscare.VO.ClubVO;
import com.pro.hellscare.VO.CommentVO;
import com.pro.hellscare.VO.DiseaseVO;
import com.pro.hellscare.VO.ExerciseVO;
import com.pro.hellscare.VO.FoodVO;
import com.pro.hellscare.VO.GenderChartVO;
import com.pro.hellscare.VO.HellsCareVO;
import com.pro.hellscare.VO.KcalVO;
import com.pro.hellscare.VO.MyClubVO;
import com.pro.hellscare.VO.MychalleangeVO;
import com.pro.hellscare.VO.UserInfoVO;
import com.pro.hellscare.VO.UsersVO;
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
	
	
	//==규진파트 시작
	
	@Override
	public List<challengeVO> challengesearch(String content) {
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.challengesearch",content);
	}
	
	
	
	@Override
	public challengeVO challengedetail(int code) {
	
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.challengedetail",code);
	}
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
	@Override
	public int addchall(Map<String, Object> map) {
		
		return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.addchall",map);
	}
	
	@Override
	public List<MychalleangeVO> Mychallenge(String id) {
		
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.Mychallenge",id);
	}
	
	@Override
	public int challchek(Map<String, Object> map) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.challchek",map);
	}

	@Override
	public int delchall(Map<String, Object> map) {
		return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.delchall",map);
	}
	@Override
	public int challcheck2(String id) {
		
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.challcheck2",id);
	}

	
	//==규진파트 종료
	
	
	//==재관 유저 시작
	
	//==재관 유저 종료
	
	


	
	// host
				//재관 ===== 관리자 =====
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

				// 회원수 구하기
				@Override
				public int getUserCnt() {
					return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getUserCnt");
				}

				// 회원리스트
				@Override
				public List<UsersVO> getUserList(Map<String, Object> map) {
					return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getUserList", map);
				}

				// 최근가입회원
				@Override
				public List<UsersVO> recentJoinUser() {
					return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.recentJoinUser");
				}

				// 성별 차트 구하기
				@Override
				public Map<String, Integer> getGenderChart() {
					// 큰바구니 선언
					Map<String, Integer> m = null;

					m = new HashMap<String, Integer>();
					m.put("total", 2);
					m.put("Female", 1);
					m.put("Male", 1);

					List<GenderChartVO> list = null;
					list = sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getGenderChart");

					for (int i = 0; i < list.size(); i++) {
						GenderChartVO vo = list.get(i);
						// System.out.println("gender >>" + vo.getGender() + "--- genderCnt >>"+
						// vo.getGenderCnt());
						m.put(vo.getGender(), vo.getGenderCnt());
					}

					return m;
				}

	// ===== 재관유저 =====	   
				// ===== 재관유저 =====
				// 건강정보가 있는지 확인
				@Override
				public int checkUserInfo(String username) {
					return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.checkUserInfo", username);
				}

				// 건강정보 불러오기
				@Override
				public UserInfoVO getUserInfo(String username) {
					return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getUserInfo", username);
				}

				// 건강정보 입력
				@Override
				public int insertUserInfo(UserInfoVO vo) {
					return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.insertUserInfo", vo);
				}

				// 건강정보 수정
				@Override
				public int updateUserInfo(UserInfoVO vo) {
					return sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.updateUserInfo", vo);
				}

			// ===== 재관 앱 =====
				// 로그인 정보체크
				@Override
				public String confirmId(String username) {
					return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.confirmId", username);
				}

				//
				@Override
				public UsersVO getMemberInfo(String username) {
					return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getMemberInfo", username);
				}
			// 재관 종료
	// ==예찬 시작
	// 관리자 - 운동등록처리
	@Override
	public int insertExercise(ExerciseVO vo) {
		return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.insertExercise", vo);
	}

	// 관리자 - 운동목록 개수구하기
	@Override
	public int getexerciseArticleCnt() {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getexerciseArticleCnt");
	}

	// 운동 - 스트레칭 개수구하기
	@Override
	public int getArticleCntSt() {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getArticleCntSt");
	}

	// 운동 - 유산소운동 개수구하기
	@Override
	public int getArticleCntDi() {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getArticleCntDi");
	}

	// 관리자 - 운동목록
	@Override
	public List<ExerciseVO> getexerciseList(Map<String, Integer> map) {
		List<ExerciseVO> dtos = sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getexerciseList",
				map);
		return dtos;
	}

	// 운동목록 - 스트레칭
	@Override
	public List<ExerciseVO> getstretching(Map<String, Integer> map) {
		List<ExerciseVO> dtosSt = sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getstretching",
				map);
		return dtosSt;
	}

	// 운동목록 - 다이어트 (유산소운동)
	@Override
	public List<ExerciseVO> getdiet(Map<String, Integer> map) {
		List<ExerciseVO> dtosDi = sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getdiet", map);
		return dtosDi;
	}

	// 관리자 - 운동삭제
	@Override
	public int deleteExercise(String exercise_code) {
		return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.deleteExercise", exercise_code);
	}

	// 관리자 - 운동수정 뷰
	@Override
	public ExerciseVO getExercise(String exercise_code) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getExercise", exercise_code);
	}

	// 관리자 - 운동수정처리
	@Override
	public int modifyPro(ExerciseVO vo) {
		return sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.modifyPro", vo);
	}

	// 운동 - 상세페이지
	@Override
	public ExerciseVO detailExercise(String exercise_code) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.detailExercise", exercise_code);
	}

	// 운동 - 즐겨찾기 추가
	@Override
	public int addFavorit(Map<String, Object> map) {
		return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.addFavorit", map);
	}

	// 운동 - 부위별 목록
	@Override
	public List<ExerciseVO> getPartList(String part) {
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getPartList", part);
	}

	// 운동 - 부위별 목록 여부
	@Override
	public int getPartCnt(String part) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getPartCnt", part);
	}

	// 즐겨찾기 여부
	@Override
	public int getFavoriteCnt(String username) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getFavoriteCnt", username);
	}

	// 동호회명 중복확인
	@Override
	public int clubNameCheck(String club_id) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.clubNameCheck", club_id);
	}

	// 즐겨찾기 여부
	@Override
	public int favoritCnt(Map<String, Object> map) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.favoritCnt", map);
	}

	// 즐겨찾기 코드 값
	@Override
	public String favoritCode(Map<String, Object> map) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.favoritCode", map);
	}

	// 즐겨찾기 제거 - 버튼
	@Override
	public int removeFavorit(String favorite_code) {
		return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.removeFavorit", favorite_code);
	}

	// 즐겨찾기 목록
	@Override
	public List<ExerciseVO> getFavoriteList(String username) {
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getFavoriteList", username);
	}

	// 즐겨찾기 - 해당운동코드에 맞는 운동정보
	@Override
	public ExerciseVO getExerciseInfo(Map<String, Object> map) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getExerciseInfo", map);
	}

	// 즐겨찾기 제거 - 사용자
	@Override
	public int deletefavorite(String favorite_code) {
		return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.deletefavorite", favorite_code);
	}

	// 동호회 - 개설신청
	@Override
	public int addClubApply(ClubVO vo) {
		return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.addClubApply", vo);
	}

	// 동호회 - 목록
	@Override
	public List<ClubVO> getClubList(Map<String, Object> map) {
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getClubList", map);
	}

	// 동호회 - 목록개수구하기
	@Override
	public int getClubCnt() {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getClubCnt");
	}

	// 관리자 - 동호회 상세페이지
	@Override
	public ClubVO clubDetail(String club_name) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.clubDetail", club_name);
	}

	// 관리자 - 동호회 신청 삭제
	@Override
	public int deleteApplyClub(String club_name) {
		return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.deleteApplyClub", club_name);
	}

	// 관리자 - 동호회 신청 승인
	@Override
	public int clubPermit(String club_name) {
		return sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.clubPermit", club_name);
	}

	// 동호회 - 목록
	@Override
	public List<ClubVO> getClub_List(Map<String, Object> map) {
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getClub_List", map);
	}

	// 동호회 - 개수구하기
	@Override
	public int getClub_Cnt(String username) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getClub_Cnt", username);
	}

	// 동호회 - 상세페이지
	@Override
	public ClubVO getClub(String club_name) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getClub", club_name);
	}

	// 동호회 - 로그인한 회원이 동호회원인지 여부
	@Override
	public int getMember(Map<String, Object> map) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getMember", map);
	}

	// 관리자 - 개설된 동호회 개수
	@Override
	public int getExistenceClubCnt() {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getExistenceClubCnt");
	}

	// 관리자 - 개설된 동호회 목록
	@Override
	public List<ClubVO> getExistenceClubList(Map<String, Object> map) {
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getExistenceClubList", map);
	}

	// 동호회 - 내가 가입한 동호회 개수 구하기
	@Override
	public int getMyClubCnt(String username) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getMyClubCnt", username);
	}

	// 동호회 - 내가 가입한 동호회 목록
	@Override
	public MyClubVO getMyClubList(String username) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getMyClubList", username);
	}

	// 동호회 - 내가 가입한 동호회 목록 정보
	@Override
	public ClubVO getMy_ClubList(String club_name) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getMy_ClubList", club_name);
	}

	// 동호회 - 동호회 가입신청
	@Override
	public int applyClub(Map<String, Object> map) {
		return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.applyClub", map);
	}

	// 동호회 - 중복지원 방지
	@Override
	public int clubWhether(Map<String, Object> map) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.clubWhether", map);
	}

	// 동호회 - 최대 3곳만 가입가능하도록 설정
	@Override
	public int getJoinClubCnt(String username) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getJoinClubCnt", username);
	}

	// 동호회 - 가입신청 목록
	@Override
	public List<ClubVO> getApplyList(String username) {
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getApplyList", username);
	}

	// 대표자 - 클럽개수 확인
	@Override
	public String getClubMaster(String club_name) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getClubMaster", club_name);
	}

	// 처음 동호회 가입시 첫번째 동호회에 추가
	@Override
	public void addClub1(Map<String, Object> map) {
		sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.addClub1", map);
	}

	// 첫번째는 있고, 두번째 동호회 없을시 두번째 동호회에 추가
	@Override
	public void addClub2(Map<String, Object> map) {
		sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.addClub2", map);
	}

	// 세번째만 없을때 추가
	@Override
	public void addClub3(Map<String, Object> map) {
		sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.addClub3", map);
	}

	// 내가 신청한 동호회 개수
	@Override
	public int applyCnt(String username) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.applyCnt", username);
	}

	// 동호회 - 신청목록 삭제
	@Override
	public int deleteApply(String apply_code) {
		return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.deleteApply", apply_code);
	}

	// 관리자 - 동호회 신청삭제
	@Override
	public void deleteClub(String club_name) {
		sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.deleteClub", club_name);
	}

	// 동호회 - 현재인원
	@Override
	public int getCurrentMember(String club_name) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getCurrentMember", club_name);
	}

	// 동호회 - 현재인원 정보 목록
	@Override
	public List<UsersVO> getMemberList(Map<String, Object> map) {
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getMemberList", map);
	}

	// 동호회 - 동호회 회원탈퇴 1번째 클럽일 경우
	@Override
	public int removeClub1(String username) {
		return sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.removeClub1", username);
	}

	// 동호회 - 동호회 회원탈퇴 2번째 클럽일 경우
	@Override
	public int removeClub2(String username) {
		return sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.removeClub2", username);
	}

	// 동호회 - 동호회 회원탈퇴 3번째 클럽일 경우
	@Override
	public int removeClub3(String username) {
		return sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.removeClub3", username);
	}

	// 동호회 - 삭제시 필요한 아이디
	@Override
	public List<UsersVO> getUserName(String club_name) {
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getUserName", club_name);
	}

	// 동호회 - 해당동호회 가입신청 목록
	@Override
	public List<UsersVO> getClubApply(Map<String, Object> map) {
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getClubApply", map);
	}

	// 동호회 - 해당동호회 가입신청 개수
	@Override
	public int clubApplyCnt(String club_name) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.clubApplyCnt", club_name);
	}

	// 동호회 - 첫번째 동호회없을시 첫번째 동호회에 추가
	@Override
	public void add_Club1(Map<String, Object> map) {
		sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.add_Club1", map);
	}

	// 동호회 - 가입승인시 현재인원 증가
	@Override
	public void plusMember(String club_name) {
		sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.plusMember", club_name);
	}

	// 동호회 - 최대인원수
	@Override
	public int getMax(String club_name) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getMax", club_name);
	}

	// 동호회 - 현재인원수
	@Override
	public int getCurrent(String club_name) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getCurrent", club_name);
	}

	// 동호회 - 탈퇴시 인원감소
	@Override
	public void minusMember(String club_name) {
		sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.minusMember", club_name);
	}

	// 동호회 - 동호회 게시판개수
	@Override
	public int getClubBoardCnt(String club_name) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getClubBoardCnt", club_name);
	}

	// 동호회 - 동호회 게시판 목록
	@Override
	public List<ClubBoardVO> getClubBoardList(String club_name) {
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getClubBoardList", club_name);
	}

	// 동호회 - 동호회 게시판 글쓰기 처리
	@Override
	public int insertClubBoard(ClubBoardVO vo) {
		return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.insertClubBoard", vo);
	}

	// 동호회 - 동호회 게시판 글삭제 처리
	@Override
	public int deleteClubBoard(String club_board_code) {
		return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.deleteClubBoard", club_board_code);
	}

	// 동호회 - 동호회 게시판 상세페이지
	@Override
	public ClubBoardVO getBoardDetail(String club_board_code) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getBoardDetail", club_board_code);
	}

	// 동호회 - 상세페이지 클릭시 조회수 증가
	@Override
	public void plusReadCnt(String club_board_code) {
		sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.plusReadCnt", club_board_code);
	}

	// 동호회 - 동호회 게시글 수정처리
	@Override
	public int updateClubCnt(ClubBoardVO vo) {
		return sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.updateClubCnt", vo);
	}

	// ==예찬 종료
	// ========================================
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
		@Override
		public int getQnaCommentCnt(int qna_code) {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getQnaCommentCnt", qna_code);
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
		
		@Override
		public void addQnAReadCnt(int qna_code) {
			HellsCareDAO dao = sqlsession.getMapper(HellsCareDAO.class);
			dao.addQnAReadCnt(qna_code);
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

		//게시글 삭제
		@Override
		public int b_delete(int board_code) {
			return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.b_delete", board_code);
		}

		//게시글 삭제시 -> 댓글 삭제
		@Override
		public int c_delete(int board_code) {
			return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.c_delete", board_code);
		}

		//게시글 수정
		@Override
		public int boardUpdate(BoardVO vo) {
			return sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.boardUpdate", vo);
		}
		
		//QnA 수정 처리
		@Override
		public int qnaUpdate(BoardQnaVO vo) {
			return sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.qnaUpdate", vo);
		}

		//QnA 글 갯수
		@Override
		public int getQnaCnt() {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getQnaCnt");
		}

		//QnA 글 목록
		@Override
		public List<BoardQnaVO> getQnaArticleList() {
			return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getQnaArticleList");
		}

		//QnA 저장
		@Override
		public int qnaWrite(BoardQnaVO vo) {
			return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.qnaWrite", vo);
		}

		//비밀번호 확인
		@Override
		public int getPwdConfirm(Map<String, Object> map) {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getPwdConfirm",map);
		}

		//qna 내용
		@Override
		public BoardQnaVO getQnaArticle(int qna_code) {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getQnaArticle", qna_code);
		}

		//qna글 삭제
		@Override
		public int q_delete(int qna_code) {
			return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.q_delete", qna_code);
		}

		//qna 답변댓글 삭제
		@Override
		public int qc_delete(int qna_code) {
			return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.qc_delete", qna_code);
		}
		//공지사항 갯수
		@Override
		public int getnoticeCnt() {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getnoticeCnt");
		}

		//공지사항 가져오깅
		@Override
		public List<BoardVO> getNoticeArticleList() {
			return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getNoticeArticleList");
		}

		//공지사항보기
		@Override
		public BoardVO getNoticeArticle(int board_code) {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getNoticeArticle", board_code);
		}


		@Override
		public List<BoardQnaVO> getmyArticleList(Map<String, Object> map) {
			return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getmyArticleList", map);
		}

		//내 질문글 갯수
		@Override
		public int getmyArticleCnt(String username) {
			return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getmyArticleCnt", username);
		}

//		//공지사항 수정 처리
//		@Override
//		public int noticeUpdate(BoardVO vo) {
//			// TODO Auto-generated method stub
//			return 0;
//		}
		//==한결 종료
		
		//==나현 시작
		
				@Autowired
				private JavaMailSender mailSender; // xml에 등록한 bean autowired
				
				// 아이디 찾기 시 이름 & 이메일 체크
				public int chkCnt(Map<String, Object> map){
					return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.chkCnt", map);
				}
				// 아이디 찾기 시 아이디 반환
				public String getUsername(Map<String, Object> map){
					return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getUsername", map);
				}
				
				//아이디 찾기 _ 이메일로 아이디보내기 
			    @Override
			    public void sendmail(String email, String username) {
			    
			        try{
			             MimeMessage message = mailSender.createMimeMessage();
			            String txt = "안녕하세요 회원님! 회원님의 명의로 가입된 아이디입니다.<br><h3><b><font color=blue>"+username+"</font></b></h3>";
			            message.setSubject("papahana 아이디찾기 서비스");
			            message.setText(txt, "UTF-8", "html");
			            message.setFrom(new InternetAddress("admin@mss.com"));
			            message.addRecipient(RecipientType.TO, new InternetAddress(email));
			            mailSender.send(message);
			        }catch(Exception e){
			            e.printStackTrace();
			        }   
			    }
			    
				// 비밀번호 찾기 시 아이디 & 이름 & 이메일 체크
				public int pChkCnt(Map<String, Object> map){
					return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.pChkCnt", map);
				}
				//  비밀번호 찾기 시  이메일로 보낼 비밀번호 반환
				public void updatePw(Map<String, String> map2){
					sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.updatePw", map2);
				}
				
				//비밀번호 찾기 _ 이메일로 비밀번호 보낸 후 비밀번호 암호화 
			    @Override
			    public void sendmail2(String email, String rdpw) {
			    
			        try{
			             MimeMessage message = mailSender.createMimeMessage();
			            String txt = "안녕하세요 회원님! 회원님의 임시 비밀번호는<br><h3><b><font color=blue>"+rdpw+"</font></b></h3>입니다. "
			            		+ "<br> 보안을 위해 로그인 후 비밀번호를 변경해주세요.  ";
			            message.setSubject("papahana 비밀번호찾기 서비스");
			            message.setText(txt, "UTF-8", "html");
			            message.setFrom(new InternetAddress("admin@mss.com"));
			            message.addRecipient(RecipientType.TO, new InternetAddress(email));
			            mailSender.send(message);
			        }catch(Exception e){
			            e.printStackTrace();
			        }   
			    }
			
				// 회원가입 시 아이디 중복확인 처리
				@Override
				public int idCheck(String strId) {
					return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.idCheck", strId);
				}
				
				//회원가입처리_INSERT INTO USERS
				@Override
				public int regUser(Map<String, String> map) {
					
				  String authority = (String)map.get("authority");
				  String username = (String)map.get("username");
				  
				  System.out.println("authority :: "+authority);
				  System.out.println("username :: " +username);
				  
				  Map<String, Object> Amap = new HashMap<String, Object>(); 
				  Amap.put("username",username);
				  Amap.put("authority", authority);
				  
				 
				  int insertCnt =  sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.regUser",map); 
				  System.out.println("insertCnt =========="+insertCnt); 
				  
				  int insertUACnt = regUser1(Amap);
				  System.out.println("insertUACnt =========="+insertUACnt); 
				 
				  
				  return insertCnt;
				}
				
				//회원가입처리_INSERT INTO AUTHORITIES
				@Override
				public int regUser1(Map<String, Object> Amap) {
					return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.regUser1", Amap);
				}
			    
			    // 권한 핸들러_  회원 상세 정보
			    @Override
				public Map<String, String> selectUser(String username) {
			    	System.out.println("HellscareDAO_selectUser_username:==>" + username);
					return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.selectUser", username); 
				}

			    // 마이페이지 회원정보 수정시 비밀번호 체크
			    @Override
				public int pwCheckCnt(Map<String,Object> map) {
					return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.pwCheckCnt",map);
				}
			    
				//회원정보 수정폼
				@Override
				public UsersVO userModiView(String username) {
					return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.userModiView",username);
				}
				
				//DB에 있는 비밀번호 리턴
				@Override
				public String returnPassword(String username) {
					return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.returnPassword",username);
				}
				
				//회원정보 수정처리
				@Override
				public int userModifyPro(UsersVO vo) {
					return sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.userModifyPro",vo);
				}
				
				//회원탈퇴 처리
				@Override
				public int deleteMember(String username) {
					return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.deleteMember",username);
				}
				
				//==나현 종료

		
	// ================ 동렬 파트 시작 ========================
	// 관리자 - 음식 등록
	@Override
	public int insertFood(FoodVO food) {
		return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.insertFood", food);
	}

	// 관리자 - 음식 갯수 반환
	@Override
	public int getFoodCount() {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getFoodCount");
	}

	// 관리자 - 음식 목록
	@Override
	public List<FoodVO> getFoodList(Map<String, Integer> map) {
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getFoodList", map);
	}

	// 관리자 - 음식 상세 정보
	@Override
	public FoodVO getFoodInfo(String food_code) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getFoodInfo", food_code);
	}

	// 관리자 - 음식 정보 수정
	@Override
	public int updateFood(FoodVO food) {
		return sqlsession.update("com.pro.hellscare.persistence.HellsCareDAO.updateFood", food);
	}

	// 관리자 - 음식 삭제
	@Override
	public int deleteFood(String food_code) {
		return sqlsession.delete("com.pro.hellscare.persistence.HellsCareDAO.deleteFood", food_code);
	}

	// 관리자 - 음식 중복 확인
	@Override
	public int checkFoodDup(String food_name) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.foodDupCheck", food_name);
	}

	// 사용자 - 섭취한 음식 입력 조회
	@Override
	public FoodVO getFoodInfoByUsingFoodNameAndFoodKind(Map<String, String> map) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getFoodInfoByUsingFoodNameAndFoodKind",
				map);
	}

	// 사용자 - 음식 종류에 해당하는 음식명 찾기
	@Override
	public List<FoodVO> getFoodNamesByUsingFoodKind(String food_kind) {
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getFoodNamesByUsingFoodKind",
				food_kind);
	}

	// 사용자 - 세션에 접속한 사용자 정보 가져오기
	@Override
	public UsersVO getUserInfoByUsingId(String username) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getUserInfoByUsingId", username);
	}

	// 사용자 - 사용자가 입력했던 음식 칼로리 값들 가져오기
	@Override
	public String getKcalInfo(Map<String, String> map) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getKcalInfo", map);
	}

	// 사용자 - 사용자가 입력 폼에 입력한 음식 정보 입력하기
	@Override
	public int insertUserFood(Map<String, String> map) {
		return sqlsession.insert("com.pro.hellscare.persistence.HellsCareDAO.insertUserFood", map);
	}

	// 사용자 - 칼로리 테이블에 입력된 회원의 일주일 간 칼로리 정보 가져오기
	@Override
	public List<KcalVO> getUserKcalInfo(Map<String, String> map) {
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getUserKcalInfo", map);
	}

	// 안드로이드 - 음식명으로 음식정보 조회
	@Override
	public FoodVO getFoodInfoByUsingFoodName(Map<String, String> map) {
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.getFoodInfoByUsingFoodName", map);
	}

	// 안드로이드 - 아이디로 오늘 섭취한 칼로리 정보 조회하기
	@Override
	public List<KcalVO> getTodayKcalInfo(String username) {
		return sqlsession.selectList("com.pro.hellscare.persistence.HellsCareDAO.getTodayKcalInfo", username);
	}
	// ========== 동렬 파트 종료 ===============
		
		
}
