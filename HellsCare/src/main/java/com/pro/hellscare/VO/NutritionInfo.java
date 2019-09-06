package com.pro.hellscare.VO;

public class NutritionInfo {
	private int number;			// 객체 정보 구분을 위한 고유번호 
	private String separation;	// 성별 및 영유아 구분
	private int age;
	private int calory;	
	
	// Percentage로 입력받아 필요량을 기준 칼로리 * 각 영양소 곱함
	private double avgCarbohydrate;
	private double recoCarbohydrate;
	private int avgProtein;
	private int recoProtein;
	private double avgFat;
	private double recoFat;
	
	public NutritionInfo() {}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getSeparation() {
		return separation;
	}

	public void setSeparation(String separation) {
		this.separation = separation;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getCalory() {
		return calory;
	}

	public void setCalory(int calory) {
		this.calory = calory;
	}

	public double getAvgCarbohydrate() {
		return avgCarbohydrate;
	}

	public void setAvgCarbohydrate(double avgCarbohydrate) {
		this.avgCarbohydrate = avgCarbohydrate;
	}

	public double getRecoCarbohydrate() {
		return recoCarbohydrate;
	}

	public void setRecoCarbohydrate(double recoCarbohydrate) {
		this.recoCarbohydrate = recoCarbohydrate;
	}

	public int getAvgProtein() {
		return avgProtein;
	}

	public void setAvgProtein(int avgProtein) {
		this.avgProtein = avgProtein;
	}

	public int getRecoProtein() {
		return recoProtein;
	}

	public void setRecoProtein(int recoProtein) {
		this.recoProtein = recoProtein;
	}

	public double getAvgFat() {
		return avgFat;
	}

	public void setAvgFat(double avgFat) {
		this.avgFat = avgFat;
	}

	public double getRecoFat() {
		return recoFat;
	}

	public void setRecoFat(double recoFat) {
		this.recoFat = recoFat;
	}

	@Override
	public String toString() {
		return "NutritionInfo [number=" + number + ", separation=" + separation + ", age=" + age + ", calory=" + calory
				+ ", avgCarbohydrate=" + avgCarbohydrate + ", recoCarbohydrate=" + recoCarbohydrate + ", avgProtein="
				+ avgProtein + ", recoProtein=" + recoProtein + ", avgFat=" + avgFat + ", recoFat=" + recoFat + "]";
	}
}
