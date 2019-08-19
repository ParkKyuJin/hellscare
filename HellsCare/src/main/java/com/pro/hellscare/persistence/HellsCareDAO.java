package com.pro.hellscare.persistence;

import java.util.List;
import java.util.Map;

import com.pro.hellscare.VO.ExerciseVO;
import com.pro.hellscare.VO.challengeVO;

//DAO 인터페이스 필요하다싶은 인터페이스 작성및 구현
// 인터페이스 작성양식
// 함수명() 위에 어떤기능인지 반드시 적을것
public interface HellsCareDAO {
	
	//관리자 - 운동등록처리
	public int insertExercise(ExerciseVO vo);
		
		
		
		
		
		
		
		
//==============host DAO부분
		//관리자 이벤트 등록 페이지
		public int challengePro(Map<String,Object> map); //같은 이름의 도전과제가 있는지 체크
		public int challengePro2(Map<String,Object> map); //도전과에 insert
		public int challengecount(); //도전과제 갯수 
		public List<challengeVO> challengecount2(Map<String,Object> map);
		//도전과제 삭제
		public int challengedel(int challenge_check);
		
		
		
		
}