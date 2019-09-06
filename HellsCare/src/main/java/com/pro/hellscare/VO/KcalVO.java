package com.pro.hellscare.VO;

import java.sql.Date;

public class KcalVO {
	private String username;
	private String food_code;
	private int kcal;
	private Date kcal_date;
	
	public KcalVO() {}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFood_code() {
		return food_code;
	}

	public void setFood_code(String food_code) {
		this.food_code = food_code;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public Date getKcal_date() {
		return kcal_date;
	}

	public void setKcal_date(Date kcal_date) {
		this.kcal_date = kcal_date;
	}

	@Override
	public String toString() {
		return "KcalVO [username=" + username + ", food_code=" + food_code + ", kcal=" + kcal + ", kcal_date="
				+ kcal_date + "]";
	}
}
