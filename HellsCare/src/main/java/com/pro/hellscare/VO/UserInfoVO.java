package com.pro.hellscare.VO;

import java.sql.Date;

public class UserInfoVO {
	private String username;	// 아이디
	private float height;		// 신장
	private float weight; 		// 몸무게
	private int heart_rate; 	// 심박수
	private float bmi; 			// bmi지수
	private float sightR; 		// 시력 오른쪽
	private float sightL; 		// 시력 왼쪽
	private int glucose; 		// 혈당
	private int pressure; 		// 수축기
	private int pressure2; 		// 이완기
	private int smokeAmount;	// 흡연량
	private int drinkAmount; 	// 음주량
	private Date check_date;	// 등록일자
	private int consume;		// 소비칼로리
	
	public UserInfoVO() {}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public float getHeight() {
		return height;
	}

	public void setHeight(float height) {
		this.height = height;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public int getHeart_rate() {
		return heart_rate;
	}

	public void setHeart_rate(int heart_rate) {
		this.heart_rate = heart_rate;
	}

	public float getBmi() {
		return bmi;
	}

	public void setBmi(float bmi) {
		this.bmi = bmi;
	}

	public float getSightR() {
		return sightR;
	}

	public void setSightR(float sightR) {
		this.sightR = sightR;
	}

	public float getSightL() {
		return sightL;
	}

	public void setSightL(float sightL) {
		this.sightL = sightL;
	}

	public int getGlucose() {
		return glucose;
	}

	public void setGlucose(int glucose) {
		this.glucose = glucose;
	}

	public int getPressure() {
		return pressure;
	}

	public void setPressure(int pressure) {
		this.pressure = pressure;
	}

	public int getPressure2() {
		return pressure2;
	}

	public void setPressure2(int pressure2) {
		this.pressure2 = pressure2;
	}

	public int getSmokeAmount() {
		return smokeAmount;
	}

	public void setSmokeAmount(int smokeAmount) {
		this.smokeAmount = smokeAmount;
	}

	public int getDrinkAmount() {
		return drinkAmount;
	}

	public void setDrinkAmount(int drinkAmount) {
		this.drinkAmount = drinkAmount;
	}

	public Date getCheck_date() {
		return check_date;
	}

	public void setCheck_date(Date check_date) {
		this.check_date = check_date;
	}

	public int getConsume() {
		return consume;
	}

	public void setConsume(int consume) {
		this.consume = consume;
	}

	
	
}
