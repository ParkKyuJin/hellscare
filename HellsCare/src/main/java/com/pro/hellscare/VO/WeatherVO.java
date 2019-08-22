package com.pro.hellscare.VO;

import java.util.List;

public class WeatherVO {
	private String city;							// OO시 OO구 OO동
	private String dong;							// OO동
		
	private String presentTemp;						// 현재 기온
	private String tomorrowAMTemp;					// 내일 오전 기온
	private String tomorrowPMTemp;					// 내일 오후 기온
	private String theDayAfterTomorrowAMTemp;		// 모레 오전 기온
	private String theDayAfterTomorrowPMTemp;		// 모레 오후 기온
	
	private String presentWeather;					// 현재 날씨 설명
	private String nowWeather;						// 현재 날씨 설명 잘라냄
	private String tomorrowAMWeather;				// 내일 오전 날씨
	private String tomorrowPMWeather;				// 내일 오후 날씨
	private String theDayAfterTomorrowAMWeather;	// 모레 오전 날씨
	private String theDayAfterTomorrowPMWeather;	// 모레 오후 날씨
	
	private int microdust;							// 미세먼지
	private int superMicrodust;						// 초미세먼지
	private double ozon;							// 오존
	
	private int ultraVioletRay;						// 자외선
	private double rainfallOnHour;					// 시간당 강수량
	
	private String minimumTemp;						// 최저 기온
	private String maximumTemp;						// 최고 기온
	private String sensibleTemp;					// 체감 기온
	
	private String tomorrowAMMicrodust;				// 내일 오전 미세먼지
	private String tomorrowPMMicrodust;				// 내일 오후 미세먼지
	private String dayAfterTomorrowAMMicrodust;		// 모레 오전 미세먼지
	private String dayAfterTomorrowPMMicrodust;		// 모레 오후 미세먼지
	
	private WindInfo windInfo;						// 바람 정보(풍향, 풍속)
	
	private List<Integer> todayTimes;						// 오늘 시간대
	private List<Integer> todayTemperature;					// 오늘 시간대의 기온
	private List<String> todayWeather;						// 오늘 시간대의 날씨
	private List<Integer> todayPrecipitation;				// 오늘 시간대의 강수확률
	private List<WindInfo> todayWind;						// 오늘 시간대의 바람 정보
	private List<Integer> todayHumidity;					// 오늘 시간대의 습도 정보
	
	private List<Integer> tomorrowTimes;					// 내일 시간대
	private List<Integer> tomorrowTemperature;				// 내일 시간대의 기온
	private List<String> tomorrowWeather;					// 내일 시간대의 날씨
	private List<Integer> tomorrowPrecipitation;			// 내일 시간대의 강수 확률
	private List<WindInfo> tomorrowWind;					// 내일 시간대의 바람 정보
	private List<Integer> tomorrowHumidity;					// 내일 시간대의 습도 정보
	
	private List<Integer> dayAfterTomorrowTimes;			// 모레 시간대
	private List<Integer> dayAfterTomorrowTemperature;		// 모레 시간대의 기온
	private List<String> dayAfterTomorrowWeather;			// 모레 시간대의 날씨
	private List<Integer> dayAfterTomorrowPrecipitation;	// 모레 시간대의 강수 확률
	private List<WindInfo> dayAfterTomorrowWind;			// 모레 시간대의 바람 정보
	private List<Integer> dayAfterTomorrowHumidity;			// 모레 시간대의 습도 정보
	
	private List<DayWeather> dayWeather;			// 주간 날씨 정보
	
	private String checkWeather;					// 시간당 강수량 or 자외선
	
	public WeatherVO() {}
	
	public void setCheckWeather(String checkWeather) {
		this.checkWeather = checkWeather;
	}
	
	public String getCheckWeather() {
		return checkWeather;
	}

	public String getPresentTemp() {
		return presentTemp;
	}

	public void setPresentTemp(String presentTemp) {
		this.presentTemp = presentTemp;
	}

	public String getPresentWeather() {
		return presentWeather;
	}

	public void setPresentWeather(String presentWeather) {
		this.presentWeather = presentWeather;
	}

	public String getMinimumTemp() {
		return minimumTemp;
	}

	public void setMinimumTemp(String minimumTemp) {
		this.minimumTemp = minimumTemp;
	}

	public String getMaximumTemp() {
		return maximumTemp;
	}

	public void setMaximumTemp(String maximumTemp) {
		this.maximumTemp = maximumTemp;
	}

	public String getSensibleTemp() {
		return sensibleTemp;
	}

