package com.pro.hellscare.Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface ParseService {
	
	
	// 의약품정보 파싱 : 재관
	public void getDrugList(HttpServletRequest req, Model model);
}
