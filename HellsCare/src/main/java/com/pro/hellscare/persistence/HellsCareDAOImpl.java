package com.pro.hellscare.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

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
	
	//테스트용 DAO
	@Override
	public HellsCareVO testDAO() {
		// TODO Auto-generated method stub
		//테스트 DAO입니다 아무기능 없습니다. 지우고 사용해주시면돼요
		return sqlsession.selectOne("com.pro.hellscare.persistence.HellsCareDAO.testDAO");
		
		
	}

	
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
	
	
}
