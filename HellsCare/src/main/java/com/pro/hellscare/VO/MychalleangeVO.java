package com.pro.hellscare.VO;

import java.sql.Date;

public class MychalleangeVO {
	String challenge_code; //이벤트 코드
	String challenge_name; //이벤트 이름
	String challenge_content; //이벤트 내용
	String challenge_gift; //이벤트 보상
	String challenge_img; //이벤트 이미지
	int done; //완료여부
	Date challenge_start; //이벤트 시작일
	Date challenge_end; //이벤트 종료일
	
	public String getChallenge_code() {
		return challenge_code;
	}
	public void setChallenge_code(String challenge_code) {
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
	public int getDone() {
		return done;
	}
	public void setDone(int done) {
		this.done = done;
	}
	public Date getChallenge_start() {
		return challenge_start;
	}
	public void setChallenge_start(Date challenge_start) {
		this.challenge_start = challenge_start;
	}
	public Date getChallenge_end() {
		return challenge_end;
	}
	public void setChallenge_end(Date challenge_end) {
		this.challenge_end = challenge_end;
	}
	
	
	
	
}
