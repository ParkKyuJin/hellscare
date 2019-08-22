package com.pro.hellscare.VO;

import java.util.Date;

public class DayWeather {
	private String day;
	private int morningRainRate;
	private int afternoonRainRate;
	private int maxTemperature;
	private int minTemperature;
	
	public DayWeather() {}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public int getMorningRainRate() {
		return morningRainRate;
	}

	public void setMorningRainRate(int morningRainRate) {
		this.morningRainRate = morningRainRate;
	}

	public int getAfternoonRainRate() {
		return afternoonRainRate;
	}

	public void setAfternoonRainRate(int afternoonRainRate) {
		this.afternoonRainRate = afternoonRainRate;
	}

	public int getMaxTemperature() {
		return maxTemperature;
	}

	public void setMaxTemperature(int maxTemperature) {
		this.maxTemperature = maxTemperature;
	}

	public int getMinTemperature() {
		return minTemperature;
	}

	public void setMinTemperature(int minTemperature) {
		this.minTemperature = minTemperature;
	}
}
