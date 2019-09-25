package com.pro.hellscare.VO;

import java.sql.Date;

public class challengeVO {
		
	public int challenge_code; //이벤트 고유코드
	public String challenge_name; //이벤트명
	public String challenge_content; //이벤트 내용
	public String challenge_gift; //이벤트 보상포인트
	public String challenge_img; //이벤트 이미지
	public Date challange_date; //이벤트 날짜
	
	
	public challengeVO(){}


	public int getChallenge_code() {
		return challenge_code;
	}


	public void setChallenge_code(int challenge_code) {
		this.challenge_code = challenge_code;
	}


	public String getChallenge_name() {
		return challenge_name;
	}


	public void setChallenge_name(String challenge_name) {
		this.challenge_name = challenge_name;
	}


	public String getChallenge_content() {
		return challenge_content;
	}


	public void setChallenge_content(String challenge_content) {
		this.challenge_content = challenge_content;
	}


	public String getChallenge_gift() {
		return challenge_gift;
	}


	public void setChallenge_gift(String challenge_gift) {
		this.challenge_gift = challenge_gift;
	}


	public String getChallenge_img() {
		return challenge_img;
	}


	public void setChallenge_img(String challenge_img) {
		this.challenge_img = challenge_img;
	}


	public Date getchallange_date() {
		return challange_date;
	}


	public void setchallange_date(Date challenge_date) {
		this.challange_date = challenge_date;
	}
	

	
	
}
