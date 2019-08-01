package com.pro.hellscare.Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

//서비스인터페이스 원칙적으로는 1개 기능 1서비스지만 필요한경우 한 서비스 안에 DAO를 여러개 넣는것은 상관없음.
//서비스 안에 서비스 넣는건 지양해주시길...

public interface HellsCareService {
	//테스트용 서비스
	public void testSetvice(HttpServletRequest req, Model model);
}
