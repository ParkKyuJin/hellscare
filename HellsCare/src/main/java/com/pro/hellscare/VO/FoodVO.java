package com.pro.hellscare.VO;

public class FoodVO {
	private String food_code;
	private String food_name;
	private String food_img;
	private int quantity;
	private int food_kind;
	private int kcal;
	private int carbohydrate;
	private int protein;
	private int fat;
	private int saccharides;
	private int salt;
	private int cholesterol;
	private int saturation;
	private int trans;
	
	public FoodVO() {}

	public String getFood_code() {
		return food_code;
	}

	public void setFood_code(String food_code) {
		this.food_code = food_code;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public String getFood_img() {
		return food_img;
	}

	public void setFood_img(String food_img) {
		this.food_img = food_img;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getFood_kind() {
		return food_kind;
	}

	public void setFood_kind(int food_kind) {
		this.food_kind = food_kind;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public int getCarbohydrate() {
		return carbohydrate;
	}

	public void setCarbohydrate(int carbohydrate) {
		this.carbohydrate = carbohydrate;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public int getFat() {
		return fat;
	}

	public void setFat(int fat) {
		this.fat = fat;
	}

	public int getSaccharides() {
		return saccharides;
	}

	public void setSaccharides(int saccharides) {
		this.saccharides = saccharides;
	}

	public int getSalt() {
		return salt;
	}

	public void setSalt(int salt) {
		this.salt = salt;
	}

	public int getCholesterol() {
		return cholesterol;
	}

	public void setCholesterol(int cholesterol) {
		this.cholesterol = cholesterol;
	}

	public int getSaturation() {
		return saturation;
	}

	public void setSaturation(int saturation) {
		this.saturation = saturation;
	}

	public int getTrans() {
		return trans;
	}

	public void setTrans(int trans) {
		this.trans = trans;
	}

	@Override
	public String toString() {
		return "FoodVO [food_code=" + food_code + ", food_name=" + food_name + ", food_img=" + food_img + ", quantity="
				+ quantity + ", food_kind=" + food_kind + ", kcal=" + kcal + ", carbohydrate=" + carbohydrate
				+ ", protein=" + protein + ", fat=" + fat + ", saccharides=" + saccharides + ", salt=" + salt
				+ ", cholesterol=" + cholesterol + ", saturation=" + saturation + ", trans=" + trans + "]";
	}
}
