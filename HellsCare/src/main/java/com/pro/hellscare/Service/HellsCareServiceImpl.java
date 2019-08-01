package com.pro.hellscare.Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.hellscare.VO.HellsCareVO;
import com.pro.hellscare.persistence.HellsCareDAO;

//서비스인터페이스 오버라이딩해서 사용할것.


@Service
public class HellsCareServiceImpl implements HellsCareService {
	
	@Autowired
	HellsCareDAO dao;
	
	
	//암호화한 비밀번호에 대해 로그인처리를 하거나 회원정보 변경, 탈퇴, 아이디 비밀번호 찾기 등등 구현할때 사용합니다. 
	//사용하지 않는다고 해서 주석처리 하지 않으셔도됩니다. 
	// 사용법
	// 화면에서 사용자가 입력한 비밀번호를 암호화하여 DB에 저장할 경우 : pass.encode(화면에서 받아온 암호값);
	// 로그인 등등 암호가 맞는지 확인 할 경우 : pass.matches(화면에서 사용자가입력한 암호, DB에 들어있는 암호화된 암호);
	@Autowired
	BCryptPasswordEncoder pass;
	
	
	//테스트용 서비스 구현
	@Override
	public void testSetvice(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		// 테스트용입니다. 지우셔도 무방합니다.
		
		//테스트용 DAO연결
		HellsCareVO vo = dao.testDAO();
		
		model.addAttribute("id", vo.getUsername());
		model.addAttribute("name", vo.getName());
		
	}

}
