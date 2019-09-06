package com.pro.hellscare.VO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class UserDayKcalInfo {
	private List<KcalVO> kcalList = new ArrayList<>();
	private int total_kcal = 0;
	private Date kcal_date;
	
	public UserDayKcalInfo() {}

	public List<KcalVO> getKcalList() {
		return kcalList;
	}

	public void setKcalList(List<KcalVO> kcalList) {
		this.kcalList = kcalList;
	}

	public Date getKcal_date() {
		return kcal_date;
	}

	public void setKcal_date(Date kcal_date) {
		this.kcal_date = kcal_date;
	}
	
	public int getTotal_kcal() {
		return total_kcal;
	}
	
	public void setTotal_kcal(int total_kcal) {
		this.total_kcal = total_kcal;
	}
}