	public void setSensibleTemp(String sensibleTemp) {
		this.sensibleTemp = sensibleTemp;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getTomorrowAMTemp() {
		return tomorrowAMTemp;
	}

	public void setTomorrowAMTemp(String tomorrowAMTemp) {
		this.tomorrowAMTemp = tomorrowAMTemp;
	}

	public String getTomorrowPMTemp() {
		return tomorrowPMTemp;
	}

	public void setTomorrowPMTemp(String tomorrowPMTemp) {
		this.tomorrowPMTemp = tomorrowPMTemp;
	}

	public String getTheDayAfterTomorrowAMTemp() {
		return theDayAfterTomorrowAMTemp;
	}

	public void setTheDayAfterTomorrowAMTemp(String theDayAfterTomorrowAMTemp) {
		this.theDayAfterTomorrowAMTemp = theDayAfterTomorrowAMTemp;
	}

	public String getTheDayAfterTomorrowPMTemp() {
		return theDayAfterTomorrowPMTemp;
	}

	public void setTheDayAfterTomorrowPMTemp(String theDayAfterTomorrowPMTemp) {
		this.theDayAfterTomorrowPMTemp = theDayAfterTomorrowPMTemp;
	}

	public String getTomorrowAMWeather() {
		return tomorrowAMWeather;
	}

	public void setTomorrowAMWeather(String tomorrowAMWeather) {
		this.tomorrowAMWeather = tomorrowAMWeather;
	}

	public String getTomorrowPMWeather() {
		return tomorrowPMWeather;
	}

	public void setTomorrowPMWeather(String tomorrowPMWeather) {
		this.tomorrowPMWeather = tomorrowPMWeather;
	}

	public String getTheDayAfterTomorrowAMWeather() {
		return theDayAfterTomorrowAMWeather;
	}

	public void setTheDayAfterTomorrowAMWeather(String theDayAfterTomorrowAMWeather) {
		this.theDayAfterTomorrowAMWeather = theDayAfterTomorrowAMWeather;
	}

	public String getTheDayAfterTomorrowPMWeather() {
		return theDayAfterTomorrowPMWeather;
	}

	public void setTheDayAfterTomorrowPMWeather(String theDayAfterTomorrowPMWeather) {
		this.theDayAfterTomorrowPMWeather = theDayAfterTomorrowPMWeather;
	}

	public int getMicrodust() {
		return microdust;
	}

	public void setMicrodust(int microdust) {
		this.microdust = microdust;
	}

	public int getSuperMicrodust() {
		return superMicrodust;
	}

	public void setSuperMicrodust(int superMicrodust) {
		this.superMicrodust = superMicrodust;
	}

	public double getOzon() {
		return ozon;
	}

	public void setOzon(double ozon) {
		this.ozon = ozon;
	}

	public int getUltraVioletRay() {
		return ultraVioletRay;
	}

	public void setUltraVioletRay(int ultraVioletRay) {
		this.ultraVioletRay = ultraVioletRay;
	}

	public WindInfo getWindInfo() {
		return windInfo;
	}

	public void setWindInfo(WindInfo windInfo) {
		this.windInfo = windInfo;
	}

	public List<DayWeather> getDayWeather() {
		return dayWeather;
	}

	public void setDayWeather(List<DayWeather> dayWeather) {
		this.dayWeather = dayWeather;
	}

	public List<Integer> getTodayTimes() {
		return todayTimes;
	}

	public void setTodayTimes(List<Integer> todayTimes) {
		this.todayTimes = todayTimes;
	}

	public List<Integer> getTodayTemperature() {
		return todayTemperature;
	}

	public void setTodayTemperature(List<Integer> todayTemperature) {
		this.todayTemperature = todayTemperature;
	}

	public List<String> getTodayWeather() {
		return todayWeather;
	}

	public void setTodayWeather(List<String> todayWeather) {
		this.todayWeather = todayWeather;
	}

	public List<Integer> getTodayPrecipitation() {
		return todayPrecipitation;
	}

	public void setTodayPrecipitation(List<Integer> todayPrecipitation) {
		this.todayPrecipitation = todayPrecipitation;
	}

	public List<WindInfo> getTodayWind() {
		return todayWind;
	}

	public void setTodayWind(List<WindInfo> todayWind) {
		this.todayWind = todayWind;
	}

	public List<Integer> getTodayHumidity() {
		return todayHumidity;
	}

	public void setTodayHumidity(List<Integer> todayHumidity) {
		this.todayHumidity = todayHumidity;
	}

	public List<Integer> getTomorrowTimes() {
		return tomorrowTimes;
	}

	public void setTomorrowTimes(List<Integer> tomorrowTimes) {
		this.tomorrowTimes = tomorrowTimes;
	}

	public List<Integer> getTomorrowTemperature() {
		return tomorrowTemperature;
	}

	public void setTomorrowTemperature(List<Integer> tomorrowTemperature) {
		this.tomorrowTemperature = tomorrowTemperature;
	}

	public List<String> getTomorrowWeather() {
		return tomorrowWeather;
	}

	public void setTomorrowWeather(List<String> tomorrowWeather) {
		this.tomorrowWeather = tomorrowWeather;
	}

	public List<Integer> getTomorrowPrecipitation() {
		return tomorrowPrecipitation;
	}

	public void setTomorrowPrecipitation(List<Integer> tomorrowPrecipitation) {
		this.tomorrowPrecipitation = tomorrowPrecipitation;
	}

	public List<WindInfo> getTomorrowWind() {
		return tomorrowWind;
	}

	public void setTomorrowWind(List<WindInfo> tomorrowWind) {
		this.tomorrowWind = tomorrowWind;
	}

	public List<Integer> getTomorrowHumidity() {
		return tomorrowHumidity;
	}

	public void setTomorrowHumidity(List<Integer> tomorrowHumidity) {
		this.tomorrowHumidity = tomorrowHumidity;
	}

	public List<Integer> getDayAfterTomorrowTimes() {
		return dayAfterTomorrowTimes;
	}

	public void setDayAfterTomorrowTimes(List<Integer> dayAfterTomorrowTimes) {
		this.dayAfterTomorrowTimes = dayAfterTomorrowTimes;
	}

	public List<Integer> getDayAfterTomorrowTemperature() {
		return dayAfterTomorrowTemperature;
	}

	public void setDayAfterTomorrowTemperature(List<Integer> dayAfterTomorrowTemperature) {
		this.dayAfterTomorrowTemperature = dayAfterTomorrowTemperature;
	}

	public List<String> getDayAfterTomorrowWeather() {
		return dayAfterTomorrowWeather;
	}

	public void setDayAfterTomorrowWeather(List<String> dayAfterTomorrowWeather) {
		this.dayAfterTomorrowWeather = dayAfterTomorrowWeather;
	}

	public List<Integer> getDayAfterTomorrowPrecipitation() {
		return dayAfterTomorrowPrecipitation;
	}

	public void setDayAfterTomorrowPrecipitation(List<Integer> dayAfterTomorrowPrecipitation) {
		this.dayAfterTomorrowPrecipitation = dayAfterTomorrowPrecipitation;
	}

	public List<WindInfo> getDayAfterTomorrowWind() {
		return dayAfterTomorrowWind;
	}

	public void setDayAfterTomorrowWind(List<WindInfo> dayAfterTomorrowWind) {
		this.dayAfterTomorrowWind = dayAfterTomorrowWind;
	}

	public List<Integer> getDayAfterTomorrowHumidity() {
		return dayAfterTomorrowHumidity;
	}

	public void setDayAfterTomorrowHumidity(List<Integer> dayAfterTomorrowHumidity) {
		this.dayAfterTomorrowHumidity = dayAfterTomorrowHumidity;
	}

	public String getTomorrowAMMicrodust() {
		return tomorrowAMMicrodust;
	}

	public void setTomorrowAMMicrodust(String tomorrowAMMicrodust) {
		this.tomorrowAMMicrodust = tomorrowAMMicrodust;
	}

	public String getTomorrowPMMicrodust() {
		return tomorrowPMMicrodust;
	}

	public void setTomorrowPMMicrodust(String tomorrowPMMicrodust) {
		this.tomorrowPMMicrodust = tomorrowPMMicrodust;
	}

	public String getDayAfterTomorrowAMMicrodust() {
		return dayAfterTomorrowAMMicrodust;
	}

	public void setDayAfterTomorrowAMMicrodust(String dayAfterTomorrowAMMicrodust) {
		this.dayAfterTomorrowAMMicrodust = dayAfterTomorrowAMMicrodust;
	}

	public String getDayAfterTomorrowPMMicrodust() {
		return dayAfterTomorrowPMMicrodust;
	}

	public void setDayAfterTomorrowPMMicrodust(String dayAfterTomorrowPMMicrodust) {
		this.dayAfterTomorrowPMMicrodust = dayAfterTomorrowPMMicrodust;
	}
	
	public void setNowWeather(String nowWeather) {
		this.nowWeather = nowWeather;
	}
	
	public String getNowWeather() {
		return nowWeather;
	}
	
	public void setRainfallOnHour(double rainfallOnHour) {
		this.rainfallOnHour = rainfallOnHour;
	}
	
	public double getRainfallOnHour() {
		return rainfallOnHour;
	}
}
